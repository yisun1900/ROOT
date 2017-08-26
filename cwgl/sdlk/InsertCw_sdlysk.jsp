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

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String fkjlh=null;

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
String gj=null;
String dd=null;
String khjl=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
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

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  cw_sdlysk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！已录入水电路预收款，不能重复录入");
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
<form method="post" action="SaveInsertCw_sdlysk.jsp" name="insertform"  >
<div align="center">录入水电路应收款</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">客户编号</font> </td>
    <td width="32%" bgcolor="#E8E8FF"><%=khbh%> </td>
    <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000FF">合同号</font> </td>
    <td width="32%" bgcolor="#E8E8FF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">客户姓名</font> </td>
    <td bgcolor="#E8E8FF"><%=khxm%> </td>
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">质检姓名</font></td>
    <td bgcolor="#E8E8FF"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3" bgcolor="#E8E8FF"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">施工队</font></td>
    <td bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">施工班组</font></td>
    <td bgcolor="#E8E8FF"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE2">管家</span></td>
    <td bgcolor="#E8E8FF"><%=gj%></td>
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE2">调度</span></td>
    <td bgcolor="#E8E8FF"><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">设计师</font> </td>
    <td bgcolor="#E8E8FF"><%=sjs%> </td>
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">签约店面</font> </td>
    <td bgcolor="#E8E8FF"><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><span class="STYLE2">客户经理</span></td>
    <td bgcolor="#E8E8FF"><%=khjl%></td>
    <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
    <td bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">签约日期</font></td>
    <td bgcolor="#E8E8FF"><%=qyrq%> </td>
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">建议交底日期</font></td>
    <td bgcolor="#E8E8FF"><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">合同开工日期</font></td>
    <td bgcolor="#E8E8FF"><%=kgrq%> </td>
    <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">合同竣工日期</font></td>
    <td bgcolor="#E8E8FF"><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><font color="#0000FF">客户编号</font></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
    </td>
    <td align="right"><span class="STYLE1">*</span>水电路应收款</td>
    <td><input type="text" name="sdlysk" value="" size="20" maxlength="17" >
    </td>
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
      </select>    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea>    </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2" bgcolor="#999999" style="FONT-SIZE:12">
  <tr align="center">
    <td colspan="4">
        <input name="button" type="button" onClick="f_do(insertform)"  value="存盘">
        <input type="reset"  value="重输" name="reset">
    </td>
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
	if(	javaTrim(FormName.sdlysk)=="") {
		alert("请输入[水电路应收款]！");
		FormName.sdlysk.focus();
		return false;
	}
	if(!(isFloat(FormName.sdlysk, "水电路应收款"))) {
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
