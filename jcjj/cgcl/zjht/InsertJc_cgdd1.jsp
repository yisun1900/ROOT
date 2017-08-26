<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");

String khlx=request.getParameter("khlx");


String ddbh=null;
String khbh=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	int count=0;
	ls_sql="select NVL(max(substr(khbh,2,6)),0)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  khlx='2'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	khbh='9'+cf.addZero(count+1,6);
	ddbh=khbh+"01";
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="449" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="33%"> 
                <input type="hidden" name="khlx" value="<%=khlx%>">
                <input type="text" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">合同号</td>
              <td width="33%"> 
                <input type="text" name="hth" value="" size="20" maxlength="20" >
              </td>
              <td width="17%" align="right">客户姓名</td>
              <td width="33%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">联系方式</td>
              <td colspan="3"> 
                <input type="text" name="lxfs" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">项目专员</td>
              <td width="33%">
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
              <td width="17%" align="right">橱柜订金</td>
              <td width="33%">
                <input type="text" name="dj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">驻店家居顾问</td>
              <td width="33%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
%> 
                </select>
              </td>
              <td width="17%" align="right">展厅家居顾问</td>
              <td width="33%">
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">计划初测时间</div>
              </td>
              <td width="33%">
                <input type="text" name="jhccsj" value="" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">计划复测时间</div>
              </td>
              <td width="33%">
                <input type="text" name="jhfcsj" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input type="button"  value="完成订单" onClick="f_end(insertform)" name="wc" disabled>
                </p>
                <p> 
                  <input type="button"  value="录入橱柜明细" onClick="f_lrmm(insertform)" name="lrmm" disabled>
                  <input type="button"  value="查看橱柜明细" onClick="f_ckmm(insertform)" name="ckmm" disabled>
                </p>
                <p> 
                  <input type="button"  value="录入五金明细" onClick="f_lrwj(insertform)" name="lrwj" disabled>
                  <input type="button"  value="查看五金明细" onClick="f_ckwj(insertform)" name="ckwj" disabled>
                </p>
                <p> 
                  <input type="button"  value="录入电器明细" onClick="f_lrbl(insertform)" name="lrbl" disabled>
                  <input type="button"  value="查看电器明细" onClick="f_ckbl(insertform)" name="ckbl" disabled>
                </p>
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
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[驻店家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("请输入[项目专员]！");
		FormName.xmzy.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[订金]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "订金"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhfcsj, "计划复测时间"))) {
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.action="SaveInsertJc_cgdd.jsp";
	FormName.submit();
	FormName.lrmm.disabled=false;
	FormName.ckmm.disabled=false;
	FormName.lrwj.disabled=false;
	FormName.ckwj.disabled=false;
	FormName.lrbl.disabled=false;
	FormName.ckbl.disabled=false;
	FormName.wc.disabled=false;
	return true;
}
function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_cgdd.jsp";
	FormName.submit();
	return true;
}

function f_lrmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgyddmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgyddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgwjyddmx.jsp";
	FormName.submit();
	return true;
}

function f_ckwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgwjyddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertJc_cgdqyddmx.jsp";
	FormName.submit();
	return true;
}

function f_ckbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_cgdqyddmxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
