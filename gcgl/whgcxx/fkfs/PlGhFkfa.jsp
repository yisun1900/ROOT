<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;
String dwbh=null;

try {
	conn=cf.getConnection();

	ls_sql="select count(distinct fgsbh)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where "+cf.arrayToInSQL(khbh,"khbh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>1)
	{
		out.println("����ֻ��ͬһ���ֹ�˾�Ŀͻ���������������");
		return;
	}


	ls_sql="select fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwbh=rs.getString("fgsbh");
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


<html>
<head>
<title>�����������ʽ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body >
<form method="post" action="" name="insertform" >
  <div align="center">�����������ʽ</div>
          

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�����</td>
      <td> 
        <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:352PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+dwbh+"' order by cw_fkfabm.fkfabm","");
%>
        </select></td>
    </tr>
    
    <tr> 
      <td colspan="2" height="2"> 
        <div align="center"> 
 <%
	for (int i=0;i<khbh.length ;i++ )
	{
		%> 
          <input type="hidden" name="khbh" value="<%=khbh[i]%>" >
          <%
	}

%>           <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����">
        </div>      </td>
    </tr>
  </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.fkfabm)=="") {
		alert("������[�����]��");
		FormName.fkfabm.focus();
		return false;
	}

	FormName.action="SavePlGhFkfa.jsp";
	FormName.submit();

	return true;
}



//-->
</SCRIPT>
