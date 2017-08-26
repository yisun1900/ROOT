<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
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
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Xz_ggbglCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">发布分公司</td>
              <td width="35%"> 
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fbfgs,xz_ggbgl_fbbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
String dwstr1=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where ((ssfgs='"+ssfgs+"') or dwlx in('A0','A1'))  and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fbfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"  onChange=\"selectItem(fbfgs,xz_ggbgl_fbbm,"+dwstr1+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ((dwbh='"+ssfgs+"' and dwlx='F0') or dwlx='A0') ","");
        out.println("        </select>");
	}
%> 
              </td>
              <td width="15%" align="right">发布部门</td>
              <td width="35%"> 
                <select name="xz_ggbgl_fbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','A1','F0','F1','F2') order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ((ssfgs='"+ssfgs+"') or dwlx in('A0','A1'))  and cxbz='N' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">公告编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xz_ggbgl_ggbh" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">标题</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xz_ggbgl_ggmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xz_ggbgl_lrr" size="20" maxlength="20" >
                <BR>
              </td>
              <td width="15%"> 
                <div align="right">发布人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xz_ggbgl_fbr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">发布时间</div>
              </td>
              <td> 
                <input type="text" name="xz_ggbgl_fbsj" size="20" maxlength="10" >
              </td>
              <td> 
                <div align="right">到</div>
              </td>
              <td> 
                <input type="text" name="xz_ggbgl_fbsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">录入时间</div>
              </td>
              <td> 
                <input type="text" name="xz_ggbgl_lrsj" size="20" maxlength="10" >
              </td>
              <td> 
                <div align="right">到</div>
              </td>
              <td> 
                <input type="text" name="xz_ggbgl_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.xz_ggbgl_fbsj, "发布时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_ggbgl_fbsj2, "发布时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_ggbgl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_ggbgl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
