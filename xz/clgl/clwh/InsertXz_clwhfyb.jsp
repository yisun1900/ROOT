<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 车辆附加费登记</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_clwhfyb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font>所属分公司</td>
              <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");

		out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,fyfsbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
		out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
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
              <td width="18%" align="right"><font color="#CC0000">*</font>汽车牌号</td>
              <td width="32%"> 
                <select name="qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm order by ssfgs,qcph","");
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by ssfgs,qcph","");
	}
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#CC0000">*</font>项目</td>
              <td width="33%"> 
                <select name="xm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select clfjfmc c1,clfjfmc c2 from dm_clfjfbm order by clfjfbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>费用发生日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="djrq" value=<%=cf.today()%> size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right"><font color="#CC0000">*</font>费用</div>
              </td>
              <td width="33%"> 
                <input type="text" name="fy" value="" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>经手人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jsr" value="" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">批准人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="pzr" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button" name="bc"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.qcph)=="") {
		alert("请选择[汽车牌号]！");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("请选择[项目]！");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.djrq)=="") {
		alert("请输入[费用发生日期]！");
		FormName.djrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.djrq, "费用发生日期"))) {
		return false;
	}
	if(	javaTrim(FormName.fy)=="") {
		alert("请输入[费用]！");
		FormName.fy.focus();
		return false;
	}
	if(!(isFloat(FormName.fy, "费用"))) {
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[经手人]！");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
