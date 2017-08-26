<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>


<TITLE>修改我的资料</TITLE>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0">
  <tr align="center"> 
    <td height="164">

<%
String khbh=(String) session.getAttribute("khbh");

String khxm=null;
String xb=null;
String lxfs=null;
String qtdh=null;

String yzbm=null;
String email=null;
String czhm=null;


khxm=cf.unescape(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
lxfs=cf.unescape(request.getParameter("lxfs"));
qtdh=cf.unescape(request.getParameter("qtdh"));

czhm=cf.unescape(request.getParameter("czhm"));
email=cf.unescape(request.getParameter("email"));
yzbm=cf.unescape(request.getParameter("yzbm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update crm_khxx set khxm='"+khxm+"',xb='"+xb+"',lxfs='"+lxfs+"',qtdh='"+qtdh+"',czhm='"+czhm+"',email='"+email+"',yzbm='"+yzbm+"'";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	修改成功！
	<P>
	<input type="button" name="Button" value="关闭窗口" onclick="window.close();">
	<%


}
catch (Exception e) {
	%>
	警告！！！修改失败！
	<P>
	<input type="button" name="Button" value="关闭窗口" onclick="window.close();">
	<%
	return;
}
finally 
{
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


    </td>
  </tr>
</table>
</body>


