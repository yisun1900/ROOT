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
<title>结算款收缴</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >
<%
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
     	pageObj.setType("EXCEL",response);
	}
%>
<div align="center"><br> <b>退单工地情况说明 （<%=tjrq%>----<%=tjrq2%>）</b></div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"   style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center">
  <td width="7%">序号</td>
    <td width="7%">合同号</td>
    <td width="5%">客户姓名</td>
    
   <td width="5%">退单原因</td>
	<td width="7%">原因说明</td>
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


try {
	conn=cf.getConnection();

	int row=0;
	//退单客户情况
	ls_sql="select hth,crm_tddj.khxm,tdyymc,tdyysm";
	ls_sql+=" from crm_tddj,dm_tdyybm,crm_khxx";
	ls_sql+=" where crm_khxx.khbh=crm_tddj.khbh and dm_tdyybm.tdyybm=crm_tddj.tdyybm  ";
	ls_sql+=" and crm_tddj.lrsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tddj.lrsj<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		jgrq=cf.fillHtml(rs.getString("tdyymc"));
		
		bz=cf.fillHtml(rs.getString("tdyysm"));
		

		row++;

		

%> 
  <tr align="center" >
  <td><%=row%></td>
    <td><%=hth%></td>
    <td><%=khxm%></td>
    
    <td><%=jgrq%></td>
    <td><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
%>
</table>

<div align="center"><br> <b>跑单情况说明 （<%=tjrq%>----<%=tjrq2%>）</b></div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"   style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center">
  <td width="7%">序号</td>
    <td width="7%">合同号</td>
    <td width="5%">客户姓名</td>
    
   <td width="5%">联系方式</td>
	<td width="7%">原因说明</td>
  </tr>
 <%
	 hth=null;
	 khxm=null;
	 jgrq=null;
	 bz=null;
	 sksj=null;
	 row=0;
	//跑单客户情况
	ls_sql="select khbh,lxfs,khxm,sbyymc";
	ls_sql+=" from crm_zxkhxx,dm_sbyybm ";
	ls_sql+=" where crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm and zxzt='4' ";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hth=cf.fillHtml(rs.getString("khbh"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		jgrq=cf.fillHtml(rs.getString("lxfs"));
		bz=cf.fillHtml(rs.getString("sbyymc"));
		row++;
%>
<tr align="center" >
  <td><%=row%></td>
    <td><%=hth%></td>
    <td><%=khxm%></td>
    
    <td><%=jgrq%></td>
    <td><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
%>
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
