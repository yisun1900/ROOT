<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String bgr=null;
String bgqssj=null;
String bgjzsj=null;
String qksm=null;
String sybz=null;
String syr=null;
String sysj=null;
String sysm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String wheredjbh=cf.GB2Uni(request.getParameter("djbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,bgr,bgqssj,bgjzsj,qksm,sybz,syr,sysj,sysm,lrr,lrsj,lrbm ";
	ls_sql+=" from  crm_gjzb";
	ls_sql+=" where  (djbh='"+wheredjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		bgr=cf.fillNull(rs.getString("bgr"));
		bgqssj=cf.fillNull(rs.getDate("bgqssj"));
		bgjzsj=cf.fillNull(rs.getDate("bgjzsj"));
		qksm=cf.fillNull(rs.getString("qksm"));
		sybz=cf.fillNull(rs.getString("sybz"));
		syr=cf.fillNull(rs.getString("syr"));
		sysj=cf.fillNull(rs.getDate("sysj"));
		sysm=cf.fillNull(rs.getString("sysm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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
<title>管家周报－－审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSpCrm_gjzb.jsp" name="editform">
<div align="center">管家周报－－审批</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">工程担当</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#E8E8FF" align="center">
    <td colspan="4" height="22">周报信息</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">报告人</td> 
  <td width="35%"><%=bgr%></td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">报告起始时间</td>
  <td><%=bgqssj%></td>
  <td align="right">报告截至时间</td>
  <td><%=bgjzsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">情况说明</td> 
  <td colspan="3"><%=qksm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"><%=lrr%></td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>
  </td>
  <td align="right" width="15%">&nbsp;  </td>
  <td width="35%">&nbsp;  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0000">*</font>审阅标志</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "sybz","Y+已审阅","Y");
%>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000FF">审阅人</font></td>
  <td><input type="text" name="syr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000FF">审阅时间</font></td>
  <td><input type="text" name="sysj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0000">*</font>审阅说明</td> 
  <td colspan="3"><textarea name="sysm" cols="72" rows="6"><%=sysm%></textarea></td>
  </tr>
<input type="hidden" name="wheredjbh"  value="<%=wheredjbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.syr)=="") {
		alert("请输入[审阅人]！");
		FormName.syr.focus();
		return false;
	}
	if(	javaTrim(FormName.sysj)=="") {
		alert("请输入[审阅时间]！");
		FormName.sysj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sysj, "审阅时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sysm)=="") {
		alert("请输入[审阅说明]！");
		FormName.sysm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
