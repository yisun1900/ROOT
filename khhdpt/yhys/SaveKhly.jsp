<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String lylx=null;
String sfyqhf=null;
String lynr=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
lylx=cf.GB2Uni(request.getParameter("lylx"));
sfyqhf=cf.GB2Uni(request.getParameter("sfyqhf"));
lynr=cf.GB2Uni(request.getParameter("lynr"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String lyxh=null;
	int count=0;
	ls_sql="select NVL(max(substr(lyxh,8,3)),0)";
	ls_sql+=" from  hd_khly";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	lyxh=khbh+cf.addZero(count+1,3);

	ls_sql="insert into hd_khly ( lyxh,khbh,lyr,lysj,lynr,lylx,sfyqhf,lysfyck ) ";
	ls_sql+=" values ( ?,?,?,SYSDATE,?,?,?,'N') ";//1：工程留言；2：集成留言；9：其它留言
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lyxh);
	ps.setString(2,khbh);
	ps.setString(3,yhmc);
	ps.setString(4,lynr);
	ps.setString(5,lylx);
	ps.setString(6,sfyqhf);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("提交成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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