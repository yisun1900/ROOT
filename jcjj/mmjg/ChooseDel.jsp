<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>ɾ��[Ʒ�ƹ�Ӧ��]����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String dqmc=cf.executeQuery("select dqmc from dm_dqbm where dqbm='"+dqbm+"'");
%>


<form method="post" action="" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:16">
    <tr align="center"> 
      <td colspan="2" height="94">ɾ����ȫ����ľ�ű���</td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <p><b><font color="#FF0000">ע�⣺��ɾ����<%=dqmc%>��ȫ��ľ�ű��ۣ�ȷ���Ƿ����������</b></font></p>
      </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="2" colspan="2">
        <div align="center"><%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_mmbjb";
	ls_sql+=" where dqbm='"+dqbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);

		out.println("<P>ľ�ű�������"+count+"����������<A HREF=# onclick=\"f_del('DelDqbmMmBj.jsp?dqbm="+dqbm+"')\">ɾ������</A>");
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
function f_del(link)//����FormName:Form������
{
	if (!confirm("ȷʵҪ��ɾ��[<%=dqmc%>]ȫ��ľ�ű���?") )	
	{
		return;
	}
	else{
		window.open(link);
		window.close();
	}
}

//-->
</SCRIPT>
