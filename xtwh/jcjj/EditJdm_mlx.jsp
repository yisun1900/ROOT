<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mlx=null;
String mlxmc=null;
String tx=null;
int gdbxy=0;
int gdbdy=0;
int kdbxy=0;
int kdbdy=0;
String wheremlx=cf.GB2Uni(request.getParameter("mlx"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mlx,mlxmc,gdbxy,gdbdy,kdbxy,kdbdy,tx ";
	ls_sql+=" from  jdm_mlx";
	ls_sql+=" where  (mlx='"+wheremlx+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mlx=cf.fillNull(rs.getString("mlx"));
		mlxmc=cf.fillNull(rs.getString("mlxmc"));
		gdbxy=rs.getInt("gdbxy");
		gdbdy=rs.getInt("gdbdy");
		kdbxy=rs.getInt("kdbxy");
		kdbdy=rs.getInt("kdbdy");
		tx=cf.fillNull(rs.getString("tx"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJdm_mlx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�����ͱ���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="mlx" size="20" maxlength="1"  value="<%=mlx%>" >
              </td>
              <td width="20%"> 
                <div align="right">����������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="mlxmc" size="20" maxlength="50"  value="<%=mlxmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�߶Ȳ�С�ڣ�MM��</td>
              <td width="30%"> 
                <input type="text" name="gdbxy" size="20" maxlength="8"  value="<%=gdbxy%>" >
              </td>
              <td width="20%" align="right">�߶Ȳ����ڣ�MM��</td>
              <td width="30%"> 
                <input type="text" name="gdbdy" size="20" maxlength="8"  value="<%=gdbdy%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��Ȳ�С�ڣ�MM��</td>
              <td width="30%"> 
                <input type="text" name="kdbxy" size="20" maxlength="8"  value="<%=kdbxy%>" >
              </td>
              <td width="20%" align="right">��Ȳ����ڣ�MM��</td>
              <td width="30%"> 
                <input type="text" name="kdbdy" size="20" maxlength="8"  value="<%=kdbdy%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����</td>
              <td colspan="3"> 
                <textarea name="tx" rows="3" cols="71"><%=tx%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wheremlx"  value="<%=wheremlx%>" >
            <tr> 
              <td width="20%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="20%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
                <input type="reset"  value="����">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mlx)=="") {
		alert("������[�����ͱ���]��");
		FormName.mlx.focus();
		return false;
	}
	if(	javaTrim(FormName.mlxmc)=="") {
		alert("������[����������]��");
		FormName.mlxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gdbxy)=="") {
		alert("������[�߶Ȳ�С��]��");
		FormName.gdbxy.focus();
		return false;
	}
	if(!(isNumber(FormName.gdbxy, "�߶Ȳ�С��"))) {
		return false;
	}
	if(	javaTrim(FormName.gdbdy)=="") {
		alert("������[�߶Ȳ�����]��");
		FormName.gdbdy.focus();
		return false;
	}
	if(!(isNumber(FormName.gdbdy, "�߶Ȳ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.kdbxy)=="") {
		alert("������[��Ȳ�С��]��");
		FormName.kdbxy.focus();
		return false;
	}
	if(!(isNumber(FormName.kdbxy, "��Ȳ�С��"))) {
		return false;
	}
	if(	javaTrim(FormName.kdbdy)=="") {
		alert("������[��Ȳ�����]��");
		FormName.kdbdy.focus();
		return false;
	}
	if(!(isNumber(FormName.kdbdy, "��Ȳ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
