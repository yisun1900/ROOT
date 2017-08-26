<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String lsbjmc=cf.GB2Uni(request.getParameter("lsbjmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_mbbjxmmx ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	if (count>0)
	{
		out.println("<BR>错误，该临时报价名称已存在");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="insert into bj_mbbjxmmx(mbmc,khbh,xh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx)";
	ls_sql+=" select '"+lsbjmc+"',khbh,xh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbfjxx (mbmc,khbh,jgwzbm,xuhao) ";
	ls_sql+=" select '"+lsbjmc+"',khbh,jgwzbm,xuhao";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbgclmx (mbmc,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
	ls_sql+=" select '"+lsbjmc+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbsfxmmx (mbmc,khbh,sfxmbm,sfxmmc,sflx,sfbfb,sfje,bz)";
	ls_sql+=" select '"+lsbjmc+"',khbh,sfxmbm,sfxmmc,sflx,sfbfb,sfje,bz";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbglfxb (mbmc,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj )";
	ls_sql+=" select '"+lsbjmc+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj ";
	ls_sql+=" from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbzcyl (mbmc,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
	ls_sql+=" select '"+lsbjmc+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf ";
	ls_sql+=" from bj_dwgclzcyl ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>