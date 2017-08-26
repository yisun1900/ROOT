<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql =" insert into sq_cd (cdbh,cdxh,cdxsmc,glurl,fcdbh,zfcdbh,zzfcdbh,sfmjcd,cdsm)";
	ls_sql+=" values('010134',32,'进销存成本价','xtsq/cswh/SelectJxcCbjSq_dwxx.jsp','0101','01','0','Y','')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql =" alter table sq_dwxx add (fccbj char(1),zccbj char(1))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	out.println("OK");


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
