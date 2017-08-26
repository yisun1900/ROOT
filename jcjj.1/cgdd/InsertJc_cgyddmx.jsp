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
String ddbh = request.getParameter("ddbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入橱柜预订单（订单号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_cgyddmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="13%"> 
                <div align="right">橱柜</div>
              </td>
              <td width="37%"> 
                <select name="cgbm" style="FONT-SIZE:12PX;WIDTH:224PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cgbm,cgmc from jc_cgjgb order by cgbm","");
%> 
                </select>
              </td>
              <td width="13%"> 
                <div align="right">台面</div>
              </td>
              <td width="37%"> 
                <select name="tmbm" style="FONT-SIZE:12PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tmbm,tmmc||'('||xh||')'||'￥:'||ymjg from jc_tmbj order by tmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="13%"> 
                <div align="right">门板</div>
              </td>
              <td width="37%"> 
                <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbbm.mbbm,jdm_mbbm.mbmc||'￥:'||jc_mbjg.jg from jdm_mbbm,jc_mbjg where jdm_mbbm.mbbm=jc_mbjg.mbbm  order by jdm_mbbm.mbbm","");
%> 
                </select>
              </td>
              <td width="13%"> 
                <div align="right">门板封边</div>
              </td>
              <td width="37%"> 
                <select name="mbfbbm" style="FONT-SIZE:12PX;WIDTH:224PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbfbbm.mbfbbm,jdm_mbfbbm.mbfbmc||'￥:'||jc_mbfbjg.jg  from jdm_mbfbbm,jc_mbfbjg where jdm_mbfbbm.mbfbbm=jc_mbfbjg.mbfbbm order by jdm_mbfbbm.mbfbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%"> 
                <div align="right">箱体</div>
              </td>
              <td width="37%"> 
                <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_xtbm.xtbm,jdm_xtbm.xtmc||'￥:'||jc_xtjg.jg  from jdm_xtbm,jc_xtjg where jdm_xtbm.xtbm=jc_xtjg.xtbm order by jdm_xtbm.xtbm","");
%> 
                </select>
              </td>
              <td width="13%" align="right">拉手</td>
              <td width="37%"> 
                <select name="lsbm" style="FONT-SIZE:12PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_lsbm.lsbm,jdm_lsbm.lsmc||'￥:'||jc_lsjg.jg from jdm_lsbm,jc_lsjg where jdm_lsbm.lsbm=jc_lsjg.lsbm order by jdm_lsbm.lsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%"> 
                <div align="right">踢脚板</div>
              </td>
              <td width="37%"> 
                <select name="tjbbm" style="FONT-SIZE:12PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_tjbbm.tjbbm,jdm_tjbbm.tjbmc||'￥:'||jc_tjbjg.jg from jdm_tjbbm,jc_tjbjg where jdm_tjbbm.tjbbm=jc_tjbjg.tjbbm order by jdm_tjbbm.tjbbm","");
%> 
                </select>
              </td>
              <td width="13%" align="right">抽屉</td>
              <td width="37%"> 
                <select name="ctbm" style="FONT-SIZE:12PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_ctbm.ctbm,jdm_ctbm.ctmc||'￥:'||jc_ctjg.jg from jdm_ctbm,jc_ctjg where jdm_ctbm.ctbm=jc_ctjg.ctbm order by jdm_ctbm.ctbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%"> 
                <div align="right">铰链</div>
              </td>
              <td width="37%" bgcolor="#FFFFCC"> 
                <select name="jlbm" style="FONT-SIZE:12PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_jlbm.jlbm,jdm_jlbm.jlmc||'￥:'||jc_jljg.jg from jdm_jlbm,jc_jljg where jdm_jlbm.jlbm=jc_jljg.jlbm order by jdm_jlbm.jlbm","");
%> 
                </select>
              </td>
              <td width="13%">&nbsp;</td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" bgcolor="#FFFFFF" align="right">备注</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
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
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cgbm)=="") {
		alert("请选择[橱柜编码]！");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmbm)=="") {
		alert("请选择[台面]！");
		FormName.tmbm.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.mbbm)=="") {
		alert("请选择[门板]！");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mbfbjg)=="") {
		alert("请选择[门板封边价格]！");
		FormName.mbfbjg.focus();
		return false;
	}
	if(	javaTrim(FormName.xtbm)=="") {
		alert("请选择[箱体]！");
		FormName.xtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsbm)=="") {
		alert("请选择[拉手]！");
		FormName.lsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tjbbm)=="") {
		alert("请选择[踢脚板]！");
		FormName.tjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ctbm)=="") {
		alert("请选择[抽屉]！");
		FormName.ctbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jlbm)=="") {
		alert("请选择[铰链]！");
		FormName.jlbm.focus();
		return false;
	}
*/

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
