<%@ page contentType="text/html;charset=GBK" %>	
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String pdph=null;
pdph=cf.GB2Uni(request.getParameter("pdph"));
int ydrsj=0;
String xsnr="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select count(*) ";
	ls_sql+=" from  jxc_kcpdmx";
	ls_sql+=" where  (pdph="+pdph+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ydrsj=rs.getInt(1);
	}
	if (ydrsj>0)
	{
		xsnr="<font color=red>�̵�����["+pdph+"]���Ѿ�������"+ydrsj+"�����ݣ�����<a href=\"ViewJxc_kcpdjl.jsp?pdph="+pdph+"\" target=\"_back\">����鿴</a></font>";
	}
	else
	{
		xsnr="�̵�����["+pdph+"]����û�е������ݣ�<a href=\"dckcexcel.jsp?pdph="+pdph+"\" target=\"_back\">����������ؿ���̵��</a>";
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<html>
<head>
<title>����̵�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>


<body bgcolor="#FFFFFF">
<CENTER>
  <B>����̵�</B><BR>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
	<tr align="center"> 
        <td colspan="2" height="52"><b><%=xsnr%></b></td>
		<input type="hidden" name="pdph" value="<%=pdph%>">
      </tr>
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ��EXECEL�ļ�</b></td>
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
	FormName.action="ckexcel.jsp";

	FormName.submit();
	return true;
} 
//-->
</script>