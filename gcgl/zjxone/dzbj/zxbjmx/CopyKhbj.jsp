<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String drkhbh=request.getParameter("drkhbh");//导入客户
String dqbm=request.getParameter("dqbm");

String khbh=request.getParameter("khbh");//被拷贝客户

if (khbh.equals(drkhbh))
{
	out.println("错误！同一个客户不能互相复制");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
int count=0;
String wybh=null;
String xmbh=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();

	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}

	//判断地区、报价级别是否一致
	String drbjjb=null;
	String drjzbz=null;
	String mqbjjb=null;
	String mqdqbm=null;
	String mqjzbz=null;
	String zklx="";
	double spzkl=10;
	ls_sql="select bjjb,jzbz,zklx,spzkl";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		drbjjb=rs.getString("bjjb");
		drjzbz=rs.getString("jzbz");
		zklx=cf.fillNull(rs.getString("zklx"));
		spzkl=rs.getDouble("spzkl");
	}
	rs.close();
	ps.close();

	//客户促销活动折扣
	double qdhdzk=10;
	double glfzk=10;
	ls_sql="select qdhdzk,glfzk ";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
	}
	rs.close();
	ps.close();

	//被拷贝客户
	ls_sql="select bjjb,jzbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mqbjjb=rs.getString("bjjb");
		mqjzbz=rs.getString("jzbz");
	}
	rs.close();
	ps.close();

	if (!drjzbz.equals(mqjzbz))
	{
		out.println("错误！不能拷贝，拷贝客户的【家装标志】不一致");
		return;
	}

	ls_sql=" select count(distinct bjjb)";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("错误！不能拷贝，报价明细中[报价级别]不一致");
		return;
	}



	conn.setAutoCommit(false);


	//保存到临时报价

	ls_sql=" delete from bj_mbbjxmmx ";
	ls_sql+=" where mbmc='报价复制"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbfjxx ";
	ls_sql+=" where mbmc='报价复制"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbgclmx ";
	ls_sql+=" where mbmc='报价复制"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbsfxmmx ";
	ls_sql+=" where mbmc='报价复制"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbzcbjmx ";
	ls_sql+=" where mbmc='报价复制"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbbjxmmx(mbmc,khbh,xh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bz,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx,sfzgzc)";
	ls_sql+=" select '报价复制"+khbh.trim()+"',khbh,xh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bz,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx,sfzgzc";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbfjxx (mbmc,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao) ";
	ls_sql+=" select '报价复制"+khbh.trim()+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbgclmx (mbmc,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
	ls_sql+=" select '报价复制"+khbh.trim()+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbsfxmmx (mbmc,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz)";
	ls_sql+=" select '报价复制"+khbh.trim()+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbzcbjmx (mbmc,xh,khbh,zcmc,jldwbm,dj,sl,je,bz)";
	ls_sql+=" select '报价复制"+khbh.trim()+"',xh,khbh,zcmc,jldwbm,dj,sl,je,bz";
	ls_sql+=" from bj_zcbjmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//清除报价
	ls_sql=" delete from bj_bjxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_fjxx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_gclmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_dwgclzcyl ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_sfxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_zcbjmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//房间信息
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao) ";
	ls_sql+=" select '"+drkhbh+"',jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//工程量明细
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
	ls_sql+=" select '"+drkhbh+"',dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh ";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//其它收费项目明细
	ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje  ,bz)";
	ls_sql+=" select       '"+drkhbh+"',sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,10   ,10     ,zqsfje,bz";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (zklx.equals("1"))
	{
		ls_sql="update bj_sfxmmx set dxzkl=?,sfje=zqsfje*cxhdzkl/10*?/10.0";
		ls_sql+=" where khbh='"+drkhbh+"' and sflx!='3'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,spzkl);
		ps.setDouble(2,spzkl);
		ps.executeUpdate();
		ps.close();
	}
	else if (zklx.equals("2"))
	{
		//重新取『单项折扣』
		String sfxmbm=null;
		ls_sql=" select khbh,sfxmbm";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+drkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			sfxmbm=rs1.getString("sfxmbm");

			double spdxzkl=10;
			ls_sql="select spdxzkl";
			ls_sql+=" from  crm_dxdzyh,crm_dzyhsq";
			ls_sql+=" where crm_dxdzyh.khbh=crm_dzyhsq.khbh and crm_dxdzyh.khbh='"+drkhbh+"' and sfxmbm='"+sfxmbm+"' and spbz='2'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				spdxzkl=rs.getDouble("spdxzkl");
			}
			rs.close();
			ps.close();
		
			ls_sql="update bj_sfxmmx set dxzkl=?,sfje=zqsfje*cxhdzkl/10*?/10.0";
			ls_sql+=" where khbh='"+drkhbh+"' and sfxmbm='"+sfxmbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,spdxzkl);
			ps.setDouble(2,spdxzkl);
			ps.executeUpdate();
			ps.close();
		
		}
		rs1.close();
		ps1.close();
	}


	//客户促销活动折扣＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	ls_sql="update bj_sfxmmx set cxhdzkl=?,sfje=zqsfje*dxzkl/10*?/10.0";
	ls_sql+=" where khbh='"+drkhbh+"' and sflx='5'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,glfzk);
	ps.setDouble(2,glfzk);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmx set cxhdzkl=?,sfje=zqsfje*dxzkl/10*?/10.0";
	ls_sql+=" where khbh='"+drkhbh+"' and sflx not in('3','5')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,qdhdzk);
	ps.setDouble(2,qdhdzk);
	ps.executeUpdate();
	ps.close();
	//客户促销活动折扣＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	//报价项目明细
	//用项目编号和地区编码重新取数据，wybh可能已发生变化

	ls_sql="insert into bj_bjxmmx(xh,khbh      ,xmbh          ,xmmc         ,xmdlbm         ,xmxlbm         ,smbm         ,jldwbm         ,cldj         ,rgdj         ,jxdj         ,dj         ,cbenj         ,sgdbj         ,zcmc          ,zcgg          ,zcf          ,fcf          ,rgf          ,jjf          ,glfbl                                  ,gycl         ,bz         ,bjjb          ,dqbm           ,bjlx          ,jzbz          ,xmlx,ckxm         ,sfxycl          ,xmpx,sfzgzc)";
	ls_sql+=" select "+xh+"+rownum,'"+drkhbh+"',bj_bjxmmx.xmbh,bj_jzbjb.xmmc,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.smbm,bj_jzbjb.jldwbm,bj_jzbjb.clbj,bj_jzbjb.rgbj,bj_jzbjb.jxbj,bj_jzbjb.bj,bj_jzbjb.cbenj,bj_jzbjb.sgdbj,bj_bjxmmx.zcmc,bj_bjxmmx.zcgg,bj_bjxmmx.zcf,bj_bjxmmx.fcf,bj_bjxmmx.rgf,bj_bjxmmx.jjf,bj_bjxmmx.glfbl                        ,bj_jzbjb.gycl,bj_jzbjb.bz,bj_jzbjb.bjjbbm,bj_bjxmmx.dqbm,bj_bjxmmx.bjlx,bj_bjxmmx.jzbz,'1' ,bj_jzbjb.ckxm,bj_bjxmmx.sfxycl,bj_bjxmmx.xmpx,sfzgzc";
	ls_sql+=" from bj_bjxmmx,bj_jzbjb ";
	ls_sql+=" where bj_bjxmmx.xmbh=bj_jzbjb.xmbh and bj_bjxmmx.dqbm=bj_jzbjb.dqbm";
	ls_sql+=" and bj_jzbjb.bjjbbm='"+drbjjb+"' and bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_bjxmmx.xh";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	xh=0;
	ls_sql="select NVL(max(TO_NUMBER(xh)),0)";
	ls_sql+=" from  bj_zcbjmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	//模板其它收费项目明细
	ls_sql="insert into bj_zcbjmx (xh,khbh,zcmc,jldwbm,dj,sl,je,bz)";
	ls_sql+=" select "+xh+"+rownum,'"+drkhbh+"',zcmc,jldwbm,dj,sl,je,bz";
	ls_sql+=" from bj_zcbjmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_zcbjmx.xh";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,drkhbh,"hmy");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,drkhbh,"hmy");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?";
	ls_sql+=" where  khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();


	double zcbjje=0;
	ls_sql="SELECT sum(je)";
	ls_sql+=" FROM bj_zcbjmx";
	ls_sql+=" where  khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcbjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
		
	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set zcbjje=?";
	ls_sql+=" where  khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zcbjje);
	ps.executeUpdate();
	ps.close();


	conn.commit();


	if (!drbjjb.equals(mqbjjb))
	{
		out.println("提醒！！！报价复制成功，但两者的报价级别不一致");
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("报价复制成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>