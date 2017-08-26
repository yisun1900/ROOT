<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String sgd=cf.GB2Uni(request.getParameter("sgd"));
%>
<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="5%">施工队</td>
	<td  width="6%">类型</td>
	<td  width="9%">金额</td>
	<td  width="10%">质保金减少原因</td>
	<td  width="7%">结算记录号</td>
	<td  width="8%">投诉报修记录号</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="10%">录入部门</td>
	<td  width="38%">备注</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT cw_zbjxgjl.xuhao,sq_sgd.sgdmc,DECODE(cw_zbjxgjl.lx,'1','手工录入','2','完工结算','3','工地维修') lx,cw_zbjxgjl.je,dm_zbjjsyybm.zbjjsyymc,cw_zbjxgjl.jsjlh,cw_zbjxgjl.tsjlh,cw_zbjxgjl.lrr,cw_zbjxgjl.lrsj,dwmc,cw_zbjxgjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjxgjl,sq_dwxx  ";
    ls_sql+=" where cw_zbjxgjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjxgjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_zbjxgjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_zbjxgjl.sgd='"+sgd+"'";
    ls_sql+=" and cw_zbjxgjl.scbz='N'";
    ls_sql+=" order by cw_zbjxgjl.xuhao";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%>
	</table>

<form method="post" action="SaveInsertCw_zbjxgjl.jsp" name="insertform" >
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">施工队</span></td>
      <td width="32%">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd  where sgd='"+sgd+"' ","");
%> 
        </select>      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">*</span>金额</td>
      <td width="32%"><input type="text" name="je" value="" size="20" maxlength="17" ></td>
      <td align="right" width="18%">质保金减少原因</td>
      <td width="32%"><select name="zbjjsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select zbjjsyybm,zbjjsyymc from dm_zbjjsyybm order by zbjjsyybm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
      <td colspan="3"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+lrbm+"' ","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" name="bc" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset"></td>
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
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[金额]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "金额"))) {
		return false;
	}

	if (parseFloat(FormName.je.value)<0)
	{
		if(	javaTrim(FormName.zbjjsyybm)=="") {
			alert("请选择[质保金减少原因]！");
			FormName.zbjjsyybm.focus();
			return false;
		}
	}
	else{
		FormName.zbjjsyybm.value="";
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
	if(	javaTrim(FormName.bz)=="") {
		alert("请选择[备注]！");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
