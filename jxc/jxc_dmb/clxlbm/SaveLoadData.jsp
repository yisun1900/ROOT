<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] dwbh =request.getParameterValues("dwbh");
String[] clxlbm =request.getParameterValues("clxlbm");
String[] bzlybl =request.getParameterValues("bzlybl");
String[] lyblxx =request.getParameterValues("lyblxx");
String[] lyblsx =request.getParameterValues("lyblsx");

//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);


	for (int i=0;i<clxlbm.length ;i++ )
	{
		String clxlmc=null;
		sql="select clxlmc";
		sql+=" from  jxc_clxlbm";
		sql+=" where clxlbm="+clxlbm[i];
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clxlmc=cf.fillNull(rs.getString("clxlmc"));
		}
		rs.close();
		ps.close();

		sql ="insert into jxc_fclybl (dwbh,clxlbm,clxlmc,bzlybl,lyblxx,lyblsx)";
		sql+=" values('"+dwbh[i]+"','"+clxlbm[i]+"','"+clxlmc+"','"+bzlybl[i]+"','"+lyblxx[i]+"','"+lyblsx[i]+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
