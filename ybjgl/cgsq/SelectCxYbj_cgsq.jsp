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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
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

<form method="post" action="Ybj_cgsqCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> 
  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,ybj_cgsq_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>
              </td>
              <td width="17%"> 
                <div align="right">申请店面</div>
              </td>
              <td width="33%">
                <select name="ybj_cgsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="15%"> 
                <div align="right">申请编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_sqbh" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">是否已签单</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_sfyqd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+已签单&N+未签单","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">客户姓名</td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_khxm" size="20" maxlength="20" >
              </td>
              <td width="15%" align="right">联系方式</td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_fwdz" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">所属城区</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">设计师</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_sjs" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">发出申请</option>
                  <option value="2">分配样板</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">申请人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_sqr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">申请时间 从</td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_sqsj" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_sqsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">要求装修风格</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">要求装修价位</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">要求户型</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">要求户型面积</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">要求油色</div>
              </td>
              <td width="35%"> 
                <select name="ybj_cgsq_ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ybj_cgsq_bz" size="20" value="">
              </td>
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
	if(!(isNumber(FormName.ybj_cgsq_sqbh, "申请编号"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_cgsq_sqsj, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_cgsq_sqsj2, "申请时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
