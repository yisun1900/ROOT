<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String xh=cf.GB2Uni(request.getParameter("xh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql=" update sq_txxxb set ckzt='2',cksj=SYSDATE ";//1��δ�鿴��2���鿴
    ls_sql+=" where xh='"+xh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String txlx=null;
	String txgjz=null;

	ls_sql="SELECT txlx,txgjz";
	ls_sql+=" FROM sq_txxxb ";
    ls_sql+=" where xh='"+xh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txlx=rs.getString("txlx");
		txgjz=rs.getString("txgjz");

		if (txlx.equals("01"))//01����ѯ�طã�02����ʩ���̻طã�03��Ͷ�߱��޻طã�04��Ͷ�߱���
		{
			response.sendRedirect("/dhzx/dhhf/ViewCrm_zxhfjl.jsp?hfjlh="+txgjz);
		}
	}
	rs.close();
	ps.close();



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


