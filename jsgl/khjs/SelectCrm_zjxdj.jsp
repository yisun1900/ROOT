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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String yhmc=(String)session.getAttribute("yhmc");
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

<form method="post" action="Crm_zjxdjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">分公司</td>
              <td width="33%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");

        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_zjxdj_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
              <td width="18%" align="right">签约店面</td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssdw='"+ssfgs+"' order by dwbh","");
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
              <td width="17%"> 
                <div align="right">增减项序号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_zjxxh" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_khbh" size="20" maxlength="7" >
              </td>
              <td width="18%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_khxm" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">电话</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_dh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">设计师</td>
              <td width="33%"> 
                <input type="text" name="sjs" size="20" maxlength="20" >
              </td>
              <td width="18%" align="right">质检姓名</td>
              <td width="32%"> 
                <input type="text" name="zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">施工队</div>
              </td>
              <td width="33%"> 
                <select name="crm_zjxdj_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">录入单位</td>
              <td width="33%"> 
                <select name="crm_zjxdj_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%" align="right">录入人</td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_lrsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">增减项发生时间 从</td>
              <td width="33%"> 
                <input type="text" name="fssj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="fssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">增减项原因</div>
              </td>
              <td width="33%"> 
                <select name="crm_zjxdj_zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">增减项发生额</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_zjje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">增减项说明</td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_zjxyysm" size="20" value="">
              </td>
              <td width="18%" align="right">发生阶段</td>
              <td width="32%"> 
                <select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">增减项完成标志</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="zjxwcbz" value="2" checked>
                已完成 </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(!(isNumber(FormName.crm_zjxdj_zjxxh, "增减项序号"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_zjxdj_zjje, "增减项发生额"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj, "增减项发生时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj2, "增减项发生时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjxdj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjxdj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
