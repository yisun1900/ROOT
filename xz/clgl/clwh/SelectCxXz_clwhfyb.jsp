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
String lrr=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Xz_clwhfybCxList.jsp" name="selectform">
  <div align="center">车辆附加费查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">所属分公司</td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");

		out.println("        <select name=\"xz_clwhfyb_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_clwhfyb_ssfgs,fyfsbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
		out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xz_clwhfyb_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="17%">费用发生部门</td>
      <td width="33%"> 
        <select name="fyfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">登记序号</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_djxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="17%">汽车牌号</td>
      <td width="33%"> 
        <select name="xz_clwhfyb_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm order by qcph","");
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by qcph","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">汽车型号</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
      <td align="right" width="17%">目前司机姓名</td>
      <td width="33%"> 
        <input type="text" name="xz_qcdm_sjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">项目</td>
      <td width="32%"> 
        <select name="xz_clwhfyb_xm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select clfjfmc c1,clfjfmc c2 from dm_clfjfbm order by clfjfbm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">费用</td>
      <td width="33%"> 
        <input type="text" name="xz_clwhfyb_fy" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">费用发生日期 从</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_djrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="xz_clwhfyb_djrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">经手人</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_jsr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">批准人</td>
      <td width="33%"> 
        <input type="text" name="xz_clwhfyb_pzr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="xz_clwhfyb_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">查询结果排序</td>
      <td colspan="3">第一列 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="xz_clwhfyb.ssfgs">所属分公司</option>
          <option value="xz_clwhfyb.fyfsbm" selected>费用发生部门</option>
          <option value="xz_clwhfyb.qcph">汽车牌号</option>
          <option value="xz_clwhfyb.lrsj">录入时间</option>
          <option value="xz_clwhfyb.djrq">费用发生日期</option>
          <option value="xz_clwhfyb.jsr">经手人</option>
          <option value="xz_clwhfyb.pzr">批准人</option>
          <option value="xz_clwhfyb.fy">费用</option>
          <option value="xz_clwhfyb.xm">项目</option>
        </select>
        第二列 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_clwhfyb.ssfgs">所属分公司</option>
          <option value="xz_clwhfyb.fyfsbm">费用发生部门</option>
          <option value="xz_clwhfyb.qcph" selected>汽车牌号</option>
          <option value="xz_clwhfyb.lrsj">录入时间</option>
          <option value="xz_clwhfyb.djrq">费用发生日期</option>
          <option value="xz_clwhfyb.jsr">经手人</option>
          <option value="xz_clwhfyb.pzr">批准人</option>
          <option value="xz_clwhfyb.fy">费用</option>
          <option value="xz_clwhfyb.xm">项目</option>
        </select>
        第三列 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_clwhfyb.ssfgs">所属分公司</option>
          <option value="xz_clwhfyb.fyfsbm">费用发生部门</option>
          <option value="xz_clwhfyb.qcph" >汽车牌号</option>
          <option value="xz_clwhfyb.lrsj" selected>录入时间</option>
          <option value="xz_clwhfyb.djrq">费用发生日期</option>
          <option value="xz_clwhfyb.jsr">经手人</option>
          <option value="xz_clwhfyb.pzr">批准人</option>
          <option value="xz_clwhfyb.fy">费用</option>
          <option value="xz_clwhfyb.xm">项目</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">显示风格</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
        <input type="text" name="myxssl" size="7" maxlength="13" value="30">
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
	if(!(isNumber(FormName.xz_clwhfyb_djxh, "登记序号"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_clwhfyb_fy, "费用"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_djrq, "费用发生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_djrq2, "费用发生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
