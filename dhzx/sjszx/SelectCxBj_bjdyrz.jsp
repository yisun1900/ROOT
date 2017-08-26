<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<%	
	String dwbh=(String)session.getAttribute("dwbh");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx order by ssfgs,dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">电子报价打印日志</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post"  name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">分公司</div>
              </td>
              <td width="33%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
                  <%
				if (yhjs.equals("A0") || yhjs.equals("A1"))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
				}
				else{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
				}
			%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">所属单位</div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				if (yhjs.equals("A0") || yhjs.equals("A1"))
				{
					out.println("<option value=\"\"></option>");
//					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  order by ssfgs,dwbh","");
				}
				else if (yhjs.equals("F0") || yhjs.equals("F1"))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  ssfgs='"+ssfgs+"' order by dwbh","");
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
              <td width="17%" align="right">IP地址</td>
              <td width="33%"> 
                <input type="text" name="ip" size="20" maxlength="30" >
              </td>
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">客户姓名</td>
              <td width="33%">
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
              <td width="17%" align="right">合同号</td>
              <td width="33%">
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">用户登陆名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16" >
              </td>
              <td width="17%"> 
                <div align="right">用户名称</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yhmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">查打印时间 从</td>
              <td width="33%"> 
                <input type="text" name="dysj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="dysj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">显示风格</td>
              <td width="33%"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
              <td align="right" width="17%" >&nbsp;</td>
              <td width="33%" >&nbsp; </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="button"  value="统计" onClick="f_do1(selectform)">
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
	if(!(isDatetime(FormName.dysj, "查打印时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.dysj2, "查打印时间"))) {
		return false;
	}

	FormName.action="Bj_bjdyrzList.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.dysj, "查打印时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.dysj2, "查打印时间"))) {
		return false;
	}

	FormName.action="Sq_ckdhrzTj.jsp";
	FormName.submit();

	return true;
}
//-->
</SCRIPT>
