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
.STYLE1 {color: #3300FF}
-->
</style>
</head>
<%

String fgsbh=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String sjs=cf.GB2Uni(request.getParameter("sjs"));
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");
String xdsskbfb=request.getParameter("xdsskbfb");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="InsertCw_sjsjsjl.jsp" name="insertform" >

<center>
  请选择－－结算工地（<%=sjs%>）
  <input type="button"  value="选择工地－继续" onclick="f_do(insertform)">
    <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
    <input type="hidden" name="dwbh" value="<%=dwbh%>" >
    <input type="hidden" name="sjs" value="<%=sjs%>" >
    <input type="hidden" name="sjfw" value="<%=sjfw%>" >
    <input type="hidden" name="sjfw2" value="<%=sjfw2%>" >
    <input type="hidden" name="xdsskbfb" value="<%=xdsskbfb%>" >
</center>

<BR>
<center>《签单结算－－工地明细》</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">选择</td>
	<td  width="9%">合同号</td>
	<td  width="7%">姓名</td>
	<td  width="24%">房屋地址</td>
	<td  width="7%">施工队</td>
	<td  width="6%">质检</td>
	<td  width="9%">签约日期</td>
	<td  width="10%">业绩净值</td>
	<td  width="10%">家装实收款</td>
	<td  width="7%">工程进度</td>
	<td  width="7%">结算</td>
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
String zjxm=null;
String qyrq=null;
String sjjgrq=null;
String tdsj=null;
double qye=0;
double sfke=0;
double allqye=0;
double allsfke=0;
double sjstcbl=0;
double qdsyjsje=0;
double allqdsyjsje=0;
String ysgcjdmc=null;
String sjsjsbz=null;

String bgcolor="#E8E8FF";

int row=0;
int row1=0;
int row2=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,sjjgrq,tdsj,qye,sfke,sjstcbl,qdsyjsje,ysgcjdmc,DECODE(sjsjsbz,'0','未结算','1','签单结算','2','完工结算') sjsjsbz";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
//    ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"' and crm_khxx.sjs='"+sjs+"' and crm_khxx.sjsjsbz='0'";//0：未结算；1：签单结算；2：完工结算
//    ls_sql+=" and crm_khxx.sfke*100.0>=crm_khxx.qye*"+xdsskbfb;
    ls_sql+=" and crm_khxx.zt in('2','5')";
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
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		sjstcbl=rs.getDouble("sjstcbl");
		qdsyjsje=rs.getDouble("qdsyjsje");
		ysgcjdmc=rs.getString("ysgcjdmc");
		sjsjsbz=rs.getString("sjsjsbz");

		allqye+=qye;
		allsfke+=sfke;
		allqdsyjsje+=qdsyjsje;

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
				<input name="khbh" type="checkbox" value="<%=khbh%>" checked>			
			</td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
			<td><%=qyrq%></td>
			<td><%=qye%></td>
			<td><%=sfke%></td>
			<td><%=ysgcjdmc%></td>
			<td><%=sjsjsbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	allqye=cf.doubleTrim(allqye);
	allsfke=cf.doubleTrim(allsfke);
	allqdsyjsje=cf.doubleTrim(allqdsyjsje);

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

<center>《完工结算－－工地明细》</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">选择</td>
	<td  width="9%">合同号</td>
	<td  width="7%">姓名</td>
	<td  width="24%">房屋地址</td>
	<td  width="7%">施工队</td>
	<td  width="6%">质检</td>
	<td  width="9%">完工日期</td>
	<td  width="10%">业绩净值</td>
	<td  width="7%">已结算比率</td>
	<td  width="10%">已结算金额 </td>
	<td  width="7%">工程进度</td>
</tr>

<%
	allqye=0;
	allsfke=0;
	allqdsyjsje=0;

	ls_sql="SELECT khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,sjjgrq,tdsj,qye,sfke,sjstcbl,qdsyjsje,ysgcjdmc,DECODE(sjsjsbz,'0','未结算','1','签单结算','2','完工结算') sjsjsbz";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
//    ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
 //   ls_sql+=" and crm_khxx.dwbh='"+dwbh+"' and crm_khxx.sjs='"+sjs+"'";//0：未结算；1：签单结算；2：完工结算
    ls_sql+=" and crm_khxx.sjsjsbz='1' and crm_khxx.gcjdbm in('4','5') and crm_khxx.zt in('2','5') ";
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
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		sjstcbl=rs.getDouble("sjstcbl");
		qdsyjsje=rs.getDouble("qdsyjsje");
		ysgcjdmc=rs.getString("ysgcjdmc");
		sjsjsbz=rs.getString("sjsjsbz");

		allqye+=qye;
		allsfke+=sfke;
		allqdsyjsje+=qdsyjsje;

		row1++;
		if (row1%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td>
				<input name="khbh1" type="checkbox" value="<%=khbh%>" checked>			
			</td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
			<td><%=sjjgrq%></td>
			<td><%=qye%></td>
			<td><%=sjstcbl%>%</td>
			<td><%=qdsyjsje%></td>
			<td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	allqye=cf.doubleTrim(allqye);
	allsfke=cf.doubleTrim(allsfke);
	allqdsyjsje=cf.doubleTrim(allqdsyjsje);

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allqdsyjsje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>


<center>《退单结算－－工地明细》</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">选择</td>
	<td  width="9%">合同号</td>
	<td  width="7%">姓名</td>
	<td  width="24%">房屋地址</td>
	<td  width="7%">施工队</td>
	<td  width="6%">质检</td>
	<td  width="9%">退单日期</td>
	<td  width="10%">业绩净值</td>
	<td  width="7%">已结算比率</td>
	<td  width="10%">已结算金额 </td>
	<td  width="7%">工程进度</td>
</tr>

<%
	allqye=0;
	allsfke=0;
	allqdsyjsje=0;

	ls_sql="SELECT khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,sjjgrq,tdsj,qye,sfke,sjstcbl,qdsyjsje,ysgcjdmc,DECODE(sjsjsbz,'0','未结算','1','签单结算','2','完工结算') sjsjsbz";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.tdsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
    ls_sql+=" and crm_khxx.dwbh='"+dwbh+"' and crm_khxx.sjs='"+sjs+"'";//0：未结算；1：签单结算；2：完工结算
    ls_sql+=" and crm_khxx.zt in('3')  ";
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
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		sjstcbl=rs.getDouble("sjstcbl");
		qdsyjsje=rs.getDouble("qdsyjsje");
		ysgcjdmc=rs.getString("ysgcjdmc");
		sjsjsbz=rs.getString("sjsjsbz");

		allqye+=qye;
		allsfke+=sfke;
		allqdsyjsje+=qdsyjsje;

		row2++;
		if (row2%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td>
				<input name="khbh2" type="checkbox" value="<%=khbh%>">			
			</td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
			<td><%=qye%></td>
			<td><%=tdsj%></td>
			<td><%=sjstcbl%>%</td>
			<td><%=qdsyjsje%></td>
			<td><%=ysgcjdmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	allqye=cf.doubleTrim(allqye);
	allsfke=cf.doubleTrim(allsfke);
	allqdsyjsje=cf.doubleTrim(allqdsyjsje);

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allqdsyjsje%></td>
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
		if ( !confirm("提醒！没有选择任何【签单结算工地】，确实要继续吗？") )	
		{
			return false;
		}
	}

	mark=0;

	if (<%=row1%>>1)
	{
		for (var i=0;i<<%=row1%> ;i++ )
		{
			if( FormName.khbh1[i].checked ){
				mark=1;
			}
		}
	}
	else if (<%=row1%>==1)
	{
		if( FormName.khbh1.checked ){
			mark=1;
		}
	}

	if (mark==0)
	{
		if ( !confirm("提醒！没有选择任何【完工结算工地】，确实要继续吗？") )	
		{
			return false;
		}
	}

	mark=0;

	if (<%=row2%>>1)
	{
		for (var i=0;i<<%=row2%> ;i++ )
		{
			if( FormName.khbh2[i].checked ){
				mark=1;
			}
		}
	}
	else if (<%=row2%>==1)
	{
		if( FormName.khbh2.checked ){
			mark=1;
		}
	}

	if (mark==0)
	{
/*
		if ( !confirm("提醒！没有选择任何【退单结算】，确实要继续吗？") )	
		{
			return false;
		}
*/
	}

	FormName.action="InsertCw_sjsjsjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>