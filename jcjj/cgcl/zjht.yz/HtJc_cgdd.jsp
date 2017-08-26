<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String qhtr=null;
String qhtsj=null;
String htbz=null;
String sdks =null;
String xtbc=null;
String cghs=null;
String tmpp=null;
String tmhs=null;
String blcz=null;
String jiaolian=null;
String kjxsj=null;
String jhazrq=null;

double gtbfje=0;
double tmbfje=0;
double wjhtze=0;
double dqhtze=0;
double htze=0;
double wdzje=0;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select qhtr,qhtsj,htbz,gtbfje,tmbfje,wjhtze,dqhtze,htze,wdzje,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,kjxsj,jhazrq";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qhtr=cf.fillNull(rs.getString("qhtr"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htbz=cf.fillNull(rs.getString("htbz"));
		gtbfje=rs.getDouble("gtbfje");
		tmbfje=rs.getDouble("tmbfje");
		wjhtze=rs.getDouble("wjhtze");
		dqhtze=rs.getDouble("dqhtze");
		htze=rs.getDouble("htze");
		wdzje=rs.getDouble("wdzje");
		sdks=cf.fillNull(rs.getString("sdks"));
		xtbc=cf.fillNull(rs.getString("xtbc"));
		cghs=cf.fillNull(rs.getString("cghs"));
		tmpp=cf.fillNull(rs.getString("tmpp"));
		tmhs=cf.fillNull(rs.getString("tmhs"));
		blcz=cf.fillNull(rs.getString("blcz"));
		jiaolian=cf.fillNull(rs.getString("jiaolian"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
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
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>签订合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">签订合同（<font color="#0000FF"><b>注意：<font color="#FF0000">*</font>项必添</b></font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>橱柜款式</td>
              <td width="29%"> 
                <input type="text" name="sdks" size="20" maxlength="50"  value="<%=sdks%>"  >
              </td>
              <td width="22%" align="right"><font color="#FF0033">*</font>箱体板材</td>
              <td width="28%"> 
                <input type="text" name="xtbc" size="20" maxlength="50"  value="<%=xtbc%>"  >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>橱柜花色</td>
              <td width="29%">
                <input type="text" name="cghs" size="20" maxlength="50"  value="<%=cghs%>"  >
              </td>
              <td width="22%" align="right">&nbsp;</td>
              <td width="28%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>台面品牌</td>
              <td width="29%"> 
                <input type="text" name="tmpp" size="20" maxlength="50"  value="<%=tmpp%>" >
              </td>
              <td width="22%" align="right"><font color="#FF0033">*</font>台面花色</td>
              <td width="28%">
                <input type="text" name="tmhs" size="20" maxlength="50"  value="<%=tmhs%>"  >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">玻璃材质</td>
              <td width="29%"> 
                <input type="text" name="blcz" size="20" maxlength="50"  value="<%=blcz%>"  >
              </td>
              <td width="22%" align="right">铰链</td>
              <td width="28%"> 
                <input type="text" name="jiaolian" size="20" maxlength="50"  value="<%=jiaolian%>"  >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>柜体部分金额</td>
              <td> 
                <input type="text" name="gtbfje" size="20" maxlength="20"  value="" onChange="f_wdzje(insertform)" >
              </td>
              <td align="right"><font color="#FF0033">*</font>台面部分金额</td>
              <td> 
                <input type="text" name="tmbfje" size="20" maxlength="20"  value=""  onChange="f_wdzje(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>电器部分金额</td>
              <td width="29%"> 
                <input type="text" name="dqhtze" size="20" maxlength="20"  value="" onChange="f_wdzje(insertform)" >
              </td>
              <td width="22%" align="right"><font color="#FF0033">*</font>五金合同总额</td>
              <td width="28%"> 
                <input type="text" name="wjhtze" size="20" maxlength="20"  value="" onChange="f_wdzje(insertform)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>未打折金额</td>
              <td width="29%"> 
                <input type="text" name="wdzje" size="20" maxlength="20"  value="" >
              </td>
              <td width="22%" align="right"><font color="#FF0033">*</font>合同总额</td>
              <td width="28%"> 
                <input type="text" name="htze" size="20" maxlength="20"  value="" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font>计划安装日期</td>
              <td width="29%"> 
                <input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>"  ondblclick="JSCalendar(this)">
              </td>
              <td width="22%" align="right"><font color="#FF0033">*</font>可减项截止时间</td>
              <td width="28%"> 
                <input type="text" name="kjxsj" size="20" maxlength="10"  value="<%=cf.addDay(7)%>" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0033">*</font><font color="#0000CC">签合同人</font></td>
              <td width="29%"> 
                <input type="text" name="qhtr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="22%" align="right"><font color="#FF0033">*</font>签合同时间</td>
              <td width="28%"> 
                <input type="text" name="qhtsj" size="20" maxlength="10"  value="<%=cf.today()%>" ondblclick="JSCalendar(this)" onBlur="f_getrq(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">合同备注</td>
              <td colspan="3"> 
                <textarea name="htbz" cols="71" rows="3"><%=htbz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="button" onClick="window.open('LoadData.jsp?ddbh=<%=ddbh%>')"  value="导入明细" name="drmx" disabled>
                  <input type="button" onClick="window.open('/jcjj/cgdd/ViewJc_cgdtmx.jsp?ddbh=<%=ddbh%>')"  value="查看明细" name="ckmx" >
                  <input type="button" onClick="window.open('DeleteLoadData.jsp?ddbh=<%=ddbh%>')"  value="删除明细" name="scmx" >
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
                </div>
              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_getrq(FormName)
{
	FormName.kjxsj.value=addDay(FormName.qhtsj.value,7);
}

function f_wdzje(FormName)//参数FormName:Form的名称
{
	var je=0;
	je=FormName.gtbfje.value*1.0+FormName.tmbfje.value*1.0+FormName.wjhtze.value*1.0+FormName.dqhtze.value*1.0;
	je=round(je,2);
	FormName.wdzje.value=je;
	FormName.htze.value=je;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_getrq(FormName);

	if(	javaTrim(FormName.sdks )=="") {
		alert("请输入[橱柜款式]！");
		FormName.sdks .focus();
		return false;
	}
	if(	javaTrim(FormName.xtbc )=="") {
		alert("请输入[箱体板材]！");
		FormName.xtbc .focus();
		return false;
	}
	if(	javaTrim(FormName.cghs )=="") {
		alert("请输入[橱柜花色]！");
		FormName.cghs .focus();
		return false;
	}
	if(	javaTrim(FormName.tmpp )=="") {
		alert("请输入[台面品牌]！");
		FormName.tmpp .focus();
		return false;
	}
	if(	javaTrim(FormName.tmhs )=="") {
		alert("请输入[台面花色]！");
		FormName.tmhs .focus();
		return false;
	}

	if(	javaTrim(FormName.gtbfje)=="") {
		alert("请输入[柜体部分金额]！");
		FormName.gtbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.gtbfje, "柜体部分金额"))) {
		return false;
	}
	if (parseFloat(FormName.gtbfje.value)==0)
	{
		alert("[柜体部分金额]不能为0！");
		FormName.gtbfje.select();
		return false;
	}

	if(	javaTrim(FormName.tmbfje)=="") {
		alert("请输入[台面合同金额]！");
		FormName.tmbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.tmbfje, "台面合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.wjhtze)=="") {
		alert("请输入[五金合同总额]！");
		FormName.wjhtze.focus();
		return false;
	}
	if(!(isFloat(FormName.wjhtze, "五金合同总额"))) {
		return false;
	}
	if(	javaTrim(FormName.dqhtze)=="") {
		alert("请输入[电器合同总额]！");
		FormName.dqhtze.focus();
		return false;
	}
	if(!(isFloat(FormName.dqhtze, "电器合同总额"))) {
		return false;
	}
	if(	javaTrim(FormName.htze)=="") {
		alert("请输入[合同总额]！");
		FormName.htze.focus();
		return false;
	}
	if(!(isFloat(FormName.htze, "合同总额"))) {
		return false;
	}
	if (parseFloat(FormName.htze.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.htze.select();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[未打折金额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折金额"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.htze.value))
	{
		alert("[未打折金额]不能小于[合同总额]！");
		FormName.htze.select();
		return false;
	}

	if(	javaTrim(FormName.jhazrq)=="") {
		alert("请输入[计划安装日期]！");
		FormName.jhazrq.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhazrq, "计划安装日期"))) {
		return false;
	}

	if(	javaTrim(FormName.kjxsj)=="") {
		alert("请输入[可减项截止时间]！");
		FormName.kjxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtr)=="") {
		alert("请输入[签合同人]！");
		FormName.qhtr.focus();
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[签合同时间]！");
		FormName.qhtsj.focus();
		return false;
	}
		if(!(isDatetime(FormName.qhtsj, "签合同时间"))) {
		return false;
	}

	FormName.action="SaveHtJc_cgdd.jsp";
	FormName.submit();

	FormName.drmx.disabled=false;
//	FormName.ckmx.disabled=false;
//	FormName.scmx.disabled=false;

/*	
	FormName.lrmm.disabled=false;
	FormName.ckmm.disabled=false;
	FormName.lrwj.disabled=false;
	FormName.ckwj.disabled=false;
	FormName.lrbl.disabled=false;
	FormName.ckbl.disabled=false;
*/
	return true;
}
function f_ckjg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="CkjgJc_cgdd.jsp";
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

	FormName.action="Jc_cgddmxMain.jsp";
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

	FormName.action="Jc_cgddmxList.jsp";
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

	FormName.action="InsertJc_cgwjddmx.jsp";
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

	FormName.action="Jc_cgwjddmxList.jsp";
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

	FormName.action="InsertJc_cgdqddmx.jsp";
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

	FormName.action="Jc_cgdqddmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
