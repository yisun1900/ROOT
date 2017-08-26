<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>


<TITLE>修改密码</TITLE>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0">
  <tr align="center"> 
    <td height="164">

<%
String oldyhdlm=(String)session.getAttribute("yhdlm");
String yhdlm=request.getParameter("yhdlm");
String oldpass=request.getParameter("oldpass");
String newpass=request.getParameter("newpass");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String yhkl="";

int mark=0;
int count=0;

try {
	conn=cf.getConnection();

	if(!(oldyhdlm.equals(yhdlm)))
	{	
		ls_sql="select count(*) from crm_khxx where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		if(count>0)
		{
			%>
			警告！！！修改失败，该用户名已存在！
			<P>
			<input type="button" name="Button" value="关闭窗口" onclick="window.close();">
			<%
			return;
		}
	}

	ls_sql="select yhkl from crm_khxx where yhdlm='"+oldyhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		yhkl=rs.getString("yhkl");
	}
	rs.close();
	ps.close();

	if (!yhkl.equals(oldpass))
	{
		%>
		警告！！！修改失败，输入旧密码不正确！
		<P>
		<input type="button" name="Button" value="关闭窗口" onclick="window.close();">
		<%
		return;
	}


	ls_sql="update crm_khxx set yhkl='"+newpass+"',yhdlm='"+yhdlm+"' where yhdlm='"+oldyhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	session.removeAttribute("yhdlm");
	session.setAttribute("yhdlm",yhdlm);

	%>
	修改成功！
	<P>
	<input type="button" name="Button" value="关闭窗口" onclick="window.close();">
	<%


}
catch (Exception e) {
	out.print("操作失败！"+e);
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


