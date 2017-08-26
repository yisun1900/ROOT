<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String zxdm=cf.GB2Uni(request.getParameter("zxdm"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));


String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;



try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_zxkhxx set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();

	//���¼��ɶ�����������������������������������������������������
	ls_sql="update jc_jcdd set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmydd set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_mmzjx set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_cgdd set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_cgzjx set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjdd set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_jjzjx set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_zcdd set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zcddmx set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zczjx set khjl=?";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khjl);
	ps.executeUpdate();
	ps.close();
	//���¼��ɶ�������������������������������������������������������������������

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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