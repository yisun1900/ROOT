<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>���ڸ�ʽ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!-- ʱ��ؼ� -->
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<LINK HREF='/js/JSCalendar.css' REL='stylesheet' TYPE='text/css'>
</head>

<body bgcolor="#FFFFFF">
<center>�ͷ�������<br></center>
<table width="82%" align="center">
  <tr>
 
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>



<td>
<form method="post"  name="selectform">


          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="17%" height="24">�ֹ�˾</td>
            <td width="32%" height="24"> 
              <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
              </select> </td>
            <td width="13%" height="24">ǩԼ����</td>
            <td width="38%" height="24"> 
              <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td><div align="right">��ʼ����</div></td>
            <td><input name="time1" id="time12" onDblClick="JSCalendar(this)" size="20" maxlength="10" value="<%=cf.firstDay()%>"></td>
            <td>��������</td>
            <td><input name="time2" id="time23" onDblClick="JSCalendar(this)" size="20" maxlength="10" value="<%=cf.lastDay()%>"></td>
          <tr bgcolor="#FFFFFF"> 
           <!--  <td colspan="4"> <div align="left">
                &nbsp; &nbsp; &nbsp; &nbsp;��ʾ���:<input type="radio" name="lxbb" value="aa" checked>
                ��ͼ 
                <input type="radio" name="lxbb" value="bb">
                ��ͨ</div></td> -->
          <tr bgcolor="#FFFFFF"> 
            <td colspan="4" ALign="center"> <input name="button" type="button"  value="��װ����" onClick="f_do(selectform)"> 
             <input name="reset" type="reset"  value=" �� �� "> </td>
          </tr>
        </table>
		  </form>  
	  </div>
    </td>
  </tr>
</table>
</p>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)
{
	if(	javaTrim(FormName.time1)=="") {
			alert("������[��ʼ����]��");
			FormName.time1.focus();
			return false;
	}
	if(	javaTrim(FormName.time2)=="") {
		alert("������[��������]��");
		FormName.time2.focus();
		return false;
	}
	if(!(isDatetime(FormName.time1, "��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.time2, "��������"))) {
		return false;
	}
	
	FormName.action="Kfbblist.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>