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
String ssfgs=null;
String zcdlbm=null;
String ztjjgw=null;


double zcyfk=0;
double zcfk=0;
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
<title>订单确认</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform" >
<div align="center">订单确认（订单编号：<%=fbillno%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right">品牌</td>
      <td>
      <input type="text" name="ppbm" value="<%=ppbm%>" size="20" maxlength="50"></td>
      <td align="right">订单时间</td>
      <td><%=qhtsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"> 家居顾问 </td>
      <td><input type="text" name="clgw" value="<%=clgw%>" size="20" maxlength="20"></td>
      <td align="right">项目专员</td>
      <td>
      <input type="text" name="xmzy" value="<%=xmzy%>" size="20" maxlength="20"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" align="right"> 
        订单确认人      </td>
      <td width="29%"> 
        <input type="text" name="ddqrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="21%" align="right"> 
        订单确认时间      </td>
      <td width="29%"> 
        <input type="text" name="ddqrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr> 
      <td height="2" colspan="4" align="center">
          <input type="hidden" name="fbillno" value="<%=fbillno%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输" name="reset">
          <input type="button" value="查看客户电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')">      </td>
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

	if(	javaTrim(FormName.ddqrr)=="") {
		alert("请选择[订单确认人]！");
		FormName.ddqrr.focus();
		return false;
	}
	if(	javaTrim(FormName.ddqrsj)=="") {
		alert("请选择[订单确认时间]！");
		FormName.ddqrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ddqrsj, "订单确认时间"))) {
		return false;
	}


	FormName.action="SaveQrJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
