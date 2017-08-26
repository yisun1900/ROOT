<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");

String ssfgs=null;
String khxm=null;
String xb=null;
String fwdz=null;
String sjs=null;
String zxdm=null;
String zxzt=null;

String khfwjlh=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select ssfgs,sjs,khbh,khxm,xb,fwdz,zxdm,zxzt ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where (1=1) and  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
	}
	rs.close();
	ps.close();

	if (zxzt.equals("3"))
	{
		out.println("错误！该客户已签单");
		return;
	}
	else if (zxzt.equals("4") )
	{
		out.println("错误！该客户已签单失败");
		return;
	}

	if (zxzt.equals("2") )
	{
		out.println("错误！该客户已提交飞单");
		return;
	}

	int count=0;
	ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	khfwjlh=khbh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>设计师提交飞单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">设计师提交飞单</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td width="6%">回访次数</td>
	<td width="9%">回访时间</td>
	<td width="13%">回访部门</td>
	<td width="6%">回访人</td>
	<td width="66%">客户回访情况</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT crm_zxhfjl.hfcs,crm_zxhfjl.hfsj,sq_dwxx.dwmc hfbm ,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk";
	ls_sql+=" FROM crm_zxhfjl,sq_dwxx";
    ls_sql+=" where crm_zxhfjl.khbh='"+khbh+"' and crm_zxhfjl.hfbm=sq_dwxx.dwbh(+)";
	ls_sql+=" order by crm_zxhfjl.hfjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[3]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>


<form method="post" action="SaveInsertCrm_qysbdj.jsp" name="selectform">
	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#CCCCCC" cellpadding="2" cellspacing="2">
	  <tr bgcolor="#CCCCFF">
        <td align="right" bgcolor="#FFFFCC"> 客户编号 </td>
	    <td bgcolor="#FFFFCC"><%=khbh%> </td>
	    <td align="right" bgcolor="#FFFFCC"> 客户姓名 </td>
	    <td bgcolor="#FFFFCC"><%=khxm%> </td>
      </tr>
	  <tr bgcolor="#CCCCFF">
        <td align="right" bgcolor="#FFFFCC"> 房屋地址 </td>
	    <td bgcolor="#FFFFCC"><%=fwdz%></td>
	    <td align="right" bgcolor="#FFFFCC">性别</td>
	    <td bgcolor="#FFFFCC"><%
	cf.radioToken(out, "M+男&W+女",xb,true);
%></td>
      </tr>
	  
	  <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFCC">咨询店面</td>
	    <td bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%></td>
	    <td align="right" bgcolor="#FFFFCC">设计师</td>
	    <td bgcolor="#FFFFCC"><%=sjs%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td width="18%" align="right"><span class="STYLE1">*</span><span class="STYLE2">登记编号</span></td>
        <td width="32%">
          <input type="text" name="khfwjlh" value="<%=khfwjlh%>" readonly>        </td>
        <td width="18%" align="right"><span class="STYLE1">*</span><span class="STYLE2">客户编号</span></td>
        <td width="32%">
          <input type="text" name="khbh" value="<%=khbh%>" readonly>        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right"><span class="STYLE1">*</span>飞单原因</td>
        <td width="32%"> 
          <select name="sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <option value=""></option>
            <%
			cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
			%> 
          </select>        </td>
        <td width="18%" align="right"><span class="STYLE1">*</span>飞单客户流向</td>
        <td width="32%"><select name="sbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
            <option value=""></option>
          <%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"' order by xh","");
%>
        </select></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><span class="STYLE1">*</span>飞单时间</td>
        <td><input type="text" name="sbsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)"></td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right"><span class="STYLE1">*</span>飞单原因详述</td>
        <td colspan="3"> 
          <textarea name="sbyyxs" cols="71" rows="6"></textarea>        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
        <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>        </td>
        <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
        <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
        <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
        </select></td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" align="center"> 
        <td colspan="4"> 
		<input type="hidden" name="sjs" value="<%=sjs%>"  >
          <input type="button" name="cz" value="存盘" onClick="f_do(selectform)">
          <input type="reset" name="Reset" value="重输">        </td>
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
	if(	javaTrim(FormName.sbyybm)=="") {
		alert("请输入[飞单原因]！");
		FormName.sbyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.sbkhlx)=="") {
		alert("请输入[飞单客户流向]！");
		FormName.sbkhlx.focus();
		return false;
	}
	if(	javaTrim(FormName.sbyyxs)=="") {
		alert("请输入[飞单原因详述]！");
		FormName.sbyyxs.focus();
		return false;
	}
	if(	javaTrim(FormName.sbsj)=="") {
		alert("请输入[飞单时间]！");
		FormName.sbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbsj, "飞单时间"))) {
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
