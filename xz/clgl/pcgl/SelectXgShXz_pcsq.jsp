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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_pcsqXgShList.jsp" name="selectform">
  <div align="center">派车－维护 </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申请序号</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">派车状态</td>
      <td width="32%"> 
        <select name="xz_pcsq_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="2">已派车</option>
          <option value="3">不同意</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">用车时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_ycsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_ycsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">返回时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_fhsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_fhsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">用车事由</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_ycsy" size="20" maxlength="200" >
      </td>
      <td align="right" width="18%">目的地</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_mdd" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申请人</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">申请部门</td>
      <td width="32%"> 
        <select name="xz_pcsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else  
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申请日期 从</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">被派车号</td>
      <td width="32%"> 
        <select name="xz_pcsq_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm order by qcph","");
%> 
        </select>
      </td>
      <td align="right" width="18%">派车人</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_pzr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">汽车型号</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
      <td align="right" width="18%">司机姓名</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_sjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">派车时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_pzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_pzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">录入时间</td>
      <td width="32%"> 
        <input type="text" name="xz_pcsq_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.xz_pcsq_sqxh, "申请序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_ycsj, "用车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_ycsj2, "用车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_fhsj, "返回时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_fhsj2, "返回时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_pzsj, "派车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_pzsj2, "派车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
