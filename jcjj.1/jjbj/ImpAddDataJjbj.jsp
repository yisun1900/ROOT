<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ӱ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql =" select count(*)";
	ls_sql+=" from jc_jjbjbj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <B>����[�Ҿ߰��]����</B><BR>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ�񱨼�EXECEL�ļ�</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"><b><font color="#FF0000">
		  
          <BR>Ŀǰ�б��ۼ�¼����<%=count%>��
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button"  value="ɾ��ȫ������" onClick="window.open('isDelJjbjBj.jsp')">
		  <P>ע�⣺ϵͳ�����Զ�ɾ���ɱ��ۣ���ȷ���¡��ɱ��۲�Ҫ�ظ�</font></b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
          <input type="button"  value="����" onClick="f_onclick(loadform)">
        </td>
	  </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	FormName.action="DisImpAddDataJjbj.jsp";

	FormName.submit();
	return true;
} 


//-->
</script>