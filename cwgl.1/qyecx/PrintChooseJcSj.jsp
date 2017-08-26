<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>打印收据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<div align="center">
<p>收据打印</p>
注意：<font color="#CC0000"><b>打勾的收款记录会打印在一张收据中，但每次最多7条</b></font>
</div>

<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="8%">收款序号</td>
	<td  width="9%">收款时间</td>
	<td  width="6%">审核人</td>
	<td  width="9%">收款类型</td>
	<td  width="7%">款期</td>
	<td  width="12%">收款品牌</td>
	<td  width="11%">实收款金额</td>
	<td  width="7%">是否需审核</td>
	<td  width="7%">支付</td>
	<td  width="9%">转帐款项</td>
	<td  width="12%">转帐品牌</td>
	</tr>

<%
String getfkxh=request.getParameter("fkxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String getskr=null;
String getsksj=null;


String fkxh=null;
String sksj=null;
String skr=null;
String fklxbm=null;
String fkcsmc=null;
String gysbh=null;
double fkje=0;
double allfkje=0;
String skdd=null;
String zffsmc=null;
String zckx=null;
String zcgysbh=null;

String bgcolor="";
int row=0;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,skr,sksj";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fkxh='"+getfkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		getskr=cf.fillNull(rs.getString("skr"));
		getsksj=cf.fillNull(rs.getDate("sksj"));
	}
	rs.close();
	ps.close();

	int dysl=0;

	ls_sql="SELECT fkxh,cw_khfkjl.sksj,cw_khfkjl.skr,a.fklxmc fklxbm,fkcsmc,gysbh,cw_khfkjl.fkje,DECODE(skdd,'1','不需','2','需审核') skdd,zffsmc,b.fklxmc zckx,zcgysbh";
	ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
    ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
    ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
//	ls_sql+=" and cw_khfkjl.fklxbm in ('21','22','23','24')  ";
//    ls_sql+=" and cw_khfkjl.skr='"+getskr+"' and cw_khfkjl.sksj=TO_DATE('"+getsksj+"','YYYY-MM-DD') ";
    ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
    ls_sql+=" order by cw_khfkjl.sksj desc,cw_khfkjl.skr,cw_khfkjl.glxh,cw_khfkjl.fkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkxh=cf.fillNull(rs.getString("fkxh"));
		sksj=cf.fillNull(rs.getDate("sksj"));
		skr=cf.fillNull(rs.getString("skr"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		fkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
		gysbh=cf.fillHtml(rs.getString("gysbh"));
		fkje=rs.getDouble("fkje");
		skdd=cf.fillHtml(rs.getString("skdd"));
		zffsmc=cf.fillHtml(rs.getString("zffsmc"));
		zckx=cf.fillHtml(rs.getString("zckx"));
		zcgysbh=cf.fillHtml(rs.getString("zcgysbh"));

		allfkje+=fkje;

		String mark="";
		if (sksj.equals(getsksj) && skr.equals(getskr) && dysl<7)//是否与该收据同一天付款，付款记录最多7笔
		{
			mark="checked";
			dysl++;
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		if (mark.equals("checked"))
		{
			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td ><input name="fkxh" type=checkbox value="<%=fkxh%>" checked></td>
				<td ><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=fkxh%>"><B><%=fkxh%></B></A></td>
				<td ><B><%=sksj%></B></td>
				<td ><B><%=skr%></B></td>
				<td ><B><%=fklxbm%></B></td>
				<td ><%=fkcsmc%></td>
				<td ><%=gysbh%></td>
				<td ><%=fkje%></td>
				<td ><%=skdd%></td>
				<td ><%=zffsmc%></td>
				<td ><%=zckx%></td>
				<td ><%=zcgysbh%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td ><input name="fkxh" type=checkbox value="<%=fkxh%>" ></td>
				<td ><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=fkxh%>"><%=fkxh%></A></td>
				<td ><%=sksj%></td>
				<td ><%=skr%></td>
				<td ><%=fklxbm%></td>
				<td ><%=fkcsmc%></td>
				<td ><%=gysbh%></td>
				<td ><%=fkje%></td>
				<td ><%=skdd%></td>
				<td ><%=zffsmc%></td>
				<td ><%=zckx%></td>
				<td ><%=zcgysbh%></td>
			</tr>
			<%
		}
	}
	rs.close();
	ps.close();


%>
<tr bgcolor="#FFFFFF" align='center'>
  <td>小 计</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td ><%=allfkje%></td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
  <td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="12" height="2"> 
	<input type="hidden" name="khbh" value="<%=khbh%>">
	<input type=button value='全选' onclick="cf_checkAll(listform)">
	<input type=button value='打印收据' onclick="cf_submit(listform)">
	</td>
</tr>
</table>
</form> 
</body>

<script  LANGUAGE="javascript">
<!--
var mark=1;
function cf_checkAll(formName)//转换字符串
{
	var i = 0;

	if (<%=row%>==1){
		if (mark==0)
		{
			formName.fkxh.checked =false
		}
		else{
			formName.fkxh.checked =true
		}
	}
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if (mark==0)
			{
				formName.fkxh[i].checked =false
			}
			else{
				formName.fkxh[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}

function cf_submit(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.fkxh.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.fkxh[i].checked ){
				choo=1;
			}
		} 
	} 
	if (choo == 0){
		alert("请选择所要操作的数据");
		return false;
	}
	else{
		formName.action="PrintAllJcSj.jsp";
		formName.submit();
		return true;
	}

} 


//-->
</script>
</html>

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
