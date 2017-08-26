<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}


	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");
	
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (hflxbm!=null)
	{
		if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
	}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>工程回访统计<<%=hflxmc%>> <BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> <BR>
</CENTER>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int all=0;
int[] sl=new int[20];
String[] jglxmc=new String[20];
int i=0;

String ls1=null;
String ls2=null;
int sl1=0;

int ywt=0;//有问题 
int mwt=0;//没有问题 
int wlxs=0;//未联系上
int wkg=0;//未开工

try {
	conn=cf.getConnection();

	//获取回访总数
	ls_sql="SELECT jglxbm,jglxmc";
	ls_sql+=" FROM dm_jglxbm  ";
	ls_sql+=" where jglxbm not in('1','6','7')";//有问题
    ls_sql+=" order by jglxbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		ls1=rs1.getString(1);
		ls2=rs1.getString(2);

		//取有问题数据
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_hfjl,crm_khxx  ";
		ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.jglxbm='"+ls1+"'";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sl1=rs.getInt(1);
		}
		rs.close();
		ps.close();

		jglxmc[i]=ls2;
		sl[i]=sl1;
		ywt+=sl[i];
		i++;
	}
	rs1.close();
	ps1.close();

	

	//获取没有问题
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_hfjl.jglxbm='1'";//1:没问题
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mwt=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//获取未联系上
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_hfjl.jglxbm='6'";//6:未联系上
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wlxs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//获取未开工
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_hfjl.jglxbm='7'";//7:未开工
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wkg=rs.getInt(1);
	}
	rs.close();
	ps.close();

	all=ywt+mwt+wlxs+wkg;
	if (all==0)
	{
		out.println("没有回访数据");
		return;
	}

}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
<div align="center">表格统计 </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr align="center"> 
    <td rowspan="2" width="12%">&nbsp;</td>
    <td rowspan="2" width="11%">回访总数</td>
    <td rowspan="2" width="11%">没有问题 </td>
    <td colspan="<%=(i+1)%>">存在问题</td>
    <td rowspan="2" width="10%">未联系上 </td>
    <td rowspan="2" width="9%">未开工</td>
  </tr>
  <tr align="center"> 
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<td  >"+jglxmc[j]+"</td>");
	}
	%>
    <td  align="center">合计</td>
  </tr>
  <tr align="center"> 
    <td width="12%" align="center">人数（人） </td>
    <td width="11%"><%=all%></td>
    <td width="11%"><%=mwt%></td>
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<td  >"+sl[j]+"</td>");
	}
	%>
    <td ><%=ywt%></td>
    <td width="10%"><%=wlxs%></td>
    <td width="9%"><%=wkg%></td>
  </tr>
  <tr align="center"> 
    <td width="12%" align="center">百分率（%） </td>
    <td width="11%">&nbsp;</td>
    <td width="11%"><%=  1000*mwt/all/10.0  %>%</td>
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<td  >"+1000*sl[j]/all/10.0+"%</td>");
	}
	%>
    <td ><%=  1000*ywt/all/10.0  %>%</td>
    <td width="10%"><%=  1000*wlxs/all/10.0  %>%</td>
    <td width="9%"><%=  1000*wkg/all/10.0  %>%</td>
  </tr>
</table>
<P><div align="center">图形统计 </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr height="30"> 
	<td width="35%" align="right">没有问题</td>
	<td width="65%"><img src="/images/ColuGif.gif" width=<%=400*mwt/(mwt+ywt)%> height=15>&nbsp;<%=cf.formatDouble(100.0*mwt/(mwt+ywt))%>%</td>
	</tr>
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<tr height=\"30\"> ");
		out.println("<td width=\"35%\" align=\"right\">"+jglxmc[j]+"</td>");
		out.println("<td width=\"65%\"><img src=\"/images/ColuGif.gif\" width="+400*sl[j]/(mwt+ywt)+" height=15>&nbsp;"+cf.formatDouble(100.0*sl[j]/(mwt+ywt))+"%</td>");
		out.println("</tr>");
	}
	%>
</table>
</body>
</html>
