<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>��ԭ��ǰ���ݵ����ı���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="BackToDb.jsp" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:16">
    <tr align="center"> 
      <td colspan="2" height="94">��ԭ��ǰ���ݵ����ı���</td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <p><b><font color="#FF0000">ע�⣺�ò������ϵͳ�еı���ȫ��ɾ�����ñ��ݵı����滻</font></b></p>
        <p><font color="#FF0000"><b>�ò�����Ӱ����ǰ�Ķ���</b></font></p>
      </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="2" colspan="2">
        <div align="center">�ɹ�ѡ��ı��ݱ��ۣ� <%
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	java.sql.Timestamp bfsj=null;
	int count=0;
	ls_sql =" select bfsj,count(*)";
	ls_sql+=" from jc_zcjgb1";
	ls_sql+=" where dqbm=?";
	ls_sql+=" group by bfsj";
	ls_sql+=" order by bfsj desc";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bfsj=rs.getTimestamp(1);
		count=rs.getInt(2);

		out.println("<P>����ʱ�䣺"+bfsj+"�����ݼ�¼����"+count+"��<A HREF=# onclick=\"f_restore('BackToDb.jsp?dqbm="+dqbm+"&bfsj="+bfsj+"')\">��ԭ����</A>");
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
%> </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_restore(link)//����FormName:Form������
{
	if (!confirm("ȷʵҪ��ԭ���ݱ�����?") )	
	{
		return;
	}
	else{
		window.open(link);
	}
}

//-->
</SCRIPT>
