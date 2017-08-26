<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Sq_bzxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">分公司</td>
              <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"changeFgs(selectform);\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="18%" align="right">所属队长</td>
              <td width="34%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc||'（'||DECODE(sq_sgd.cxbz,'Y','撤销,')||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">班长名称</div>              </td>
              <td width="30%"> 
                <input type="text" name="sq_bzxx_bzmc" size="20" maxlength="50" >              </td>
              <td width="18%"> 
                <div align="right">电话</div>              </td>
              <td width="34%"> 
                <input type="text" name="sq_bzxx_dh" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">身份证号</div>              </td>
              <td width="30%"> 
                <input type="text" name="sq_bzxx_sfzh" size="20" maxlength="20" >              </td>
              <td width="18%"> 
                <div align="right">性别</div>              </td>
              <td width="34%"> <%
	cf.radioToken(out, "sq_bzxx_xb","M+男&W+女","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">状态</td>
              <td colspan="3"><INPUT type="radio" name="tdbz" value="N">
                正常
                <INPUT type="radio" name="tdbz" value="Y">
                停单
                <INPUT type="radio" name="tdbz" value="K">
                开除
                <INPUT type="radio" name="tdbz" value="L">
                离职 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">入职时间 从 </td>
              <td><input name="rzsj" type="text" id="rzsj"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
              <td align="right">到</td>
              <td><input name="rzsj2" type="text" id="rzsj2"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">离职时间 从</td>
              <td><input name="lzsj" type="text" id="lzsj"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
              <td align="right">到</td>
              <td><input name="lzsj2" type="text" id="lzsj2"  ondblclick="JSCalendar(this)" onKeyUp="keyGo(qyrq)" value="" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否签劳动合同</td>
              <td colspan="3"><input type="radio" name="sfqldht" value="Y">
是
  <input type="radio" name="sfqldht" value="N">
否</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">住址</td>
              <td colspan="3"> 
                <input type="text" name="sq_bzxx_zz" size="75" maxlength="100" >              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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

<%
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName) 
{
	FormName.sgd.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="fgs";

	var sql;
	sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.cxbz,'Y','撤销,')||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+FormName.fgs.value+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.sgd,ajaxRetStr);
}





function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.rzsj, "入职时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rzsj2, "入职时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj, "离职时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj2, "离职时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
