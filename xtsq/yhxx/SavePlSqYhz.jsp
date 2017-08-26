<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010218")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%

String[] ygbh=request.getParameterValues("ygbh");
String[] yhzbh=request.getParameterValues("yhzbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		String yhdlm=null;
		ls_sql="select yhdlm";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhdlm=cf.fillNull(rs.getString("yhdlm"));
		}
		rs.close();
		ps.close();
		if (yhdlm==null || yhdlm.equals(""))
		{
			conn.rollback();
			out.println("错误！没有用户登陆名："+ygbh[i]);
			return;
		}

		ls_sql="delete from sq_yhssz ";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int j=0;j<yhzbh.length ;j++ )
		{
			ls_sql="insert into sq_yhssz (yhdlm,yhzbh) ";
			ls_sql+=" values('"+yhdlm+"','"+yhzbh[j]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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