<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String sfjs="";
try {
	conn=cf.getConnection();

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select sfjs";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfjs=cf.fillNull(rs.getString("sfjs"));
		}
		rs.close();
		ps.close();

		if (!sfjs.equals("N") && !sfjs.equals("C") && !sfjs.equals("P"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
		{
			out.println("���󣡶�����"+ddbh[i]+"���ѽ��㣬�����޸�");
			return;
		}
	}

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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ά������ɼ������</div> 
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>����Ʒ��ɼ������</td>
              <td><input type="text" name="tcjrbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td width="45%" align="right"><font color="#FF0000">*</font>�ؼ�Ʒ��ɼ������</td>
              <td width="55%"><input type="text" name="tjptcjrbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center">
				<%
				for (int i=0;i<ddbh.length ;i++ )
				{
					%>
                  <input type="hidden" name="ddbh"  value="<%=ddbh[i]%>" >
					<%
				}
				%>
                  <input type="button" value="����" onClick="f_do(editform)">
                </div>              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tcjrbl)=="") {
		alert("������[����Ʒ��ɼ������]��");
		FormName.tcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjrbl, "����Ʒ��ɼ������"))) {
		return false;
	}
	if(	parseFloat(FormName.tcjrbl.value)<0 || parseFloat(FormName.tcjrbl.value)>100) {
		alert("����[����Ʒ��ɼ������]Ӧ��0��100֮��");
		FormName.tcjrbl.select();
		return false;
	}
	if(	javaTrim(FormName.tjptcjrbl)=="") {
		alert("������[�ؼ�Ʒ��ɼ������]��");
		FormName.tjptcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjptcjrbl, "�ؼ�Ʒ��ɼ������"))) {
		return false;
	}
	if(	parseFloat(FormName.tjptcjrbl.value)<0 || parseFloat(FormName.tjptcjrbl.value)>100) {
		alert("����[�ؼ�Ʒ��ɼ������]Ӧ��0��100֮��");
		FormName.tjptcjrbl.select();
		return false;
	}


	FormName.action="SavePlEditWhTcblJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
