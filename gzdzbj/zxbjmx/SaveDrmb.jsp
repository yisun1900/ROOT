<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");
String dqbm=request.getParameter("dqbm");
String mbmc=cf.GB2Uni(request.getParameter("mbmc"));
int pos=mbmc.indexOf("+");
String yhdlm=mbmc.substring(pos+1);
mbmc=mbmc.substring(0,pos);

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
long xh=0;
int xmpx=0;
int count=0;

String xmbh=null;
String ckxm=null;
String bjlx=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" delete from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_dwgclzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	//工程量明细
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz) ";
	ls_sql+=" select '"+khbh+"',dqbm,xmbh,jgwzbm,0,0,0,'N'";
	ls_sql+=" from bj_gzmbgclmx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//房间信息
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,xuhao) ";
	ls_sql+=" select '"+khbh+"',jgwzbm,xuhao";
	ls_sql+=" from bj_gzmbfjxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' and mbmc='"+mbmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//报价项目明细
	ls_sql="select bj_gzmbxm.xh,bj_gzmbxm.xmbh,ckxm,bjlx,xmmc,xmdlbm,xmxlbm";
	ls_sql+=" from  bj_gzmbxm,bj_gzbjb";
	ls_sql+=" where bj_gzmbxm.yhdlm='"+yhdlm+"' and bj_gzmbxm.mbmc='"+mbmc+"' and bj_gzmbxm.dqbm=bj_gzbjb.dqbm and bj_gzmbxm.xmbh=bj_gzbjb.xmbh";
	ls_sql+=" order by bj_gzmbxm.xh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		xmpx=rs1.getInt("xh");
		xmbh=rs1.getString("xmbh");
		ckxm=rs1.getString("ckxm");
		bjlx=rs1.getString("bjlx");
		xmmc=rs1.getString("xmmc");
		xmdlbm=rs1.getString("xmdlbm");
		xmxlbm=rs1.getString("xmxlbm");

		ls_sql="select count(*)";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("错误！项目编号【"+xmbh+"】已存在");
			return;
		}

		//报价项目明细
		ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,gycl,dqbm,bjjb,bjlx,xmlx,cbenj,sgdbj,jzbz,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,ckxm,xmpx,sfxycl ) ";

		if (bjjb.equals("A"))//A:普通;B:精品;C:乐华梅兰
		{
			ls_sql+=" select ?,?,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,abj,agycl,dqbm,?,bjlx,'1',cbenj,sgdbj,'2',azcmc,azcgg,azcf,aclf,argf,ajjf,aglfbl,ckxm,?,sfxycl";
		}
		else if (bjjb.equals("B"))
		{
			ls_sql+=" select ?,?,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bbj,bgycl,dqbm,?,bjlx,'1',cbenj,sgdbj,'2',bzcmc,bzcgg,bzcf,bclf,brgf,bjjf,bglfbl,ckxm,?,sfxycl";
		}
		else if (bjjb.equals("C"))
		{
			ls_sql+=" select ?,?,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cbj,cgycl,dqbm,?,bjlx,'1',cbenj,sgdbj,'2',czcmc,czcgg,czcf,cclf,crgf,cjjf,cglfbl,ckxm,?,sfxycl";
		}
		ls_sql+=" from bj_gzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,khbh);
		ps.setString(3,bjjb);
		ps.setInt(4,xmpx);
		ps.executeUpdate();
		ps.close();

		//客户工料分析表（bj_khglfxb）
		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
			ls_sql+=" select ?,glbxh,dqbm,xmbh,?,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
			ls_sql+=" from bj_gzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjb='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,bjjb);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
			ls_sql+=" select ?,glbxh,?,?,?,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
			ls_sql+=" from bj_gzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjb='"+bjjb+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,dqbm);
			ps.setString(3,xmbh);
			ps.setString(4,bjjb);
			ps.executeUpdate();
			ps.close();
		}

		xh++;
	}
	rs1.close();
	ps1.close();



	//获取：电子报价总额
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double dzbjze=dzbj.getBjje(conn,khbh,"hd");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("导入成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + ls_sql);
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