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
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
	String lrr=(String)session.getAttribute("yhmc");
	String lrbm=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入五金件报价</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_wjjbj.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>五金类别</div>
              </td>
              <td width="34%"> 
                <select name="wjjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjjbm,wjjmc from jdm_wjjbm order by wjjbm","");
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>五金名称</td>
              <td colspan="3"> 
                <input type="text" name="wjmc" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>计量单位</div>
              </td>
              <td width="34%"> 
                <input type="text" name="jldw" value="" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>单价</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">供应商</td>
              <td width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='1' order by gysmc","");
%> 
                </select>
              </td>
              <td width="17%" align="right">安装位置</td>
              <td width="33%"> 
                <select name="wjazwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjazwzbm,wjazwzmc from jdm_wjazwzbm order by wjazwzbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入部门</font></td>
              <td width="34%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">所属地区</font></td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wjjbm)=="") {
		alert("请选择[五金类别]！");
		FormName.wjjbm.focus();
		return false;
	}

	if(	javaTrim(FormName.wjmc)=="") {
		alert("请输入[五金名称]！");
		FormName.wjmc.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.xinghao)=="") {
		alert("请输入[型号]！");
		FormName.xinghao.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
/*
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[供应商]！");
		FormName.dwbh.focus();
		return false;
	}
*/

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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
