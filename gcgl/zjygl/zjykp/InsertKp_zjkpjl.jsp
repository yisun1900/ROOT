<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//考评记录号
int kpjlh=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(kpjlh)+1,1)";
	ls_sql+=" from  kp_zjkpjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=rs.getInt(1);
	}
	ps.close();
	rs.close();

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 工程担当考评</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评记录号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpjlh" value="<%=kpjlh%>" size="20" maxlength="8" readonly>
              </td>
              <td width="15%"> 
                <div align="right">考评分公司</div>
              </td>
              <td width="35%">
                <select name="kpfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评起始时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qssj" value="<%=cf.firstDay()%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">考评截止时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jzsj" value="<%=cf.lastDay()%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">录入人</td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%" align="right">录入时间</td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="button"  value="统计考评结果" onClick="f_kp(insertform)" name="kp" disabled=true>
                <input type="button"  value="查看考评结果" onClick="f_ckkp(insertform)" name="ck" disabled=true>
                <input type="reset"  value="重输" name="reset">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.kpjlh, "考评记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.kpfgs)=="") {
		alert("请选择[考评分公司]！");
		FormName.kpfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.qssj)=="") {
		alert("请输入[考评起始时间]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[考评截止时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.action="SaveInsertKp_zjkpjl.jsp";
	FormName.submit();
	FormName.kp.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function f_kp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.kpjlh, "考评记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.qssj)=="") {
		alert("请输入[考评起始时间]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[考评截止时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}

	FormName.action="tjkpjg.jsp";
	FormName.submit();
	return true;
}
function f_ckkp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	FormName.action="Kp_zjpfbCxList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
