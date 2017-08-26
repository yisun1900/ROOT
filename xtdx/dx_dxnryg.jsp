<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String[] ygbh=request.getParameterValues("ygbh");
%>
<title>请输入信息内容</title>
<div align="center">
  <p><font color="red"><b>接收信息人数:<%=ygbh.length%></b></font></p>
  </div>
<form method="post" name="selectform">
<%
for (int i=0;i<ygbh.length;i++)
{
	out.print("<input type=\"hidden\" value=\""+ygbh[i]+"\" name=\"ygbh\" >");
}
%>
<DIV align="center">
  <table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right">信息前缀</td>
      <td width="75%"> 
	   <select name="xxqz" style="FONT-SIZE:12PX;WIDTH:200PX">
                  <option value=""></option>
                  <option value="Y">自动匹配客户姓名性别</option>
                  <option value="N">只发送信息不匹配姓名</option>
                </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="15%" align="right">信息内容</td>
      <td width="75%"> 
        <textarea name="xxnr" rows="5" cols="55"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center">
          <input type="button"  value="发送" onClick="f_ph(selectform)" name="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset"  value="重输" name="reset">
        </div>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center">
          待发时间:<input type="text" name="dfsj" size="11" maxlength="10"  ondblclick="JSCalendar(this)">
		  小时:<select name="dfxs" style="FONT-SIZE:12PX;WIDTH:60PX">
                  <option value=""></option>
                  <option value="0">00:00</option>
				  <option value="1">01:00</option>
				  <option value="2">02:00</option>
				  <option value="3">03:00</option>
				  <option value="4">04:00</option>
				  <option value="5">05:00</option>
				  <option value="6">06:00</option>
				  <option value="7">07:00</option>
				  <option value="8">08:00</option>
				  <option value="9">09:00</option>
				  <option value="10">10:00</option>
				  <option value="11">11:00</option>
				  <option value="12">12:00</option>
				  <option value="13">13:00</option>
				  <option value="14">14:00</option>
				  <option value="15">15:00</option>
				  <option value="16">16:00</option>
				  <option value="17">17:00</option>
				  <option value="18">18:00</option>
				  <option value="19">19:00</option>
				  <option value="20">20:00</option>
				  <option value="21">21:00</option>
				  <option value="22">22:00</option>
				  <option value="23">23:00</option>
                </select>
          <input type="button"  value="定时发送" onClick="f_df(selectform)" name="button">
        </div>
      </td>
    </tr>
	<tr> 
      <td colspan="2"  bgcolor="#FFFFFF"> 
         <div align="left">
  <p><font color="red"><b>关于信息前缀:</b></font></p>
  <p><font color="blue">选择自动匹配客户姓名性别:</font>系统自动从客户资料中读取客户姓名,性别,添加到信息中,;例如,客户姓名:张三,性别:男.系统将自动在您的信息内容前面增加 "张三先生,"</p>
  <p><font color="blue">选择只发送信息不匹配姓名:</font>系统只发送您输入的信息内容!</p>
  <p><font color="blue">信息内容:</font>信息内容不能超过60个字,如果您选择了[自动匹配客户姓名性别]信息内容不能超过55个字,如果超过系统提示:信息内容超长!!!</p>
   <p><font color="blue">定时发送:</font>定时发送时间以系统时间为准,请至少提前1小时设定您的定时短信!</p>
  </div>
      </td>
    </tr>
  </table>
  </DIV>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ph(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xxqz)=="") {
		alert("请选择[信息前缀]！");
		FormName.xxqz.focus();
		return false;
	}
	if(	javaTrim(FormName.xxnr)=="") {
		alert("请输入[信息内容]！");
		FormName.xxnr.focus();
		return false;
	}
	var maxzs=60
	if (javaTrim(FormName.xxqz)=="Y")
	{
		maxzs=55
	}
	if (FormName.xxnr.value.length>maxzs)
	{
		alert("信息内容超长!!!");
		FormName.xxnr.focus();
		return false;
	}
	FormName.action="dx_plqfyg.jsp";
	FormName.submit();
	return true;
}
function f_df(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xxqz)=="") {
		alert("请选择[信息前缀]！");
		FormName.xxqz.focus();
		return false;
	}
	if(	javaTrim(FormName.xxnr)=="") {
		alert("请输入[信息内容]！");
		FormName.xxnr.focus();
		return false;
	}
	if(	javaTrim(FormName.dfsj)=="") {
		alert("请输入[待发时间]！");
		FormName.dfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.dfsj, "待发时间"))) {
		return false;
	}
	if(	javaTrim(FormName.dfxs)=="") {
		alert("请选择[小时]！");
		FormName.dfxs.focus();
		return false;
	}
	var maxzs=60
	if (javaTrim(FormName.xxqz)=="Y")
	{
		maxzs=55
	}
	if (FormName.xxnr.value.length>maxzs)
	{
		alert("信息内容超长!!!");
		FormName.xxnr.focus();
		return false;
	}
	FormName.action="dx_saverdsfsyg.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>