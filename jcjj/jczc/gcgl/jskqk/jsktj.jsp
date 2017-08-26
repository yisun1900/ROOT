<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>

<%@ include file="/getlogin.jsp" %>
<%
String tjrq=request.getParameter("tjrq");
String tjrq2=request.getParameter("tjrq2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
%>
<html>
<head>
<title>工程进度跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" >
<%
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
     	pageObj.setType("EXCEL",response);
	}
%>
<div align="center"><br> <b>上月未结算款收缴情况 （<%=tjrq%>----<%=tjrq2%>）</b></div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"   style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center">
  <td width="7%">序号</td>
    <td width="7%">合同号</td>
    <td width="5%">客户姓名</td>
    <td width="18%">交款日期</td>
	<td width="18%">金额</td>
    <td width="7%">应竣工日期</td>
	<td width="7%">备注</td>
  </tr>
  <%


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String jgrq=null;
String bz=null;
String sksj=null;
double je=0;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="select hth,khxm,fkje,sksj,jgrq,cw_khfkjl.bz";
	ls_sql+=" from  crm_khxx,cw_khfkjl";
	ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.zt='2' and cw_khfkjl.scbz='N' and fklxbm='11'";
	ls_sql+=" and sksj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and sksj<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" order by jgrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		jgrq=rs.getString("jgrq");
		sksj=rs.getString("sksj");
		bz=cf.fillHtml(rs.getString("bz"));
		je=rs.getDouble(3);

		row++;

		

%> 
  <tr align="center" >
  <td><%=row%></td>
    <td><%=hth%></td>
    <td><%=khxm%></td>
    <td><%=sksj%></td>
    <td><%=je%></td>
    <td><%=jgrq%></td>
    <td><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
%>
</table>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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
