<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shjl=null;
String shr=null;
java.sql.Date shsj=null;
String shsm=null;
shjl=cf.GB2Uni(request.getParameter("shjl"));
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[shsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
shsm=cf.GB2Uni(request.getParameter("shsm"));

String xsph=cf.GB2Uni(request.getParameter("xsph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getxsdzt=null;
	ls_sql=" SELECT xsdzt ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getxsdzt=cf.fillNull(rs.getString("xsdzt"));
	}
	rs.close();
	ps.close();

	if (!getxsdzt.equals("2") && !getxsdzt.equals("9"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻4�����ֳ��⣻9��ȡ��
	{
		out.print("������������["+xsph+"]״̬����ȷ��");
		return;
	}

	String xsdzt="";
	if (shjl.equals("Y"))//Y��ͬ�⣻N����ͬ��
	{
		xsdzt="2";
	}
	else{
		xsdzt="9";
	}

	ls_sql="update jxc_fcxsd set shjl=?,shr=?,shsj=?,shsm=?,xsdzt=? ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,shsm);
	ps.setString(5,xsdzt);
	ps.executeUpdate();
	ps.close();

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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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