<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sgd=null;
String zjxm=null;
String gqts=null;

String djbh=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,sgd,zjxm,gqts";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		gqts=cf.fillNull(rs.getString("gqts"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(djbh,8,3)),0)";
	ls_sql+=" from  crm_gdsgrz";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	djbh=khbh+cf.addZero(count+1,3);
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
<div align="center">录入－工地施工日志（登记编号：<%=djbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"> 客户编号 </td>
    <td bgcolor="#FFFFCC"><%=khbh%> </td>
    <td align="right" bgcolor="#FFFFCC">合同号</td>
    <td bgcolor="#FFFFCC"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">客户姓名</td>
    <td bgcolor="#FFFFCC"><%=khxm%></td>
    <td align="right" bgcolor="#FFFFCC">电话</td>
    <td bgcolor="#FFFFCC"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"> 房屋地址 </td>
    <td bgcolor="#FFFFCC"><%=fwdz%> </td>
    <td align="right" bgcolor="#FFFFCC">设计师 </td>
    <td bgcolor="#FFFFCC"><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"> 签约日期 </td>
    <td bgcolor="#FFFFCC"><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFCC">合同工期</td>
    <td bgcolor="#FFFFCC"><%=gqts%>天</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">合同开工日期 </td>
    <td bgcolor="#FFFFCC"><%=kgrq%></td>
    <td align="right" bgcolor="#FFFFCC">合同完工日期</td>
    <td bgcolor="#FFFFCC"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">实际开工日期 </td>
    <td bgcolor="#FFFFCC"><%=sjkgrq%></td>
    <td align="right" bgcolor="#FFFFCC">实际完工日期</td>
    <td bgcolor="#FFFFCC"><%=sjjgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">施工队</td>
    <td bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd",sgd,true);
%></td>
    <td align="right" bgcolor="#FFFFCC">工程担当</td>
    <td bgcolor="#FFFFCC"><%=zjxm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="17" colspan="4">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>情况说明</td> 
  <td colspan="3"> 
    <textarea name="qksm" cols="71" rows="4"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="31%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span> </td>
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="hidden" name="djbh" value="<%=djbh%>"  >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="button"  value="上传照片" onClick="f_lr(insertform)" name="lr" disabled>
	<input type="button"  value="查看照片" onClick="f_ck(insertform)" name="ck" disabled></td>
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
	if(	javaTrim(FormName.djbh)=="") {
		alert("请输入[登记编号]！");
		FormName.djbh.focus();
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

	FormName.action="SaveInsertCrm_gdsgrz.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djbh)=="") {
		alert("请输入[登记编号]！");
		FormName.djbh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djbh)=="") {
		alert("请输入[登记编号]！");
		FormName.djbh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
