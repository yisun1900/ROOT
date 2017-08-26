<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String xmbh=null;
String wybh=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
int dj=0;

int fjsl=0;
String[] fjbm=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjsl=rs.getInt(1);
		fjbm=new String [fjsl];

		allw+=53*fjsl;
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
  
<table border="1" cellspacing="0" width="<%=allw%>" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td rowspan="2" width="30">&nbsp;</td>
    <td colspan="<%=fjsl%>" width="<%=allw-433%>">工程量明细</td>
    <td rowspan="2" width="53">工程量
	<td rowspan="2" width="50">项目编号</td>
    <td rowspan="2" width="200">项目名称</td>
    <td rowspan="2" width="50">计量单位</td>
    <td rowspan="2" width="50">单价</td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
<%
	int i1=0;
	ls_sql="SELECT bj_fjxx.jgwzbm,jgwzmc";
	ls_sql+=" FROM bj_fjxx,bdm_jgwzbm ";
    ls_sql+=" where bj_fjxx.jgwzbm=bdm_jgwzbm.jgwzbm and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.jgwzbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		jgwzmc=rs.getString("jgwzmc");
		fjbm[i1]=jgwzbm;
	  %>
    <td width="53"><%=jgwzmc%></td>
	  <%
		i1++;
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    </tr>
  </table>
</body>
</html>

