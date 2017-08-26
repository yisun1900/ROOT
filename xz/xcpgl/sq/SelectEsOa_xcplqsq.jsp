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
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Oa_xcplqsqEsList.jsp" name="selectform">
<div align="center">印刷品领取申请---二级审批</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申领分公司</td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"oa_xcplqsq_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(oa_xcplqsq_fgsbh,oa_xcplqsq_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"oa_xcplqsq_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="18%">申领单位</td>
      <td width="32%"> 
        <select name="oa_xcplqsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") )
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申请序号</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_sqxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">申领人</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_slr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">计划领取日期 从</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_jhlqrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_jhlqrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入日期 从</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_lrrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_lrrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">是否需审批</td>
      <td width="32%"> 
        <input type="radio" name="oa_xcplqsq_sfxsp" value="Y" checked>
        需要 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">一级审批人</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_yjspr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">一级审批结论</td>
      <td width="32%">
<%
	cf.radioToken(out, "oa_xcplqsq_yjspjl","1+同意&2+返回上级&3+撤销","");
%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">一级审批时间 从</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_yjspsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_yjspsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">领取状态</td>
      <td width="32%"> 
        <select name="oa_xcplqsq_lqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="3">一级审批</option>
          <option value="5">三级审批</option>
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.oa_xcplqsq_sqxh, "申请序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_jhlqrq, "计划领取日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_jhlqrq2, "计划领取日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lrrq, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lrrq2, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_yjspsj, "一级审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_yjspsj2, "一级审批时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
