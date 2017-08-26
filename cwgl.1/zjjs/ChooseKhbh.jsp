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
.STYLE1 {color: #3300FF}
-->
</style>
</head>
<%

String fgsbh=request.getParameter("fgsbh");
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="InsertCw_zjjsjl.jsp" name="insertform" >

<center>
  请选择－－结算工地（<%=zjxm%>）
  <input type="button"  value="选择工地－继续" onclick="f_do(insertform)">
    <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
    <input type="hidden" name="zjxm" value="<%=zjxm%>" >
    <input type="hidden" name="sjfw" value="<%=sjfw%>" >
    <input type="hidden" name="sjfw2" value="<%=sjfw2%>" >
</center>



<center>《完工结算－－工地明细》</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">选择</td>
	<td  width="9%">合同号</td>
	<td  width="7%">姓名</td>
	<td  width="24%">房屋地址</td>
	<td  width="7%">施工队</td>
	<td  width="6%">设计师</td>
	<td  width="9%">完工日期</td>
	<td  width="10%">工程签约额</td>
	<td  width="10%">家装实收款 </td>
	<td  width="7%">工程进度</td>
	<td  width="7%">客户类型</td>
</tr>


<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
String sjs=null;
String qyrq=null;
String sjjgrq=null;
String tdsj=null;
double qye=0;
double sfke=0;
double allqye=0;
double allsfke=0;
String sfyjqk=null;
String ysgcjdmc=null;
String zjjsbz=null;
String zt=null;

String bgcolor="#E8E8FF";

int row=0;

try {
	conn=cf.getConnection();

	allqye=0;
	allsfke=0;

	ls_sql="SELECT khbh,hth,khxm,fwdz,sgdmc,sjs,qyrq,sjjgrq,tdsj,qye,sfke,sfyjqk,ysgcjdmc,DECODE(zjjsbz,'0','未结算','1','签单结算','2','完工结算') zjjsbz,DECODE(crm_khxx.zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') zt";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zjxm='"+zjxm+"'";//0：未结算；1：已结算
    ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
    ls_sql+=" and crm_khxx.zjjsbz='0' and crm_khxx.gcjdbm in('4','5') and crm_khxx.zt in('2','5') ";
    ls_sql+=" and crm_khxx.sfyjqk='N'";//N：未交全款；Y：已交全款
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		sfyjqk=rs.getString("sfyjqk");
		ysgcjdmc=rs.getString("ysgcjdmc");
		zjjsbz=rs.getString("zjjsbz");
		zt=rs.getString("zt");

		allqye+=qye;
		allsfke+=sfke;

		row++;
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td>
				<input name="khbh" type="checkbox" value="<%=khbh%>">			
			</td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=sjs%></td>
			<td><%=sjjgrq%></td>
			<td><%=qye%></td>
			<td><%=sfke%></td>
			<td><%=ysgcjdmc%></td>
			<td><%=zt%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	allqye=cf.doubleTrim(allqye);
	allsfke=cf.doubleTrim(allsfke);

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allqye%></td>
		<td><%=allsfke%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>


</form>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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



</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	var mark=0;
	if (<%=row%>>1)
	{
		for (var i=0;i<<%=row%> ;i++ )
		{
			if( FormName.khbh[i].checked ){
				mark=1;
			}
		}
	}
	else if (<%=row%>==1)
	{
		if( FormName.khbh.checked ){
			mark=1;
		}
	}

	if (mark==0)
	{
		if ( !confirm("提醒！没有选择任何【结算工地】，确实要继续吗？") )	
		{
			return false;
		}
	}


	FormName.action="InsertCw_zjjsjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>