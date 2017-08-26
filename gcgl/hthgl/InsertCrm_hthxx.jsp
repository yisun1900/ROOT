<%@ page contentType="text/html;charset=GBK" %>
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
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String hthqz=cf.executeQuery("select hthqz from sq_dwxx where dwbh='"+dwbh+"'");

String yhjs=(String)session.getAttribute("yhjs");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 合同号申请（<font color="#FF3333">注意：只有超级用户才能指定合同号</font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_hthxx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
              <div align="right"><font color="#FF0000">*</font>申请数量</div>              </td>
              <td width="29%"> 
              <input type="text" name="sqsl" value="1" size="20" maxlength="20" readonly>              </td>
              <td width="20%"> 
              <div align="right">指定合同号</div>              </td>
              <td width="30%">
              <input type="text" name="hth" value="" size="20" maxlength="10" <% if (!yhjs.equals("A0")) out.println("readonly");%>>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="21%" bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>合同号前缀</td>
              <td width="29%"> 
                <select name="hthqz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,hthqz,"");
%> 
              </select>              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font>申请单位</td>
              <td width="30%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>使用此合同号的客户编号</td>
              <td><input name="khbh" type="text" id="khbh" size="20" maxlength="7" ></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
              <div align="right"><font color="#FF0000">*</font>申请人</div>              </td>
              <td width="29%"> 
              <input type="text" name="sqr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>              </td>
              <td width="20%"> 
              <div align="right"><font color="#FF0000">*</font>申请时间</div>              </td>
              <td width="30%"> 
              <input type="text" name="sqsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="申请合同号" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
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
	if(	javaTrim(FormName.hth)!="") 
	{
		if (FormName.hth.value.length!=10)
		{
			alert("[合同号]长度为10位！");
			FormName.hth.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sqsl)=="") {
			alert("请输入[合同号申请数量]！");
			FormName.sqsl.focus();
			return false;
		}
		if(!(isNumber(FormName.sqsl, "合同号申请数量"))) {
			return false;
		}
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申请单位]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hthqz)=="") {
		alert("请选择[合同号前缀]！");
		FormName.hthqz.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请选择[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("请输入[申请时间]！");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "申请时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
