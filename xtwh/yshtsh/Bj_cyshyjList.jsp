<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<body bgcolor="#FFFFFF" onbeforeunload="f_do(insertform)">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">��˳�������ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

    <tr align="center"> 
      <td colspan="4" align="left"><input name="�ύ" type="button" onClick="f_del(insertform)"  value="ɾ��������">
      <input  type="button" onClick="window.open('InsertBj_cyshyj.jsp')"  value="����������"></td>
    </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="5%">ѡ��</td>
  <td width="5%">�޸�</td>
  <td width="5%">���</td>
  <td width="85%">����</td>
  </tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String bh=null;
	String shyj=null;
	ls_sql="select bh,shyj";
	ls_sql+=" from  bj_cyshyj";
	ls_sql+=" order by bh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bh=cf.fillNull(rs.getString("bh"));
		shyj=cf.fillNull(rs.getString("shyj"));

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><input name="bhch" type="checkbox" value="<%=bh%>">
		  </td>
		  <td><A HREF="EditBj_cyshyj.jsp?bh=<%=bh%>" target="_blank">�޸�</A>
		  </td>
		  <td><%=bh%>
		  </td>
		  </td>
		  <td align="left">
		  <%=shyj%>
		  <input type="hidden" name="shyj" value="<%=shyj%>" ></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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

    <tr align="center"> 
      <td height="25" colspan="4" align="left"> 
	    <input type="button"  value="ɾ��������" onClick="f_del(insertform)"></td>
    </tr>

</table>
</form>
</body>
</html>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
var ysshyj="";


function f_del(FormName)//����FormName:Form������
{
	if ( confirm("ȷʵҪɾ����?") )	
	{
		FormName.action="DeleteBj_cyshyj.jsp";
		FormName.submit();
		return true;
	}
}
//-->
</SCRIPT>

