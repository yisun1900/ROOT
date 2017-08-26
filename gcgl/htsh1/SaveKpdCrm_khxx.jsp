<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String htshr=cf.GB2Uni(request.getParameter("htshr"));
String htshyj=cf.GB2Uni(request.getParameter("htshyj"));
String khxm=cf.GB2Uni(request.getParameter("khxm"));
String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
String qtdh=cf.GB2Uni(request.getParameter("qtdh"));
String email=cf.GB2Uni(request.getParameter("email"));
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));

String ls=null;
java.sql.Date htshsj=null;
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同审核时间]类型转换发生意外:"+e);
	return;
}
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

	ls_sql="update crm_khxx set htshr=?,htshsj=?,htshyj=?,htshdf=?,htshbz='P',khxm=?,lxfs=?,qtdh=?,email=?,fwdz=?,glftd=?";
	ls_sql+=" where  khbh='"+khbh+"' and htshbz='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,htshr);
	ps.setDate(2,htshsj);
	ps.setString(3,htshyj);
	ps.setInt(4,htshdf);
	ps.setString(5,khxm);
	ps.setString(6,lxfs);
	ps.setString(7,qtdh);
	ps.setString(8,email);
	ps.setString(9,fwdz);
	ps.setDouble(10,glftd);
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