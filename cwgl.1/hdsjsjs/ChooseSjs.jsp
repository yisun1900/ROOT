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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'（'||b.dwmc||'）',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by a.ssdw,a.dwbh");
%>

<body bgcolor="#FFFFFF" onLoad="selectform.focus();">
<table width="100%">
  <tr>
    <td width="100%" height="49"> 
      <div align="center">设计师结算</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="122" > 
      <div align="center">

<form method="post" action="" name="selectform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="36%" align="right">分公司</td>
              <td width="64%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgsbh,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">签约店面</td>
              <td width="64%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dwbh,sjsbh,<%=sjsstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">所属设计室</td>
              <td width="64%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">已交款金额/签单金额大于</td>
              <td width="64%"> 
                <input type="text" name="sfkl" size="10" maxlength="10" value="30">
                %</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">设计费扣税比率</td>
              <td width="64%"> 
                <input type="text" name="sjfksbl" size="10" maxlength="10"  value="5.2">
                % </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">设计费提成比率</td>
              <td width="64%"> 
                <input type="text" name="sjftcbl" size="10" maxlength="10"  value="40">
                % </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="36%">签单客户提点</td>
              <td width="64%">
                <input type="text" name="sjstcbl" size="10" maxlength="10"  value="">
                % </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">时间范围 从</td>
              <td width="64%"> 
                <input type="text" name="sjfw" size="20" maxlength="10"  value="" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">到</td>
              <td width="64%"> 
                <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="36%">结算说明</td>
              <td width="64%"> 
                <textarea name="jsbz" cols="40" onDblClick="JSCalendar(this)" rows="6"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="继续" name="butt" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjsbh)=="") {
		alert("请输入[所属设计室]！");
		FormName.sjsbh.focus();
		return false;
	}

	if(	javaTrim(FormName.sfkl)=="") {
		alert("请输入[已交款金额/签单金额大于]！");
		FormName.sfkl.focus();
		return false;
	}
	if(!(isFloat(FormName.sfkl, "已交款金额/签单金额大于"))) {
		return false;
	}

	if(	javaTrim(FormName.sjfksbl)=="") {
		alert("请输入[设计费扣税比率]！");
		FormName.sjfksbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjfksbl, "设计费扣税比率"))) {
		return false;
	}
	if(	javaTrim(FormName.sjftcbl)=="") {
		alert("请输入[设计费提成比率]！");
		FormName.sjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjftcbl, "设计费提成比率"))) {
		return false;
	}


	if(!(isDatetime(FormName.sjfw, "时间范围到"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围到]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围到"))) {
		return false;
	}

	if(	javaTrim(FormName.sjstcbl)=="") {
		alert("请输入[签单客户提点]！");
		FormName.sjstcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjstcbl, "签单客户提点"))) {
		return false;
	}
	
	
	
	FormName.action="InsertCw_sjsjsjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
