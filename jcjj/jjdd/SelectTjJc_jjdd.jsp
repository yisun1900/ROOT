<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by ssfgs,dwbh");
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dlxmzy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='10'");
	if (dlxmzy==null)
	{
		dlxmzy="";
	}
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">家具订单查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="307" > 
      <div align="center">

<form method="post" action="Jc_jjddCxListTj.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">分公司</td>
              <td width="31%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,jc_jjdd_dwbh,"+dwstr+");\">");
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
              <td width="19%" align="right">录入部门</td>
              <td width="31%"> 
                <select name="jc_jjdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
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
              <td width="19%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="31%"> 
                <select name="jc_jjdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_jjddzt order by clzt","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">退单原因</div>
              </td>
              <td width="31%"> 
                <select name="jc_jjdd_jjtdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">是否需派设计师</td>
              <td width="31%"> 
                <input type="radio" name="sfpsjs" value="1">
                是 
                <input type="radio" name="sfpsjs" value="2">
                否 </td>
              <td width="19%" align="right">客户类型</td>
              <td width="31%"> 
                <input type="radio" name="jc_jjdd_khlx" value="2">
                家装客户 
                <input type="radio" name="jc_jjdd_khlx" value="4">
                非家装客户 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">家具工厂</td>
              <td width="31%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' order by ssfgs,gysmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
		}
%> 
                </select>
              </td>
              <td width="19%" align="right">型材门工厂</td>
              <td width="31%"> 
                <select name="xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' order by ssfgs,gysmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_ddbh" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">合同号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="31%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">项目专员</div>
              </td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (dlxmzy.equals(""))
	{
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='10' order by sq_dwxx.ssdw,yhmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' order by yhmc","");
		}
	}
	else{
		out.println("<option value=\""+dlxmzy+"\">"+dlxmzy+"</option>");
	}
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">家居设计师&nbsp;</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jjsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%"> 
                <div align="right">计划初测时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhccsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%"> 
                <div align="right">实初测时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sccsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">签合同时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_qhtsj" size="20" maxlength="10" >
              </td>
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_qhtsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">计划安装日期 从</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhazrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%"> 
                <div align="right">实安装日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sazrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入时间 从</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrsj" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">退单时间 从</td>
              <td width="31%">
                <input type="text" name="jc_jjdd_tdsj" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%">
                <input type="text" name="jc_jjdd_tdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
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
	if(!(isDatetime(FormName.jc_jjdd_jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhccsj2, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sccsj, "实初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sccsj2, "实初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj2, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhazrq, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhazrq2, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sazrq, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sazrq2, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_tdsj, "退单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_tdsj2, "退单时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
