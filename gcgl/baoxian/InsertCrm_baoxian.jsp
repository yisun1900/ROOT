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
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String gcjdmc=null;
String dwmc=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String sfysbx=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,sjkgrq,sjjgrq,sjwjrq,sq_dwxx.dwmc dm,zjxm,sgdmc sgd,sgbz,gcjdmc,sfysbx";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and  crm_khxx.khbh='"+khbh+"' ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
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
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		sfysbx=cf.fillNull(rs.getString("sfysbx"));
	}
	rs.close();
	ps.close();

	if (sfysbx.equals("2"))//1：未上保险；2：已保险
	{
		out.println("错误！已上保险");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_baoxian.jsp" name="insertform" >
<div align="center">办理保险</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF">
    <td align="right">客户编号</td>
    <td><%=khbh%> </td>
    <td align="right">合同号</td>
    <td><%=hth%> </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#CCCCFF">客户姓名</td>
    <td bgcolor="#CCCCFF"><%=khxm%> </td>
    <td align="right" bgcolor="#CCCCFF">联系方式</td>
    <td bgcolor="#CCCCFF"><%=lxfs%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCFF" align="right">签约店面</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">签约额</td>
    <td bgcolor="#CCCCFF"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">装修设计师</td>
    <td><%=sjs%></td>
    <td align="right">工程担当</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">施工队</td>
    <td><%=sgd%></td>
    <td align="right">施工班组</td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">合同开工日期</td>
    <td><%=kgrq%></td>
    <td align="right">合同竣工日期</td>
    <td><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">实际开工日期</td>
    <td><%=sjkgrq%></td>
    <td align="right">实际竣工日期</td>
    <td><%=sjjgrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">工程进度</td>
    <td><%=gcjdmc%></td>
    <td align="right">完结时间</td>
    <td><%=sjwjrq%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">客户编号</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>场地保险金额</td> 
  <td><input type="text" name="cdbxje" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>人员保险金额</td>
  <td><input type="text" name="rybxje" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>保险开始时间</td>
  <td><input type="text" name="baokssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right"><span class="STYLE1">*</span>保险终止时间</td>
  <td width="32%"><input type="text" name="baozzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
    <textarea name="bz" cols="71" rows="3"></textarea>      </td>
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
	if(	javaTrim(FormName.cdbxje)=="") {
		alert("请输入[场地保险金额]！");
		FormName.cdbxje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdbxje, "场地保险金额"))) {
		return false;
	}
	if(	javaTrim(FormName.rybxje)=="") {
		alert("请输入[人员保险金额]！");
		FormName.rybxje.focus();
		return false;
	}
	if(!(isFloat(FormName.rybxje, "人员保险金额"))) {
		return false;
	}
	if(	javaTrim(FormName.baokssj)=="") {
		alert("请输入[保险开始时间]！");
		FormName.baokssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.baokssj, "保险开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.baozzsj)=="") {
		alert("请输入[保险终止时间]！");
		FormName.baozzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.baozzsj, "保险终止时间"))) {
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
