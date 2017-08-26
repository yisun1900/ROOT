<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String jzssk=null;
String cxhddj=null;
String jrhdje=null;
String ybkje=null;
String yfkje=null;
String lrr=null;
String lrsj=null;
String bz=null;
String blr=null;
String blsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String khxm=null;
String hth=null;
String lxfs=null;
String qtdh=null;
String sjs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jzssk,cxhddj,jrhdje,ybkje,yfkje,lrr,lrsj,bz,blr,blsj ";
	ls_sql+=" from  cw_jcfkd";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jzssk=cf.fillNull(rs.getString("jzssk"));
		cxhddj=cf.fillNull(rs.getString("cxhddj"));
		jrhdje=cf.fillNull(rs.getString("jrhdje"));
		ybkje=cf.fillNull(rs.getString("ybkje"));
		yfkje=cf.fillNull(rs.getString("yfkje"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		blr=cf.fillNull(rs.getString("blr"));
		blsj=cf.fillNull(rs.getDate("blsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,hth,lxfs,qtdh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
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
.STYLE1 {	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {color: #FF0000}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jcfkd.jsp" name="editform">
<div align="center">修改集成返款单（客户编号：<%=khbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">客户姓名</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE1">合同号</span></td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">联系电话</span></td>
    <td><%=lxfs%>、<%=qtdh%></td>
    <td align="right"><span class="STYLE1">家装设计师</span></td>
    <td><%=sjs%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1"><span class="STYLE2">*</span>家装实收款</span></td> 
  <td width="31%"> 
    <input type="text" name="jzssk" size="20" maxlength="17"  value="<%=jzssk%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1"><span class="STYLE2">*</span>促销活动订金</span></td> 
  <td width="31%"> 
    <input type="text" name="cxhddj" size="20" maxlength="17"  value="<%=cxhddj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE2">*</span>集成家居可计入活动金额</td> 
  <td colspan="3"> 
    <input type="text" name="jrhdje" size="20" maxlength="17"  value="<%=jrhdje%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>应补（扣）款</td>
  <td colspan="3"><input type="text" name="ybkje" size="20" maxlength="17"  value="<%=ybkje%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE2">*</span>最终应返款</td> 
  <td colspan="3"> 
    <input type="text" name="yfkje" size="20" maxlength="17"  value="<%=yfkje%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>办理人</td>
  <td><input type="text" name="blr" size="20" maxlength="20"  value="<%=blr%>" ></td>
  <td align="right"><span class="STYLE2">*</span>办理时间 </td>
  <td><input type="text" name="blsj" size="20" maxlength="10"  value="<%=blsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	  <input name="button" type="button" onClick="window.open('ViewCw_jcfkd.jsp?khbh=<%=khbh%>')"  value="打印">
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
	if(	javaTrim(FormName.jzssk)=="") {
		alert("请输入[家装实收款]！");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "家装实收款"))) {
		return false;
	}
	if(	javaTrim(FormName.cxhddj)=="") {
		alert("请输入[促销活动订金]！");
		FormName.cxhddj.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhddj, "促销活动订金"))) {
		return false;
	}
	if(	javaTrim(FormName.jrhdje)=="") {
		alert("请输入[计入活动金额]！");
		FormName.jrhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.jrhdje, "计入活动金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ybkje)=="") {
		alert("请输入[应补（扣）款金额]！");
		FormName.ybkje.focus();
		return false;
	}
	if(!(isFloat(FormName.ybkje, "应补（扣）款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.yfkje)=="") {
		alert("请输入[应返款金额]！");
		FormName.yfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkje, "应返款金额"))) {
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
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.blr)=="") {
		alert("请输入[办理人]！");
		FormName.blr.focus();
		return false;
	}
	if(	javaTrim(FormName.blsj)=="") {
		alert("请输入[办理时间]！");
		FormName.blsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.blsj, "办理时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
