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
	String fgsbh=(String)session.getAttribute("ssfgs");

	String yhdlm=(String)session.getAttribute("yhdlm");
	String sjs=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='04'");
	if (sjs==null)
	{
		sjs="";
	}
%>

<body bgcolor="#FFFFFF">


      <div align="center">
        设计师－重做电子报价
        <BR><b><font color="#CC0000">（注意：只有『经过授权』才能重做电子报价 ）</font></b>
      </div>
<form method="post" action="Crm_khxxCzList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">分公司</div>
              </td>
              <td width="32%"> <%
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="16%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F2")){
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh='"+dwbh+"' ","");
	}
	else {
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+fgsbh+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
              <td width="16%"> 
                <div align="right">合同号</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
              <td width="16%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>
              </td>
              <td width="16%"> 
                <div align="right">质检</div>
              </td>
              <td width="34%"> 
                <input type="text" name="zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">施工队</div>
              </td>
              <td width="32%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by cxbz,sgdmc","");
	}
	else 
	{
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssdw='"+fgsbh+"' order by cxbz,sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="34%"> 
                <input type="text" name="sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">签约日期 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
