<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
.STYLE5 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;

String ghf=null;
String cplx=null;
String cpztbm=null;
String cpztmc=null;
int ztxh=0;

try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	ls_sql="select cpztbm,cplx,ghf ";
	ls_sql+=" from  crm_cpgzjl";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpztbm=cf.fillNull(rs.getString("cpztbm"));
		cplx=cf.fillNull(rs.getString("cplx"));
		ghf=cf.fillNull(rs.getString("ghf"));
	}
	else{
		out.println("错误！不存在的产品信息");
		return;
	}
	rs.close();
	ps.close();

	ls_sql="select ztxh,cpztmc ";
	ls_sql+=" from  dm_cpztbm";
	ls_sql+=" where cpztbm='"+cpztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztxh=rs.getInt("ztxh");
		cpztmc=cf.fillNull(rs.getString("cpztmc"));
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
<form method="post" action="SaveInsertCrm_cpazjl.jsp" name="insertform" >
<div align="center">录入安装记录</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">安装记录号</td>
	<td  width="8%">产品分类</td>
	<td  width="8%">安装结果</td>
	<td  width="8%">上门时间</td>
	<td  width="8%">上门人</td>
	<td  width="12%">安装说明</td>
	<td  width="8%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="8%">录入部门</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_cpazjl.azjlh,dm_cpflbm.cpflmc, DECODE(crm_cpazjl.azjg,'1','未完成','2','安装成功','3','安装失败'),crm_cpazjl.smsj,crm_cpazjl.smr,crm_cpazjl.azsm,crm_cpazjl.lrr,crm_cpazjl.lrsj,crm_cpazjl.lrbm  ";
	ls_sql+=" FROM dm_cpflbm,crm_cpazjl  ";
    ls_sql+=" where crm_cpazjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpazjl.khbh='"+khbh+"' and crm_cpazjl.cpflbm='"+cpflbm+"'";
    ls_sql+=" order by crm_cpazjl.cpflbm,crm_cpazjl.smsj ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">客户编号</span></td>
    <td><%=khbh%></td>
    <td align="right"><span class="STYLE3">合同号</span></td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">客户姓名</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE3">房屋地址</span></td>
    <td><%=fwdz%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品分类</td> 
  <td width="32%"> 
    <select name="cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm='"+cpflbm+"'","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>安装结果</td> 
  <td width="32%"> 
    <input type="radio" name="azjg"  value="1">未完成
    <input type="radio" name="azjg"  value="2">安装成功
    <input type="radio" name="azjg"  value="3">安装失败  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>上门时间</td> 
  <td width="32%"> 
    <input type="text" name="smsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">上门人</td> 
  <td width="32%"> 
    <input type="text" name="smr" value="" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">安装说明</td> 
  <td colspan="3"> 
    <textarea name="azsm" cols="71" rows="3"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	    <input type="hidden" name="khbh" value="<%=khbh%>"  >
	    <input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("请选择[产品分类]！");
		FormName.cpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.azjg)) {
		alert("请选择[安装结果]！");
		FormName.azjg[0].focus();
		return false;
	}
	if (!FormName.azjg[1].checked)
	{
		if(	javaTrim(FormName.azsm)=="") {
			alert("请输入[安装说明]！");
			FormName.azsm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.smsj)=="") {
		alert("请输入[上门时间]！");
		FormName.smsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.smsj, "上门时间"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
