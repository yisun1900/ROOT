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
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

String bjjbbm=null;
int zdsl=0;//标准数量
int sjjmsl=0;//实际减免数量
int sjsl=0;//实际数量
double sjzj=0;
String dqbm="";

String sjjmslStr="";

int yxjmsl=0;//允许减免数量

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sjjmsl,zdsl,sjsl";
	ls_sql+=" from  tc_csrjkhmmjmj";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjjmsl=rs.getInt("sjjmsl");
		zdsl=rs.getInt("zdsl");//最大免费数量
		sjsl=rs.getInt("sjsl");
	}
	rs.close();
	ps.close();

	yxjmsl=zdsl-sjsl;

	if (sjjmsl==0)
	{
		sjjmslStr="";
	}
	else{
		sjjmslStr=""+sjjmsl;
	}

	double tcnsl=0;//套餐内实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and lx in('1','2')";//1：标配；2：升级；3：套餐外
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcnsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcnsl>0)
	{
		out.println("错误！已选择主材，不能再减免");
		return;
	}

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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
<form method="post" action="SaveZcjmMm.jsp" name="insertform">
<div align="center">木门减免</div>





<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">客户编号</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">产品大类</span></td> 
  <td width="32%"><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">标准数量</span></td>
  <td><%=zdsl%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">实际数量</span></td>
  <td><%=sjsl%></td>
  <td align="right"><span class="STYLE4">实际减免数量</span></td>
  <td><%=sjjmsl%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>实际减免数量</td>
  <td><input type="text" name="sjjmsl" value="<%=sjjmslStr%>" size="20" maxlength="17" ></td>
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
 
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sjjmsl)=="") {
		alert("请输入[减免数量]！");
		FormName.sjjmsl.focus();
		return false;
	}
	if(!(isNumber(FormName.sjjmsl, "减免数量"))) {
		return false;
	}

	if (parseInt(FormName.sjjmsl.value)  > <%=yxjmsl%>)
	{
		alert("错误！[数量]不能超过限制:<%=yxjmsl%>");
		FormName.sjjmsl.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
