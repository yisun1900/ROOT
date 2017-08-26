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
	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=(String)session.getAttribute("zdyhbz");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
	String yhmc=cf.executeQuery("select yhmc from sq_yhxx where zwbm='05' and yhdlm='"+yhdlm+"' ");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">材料进场维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_gcyszxmjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">分公司</div>
              </td>
              <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
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
              <td width="19%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="31%"> 
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
              <td width="20%" align="right">客户编号</td>
              <td width="30%"> 
                <input type="text" name="crm_gcyszxmjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">合同号</td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">设计师</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">施工队</div>
              </td>
              <td width="30%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by cxbz,sgdmc","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">工程担当</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='05' order by yhmc","");
	}
	else
	{
		if (zdyhbz.equals("Y") || yhmc==null)
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc","");
		}
		else{
			cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where zwbm='05' and ssfgs='"+ssfgs+"' order by yhmc",yhmc,false);
		}
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">验收子项目</div>
              </td>
              <td width="30%"> 
                <select name="crm_gcyszxmjl_gcyszxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='2' order by gcjdbm,gcyszxmbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">验收分类</div>
              </td>
              <td width="31%"> 
                <select name="crm_gcyszxmjl_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">材料进场</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">验收时间 从</td>
              <td width="30%"> 
                <input type="text" name="crm_gcyszxmjl_yssj" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="crm_gcyszxmjl_yssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">验收人</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_gcyszxmjl_ysr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">录入人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_gcyszxmjl_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_gcyszxmjl_lrsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_gcyszxmjl_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">录入单位</div>
              </td>
              <td width="30%"> 
                <select name="crm_gcyszxmjl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A1','F1') and  cxbz='N' order by dwbh","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">验收记录号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_gcyszxmjl_ysjlh" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_gcyszxmjl_yssj, "验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcyszxmjl_yssj2, "验收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcyszxmjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gcyszxmjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
