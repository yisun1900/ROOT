<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<%
String khqz = cf.GB2Uni(request.getParameter("khqz"));
String khcdstr = cf.GB2Uni(request.getParameter("khcd"));
int khcd = 0;
try{
	khcd = Integer.parseInt(khcdstr);
}
catch(Exception e){
	out.print("���ָ�ʽ����ȷ������ȷ��");
	return;
}
khcd=khcd-khqz.length();

String maxID=null;
Connection conn = null;
Statement st = null;
ResultSet rs = null;
String sqlString = null;

try{
	conn = cf.getConnection();

	sqlString = "SELECT MAX(SUBSTR(hykh,"+(khqz.length()+1)+","+khcd+")) tempID";
	sqlString+= " FROM hy_khxxb WHERE SUBSTR(hykh,1,"+khqz.length()+")='"+khqz+"'";
	st = conn.createStatement();
	rs = st.executeQuery(sqlString);
	if(rs.next())
	{
		maxID = rs.getString(1);
	}
	if(maxID==null)
	{
		maxID="û�п���";
	}
	else{
		maxID=khqz+maxID;
	}

}
catch(Exception e){
	System.out.println("error:"+e);
}
finally{
	try{
		if(rs!=null) rs.close();
		if(st!=null) st.close();
		if(conn!=null) cf.close(conn);
	}catch(Exception exc){
		out.print("error");
	}
}
%>

<html>
<head>
<title>�ޱ����ĵ�</title>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="savehy_khxxb.jsp">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" align="center" style="FONT-SIZE:12">
    <tr> 
      <td colspan="4" height="30"> 
        <div align="center">������Ҫ���ɵ�ˮ�ʷ���������ʼֵ����ֵֹ</div>
      </td>
    </tr>
    <tr> 
      <td width="22%"> 
        <div align="right"><font color="#0000FF">������ʹ�õ�</font> </div>
      </td>
      <td width="27%"> 
        <input type="text" name="mqkh" maxlength="12" value="<%=maxID%>" readonly size="16">
      </td>
      <td width="24%" align="right"><font color="#0000FF">����ǰ׺</font></td>
      <td width="27%"> 
        <input type="text" name="khqz" maxlength="10" value="<%=khqz%>"  size="16" readonly>
      </td>
    </tr>
    <tr> 
      <td width="22%"> 
        <div align="right">������ʼֵ</div>
      </td>
      <td width="27%"> 
        <input type="text" name="khqsh" maxlength="10" size="16">
      </td>
      <td width="24%"> 
        <div align="right">������ֵֹ</div>
      </td>
      <td width="27%"> 
        <input type="text" name="khzzh" maxlength="10" size="16">
      </td>
    </tr>
    <tr> 
      <td width="22%"> 
        <div align="right">��������</div>
      </td>
      <td width="27%"> 
        <select name="kdlb" style="FONT-SIZE:14px;WIDTH:120px">
          <option value=""></option>
          <%
		cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb","");
%> 
        </select>
      </td>
      <td width="24%" align="right"><font color="#0000FF">���ų���</font></td>
      <td width="27%"> 
        <input type="text" name="khcd" value="<%=khcdstr%>" maxlength="10" size="16" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <center>
          <input type="button" name="Submit" value="���ɿ���" onClick="return isValid(form1)">
          <input type="button" name="Submit2" value="����" onClick="history.back()">
        </center>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

<script language="javascript" src="/js/validate.js"></script>
<script language="javascript">
function isValid(form)
{
	if(	javaTrim(form.khqz)=="") {
		alert("������[����ǰ׺]��");
		form.khqz.focus();
		return false;
	}
	if(javaTrim(form.khqsh)==""){
		alert("������ʼ�Ų���Ϊ��");
		form.khqsh.focus();
		return false;
	}
	if(!(isNumber(form.khqsh, "������ʼֵ"))) {
		return false;
	}

	if(javaTrim(form.khzzh)==""){
		alert("������ֹ�Ų���Ϊ��");
		form.khzzh.focus();
		return false;
	}

	if(!(isNumber(form.khzzh, "������ֵֹ"))) {
		return false;
	}

	if(parseInt(form.khqsh.value)>parseInt(form.khzzh.value)){
		alert("��ʼ���벻�ܴ�����ֹ����");
		form.khqsh.value="";
		form.khzzh.value="";
		form.khqsh.focus();
		return false;
	}

	if(	javaTrim(form.khcd)=="") {
		alert("������[���ų���]��");
		form.khcd.focus();
		return false;
	}
	if(!(isNumber(form.khcd, "���ų���"))) {
		return false;
	}
	if(	javaTrim(form.kdlb)=="") {
		alert("������[��������]��");
		form.kdlb.focus();
		return false;
	}

	form.submit();
	return true;
}
</script>
