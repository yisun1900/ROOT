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
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdmc=cf.GB2Uni(request.getParameter("cxhdmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String djjzsfs=null;
String zsjs=null;

int row=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT djjzsfs,zsjs";
	ls_sql+=" FROM jc_hddjj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#FFFFFF">
<CENTER >
  <B><font size="3">促销活动代金券(<%=cxhdmc%>)</font></B>
</CENTER>
<form method="post" action="SaveInsertJc_hddjj.jsp" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">促销活动编码</span></td> 
  <td width="32%"> 
    <input type="text" name="cxhdbm" value="<%=cxhdbm%>" size="20" maxlength="8" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">促销活动名称</span></td> 
  <td width="32%"> 
    <input type="text" name="cxhdmc" value="<%=cxhdmc%>" size="20" maxlength="100" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>代金券赠送方式</td> 
  <td colspan="3">
<%
	cf.radioToken(out, "djjzsfs","1+固定金额&2+百分比",djjzsfs);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>赠送基数</td>
  <td colspan="3"><%
	cf.radioToken(out, "zsjs","1+折前合同额&2+折后合同额&3+折前工程费&4+折后工程费&5+结算金额",zsjs);
%></td>
  </tr>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center" bgcolor="#E8E8FF">
  <td width="10%" height="23"><strong>分段</strong></td>
  <td width="23%"><strong>金额起点</strong></td>
  <td width="23%"><strong>金额截止点</strong></td>
  <td width="23%"><strong>返券金额</strong></td>
  <td width="21%"><strong>返券百分比<font color="#0000FF">（>0且<=100）</font></strong></td>
</tr>
<%

	String qd=null;
	String zd=null;
	double fqje=0;
	double fqbfb=0;

	ls_sql="SELECT qd,zd,fqje,fqbfb";
	ls_sql+=" FROM jc_cxhdfqbz  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qd=rs.getString("qd");
		zd=rs.getString("zd");
		fqje=rs.getDouble("fqje");
		fqbfb=rs.getDouble("fqbfb");

		row++;


		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td>分段<%=row%></td>
		  <td><input type="text" name="qd" value="<%=qd%>" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td ><input type="text" name="zd" value="<%=zd%>" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td  > 
			<input type="text" name="fqje" value="<%=fqje%>" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">  </td>
		  <td  > 
			<input type="text" name="fqbfb" value="<%=fqbfb%>" size="12" maxlength="9" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			%&nbsp;&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	for (int i=0;i<5 ;i++ )
	{
		row++;
		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td>分段<%=row%></td>
		  <td><input type="text" name="qd" value="" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td ><input type="text" name="zd" value="" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td  > 
			<input type="text" name="fqje" value="" size="12" maxlength="17" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">  </td>
		  <td  > 
			<input type="text" name="fqbfb" value="" size="12" maxlength="9" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			%&nbsp;&nbsp;</td>
		</tr>
		<%
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
	if(	javaTrim(FormName.cxhdbm)=="") {
		alert("请输入[促销活动编码]！");
		FormName.cxhdbm.focus();
		return false;
	}
	if(!(isNumber(FormName.cxhdbm, "促销活动编码"))) {
		return false;
	}
	if(	javaTrim(FormName.cxhdmc)=="") {
		alert("请输入[促销活动名称]！");
		FormName.cxhdmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.zsjs)) {
		alert("请选择[赠送基数]！");
		FormName.zsjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.djjzsfs)) {
		alert("请选择[代金券赠送方式]！");
		FormName.djjzsfs[0].focus();
		return false;
	}

	if(	javaTrim(FormName.qd[0])=="") {
		alert("请输入[金额起点]！");
		FormName.qd[0].focus();
		return false;
	}
	if(!(isFloat(FormName.qd[0], "金额起点"))) {
		return false;
	}

	if(	javaTrim(FormName.zd[0])=="") {
		alert("请输入[金额截止点]！");
		FormName.zd[0].focus();
		return false;
	}
	if(!(isFloat(FormName.zd[0], "金额截止点"))) {
		return false;
	}

	if (parseFloat(FormName.zd[0].value)<=parseFloat(FormName.qd[0].value))
	{
		alert("[金额截止点]要大于[金额起点]！");
		FormName.zd[0].select();
		return false;
	}

	for (var i=0;i<<%=row%> ;i++ )
	{
		if(	javaTrim(FormName.qd[i])!="") 
		{
			if(	javaTrim(FormName.zd[i])=="") {
				alert("请输入[金额截止点]！");
				FormName.zd[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zd[i], "金额截止点"))) {
				return false;
			}

			if (parseFloat(FormName.zd[i].value)<=parseFloat(FormName.qd[i].value))
			{
				alert("[金额截止点]要大于[金额起点]！");
				FormName.zd[i].select();
				return false;
			}

			if (FormName.djjzsfs[1].checked)//百分比
			{
				if(	javaTrim(FormName.fqbfb[i])=="") {
					alert("请输入[返券百分比]！");
					FormName.fqbfb[i].focus();
					return false;
				}
				if(!(isFloat(FormName.fqbfb[i], "返券百分比"))) {
					return false;
				}
				if (FormName.fqbfb[i].value<0 || FormName.fqbfb[i].value>100)
				{
					alert("错误！[返券百分比]应该在0和100之间！");
					FormName.fqbfb[i].select();
					return false;
				}

				FormName.fqje[i].value="";
			}
			else{
				if(	javaTrim(FormName.fqje[i])=="") {
					alert("请输入[返券金额]！");
					FormName.fqje[i].focus();
					return false;
				}
				if(!(isFloat(FormName.fqje[i], "返券金额"))) {
					return false;
				}
				if (FormName.fqje[i].value<0)
				{
					alert("错误！[返券金额]应大于0！");
					FormName.fqje[i].select();
					return false;
				}

				FormName.fqbfb[i].value="";
			}
		}

	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
