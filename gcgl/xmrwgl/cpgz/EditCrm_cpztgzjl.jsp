<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改跟踪信息</title>
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
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
String cpztbm=cf.GB2Uni(request.getParameter("cpztbm"));
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;

String getcplx=null;
String getcpztbm=null;
String getcpztmc=null;
int getztxh=0;

String zrr=null;
java.sql.Date fssj=null;
String bz=null;

try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz ";
	ls_sql+=" from  crm_khxx";
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

	ls_sql="select cpztbm,cplx ";
	ls_sql+=" from  crm_cpgzjl";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpztbm=cf.fillNull(rs.getString("cpztbm"));
		getcplx=cf.fillNull(rs.getString("cplx"));
	}
	else{
		out.println("错误！不存在的产品信息");
		return;
	}
	rs.close();
	ps.close();

	ls_sql="select ztxh,cpztmc ";
	ls_sql+=" from  dm_cpztbm";
	ls_sql+=" where cpztbm='"+getcpztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getztxh=rs.getInt("ztxh");
		getcpztmc=cf.fillNull(rs.getString("cpztmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select fssj,zrr,bz ";
	ls_sql+=" from  crm_cpztgzjl";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"' and cpztbm='"+cpztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fssj=rs.getDate("fssj");
		zrr=cf.fillNull(rs.getString("zrr"));
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
<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_cpztgzjl.jsp" name="insertform" >
<div align="center">修改跟踪信息</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">产品分类</td>
	<td  width="8%">产品状态</td>
	<td  width="8%">发生时间</td>
	<td  width="6%">责任人</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="12%">录入部门</td>
	<td  width="37%">备注</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();
	ls_sql="SELECT cpflmc,cpztmc,crm_cpztgzjl.fssj,crm_cpztgzjl.zrr,crm_cpztgzjl.lrr,crm_cpztgzjl.lrsj,dwmc,crm_cpztgzjl.bz";
	ls_sql+=" FROM crm_cpztgzjl,dm_cpztbm,dm_cpflbm,sq_dwxx  ";
    ls_sql+=" where crm_cpztgzjl.cpztbm=dm_cpztbm.cpztbm and crm_cpztgzjl.cpflbm=dm_cpflbm.cpflbm and crm_cpztgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_cpztgzjl.khbh='"+khbh+"' and crm_cpztgzjl.cpflbm='"+cpflbm+"'";
    ls_sql+=" order by crm_cpztgzjl.cpflbm,crm_cpztgzjl.fssj ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_cpztgzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">客户编号</span></td> 
  <td width="32%"><%=khbh%></td>
  <td align="right" width="18%"><span class="STYLE3">合同号</span></td> 
  <td width="32%"><%=hth%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">客户姓名</span></td>
  <td><%=khxm%></td>
  <td align="right"><span class="STYLE3">房屋地址</span></td>
  <td><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>产品分类</td>
  <td><select name="cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm='"+cpflbm+"'","");
%>
  </select></td>
  <td align="right"><span class="STYLE5">目前状态</span></td>
  <td><%=getcpztmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品状态</td> 
  <td width="32%"> 
    <select name="cpztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select cpztbm,cpztmc from dm_cpztbm where cpztbm='"+cpztbm+"'",cpztbm);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>发生时间</td> 
  <td width="32%"> 
    <input type="text" name="fssj" value="<%=fssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>责任人</td> 
  <td width="32%"> 
    <input type="text" name="zrr" value="<%=zrr%>" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
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
	if(	javaTrim(FormName.cpztbm)=="") {
		alert("请选择[产品状态]！");
		FormName.cpztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("请输入[发生时间]！");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "发生时间"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
