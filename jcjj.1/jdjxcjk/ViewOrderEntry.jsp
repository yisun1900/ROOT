<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<html>
<head></head>
<body bgcolor="#FFFFFF">
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC" style="FONT-SIZE:12">
<tr bgcolor="#FFFFFF">
<td><div align="center">订单编号</div></td>
<td><div align="center">产品名称</div></td>
<td><div align="center">购货单位</div></td>
<td><div align="center">单价</div></td>
<td><div align="center">数量</div></td>
<td><div align="center">金额</div></td>
<tr>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");


String FBillNo = request.getParameter("FBillNo");
String CustName=null;
//out.println(CustName);
//out.println(CustName!=null && !"".equals(CustName));
//if(CustName!=null && !"".equals(CustName))
	//CustName=new String(CustName.getBytes("iso-8859-1"),"gb2312");
	//out.println(CustName);
String FAmount=null;
String FAuxPrice=null;
String FAuxQty=null;
String FName=null;
String FInterID=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	
		ls_sql="select FAmount,FAuxPrice,FAuxQty,t_ICItem.FName,FInterID,t_Organization.FName";
		ls_sql+=" from  SEOrderEntry,t_ICItem,t_Organization,SEOrder";
		ls_sql+=" where FInterID='"+FBillNo+"' ";
		ls_sql+=" and FInterID=FBillNo ";
		ls_sql+=" and FCustID=FNumber ";
		ls_sql+=" and SEOrderEntry.FItemID=t_ICItem.FItemID ";
		
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			
			FAmount=rs.getString(1);
			FAuxPrice=rs.getString(2);
			FAuxQty=rs.getString(3);
			FName=rs.getString(4);
			FInterID=rs.getString(5);
			CustName=rs.getString(6);
			%>
  <tr bgcolor="#FFFFFF">
			<td><div align="center"><%=FInterID%></div></td>
			<td><div align="center"><%=FName%></div></td>
			<td><div align="center"><%=CustName%></div></td>
			<td><div align="center"><%=FAuxPrice%></div></td>
			<td><div align="center"><%=FAuxQty%></div></td>
			<td><div align="center"><%=FAmount%></div></td>
  <tr>
		<%}
		rs.close();
		ps.close();

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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


</table>
</body>
</html>
