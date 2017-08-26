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

<form method="post" action="Crm_hfjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                回访记录号              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfjlh" size="20" maxlength="9" >
              </td>
              <td width="19%" align="right"> 
                回访类型              </td>
              <td width="29%"> 
                <select name="crm_hfjl_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                客户编号              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                房屋地址              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="19%" align="right"> 
                联系方式              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                设计师设计方案              </td>
              <td width="31%"> 
                <select name="crm_hfjl_sjfa" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">              </td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                设计师后期服务              </td>
              <td width="31%"> 
                <select name="crm_hfjl_hqfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                设计师交底清楚              </td>
              <td width="29%"> 
                <select name="crm_hfjl_jdqk" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                工程担当服务              </td>
              <td width="31%"> 
                <select name="crm_hfjl_zjyfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                工程担当到位              </td>
              <td width="29%"> 
                <select name="crm_hfjl_zjydw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                工程担当尽责              </td>
              <td width="31%"> 
                <select name="crm_hfjl_zjyjz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                施工队服务素质              </td>
              <td width="29%"> 
                <select name="crm_hfjl_fwsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                施工队施工质量              </td>
              <td width="31%"> 
                <select name="crm_hfjl_sgzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                施工队工人素质              </td>
              <td width="29%"> 
                <select name="crm_hfjl_grsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                集成家居设计师              </td>
              <td width="30%"> 
                <select name="jcjjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                集成家居顾问              </td>
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
              <td width="20%" align="right"> 
                集成项目专员              </td>
              <td width="30%"> 
                <select name="jcxmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                集成产品送货安装              </td>
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
              <td width="20%" align="right"> 
                集成产品质量              </td>
              <td width="30%"> 
                <select name="jccpzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">设计师回访内容</td>
              <td colspan="3"> 
                <input type="text" name="sjshfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">工程担当回访内容</td>
              <td colspan="3"> 
                <input type="text" name="zjyhfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">施工队回访内容</td>
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
              <td width="21%" align="right">设置下次回访时间</td>
              <td width="31%"><input type="radio" name="sfjxhf"  value="Y" >
设置
  <input type="radio" name="sfjxhf"  value="N" >
不设置
<input type="radio" name="sfjxhf"  value="F" >
重新回访</td>
              <td width="19%" align="right"> 
                下次回访类型              </td>
              <td width="29%"> 
                <select name="crm_hfjl_xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                下次回访日期 从              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_xchfrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="29%"> 
                <input type="text" name="crm_hfjl_xchfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                处理方式              </td>
              <td width="31%"> 
                <select name="crm_hfjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+不需处理&1+反馈相关部门","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                反馈部门              </td>
              <td width="29%"> 
                <select name="crm_hfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	String sql=null;

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2')";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and ssdw='"+ssfgs+"' ";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	}
	cf.selectItem(out,sql,"");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">处理状态</td>
              <td width="31%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="Y">相关部门已处理</option>
                  <option value="N">相关部门未处理</option>
                </select>
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                回访时间 从              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfsj" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="29%"> 
                <input type="text" name="crm_hfjl_hfsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">回访部门</td>
              <td width="31%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="19%" align="right">回访人</td>
              <td width="29%"> 
                <input type="text" name="crm_hfjl_hfr" size="20" maxlength="20" >
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
