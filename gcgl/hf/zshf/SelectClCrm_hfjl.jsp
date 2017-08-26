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
	String sql=null;
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

<form method="post" action="Crm_hfjlClList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">分公司</div>
              </td>
              <td width="30%"> 
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('F1','F2') and cxbz='N' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_hfjl_dwbh,"+dwstr+");\">");
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
              <td width="19%"> 
                <div align="right">反馈部门</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and cxbz='N' and ssdw='"+ssfgs+"' ";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
		cf.selectItem(out,sql,"");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+dwbh+"' ","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">回访记录号</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfjlh" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">回访类型</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">设计师设计方案</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_sjfa" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">回访人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">设计师后期服务</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_hqfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">设计师交底清楚</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_jdqk" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">工程担当服务</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_zjyfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">工程担当到位</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_zjydw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">工程担当尽责</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_zjyjz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">施工队服务素质</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_fwsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">施工队施工质量</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_sgzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">施工队工人素质</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_grsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">集成家居设计师</div>
              </td>
              <td width="30%"> 
                <select name="jcjjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">集成家居顾问</div>
              </td>
              <td width="31%"> 
                <select name="jsjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">集成项目专员</div>
              </td>
              <td width="30%"> 
                <select name="jcxmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">集成产品送货安装</div>
              </td>
              <td width="31%"> 
                <select name="jcshaz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">集成产品质量</div>
              </td>
              <td width="30%"> 
                <select name="jccpzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">设计师回访内容</td>
              <td colspan="3"> 
                <input type="text" name="sjshfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">工程担当回访内容</td>
              <td colspan="3"> 
                <input type="text" name="zjyhfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">施工队回访内容</td>
              <td colspan="3"> 
                <input type="text" name="sgdhfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">集成家居回访内容</td>
              <td colspan="3"> 
                <input type="text" name="jchfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">是否继续回访</div>
              </td>
              <td width="30%"><%
	cf.radioToken(out, "crm_hfjl_sfjxhf","Y+需回访&N+不需回访","");
%> </td>
              <td width="19%"> 
                <div align="right">下次回访类型</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">下次回访日期 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_xchfrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_xchfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">处理方式</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">反馈相关部门</option>
                </select>
              </td>
              <td width="19%"> 
                <div align="right">回访部门</div>
              </td>
              <td width="31%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1')";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";

		out.println("<option value=\"\"></option>");

		cf.selectItem(out,sql,"");

	}
	else
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1') and ssdw='"+ssfgs+"'";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";

		out.println("<option value=\"\"></option>");
		cf.selectItem(out,sql,"");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">处理状态</td>
              <td width="30%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">未处理</option>
                </select>
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">回访时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.crm_hfjl_hfjlh, "回访记录号"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_xchfrq, "下次回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_xchfrq2, "下次回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj2, "回访时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
