<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String htshyj=cf.GB2Uni(request.getParameter("htshyj"));
String khxm=cf.GB2Uni(request.getParameter("khxm"));
String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String qtdh=cf.GB2Uni(request.getParameter("qtdh"));
String email=cf.GB2Uni(request.getParameter("email"));
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));

String ls=null;
double glftd=0;
ls=request.getParameter("glftd");
try{
	if (!(ls.equals("")))  glftd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glftd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费提点]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int htshdf=0;

try {
	conn=cf.getConnection();

	ls_sql="select sum(bhgsl*kf)";
	ls_sql+=" from  crm_htshmx";
	ls_sql+=" where  khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htshdf=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_zxkhxx set khxm=?,fwdz=?,lxfs=?,qtdh=?,email=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,fwdz);
	ps.setString(3,lxfs);
	ps.setString(4,qtdh);
	ps.setString(5,email);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set htshyj=?,htshdf=?,htshbz='Y',khxm=?,lxfs=?,qtdh=?,email=?,fwdz=?,glftd=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,htshyj);
	ps.setInt(2,htshdf);
	ps.setString(3,khxm);
	ps.setString(4,lxfs);
	ps.setString(5,qtdh);
	ps.setString(6,email);
	ps.setString(7,fwdz);
	ps.setDouble(8,glftd);
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