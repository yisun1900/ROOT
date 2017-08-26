<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tccplbbm=null;
String jldw=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">录入－套餐品牌升级差价表</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">地区</td>
	<td  width="13%">产品类别</td>
	<td  width="10%">原报价级别</td>
	<td  width="10%">升级报价级别</td>
	<td  width="16%">品牌</td>
	<td  width="8%">计量单位</td>
	<td  width="10%">升级差价</td>
	<td  width="9%">有效开始时间</td>
	<td  width="9%">有效结束时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT tckd_tcppsjcjb.dqbm,dm_dqbm.dqmc,tckd_tcppsjcjb.bjjbbm,a.bjjbmc,tckd_tcppsjcjb.bjjbbm1,b.bjjbmc bjjbmc1,tckd_tcppsjcjb.tccplbbm,clxlmc,tckd_tcppsjcjb.ppmc,tckd_tcppsjcjb.jldw,tckd_tcppsjcjb.sjcj,yxkssj,yxjzsj ";
	ls_sql+=" FROM tckd_tcppsjcjb,dm_dqbm,jdm_bjjbbm a,jdm_bjjbbm b,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcppsjcjb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcppsjcjb.dqbm='"+dqbm+"' and tckd_tcppsjcjb.tccplbbm='"+tccplbbm+"' and tckd_tcppsjcjb.bjjbbm='"+bjjbbm+"' and tckd_tcppsjcjb.bjjbbm1='"+bjjbbm1+"'";
    ls_sql+=" order by tckd_tcppsjcjb.dqbm,tckd_tcppsjcjb.tccplbbm,tckd_tcppsjcjb.bjjbbm,tckd_tcppsjcjb.bjjbbm1,tckd_tcppsjcjb.ppmc";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","DeleteTckd_tcppsjcjb.jsp","EditTckd_tcppsjcjb.jsp");

//设置显示列
	String[] disColName={"dqmc","clxlmc","bjjbmc","bjjbmc1","ppmc","jldw","sjcj","yxkssj","yxjzsj"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"dqbm","bjjbbm","bjjbbm1","tccplbbm","ppmc"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("删除");
	pageObj.setViewBolt("");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">产品类别</font></td>
    <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">地区</font></td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' ","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">原报价级别</font></td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm+"'","");
	%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">升级报价级别</font></td>
    <td><select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm1+"'","");
%>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">计量单位</font></td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm where jldwmc='"+jldw+"'",jldw);
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>有效开始时间</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>有效结束时间</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>品牌</td>
    <td bgcolor="#E8E8FF"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>升级差价</td>
    <td bgcolor="#E8E8FF"><input type="text" name="sjcj" value="" size="20" maxlength="17" ></td>
  </tr>
  

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset"></td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[原报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("请选择[升级报价级别]！");
		FormName.bjjbbm1.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}


	if(	javaTrim(FormName.yxkssj)=="") {
		alert("请输入[有效开始时间]！");
		FormName.yxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "有效开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.yxjzsj)=="") {
		alert("请输入[有效结束时间]！");
		FormName.yxjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "有效结束时间"))) {
		return false;
	}
	if (FormName.yxkssj.value>FormName.yxjzsj.value)
	{
		alert("[有效开始时间]不能大于[有效结束时间]！");
		FormName.yxjzsj.select();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("请输入[升级差价]！");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "升级差价"))) {
		return false;
	}

	FormName.action="SaveInsertTckd_tcppsjcjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
