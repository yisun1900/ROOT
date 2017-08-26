<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String khbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String gzjlh=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(gzjlh,11,2)),0)";
	ls_sql+=" from  crm_tsbxgzjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gzjlh=tsjlh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_tsbxgzjl.jsp" name="insertform" >
<div align="center">投诉保修跟踪记录</div>

	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">跟踪记录号</td>
	<td  width="7%">类型</td>
	<td  width="58%">跟踪情况</td>
	<td  width="9%">录入时间</td>
	<td  width="6%">录入人</td>
	<td  width="11%">录入部门</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_tsbxgzjl.gzjlh, DECODE(crm_tsbxgzjl.lx,'1','客诉专员','2','客服'),crm_tsbxgzjl.qksm,crm_tsbxgzjl.lrsj,crm_tsbxgzjl.lrr,dwmc  ";
	ls_sql+=" FROM crm_tsbxgzjl,crm_tsjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_tsbxgzjl.tsjlh=crm_tsjl.tsjlh and crm_tsbxgzjl.khbh=crm_khxx.khbh and crm_tsbxgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_tsbxgzjl.tsjlh='"+tsjlh+"'";
    ls_sql+=" order by crm_tsbxgzjl.gzjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE2">跟踪记录号</span></td> 
  <td width="33%"> 
    <input type="text" name="gzjlh" value="<%=gzjlh%>" size="20" maxlength="12" readonly>  </td>
  <td align="right" width="17%"><span class="STYLE1">*</span>类型</td> 
  <td width="33%"><input type="radio" name="lx"  value="1">
客诉专员
  <input type="radio" name="lx"  value="2">
客服 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE2">投诉报修记录号</span></td> 
  <td width="33%"><input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="10" readonly></td>
  <td align="right" width="17%"><span class="STYLE2"><span class="STYLE1">*</span>客户编号</span></td> 
  <td width="33%"><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>情况说明</td>
  <td colspan="3"><textarea name="qksm" cols="71" rows="6"></textarea></td>
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
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.gzjlh)=="") {
		alert("请输入[跟踪记录号]！");
		FormName.gzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[投诉报修记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.qksm)=="") {
		alert("请输入[情况说明]！");
		FormName.qksm.focus();
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
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
