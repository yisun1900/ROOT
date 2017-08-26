<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String clmc=null;
String cllb=null;
String cldlbm=null;
String clxlbm=null;
String scsmc=null;
String ppmc=null;
String cllbbm=null;
String xh=null;
String gg=null;
String clysbm=null;
String jldwbm=null;
String sfbhpj=null;
String pjts=null;
String cpjb=null;
String fgsx=null;
String cpsm=null;
String cd=null;
String zp=null;
String cgzq=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String nbbm=null;
String djzl=null;
String bzq=null;
String bztxq=null;
String clcd=null;
String clkd=null;
String clgd=null;
String cglb=null;
String bzgg=null;
String bzjldwbm=null;

String clbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bzjldwbm,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,cllbbm,xh,gg,clysbm,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,lrr,lrsj,lrbm,bz,nbbm,djzl,bzq,bztxq,clcd,clkd,clgd,cglb,bzgg ";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where  clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzjldwbm=cf.fillNull(rs.getString("bzjldwbm"));
		bzgg=cf.fillNull(rs.getString("bzgg"));
		cglb=cf.fillNull(rs.getString("cglb"));
		clcd=cf.fillNull(rs.getString("clcd"));
		clkd=cf.fillNull(rs.getString("clkd"));
		clgd=cf.fillNull(rs.getString("clgd"));
		bztxq=cf.fillNull(rs.getString("bztxq"));
		bzq=cf.fillNull(rs.getString("bzq"));
		djzl=cf.fillNull(rs.getString("djzl"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		cllb=cf.fillNull(rs.getString("cllb"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cllbbm=cf.fillNull(rs.getString("cllbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		clysbm=cf.fillNull(rs.getString("clysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cpsm=cf.fillNull(rs.getString("cpsm"));
		cd=cf.fillNull(rs.getString("cd"));
		zp=cf.fillNull(rs.getString("zp"));
		cgzq=cf.fillNull(rs.getString("cgzq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_clbm.jsp" name="insertform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>材料大类</td>
    <td>
	<select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeCldlbm(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('2','3') order by cldlmc",cldlbm);
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>材料小类</td>
    <td>
	<select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeClxlbm(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm where cldlmc='"+cldlbm+"' order by clxlmc",clxlbm);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>子品牌</td>
    <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc mc,ppmc from jxc_ppxx where pplb='2' and cldl='"+cldlbm+"'  order by ppmc",ppmc);
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>采购类别</td>
    <td>
      <%
	cf.radioToken(out, "cglb","J+集团采购&D+地方采购",cglb);
%>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料名称</td>
  <td colspan="3"><input type="text" name="clmc" size="73" maxlength="50"  value="<%=clmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="100"  value="<%=nbbm%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>计量单位</td> 
  <td width="32%"><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc",jldwbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="100"  value="<%=xh%>" ></td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="100"  value="<%=gg%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">单品重量</td>
  <td><input type="text" name="djzl" size="20" maxlength="100"  value="<%=djzl%>" >
    KG</td>
  <td align="right"><span class="STYLE1">*</span>包装计量单位</td>
  <td><select name="bzjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc",bzjldwbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>包装规格</td>
  <td colspan="3" >  <input type="text" name="bzgg" size="20" maxlength="8"  value="<%=bzgg%>" >
    （&gt;=1） 包装计量单位/计量单位</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料尺寸</td>
  <td colspan="3">长
    <input type="text" name="clcd" size="10" maxlength="100" value="<%=clcd%>">
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宽
    <input type="text" name="clkd" size="10" maxlength="100" value="<%=clkd%>" >
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高
    <input type="text" name="clgd" size="10" maxlength="100" value="<%=clgd%>" >
    cm</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">保质期</td> 
  <td width="32%"><input type="text" name="bzq" size="20" maxlength="100"  value="<%=bzq%>" >
天</td>
  <td align="right" width="18%">保质提醒期</td> 
  <td width="32%"><input type="text" name="bztxq" size="20" maxlength="100"  value="<%=bztxq%>" >
  天</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">采购周期</td> 
  <td width="32%"><input type="text" name="cgzq" size="20" maxlength="8"  value="<%=cgzq%>" >
天</td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>  </td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea>
  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="clbm"  value="<%=clbm%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

var lx="";

function changeCldlbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.clxlbm.length=1;
	FormName.ppmc.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	lx="1";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeClxlbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.ppmc.length=1;

	if (FormName.clxlbm.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql="select ppmc from jxc_ppxx where pplb in('2','3') and cldl='"+FormName.cldlbm.value+"'  order by ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToItem2(insertform.clxlbm,ajaxRetStr);
	}
	else if (lx=="2")
	{
		strToItem2(insertform.ppmc,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请输入[材料大类]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("请输入[材料小类]！");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cglb)) {
		alert("请选择[采购类别]！");
		FormName.cglb[0].focus();
		return false;
	}

	if(	javaTrim(FormName.clmc)=="") {
		alert("请输入[材料名称]！");
		FormName.clmc.focus();
		return false;
	}

	if(javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(javaTrim(FormName.bzjldwbm)=="") {
		alert("请选择[包装计量单位]！");
		FormName.bzjldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzgg)=="") {
		alert("请输入[包装规格]！");
		FormName.bzgg.focus();
		return false;
	}
	if(!(isNumber(FormName.bzgg, "包装规格"))) {
		return false;
	}
	if (parseFloat(FormName.bzgg.value)<1)
	{
		alert("[包装规格]必须大于或者等于1！");
		FormName.bzgg.select();
		return false;
	}

	if(!(isFloat(FormName.djzl, "单品重量"))) {
		return false;
	}
	if(!(isFloat(FormName.clcd, "长"))) {
		return false;
	}
	if(!(isFloat(FormName.clkd, "宽"))) {
		return false;
	}
	if(!(isFloat(FormName.clgd, "高"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "保质期"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "保质提醒期"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "采购周期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
