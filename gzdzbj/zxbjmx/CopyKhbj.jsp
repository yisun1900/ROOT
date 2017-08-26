<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhdlm=(String)session.getAttribute("yhdlm");

String drkhbh=request.getParameter("drkhbh");
String bjjb=request.getParameter("bjjb");
String dqbm=request.getParameter("dqbm");

String khbh=request.getParameter("khbh");//被拷贝客户

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

	//判断地区、报价级别是否一致
	String drbjjb=null;
	String drjzbz=null;
	String mqbjjb=null;
	String mqdqbm=null;
	String mqjzbz=null;
	ls_sql="select bjjb,jzbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		drbjjb=rs.getString("bjjb");
		drjzbz=rs.getString("jzbz");
	}
	rs.close();
	ps.close();

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

	if (!drbjjb.equals(mqbjjb) || !drjzbz.equals(mqjzbz))
	{
		out.println("错误！不能拷贝，【报价级别】或【地区】或【家装标志】不一致");
		return;
	}

	conn.setAutoCommit(false);


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

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//房间信息
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,xuhao) ";
	ls_sql+=" select '"+drkhbh+"',jgwzbm,xuhao";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//模板工程量明细
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz )";
	ls_sql+=" select '"+drkhbh+"',dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz ";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//模板其它收费项目明细
	ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfbfb,sfje,bz)";
	ls_sql+=" select '"+drkhbh+"',sfxmbm,sfxmmc,sflx,sfbfb,sfje,bz";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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

	ls_sql="insert into bj_bjxmmx(xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,gycl,bjjb,dqbm,bjlx,jzbz,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,xmlx,ckxm,sfxycl,xmpx)";
	
	if (drbjjb.equals("A"))//A:普通;B:精品;C:乐华梅兰
	{
		ls_sql+=" select "+xh+"+rownum,'"+drkhbh+"',bj_bjxmmx.xmbh,bj_gzbjb.xmmc,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.smbm,bj_gzbjb.jldwbm,bj_gzbjb.abj,bj_gzbjb.cbenj,bj_gzbjb.sgdbj,bj_gzbjb.agycl,bj_bjxmmx.bjjb,bj_bjxmmx.dqbm,bj_bjxmmx.bjlx,bj_bjxmmx.jzbz,azcmc,azcgg,azcf,aclf,argf,ajjf,aglfbl,'1',bj_gzbjb.ckxm,bj_bjxmmx.sfxycl,bj_bjxmmx.xmpx";
	
	}
	else if (drbjjb.equals("B"))
	{
		ls_sql+=" select "+xh+"+rownum,'"+drkhbh+"',bj_bjxmmx.xmbh,bj_gzbjb.xmmc,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.smbm,bj_gzbjb.jldwbm,bj_gzbjb.bbj,bj_gzbjb.cbenj,bj_gzbjb.sgdbj,bj_gzbjb.bgycl,bj_bjxmmx.bjjb,bj_bjxmmx.dqbm,bj_bjxmmx.bjlx,bj_bjxmmx.jzbz,bzcmc,bzcgg,bzcf,bclf,brgf,bjjf,bglfbl,'1',bj_gzbjb.ckxm,bj_bjxmmx.sfxycl,bj_bjxmmx.xmpx";
	}
	else if (drbjjb.equals("C"))
	{
		ls_sql+=" select "+xh+"+rownum,'"+drkhbh+"',bj_bjxmmx.xmbh,bj_gzbjb.xmmc,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.smbm,bj_gzbjb.jldwbm,bj_gzbjb.cbj,bj_gzbjb.cbenj,bj_gzbjb.sgdbj,bj_gzbjb.cgycl,bj_bjxmmx.bjjb,bj_bjxmmx.dqbm,bj_bjxmmx.bjlx,bj_bjxmmx.jzbz,czcmc,czcgg,czcf,cclf,crgf,cjjf,cglfbl,'1',bj_gzbjb.ckxm,bj_bjxmmx.sfxycl,bj_bjxmmx.xmpx";
	}
	ls_sql+=" from bj_bjxmmx,bj_gzbjb ";
	ls_sql+=" where bj_bjxmmx.xmbh=bj_gzbjb.xmbh and bj_bjxmmx.dqbm=bj_gzbjb.dqbm and bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_bjxmmx.xh";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//单位工程量主材用量
	ls_sql="insert into bj_dwgclzcyl (khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
	ls_sql+=" select '"+drkhbh+"',dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
	ls_sql+=" from bj_dwgclzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//客户工料分析表（bj_khglfxb）
	ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj)";
	ls_sql+=" select '"+drkhbh+"',bj_gzglfxb.glbxh,bj_gzglfxb.dqbm,bj_gzglfxb.xmbh,bj_gzglfxb.bjjb,bj_gzglfxb.glflbm,bj_gzglfxb.glmc,bj_gzglfxb.pp,bj_gzglfxb.xhgg,bj_gzglfxb.jldwbm,bj_gzglfxb.xhl,bj_gzglfxb.dj";
	ls_sql+=" from bj_bjxmmx,bj_gzglfxb ";
	ls_sql+=" where bj_bjxmmx.dqbm=bj_gzglfxb.dqbm and bj_bjxmmx.xmbh=bj_gzglfxb.xmbh";
	ls_sql+=" and bj_bjxmmx.bjjb=bj_gzglfxb.bjjb and bj_bjxmmx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//获取：电子报价总额
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double dzbjze=dzbj.getBjje(conn,drkhbh,"hd");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?";
	ls_sql+=" where  khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("报价复制成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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