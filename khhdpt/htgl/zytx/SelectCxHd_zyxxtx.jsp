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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Hd_zyxxtxCxList.jsp" name="selectform">
  <div align="center">重要提醒查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">分公司</td>
      <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
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
      <td align="right" width="19%">签约店面</td>
      <td width="31%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">合同号</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">客户编号</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_khbh" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">客户姓名</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="19%">房屋地址</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">联系方式</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">设计师</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">签约日期 从</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">施工队</td>
      <td width="32%"> 
        <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
        </select>
      </td>
      <td align="right" width="19%">质检</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">提醒序号</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_txxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">提醒等级</td>
      <td width="31%">
        <input type="radio" name="txdj" value="1">
        一般 
        <input type="radio" name="txdj" value="2">
        重要 
        <input type="radio" name="txdj" value="3">
        特别重要 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">提醒分类</td>
      <td width="32%"> 
        <select name="hd_zyxxtx_txfl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+交款提醒&2+工地验收提醒&3+结算提醒&4+集成产品提醒&9+其它提醒","");
%> 
        </select>
      </td>
      <td align="right" width="19%">提醒标题</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_txbt" size="20" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">客户是否已查看</td>
      <td width="32%"><%
	cf.radioToken(out, "hd_zyxxtx_khsfyck","N+未查看&Y+已查看","");
%> </td>
      <td align="right" width="19%">客户是否可以留言</td>
      <td width="31%">
        <input type="radio" name="sfyxkhly" value="N">
        不可以 
        <input type="radio" name="sfyxkhly" value="Y">
        可以 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">客户查看时间 从</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_khcksj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_khcksj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">留言是否已查看</td>
      <td width="32%"> <%
	cf.radioToken(out, "hd_zyxxtxly_lysfyck","N+未查看&Y+已查看","");
%> </td>
      <td align="right" width="19%">留言查看人</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtxly_lyckr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">留言查看时间 从</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtxly_lycksj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtxly_lycksj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="hd_zyxxtx_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="hd_zyxxtx_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">录入部门</td>
      <td width="31%"> 
        <select name="hd_zyxxtx_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%> 
        </select>
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_khcksj, "客户查看时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_khcksj2, "客户查看时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtxly_lycksj, "留言查看时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtxly_lycksj2, "留言查看时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.hd_zyxxtx_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
