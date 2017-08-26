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
	out.print("数字格式不正确，请您确认");
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
		maxID="没有卡号";
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
<title>无标题文档</title>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="savehy_khxxb.jsp">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" align="center" style="FONT-SIZE:12">
    <tr> 
      <td colspan="4" height="30"> 
        <div align="center">请输入要生成的水质分析卡号起始值与终止值</div>
      </td>
    </tr>
    <tr> 
      <td width="22%"> 
        <div align="right"><font color="#0000FF">卡号已使用到</font> </div>
      </td>
      <td width="27%"> 
        <input type="text" name="mqkh" maxlength="12" value="<%=maxID%>" readonly size="16">
      </td>
      <td width="24%" align="right"><font color="#0000FF">卡号前缀</font></td>
      <td width="27%"> 
        <input type="text" name="khqz" maxlength="10" value="<%=khqz%>"  size="16" readonly>
      </td>
    </tr>
    <tr> 
      <td width="22%"> 
        <div align="right">卡号起始值</div>
      </td>
      <td width="27%"> 
        <input type="text" name="khqsh" maxlength="10" size="16">
      </td>
      <td width="24%"> 
        <div align="right">卡号终止值</div>
      </td>
      <td width="27%"> 
        <input type="text" name="khzzh" maxlength="10" size="16">
      </td>
    </tr>
    <tr> 
      <td width="22%"> 
        <div align="right">卡的类型</div>
      </td>
      <td width="27%"> 
        <select name="kdlb" style="FONT-SIZE:14px;WIDTH:120px">
          <option value=""></option>
          <%
		cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb","");
%> 
        </select>
      </td>
      <td width="24%" align="right"><font color="#0000FF">卡号长度</font></td>
      <td width="27%"> 
        <input type="text" name="khcd" value="<%=khcdstr%>" maxlength="10" size="16" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <center>
          <input type="button" name="Submit" value="生成卡号" onClick="return isValid(form1)">
          <input type="button" name="Submit2" value="返回" onClick="history.back()">
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
		alert("请输入[卡号前缀]！");
		form.khqz.focus();
		return false;
	}
	if(javaTrim(form.khqsh)==""){
		alert("卡号起始号不能为空");
		form.khqsh.focus();
		return false;
	}
	if(!(isNumber(form.khqsh, "卡号起始值"))) {
		return false;
	}

	if(javaTrim(form.khzzh)==""){
		alert("卡号终止号不能为空");
		form.khzzh.focus();
		return false;
	}

	if(!(isNumber(form.khzzh, "卡号终止值"))) {
		return false;
	}

	if(parseInt(form.khqsh.value)>parseInt(form.khzzh.value)){
		alert("起始号码不能大于终止号码");
		form.khqsh.value="";
		form.khzzh.value="";
		form.khqsh.focus();
		return false;
	}

	if(	javaTrim(form.khcd)=="") {
		alert("请输入[卡号长度]！");
		form.khcd.focus();
		return false;
	}
	if(!(isNumber(form.khcd, "卡号长度"))) {
		return false;
	}
	if(	javaTrim(form.kdlb)=="") {
		alert("请输入[卡的类型]！");
		form.kdlb.focus();
		return false;
	}

	form.submit();
	return true;
}
</script>
