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
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String bjjbbm=null;
String tccplbbm=null;

String sfxzsl="";
String sfxzslStr="";
String sfkjm="";//是否可减免  1：限制；3：不限制
String sfkjmStr="";
double yxjmzdsl=0;//允许减免最大数量
double jmdj=0;//减免单价
double sjjmsl=0;//实际减免数量
double sjjmje=0;//实际减免金额
double sjsl=0;//实际数量
double bzsl=0;//标准数量
String txxx="";
String sjjmslStr="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select bjjbbm";
	ls_sql+=" from  bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sfxzsl,DECODE(sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzslStr,sfkjm,DECODE(sfkjm,'1','不可减免','2','可减免') sfkjmStr,yxjmzdsl,jmdj,sjjmsl,sjjmje,sjsl,bzsl";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		sfxzslStr=cf.fillNull(rs.getString("sfxzslStr"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");
		bzsl=rs.getDouble("bzsl");
	}
	rs.close();
	ps.close();

	ls_sql="select sum(sjsl) sjsl ";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble("sjsl");
	}
	rs.close();
	ps.close();

	if (sjsl>0)
	{
		out.println("错误！已选择主材数量:"+sjsl+"，不可减免，请先删除主材");
		return;
	}


	if (sjjmsl==0)
	{
		sjjmslStr="";
	}
	else{
		sjjmslStr=""+sjjmsl;
	}

	if (sfkjm.equals("1"))//是否可减免 1：不可减免；2：可减免
	{
		out.println("错误！不可减免");
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
<form method="post" action="SaveZcjmFl.jsp" name="insertform">
<div align="center">主材减免</div>





<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">客户编号</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">套餐升级分类</span></td> 
  <td width="32%"><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc",tcsjflbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">结构位置</span></td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<OPTION SELECTED value="<%=jgwzbm%>"><%=jgwzbm%></OPTION>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">报价级别</span></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">是否限制数量</span></td>
  <td><%=sfxzslStr%></td>
  <td align="right"><span class="STYLE4">标准数量</span></td>
  <td><%=bzsl%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">是否可减免</span></td>
  <td><%=sfkjmStr%></td>
  <td align="right"><span class="STYLE4">允许减免最大数量</span></td>
  <td><%=yxjmzdsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">实际数量</span></td>
  <td><%=sjsl%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>实际减免数量</td>
  <td><input type="text" name="sjjmsl" value="<%=sjjmslStr%>" size="20" maxlength="17"  ></td>
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
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcsjflbm)=="") {
		alert("请选择[套餐升级分类]！");
		FormName.tcsjflbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sjjmsl)=="") {
		alert("请输入[减免数量]！");
		FormName.sjjmsl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmsl, "减免数量"))) {
		return false;
	}


	if (<%=sfxzsl%>!="3")
	{
		if (parseFloat(FormName.sjjmsl.value)><%=yxjmzdsl%>)
		{
			alert("错误！[减免数量]超过允许最大值<%=yxjmzdsl%>");
			FormName.sjjmsl.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
