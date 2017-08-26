<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=request.getParameter("yhdlm");


String txnr="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	long xh=0;
	ls_sql="select xh,txnr";
	ls_sql+=" from sq_txxxb";
	ls_sql+=" where yhdlm='"+yhdlm+"'  ";
	ls_sql+=" and txzt='1'";//1：未提醒；2：提醒；3：处理
	ls_sql+=" and txfs in('1','9')";//1：系统；2：电话；3：传真；4：短信；9：全部
	ls_sql+=" and xctxsj <= SYSDATE";
	ls_sql+=" and xtxcs>0";//需提醒次数
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getLong("xh");
		txnr=rs.getString("txnr");
	}
	rs.close();
	ps.close();

//	out.println(ls_sql);

	ls_sql="update sq_txxxb set xtxcs=xtxcs-1,xctxsj=SYSDATE+txjg/24.0,txsj=SYSDATE";
	ls_sql+=" where  xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_txxxb set txzt='2'";
	ls_sql+=" where  xh="+xh;
	ls_sql+=" and txzt='1'";//1：未提醒；2：提醒；3：处理
	ls_sql+=" and xtxcs=0";//需提醒次数
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	out.println(txnr);

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

