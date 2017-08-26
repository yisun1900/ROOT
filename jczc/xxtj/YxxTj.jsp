<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String lrfgs=request.getParameter("fgs");
String lrdwbh=request.getParameter("dwbh");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;



int xxzsl=0;
int yxxxsl=0;
int wzxxsl=0;
int yxl=0;
int wzl=0;

try {
	conn=cf.getConnection();

%>
<CENTER >
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<CENTER >
  <B>客户资料有效性统计</B>
<table border="1" width="60%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="30%">项目</td>
  <td  width="30%">数量</td>
</tr>
<%
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.zxzt in('0','1','2','3','4','5')";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
	if (!lrfgs.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.ssfgs ='"+lrfgs+"'";
	}
	if (!lrdwbh.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.zxdm ='"+lrdwbh+"'";
	}

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
		{
			xxzsl=rs.getInt(1);
		}
	rs.close();
	ps.close();

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.zxzt in('0','1','2','3','4','5')";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	
	if (!lrfgs.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.ssfgs ='"+lrfgs+"'";
	}
	if (!lrdwbh.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.zxdm ='"+lrdwbh+"'";
	}

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
		{
			yxxxsl=rs.getInt(1);
		}


	rs.close();
	ps.close();

	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.zxzt in('0','1','2','3','4','5')";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=" and fj>0 and fwmj>0 and hxbm is not null and yjzxsj>TO_DATE('1998-01-01','YYYY-MM-DD') and ysrbm is not null";
	ls_sql+=" and nlqjbm is not null and fgyqbm is not null and zybm is not null";
	ls_sql+=" and zxysbm is not null and fwlxbm is not null";

	
	if (!lrfgs.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.ssfgs ='"+lrfgs+"'";
	}
	if (!lrdwbh.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.zxdm ='"+lrdwbh+"'";
	}

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
		{
			wzxxsl=rs.getInt(1);
		}


	rs.close();
	ps.close();
	
	if (xxzsl!=0)
	{
		yxl=yxxxsl*100/xxzsl;
	}
	
	if (yxxxsl!=0)
	{
		wzl=wzxxsl*100/yxxxsl;
	}
	
	%>
		<tr  align="center">
		  <td>咨询客户信息总量</td>
		  <td><%=xxzsl%></td>
		</tr>
		<tr  align="center">
		  <td>其中有效客户信息数量</td>
		  <td><%=yxxxsl%></td>
		</tr>
		<tr  align="center">
		  <td>有效信息比率</td>
		  <td><%=yxl%>%</td>
		</tr>
		<tr  align="center">
		  <td>有效完整客户信息数量</td>
		  <td><%=wzxxsl%></td>
		</tr>
		<tr  align="center">
		  <td>完整信息占有效信息比率</td>
		  <td><%=wzl%>%</td>
		</tr>




</table>
</CENTER>


<%

}
catch (Exception e) {
	out.print("Exception: " + e);
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


</body>
</html>