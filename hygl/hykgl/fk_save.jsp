<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<%
String dwbh=null;
String nf=null;
String qsh=null;
String zzh=null;
String kdlb=null;
String hykh=null;
String sql=null;
String sqlString=null;
String tempString=null;

int k = 0;

dwbh=request.getParameter("dwbh").trim();
qsh=request.getParameter("qsh").trim();
zzh=request.getParameter("zzh").trim();
kdlb=request.getParameter("kdlb").trim();

String khqz = cf.GB2Uni(request.getParameter("khqz"));
String khcdstr = cf.GB2Uni(request.getParameter("khcd"));

int khcd = 0;
int qsh_int=0;
int zzh_int=0;

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;

String fkr=(String)session.getAttribute("yhdlm");

try{

	qsh_int=Integer.parseInt(qsh);
	zzh_int=Integer.parseInt(zzh);
	khcd = Integer.parseInt(khcdstr);
	khcd=khcd-khqz.length();
	
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	for(int i=qsh_int;i<=zzh_int;i++)
	{
		tempString=cf.addZero(i,khcd);

		sqlString = "update hy_khxxb set sfyfk='Y',dwbh='"+dwbh+"',fkr='"+fkr+"',fkrq=TRUNC(SYSDATE)";
		sqlString+= " where hykh='"+(khqz+tempString)+"' and kdlb='"+kdlb+"' and sfyfk='N'";
		ps=conn.prepareStatement(sqlString);  
		if(ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.print("卡号发放失败，卡号："+(khqz+tempString));
			return;
		}
		else{
			out.print("<BR>卡号发放成功："+khqz+tempString);
		}
		ps.close();
	}

	conn.commit();
	out.print("<BR>发卡成功");
}
catch(Exception e){
	conn.rollback();
	out.print("Exception: "+e);
}
finally{
	conn.setAutoCommit(true);
	try{
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) cf.close(conn);
	}
	catch(Exception e){
		out.print("Finally Exception: "+e);
		return;
	}
}

%>