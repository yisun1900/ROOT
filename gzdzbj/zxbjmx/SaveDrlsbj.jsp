<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=request.getParameter("khbh");
String bjjb=request.getParameter("bjjb");
String dqbm=request.getParameter("dqbm");
String mbmc=cf.GB2Uni(request.getParameter("sclsbjmc"));

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

	conn.setAutoCommit(false);


	ls_sql=" delete from bj_bjxmmx ";
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

	ls_sql=" delete from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//房间信息
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,xuhao) ";
	ls_sql+=" select khbh,jgwzbm,xuhao";
	ls_sql+=" from bj_mbfjxx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//模板工程量明细
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
	ls_sql+=" select khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz";
	ls_sql+=" from bj_mbgclmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//模板其它收费项目明细
	ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfbfb,sfje,bz)";
	ls_sql+=" select khbh,sfxmbm,sfxmmc,sflx,sfbfb,sfje,bz";
	ls_sql+=" from bj_mbsfxmmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//单位工程量主材用量
	ls_sql="insert into bj_dwgclzcyl (khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
	ls_sql+=" select khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf ";
	ls_sql+=" from bj_mbzcyl ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//
	ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj)";
	ls_sql+=" select khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
	ls_sql+=" from bj_mbglfxb ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
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

	ls_sql="insert into bj_bjxmmx(xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx)";
	ls_sql+=" select "+xh+"+rownum,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx";
	ls_sql+=" from bj_mbbjxmmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


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
	alert("存盘成功！");
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