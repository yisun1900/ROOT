<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>培训审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">培训审核</div>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">&nbsp;</td>
	<td  width="7%">培训计划编号</td>
	<td  width="12%">培训计划名称</td>
	<td  width="5%">培训人数</td>
	<td  width="6%">培训费用</td>
	<td  width="6%">所属分公司</td>
	<td  width="5%">计划状态</td>
	<td  width="10%">状态编码</td>
	<td  width="5%">审核结论</td>
	<td  width="6%">是否计划内</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入人分公司</td>
	<td  width="6%">录入时间</td>
	<td  width="18%">备注</td>
  </tr>
<%

String[] ztbm=request.getParameterValues("ztbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String pxjhmc=null;

String pxjhbh=null;
int pxrs=0;
double pxfy=0;
String fgs=null;
String jhzt=null;
String ztbm_o=null;
String shjl=null;
String jhkssj=null;
String jhjssj=null;
String lrr=null;
String ssfgs=null;
String lrsj=null;
String bz=null;
String pxlx=null;
String sfjhn=null;


String ys=null;

try {
	conn=cf.getConnection();

	int row=0;
	for(int i=0;i<ztbm.length;i++){
	ls_sql="SELECT rs_pxjh.pxjhbh pxjhbh,pxjhmc,pxrs,pxfy,a.dwmc fgs,DECODE(jhzt,'0','录入未完成','1','等待审批','2','审批流程中','3','培训完成','4','审批未通过','5','修改计划') jhzt ,rs_ztbm.ztmc ztbm,rs_pxshbm.shjlmc shjl,DECODE(sfjhn,'0','计划内','1','计划外') sfjhn,lrr,b.dwmc ssfgs,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj,rs_pxjh.bz bz ";
	ls_sql+=" FROM rs_pxjh,rs_pxshbm,sq_dwxx a,sq_dwxx b,rs_ztbm  ";
    ls_sql+=" where rs_pxshbm.shjl=rs_pxjh.shjl and a.dwbh=rs_pxjh.fgs and jhzt!='0' and b.dwbh=rs_pxjh.ssfgs and rs_ztbm.ztbm=rs_pxjh.ztbm and rs_pxjh.ztbm='"+ztbm[i]+"'";
	ls_sql+=" order by rs_pxjh.pxjhbh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		pxjhbh=rs.getString("pxjhbh");
		pxjhmc=rs.getString("pxjhmc");
		pxrs=rs.getInt("pxrs");
		pxfy=rs.getDouble("pxfy");
		fgs=rs.getString("fgs");
		jhzt=rs.getString("jhzt");
		ztbm_o=rs.getString("ztbm");
		shjl=rs.getString("shjl");
		sfjhn=rs.getString("sfjhn");
		lrr=rs.getString("lrr");
		ssfgs=rs.getString("ssfgs");
		lrsj=rs.getString("lrsj");
		bz=cf.fillHtml(rs.getString("bz"));

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
%> 
  <tr align="center" bgcolor="<%=ys%>">
	<td><A HREF="InsertRs_pxsh.jsp?pxjhbh=<%=pxjhbh%>" target="_blank">审核</A></td>
    <td><A HREF="viewpxjhmx.jsp?pxjhbh=<%=pxjhbh%>" target="_blank"><%=pxjhbh%></A></td>
	<td><%=pxjhmc%></td>
    <td><%=pxrs%></td>
    <td><%=pxfy%></td>
    <td><%=fgs%></td>
    <td><%=jhzt%></td>
    <td><%=ztbm_o%></td>
    <td><%=shjl%></td>
    <td><%=sfjhn%></td>
    <td><%=lrr%></td>
    <td><%=ssfgs%></td>
    <td><%=lrsj%></td>
    <td><%=bz%></td>
  </tr>
  <%
		}
		rs.close();
		ps.close();
	}

}
catch (Exception e) {
	out.print("Exception: " + e+"<br>");
	out.print("<font color=red>请选择可审核状态!</font>");
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
</table>
</body>
</html>
