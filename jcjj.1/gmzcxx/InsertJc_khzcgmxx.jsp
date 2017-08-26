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
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;
String zxdjbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;

String xmzy="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="select khxm,crm_khxx.xmzy,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmzy=cf.fillNull(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();



	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_khzcgmxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！已录入，请到维护中修改");
		return;
	}

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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><strong>录入－客户主材购买信息</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCFF"> 客户编号 </td>
    <td bgcolor="#CCCCFF"><%=khbh%> </td>
    <td align="right" bgcolor="#CCCCFF"> 合同号 </td>
    <td bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">客户姓名</td>
    <td><%=khxm%></td>
    <td align="right">质检</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCFF" align="right">签约店面</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"> 施工队 </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"> 班长 </td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right"> 家装签约日期 </td>
    <td><%=qyrq%> </td>
    <td align="right"> 家装签约额 </td>
    <td><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">合同开工日期</td>
    <td><%=kgrq%></td>
    <td align="right">合同竣工日期</td>
    <td><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCFFCC">
    <td align="right">参加促销活动</td>
    <td colspan="3"><%=cxhdbm%> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="21" colspan="4" align="right">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="35%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="35%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td> 
  <td width="35%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
  </select></td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">总金额</span></td> 
  <td width="35%"><input type="text" name="zje" value="0" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input name="lr" type="button" onClick="f_lr(insertform)"  value="录入明细" disabled>
	<input name="ck" type="button" onClick="f_ck(insertform)"  value="查看明细" disabled>
	<input type="hidden" name="khbh" value="<%=khbh%>" ></td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zje)=="") {
		alert("请输入[总金额]！");
		FormName.zje.focus();
		return false;
	}
	if(!(isFloat(FormName.zje, "总金额"))) {
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

	FormName.action="SaveInsertJc_khzcgmxx.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}


function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertJc_khzcgmmx.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="Jc_khzcgmmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
