<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String clgw=null;
String xmzy=null;
String ppbm=null;
String qhtsj=null;

String fbillno=cf.GB2Uni(request.getParameter("fbillno"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String bzdh="";
String dzdh=null;
String ssfgs=null;
String zcdlbm=null;
String ztjjgw=null;
String htcxhdje=null;

String fkje=null;
String sqdj="";

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:sqlserver";
Connection conn1=null;

try {
	conn=cf.getConnection();

	Class.forName (driver);
	conn1 = DriverManager.getConnection(url, "sa", "");

	ls_sql="select t_Organization.fnumber,SEOrder.ppbm,SEOrder.clgw,SEOrder.xmzy,SEOrder.FDate";
	ls_sql+=" from  t_Organization,SEOrder";
    ls_sql+=" where SEOrder.FCustID=t_Organization.FItemID";
	ls_sql+=" and fbillno='"+fbillno+"'";
	ps= conn1.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("fnumber"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		clgw=cf.fillNull(rs.getString("clgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("FDate"));
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
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
		if (conn1 != null) conn1.close();
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
		if (conn1 != null) conn1.close();
	}
}
%>

<html>
<head>
<title>供应商接收</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">供应商接收（订单编号：<%=fbillno%>） </div>

<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="15%"> 
        <div align="right">供应商接收录入人</div>
      </td>
      <td width="35%"> 
        <input type="text" name="gysjslrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="15%"> 
        <div align="right">供应商接收录入时间</div>
      </td>
      <td width="35%"> 
        <input type="text" name="gysjslrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="fbillno" size="20" maxlength="9"  value="<%=fbillno%>" >
          <input type="button"  value="接收" onClick="f_do(editform)" >
          <input type="reset"  value="重输" name="reset">
          <input name="button" type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看客户电话">
        </div>
      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="31%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">客户姓名</td>
    <td width="31%"><%=khxm%></td>
    <td width="19%" align="right">质检</td>
    <td width="31%"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
    <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="19%" bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td width="31%" bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      施工队    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="19%" align="right"> 
      班长    </td>
    <td width="31%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      家装签约日期    </td>
    <td width="31%"> <%=qyrq%> </td>
    <td width="19%" align="right"> 
      家装签约额    </td>
    <td width="31%"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">合同开工日期</td>
    <td width="31%"><%=kgrq%></td>
    <td width="19%" align="right">合同竣工日期</td>
    <td width="31%"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">参加促销活动</td>
    <td width="31%"> <%=cxhdbm%> </td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fbillno)=="") {
		alert("请输入[订单编号]！");
		FormName.fbillno.focus();
		return false;
	}

	if(	javaTrim(FormName.gysjslrr)=="") {
		alert("请选择[供应商接收录入人]！");
		FormName.gysjslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.gysjslrsj)=="") {
		alert("请选择[供应商接收录入时间]！");
		FormName.gysjslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.gysjslrsj, "供应商接收录入时间"))) {
		return false;
	}

	FormName.action="SaveGcjsJc_zcdd.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fbillno)=="") {
		alert("请输入[订单编号]！");
		FormName.fbillno.focus();
		return false;
	}

	if(	javaTrim(FormName.gysjslrr)=="") {
		alert("请选择[供应商接收录入人]！");
		FormName.gysjslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.gysjslrsj)=="") {
		alert("请选择[供应商接收录入时间]！");
		FormName.gysjslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.gysjslrsj, "供应商接收录入时间"))) {
		return false;
	}

	FormName.action="GcjsDyJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
