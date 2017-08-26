<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;
double hkze=0;
double zjhze=0;
String ddqrr=null;
String ddqrsj=null;
String cltzr=null;
String tzclsj=null;
String sclsj=null;
String jhshsj=null;
String tzry=null;
String shtzsm=null;
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
String ztjjgw=null;
String htcxhdje=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:sqlserver";
Connection conn1=null;

try {
	conn=cf.getConnection();

	Class.forName (driver);
	conn1 = DriverManager.getConnection(url, "sa", "");


	ls_sql="select t_Organization.fnumber,SEOrder.ppbm,SEOrder.clgw,SEOrder.xmzy,SEOrder.FDate,SEOrder.jhshsj,SEOrder.tzry,SEOrder.shtzsm";
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
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		tzry=cf.fillNull(rs.getString("tzry"));
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
	}
	rs.close();
	ps.close();



	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
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
<title>修改送货时间</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
<div align="center">修改送货时间（订单编号：<%=fbillno%>） 
</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        订单时间      </td>
      <td width="32%" ><%=qhtsj%> </td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="32%" >&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">计划送货时间</td>
      <td > 
        <input type="text" name="jhshsj" size="20" maxlength="10" value="<%=jhshsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right">通知人员</td>
      <td ><select name="tzry" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""> </option>
<%
	cf.selectToken(out,"现场班长+现场班长&客户+客户&家居顾问+家居顾问&其它人员+其它人员",tzry);
%> 
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">送货通知说明</td>
      <td colspan="3"> 
        <textarea name="shtzsm" rows="3" cols="69"><%=shtzsm%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center" >
          <input type="hidden" name="fbillno"  value="<%=fbillno%>" >
          <input type="hidden" name="khbh" value="<%=khbh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="button">
      <input type="reset"  value="重输" name="reset">      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="19%" align="right" bgcolor="#CCCCFF"> 客户编号 </td>
    <td width="31%" bgcolor="#CCCCFF"><%=khbh%> </td>
    <td width="19%" align="right" bgcolor="#CCCCFF"> 合同号 </td>
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
    <td width="19%" align="right"> 施工队 </td>
    <td width="31%"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td width="19%" align="right"> 班长 </td>
    <td width="31%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td width="19%" align="right"> 家装签约日期 </td>
    <td width="31%"><%=qyrq%> </td>
    <td width="19%" align="right"> 家装签约额 </td>
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
    <td width="31%"><%=cxhdbm%> </td>
    <td width="19%" align="right">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.jhshsj)=="") {
		alert("请选择[计划送货时间]！");
		FormName.jhshsj.focus();
		return false;
	}

	if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.tzry)=="") {
		alert("请选择[通知人员]！");
		FormName.tzry.focus();
		return false;
	}

	FormName.action="SaveXgShsjJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
