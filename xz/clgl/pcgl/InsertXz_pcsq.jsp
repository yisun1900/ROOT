<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 用车申请</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_pcsq.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>申请部门              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              </select>              </td>
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>申请日期              </td>
              <td width="32%"> 
              <input type="text" name="sqrq"  size="20" value=<%=cf.today()%> maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>申请人</td>
              <td width="32%"> 
              <input type="text" name="sqr" value="<%=lrr%>" size="20" maxlength="8" >              </td>
              <td width="18%" align="right"><span class="STYLE1">*</span>联系方式</td>
              <td width="32%"> 
              <input type="text" name="lxfs" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <p align="right"><span class="STYLE1">*</span>用车事由              </td>
              <td colspan="3"> 
                <textarea name="ycsy" cols="71" rows="3"></textarea>
              　 　 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>目的地              </td>
              <td width="32%"> 
              <input type="text" name="mdd" value="" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
              公里数              </td>
              <td width="32%"> 
              <input type="text" name="gls" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <span class="STYLE1">*</span>用车时间              </td>
              <td colspan="3"> 日期： 
                <input type="text" name="ycsj" value=<%=cf.today()%> size="10" maxlength="10" onDblClick="JSCalendar(this)">
                小时： 
                <select name="ycsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="08">8时</option>
                  <option value="09">9时</option>
                  <option value="10">10时</option>
                  <option value="11">11时</option>
                  <option value="12">12时</option>
                  <option value="13">13时</option>
                  <option value="14">14时</option>
                  <option value="15">15时</option>
                  <option value="16">16时</option>
                  <option value="17">17时</option>
                  <option value="18">18时</option>
                  <option value="19">19时</option>
                  <option value="20">20时</option>
                  <option value="21">21时</option>
                  <option value="22">22时</option>
                  <option value="23">23时</option>
                  <option value="00">0时</option>
                  <option value="01">1时</option>
                  <option value="02">2时</option>
                  <option value="03">3时</option>
                  <option value="04">4时</option>
                  <option value="05">5时</option>
                  <option value="06">6时</option>
                  <option value="07">7时</option>
                </select>
                分钟： 
                <select name="ycsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="00" selected>00分</option>
                  <option value="10">10分</option>
                  <option value="20">20分</option>
                  <option value="30">30分</option>
                  <option value="40">40分</option>
                  <option value="50">50分</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <p align="right"><span class="STYLE1">*</span>返回时间              </td>
              <td colspan="3">日期： 
                <input type="text" name="fhsj" value=<%=cf.today()%> size="10" maxlength="10" onDblClick="JSCalendar(this)">
                小时： 
                <select name="fhsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="08">8时</option>
                  <option value="09">9时</option>
                  <option value="10">10时</option>
                  <option value="11">11时</option>
                  <option value="12">12时</option>
                  <option value="13">13时</option>
                  <option value="14">14时</option>
                  <option value="15">15时</option>
                  <option value="16">16时</option>
                  <option value="17">17时</option>
                  <option value="18">18时</option>
                  <option value="19">19时</option>
                  <option value="20">20时</option>
                  <option value="21">21时</option>
                  <option value="22">22时</option>
                  <option value="23">23时</option>
                  <option value="00">0时</option>
                  <option value="01">1时</option>
                  <option value="02">2时</option>
                  <option value="03">3时</option>
                  <option value="04">4时</option>
                  <option value="05">5时</option>
                  <option value="06">6时</option>
                  <option value="07">7时</option>
                </select>
                分钟： 
                <select name="fhsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
                  <option value="00" selected>00分</option>
                  <option value="10">10分</option>
                  <option value="20">20分</option>
                  <option value="30">30分</option>
                  <option value="40">40分</option>
                  <option value="50">50分</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF"><span class="STYLE1">*</span>录入人</font></td>
              <td width="32%"> 
              <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>              </td>
              <td align="right" width="18%"><font color="#0000FF"><span class="STYLE1">*</span>录入时间</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button" name="bc"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
        </table>
</form>
	  
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
	
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申请部门]！");
		FormName.dwbh.focus();
		return false;
	}
		if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("请输入[目的地]！");
		FormName.mdd.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.ycsy)=="") {
		alert("请输入[用车事由 ]！");
		FormName.ycsy.focus();
		return false;
	}

	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("请输入[目的地]！");
		FormName.mdd.focus();
		return false;
	}

	if(	javaTrim(FormName.ycsj)=="") {
		alert("请输入[用车日期]！");
		FormName.ycsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ycsj, "用车日期"))) {
		return false;
	}
 	if(	javaTrim(FormName.ycsj1)=="") {
		alert("请输入[用车小时]！");
		FormName.ycsj1.focus();
		return false;
	}
 	if(	javaTrim(FormName.ycsj2)=="") {
		alert("请输入[用车分钟]！");
		FormName.ycsj2.focus();
		return false;
	}


	if(	javaTrim(FormName.fhsj)=="") {
		alert("请输入[返回时间]！");
		FormName.fhsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fhsj, "返回时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fhsj1)=="") {
		alert("请输入[返回小时]！");
		FormName.fhsj1.focus();
		return false;
	}
	if(	javaTrim(FormName.fhsj2)=="") {
		alert("请输入[返回分钟]！");
		FormName.fhsj2.focus();
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
