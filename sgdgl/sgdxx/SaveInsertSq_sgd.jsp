<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgd=null;
String sgdmc=null;
String sgdlx=null;
String dz=null;
String dh=null;
String cz=null;
String bz=null;
java.sql.Date rzsj=null;
sgd=cf.GB2Uni(request.getParameter("sgd"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String cxbz=cf.GB2Uni(request.getParameter("cxbz"));
String jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
String lxrdh=cf.GB2Uni(request.getParameter("lxrdh"));
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String hjszd=cf.GB2Uni(request.getParameter("hjszd"));
String duihao=cf.GB2Uni(request.getParameter("duihao"));
String sgdjbbm=cf.GB2Uni(request.getParameter("sgdjbbm"));
String sfqldht=cf.GB2Uni(request.getParameter("sfqldht"));
String kjdsm=cf.GB2Uni(request.getParameter("kjdsm"));
sgdmc=cf.GB2Uni(request.getParameter("sgdmc"));
sgdlx=cf.GB2Uni(request.getParameter("sgdlx"));
dz=cf.GB2Uni(request.getParameter("dz"));
dh=cf.GB2Uni(request.getParameter("dh"));
cz=cf.GB2Uni(request.getParameter("cz"));
bz=cf.GB2Uni(request.getParameter("bz"));
String jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));

int jcf=0;
double zbj=0;
int bzs=0;


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into sq_sgd ( sgd,sgdmc,sgdlx,dz,dh,cz,bz,tdbz,dqbm,cxbz,ssfgs,jjlxr,lxrdh,sfzhm,hjszd,duihao,sgdjbbm,zbj,jcf,bzs,sfqldht,kjdsm,jjlxrdz,rzsj,bzj) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'N',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,sgdmc);
	ps.setString(3,sgdlx);
	ps.setString(4,dz);
	ps.setString(5,dh);
	ps.setString(6,cz);
	ps.setString(7,bz);
	ps.setString(8,dqbm);
	ps.setString(9,cxbz);
	ps.setString(10,ssfgs);
	ps.setString(11,jjlxr);
	ps.setString(12,lxrdh);
	ps.setString(13,sfzhm);
	ps.setString(14,hjszd);
	ps.setString(15,duihao);
	ps.setString(16,sgdjbbm);
	ps.setDouble(17,zbj);
	ps.setInt(18,jcf);
	ps.setInt(19,bzs);
	ps.setString(20,sfqldht);
	ps.setString(21,kjdsm);
	ps.setString(22,jjlxrdz);
	ps.setDate(23,rzsj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("´æÅÌÊ§°Ü,·¢ÉúÒâÍâ: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>