<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<html>
<head>
<title>采购计划－维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>


<%

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//表示录入存盘直接转过来
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	<%
}

String cgjhmc=null;
String cgsqr=null;
String jhkssj=null;
String jhjssj=null;
String jhje=null;
String jhnr=null;
String jhdzt=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String shr=null;
String shsj=null;
String shjg=null;
String shnr=null;
String jhfkjd=null;
String bz=null;
String dqbm=null;
String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cgjhmc,cgsqr,jhkssj,jhjssj,jhje,jhnr,jhdzt,ssfgs,lrr,lrsj,shr,shsj,shjg,shnr,bz,jhfkjd ";
	ls_sql+=" from  jxc_clcgjh";
	ls_sql+=" where  (cgjhph='"+cgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgjhmc=cf.fillNull(rs.getString("cgjhmc"));
		cgsqr=cf.fillNull(rs.getString("cgsqr"));
		jhje=cf.fillNull(rs.getString("jhje"));
		jhnr=cf.fillNull(rs.getString("jhnr"));
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shjg=cf.fillNull(rs.getString("shjg"));
		shnr=cf.fillNull(rs.getString("shnr"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">采购计划－维护（采购计划批号：<%=cgjhph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>所属公司</td> 
  <td width="32%">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td align="right" width="18%"><font color="#CC0000">*</font>采购申请人</td> 
  <td width="32%"><input type="text" name="cgsqr" value="<%=cgsqr%>" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>材料类别</td>
  <td><select name="cllb" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value="1">辅材</option>
  </select></td>
  <td align="right"><font color="#CC0000">*</font>采购类别</td>
  <td><select name="cglb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="J">集团采购</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>采购计划名称</td>
  <td colspan="3"><input type="text" name="cgjhmc" value="<%=cgjhmc%>" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><span class="STYLE2 STYLE1">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2"><font color="#CC0000">*</font><span class="STYLE1">录入时间</span></span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3" ></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="cgjhph"  value="<%=cgjhph%>" >
	  <input type="hidden" name="dqbm" value="<%=dqbm%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  
	  <input name="button2" type="button" onClick="f_to(insertform)"  value="申购单转采购计划">
	  <input type="button"  value="常用材料录入" onClick="f_pllr(insertform)" name="pllr">
      <input type="button"  value="选择录入" onClick="f_cklr(insertform)" name="cklr" >
      <input type="button"  value="查看明细" onClick="f_ck(insertform)" name="ckmx" >
      <input type="button"  value=" 提 交 " onClick="f_tj(insertform)" name="tj" >
      <input name="button" type="button" onClick="f_print(insertform)"  value="打印申购单">
      <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("请输入[采购计划批号]！");
		FormName.cgjhph.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.cgsqr)=="") {
		alert("请输入[采购申请人]！");
		FormName.cgsqr.focus();
		return false;
	}
	if(	javaTrim(FormName.cglb)=="") {
		alert("请输入[采购类别]！");
		FormName.cglb.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[采购类别]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.cgjhmc)=="") {
		alert("请输入[采购计划名称]！");
		FormName.cgjhmc.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveEditJxc_clcgjh.jsp";
	FormName.submit();
	return true;
}


function f_to(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("请输入[采购计划批号]！");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_clsgd.jsp";
	FormName.submit();
	return true;
}

function f_pllr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("请输入[采购计划批号]！");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="PlLrJxc_clbm.jsp";
	FormName.submit();
	return true;
}


function f_cklr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("请输入[采购计划批号]！");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("请输入[采购计划批号]！");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("请输入[采购计划批号]！");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="tjcgjh.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("请输入[采购计划批号]！");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="/jxcdy/printfcsgd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
