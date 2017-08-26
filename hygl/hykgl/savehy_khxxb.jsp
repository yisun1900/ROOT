<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>


<%
String kdlb = request.getParameter("kdlb");

String khqz = cf.GB2Uni(request.getParameter("khqz"));
String khqsh = cf.GB2Uni(request.getParameter("khqsh"));
String khzzh = cf.GB2Uni(request.getParameter("khzzh"));
String khcdstr = cf.GB2Uni(request.getParameter("khcd"));

int khcd = 0;
int khqsh_int = 0;
int khzzh_int = 0;
String tempString = null;
try{
	khcd = Integer.parseInt(khcdstr);
	khqsh_int = Integer.parseInt(khqsh);
	khzzh_int = Integer.parseInt(khzzh);
}
catch(Exception e){
	out.print("数字格式不正确，请您确认");
	return;
}

String jbrq=cf.fillNull(request.getParameter("jbrq"));
String jbr=cf.GB2Uni(request.getParameter("jbr"));

khcd=khcd-khqz.length();

Connection conn = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sqlString = null;

try{
	conn = cf.getConnection();
	conn.setAutoCommit(false);

	for(int i=khqsh_int;i<=khzzh_int;i++)
	{
		tempString=cf.addZero(i,khcd);

		sqlString = "insert into hy_khxxb(hykh,kdlb,sfyfk,sfysy)";
		sqlString+= " values('"+khqz+tempString+"','"+kdlb+"','N','N')";
		ps=conn.prepareStatement(sqlString);  
		ps.executeUpdate();
		ps.close();

		out.print("<BR>生成卡号："+khqz+tempString);
	}


	conn.commit();

	out.print("<BR>存盘成功");
}
catch(Exception e){
	conn.rollback();
	out.println("Exception : "+e);
}
finally{
	try{
		conn.setAutoCommit(true);
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) cf.close(conn);
	}
	catch(Exception e){
		out.println("EXCEPTION: "+e);
	}
}
%>