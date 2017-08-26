<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right"><font color="#FF0000">*</font>所属施工队</div>              </td>
              <td width="32%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>班长名称</td>
              <td width="32%"><input type="text" name="bzmc" value="" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">级别</td>
              <td><select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm","");
%>
              </select></td>
              <td align="right">工人数量</td>
              <td><input type="text" name="grsl" size="20" maxlength="50"  value="" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">已用工人数量</td>
              <td><input name="yygrsl" type="text"  value="" size="20" maxlength="50" ></td>
              <td align="right">可用工人数量</td>
              <td><input name="kygrsl" type="text"  value="" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>状态</td>
              <td><%
	cf.radioToken(out, "tdbz","N+正常&Y+停单&K+开除&L+离职","");
%></td>
              <td align="right">性别</td>
              <td><input type="radio" name="xb"  value="M">
男
  <input type="radio" name="xb"  value="W">
女 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">入职时间</td>
              <td><input name="rzsj" type="text" id="rzsj"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
              <td align="right">离职时间</td>
              <td><input name="lzsj" type="text" id="lzsj"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>电话</td>
              <td colspan="3"><input type="text" name="dh" value="" size="73" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>住址</td>
              <td colspan="3"><input type="text" name="zz" value="" size="73" maxlength="100" ></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>紧急联系人</td>
              <td bgcolor="#FFFFFF"><input type="text" name="jjlxr" value="" size="20" maxlength="20" >              </td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>联系人电话</td>
              <td bgcolor="#FFFFFF"><input type="text" name="jjlxrdh" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>紧急联系人地址</td>
              <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text" id="jjlxrdz" value="" size="72" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>身份证号</td>
              <td width="32%"><input type="text" name="sfzh" value="" size="20" maxlength="18" ></td>
              <td width="18%" align="right"><font color="#FF0000">*</font>是否签劳动合同</td>
              <td width="32%"><input type="radio" name="sfqldht" value="Y" checked>
是
  <input type="radio" name="sfqldht" value="N">
否</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否上保险</td>
              <td colspan="3"><input type="radio" name="sfsbx" value="Y" checked>
是
  <input type="radio" name="sfsbx" value="N">
否</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <P>
				<A HREF="班长.xls"><B>点击右键另存为，下载Excel模板</B></A>&nbsp;&nbsp;&nbsp;
                <input name="button" type="button" onClick="LoadExc(insertform)"  value="导入-Excel"></td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[所属施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmc)=="") {
		alert("请输入[班长名称]！");
		FormName.bzmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.tdbz)) {
		alert("请选择[状态]！");
		FormName.tdbz[0].focus();
		return false;
	}
	if(!(isNumber(FormName.grsl, "工人数量"))) {
		return false;
	}
	if(!(isNumber(FormName.yygrsl, "已用工人数量"))) {
		return false;
	}
	if(!(isNumber(FormName.kygrsl, "可用工人数量"))) {
		return false;
	}

	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[电话]！");
		FormName.dh.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfqldht)) {
		alert("请选择[是否签劳动合同]！");
		FormName.sfqldht[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfsbx)) {
		alert("请选择[是否上保险]！");
		FormName.sfsbx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("请选择[身份证号]！");
		FormName.sfzh.focus();
		return false;
	}
	if(	javaTrim(FormName.zz)=="") {
		alert("请选择[住址]！");
		FormName.zz.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxr)=="") {
		alert("请选择[紧急联系人]！");
		FormName.jjlxr.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdh)=="") {
		alert("请选择[紧急联系人电话]！");
		FormName.jjlxrdh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdz)=="") {
		alert("请选择[紧急联系人地址]！");
		FormName.jjlxrdz.focus();
		return false;
	}

	if(!(isDatetime(FormName.rzsj, "入职时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj, "离职时间"))) {
		return false;
	}

	FormName.action="SaveInsertSq_bzxx.jsp";
	FormName.submit();
	return true;
}

function LoadExc(FormName)//参数FormName:Form的名称
{

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
