<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">录入材料编码表<br>
	  <font color="red" size="+1"><b>注:录入新材料后,应及时通知各分公司相关人员,以便调整价格</b></font> </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCl_clbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="red">*</font>材料编码              </td>
              <td width="32%"> 
              <input type="text" name="clbm" value="" size="20" maxlength="20" ></td>
              <td width="18%" align="right"><font color="red">*</font>材料大类</td>
              <td width="32%"><select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
                <option value=""></option>
                <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
				%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="red">*</font>材料名称 </td>
              <td colspan="3"><input type="text" name="clmc" value="" size="73" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="red">*</font>计量单位</td>
              <td width="32%"><select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
                <option value=""></option>
                <%
				cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
				%>
              </select></td>
              <td width="18%" align="right">材料规格</td>
              <td width="32%"> 
                <input type="text" name="clgg" value="" size="20" maxlength="50" >              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">排序</td>
              <td width="32%"> 
                <input type="text" name="paixu" value="" size="20" maxlength="8" >              </td>
              <td width="18%" align="right">类型 </td>
              <td width="32%"> 
                <input type="radio" name="lx" value="1">
                常用 
                <input type="radio" name="lx" value="2" checked>
              非常用 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="18%">维护人</td>
              <td width="32%">
                <input type="text" name="wxr" value="<%=yhmc%>" size="20" maxlength="20">              </td>
              <td width="18%" rowspan="3" align="right"><font color="red">*</font>报价级别</td>
              <td width="32%" rowspan="3">
			  <select name="bjjb" size="7" multiple style="FONT-SIZE:12px;WIDTH:152px">
         	   <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
      		</select>	  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font><font color="#0000CC">信息录入人</font></td>
              <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#FF0033">*</font><font color="#0000CC">录入时间</font></td>
              <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                备注              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="lrjsfs" value="1" >
                <input type="hidden" name="lrbfb" value="" size="20" maxlength="10">
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset"> 
				<input type="button"  value="导入" name="dr" onClick="window.open('ImpAddData.jsp')"></td>
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
 
	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[材料编码]！");
		FormName.clbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clmc)=="") {
		alert("请输入[材料名称]！");
		FormName.clmc.focus();
		return false;
	}

	if(	javaTrim(FormName.jldwmc)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("请选择[材料大类]！");
		FormName.cldlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lrjsfs)=="") {
		alert("请选择[利润计算方式]！");
		FormName.lrjsfs.focus();
		return false;
	}
	if (FormName.lrjsfs.value==2 && javaTrim(FormName.lrbfb)=="")
	{
		alert("您选择了[百分比方式]必须录入[利润百分比]");
		FormName.lrbfb.focus();
		return false;
	}
	if (!(isFloat(FormName.lrbfb,"利润百分比"))){
		FormName.lrbfb.focus();     
		return      
	} 
	if (!(isNumber(FormName.paixu,"排序"))){
		FormName.paixu.focus();     
		return      
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


	if(	!selectChecked(FormName.bjjb)) {
		alert("请输入[报价级别]！");
		FormName.bjjb.focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
