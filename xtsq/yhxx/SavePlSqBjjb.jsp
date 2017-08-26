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
String[] bjjbbm=request.getParameterValues("bjjbbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String bjjb="";
	if (bjjbbm!=null)
	{
		for (int i=0;i<bjjbbm.length ;i++ )
		{
			String bjjbmc=null;
			ls_sql="select bjjbmc";
			ls_sql+=" from  bdm_bjjbbm";
			ls_sql+=" where bjjbbm='"+bjjbbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				bjjbmc=rs.getString(1);

				bjjb+="、"+bjjbmc;
			}
			rs.close();
			ps.close();
		}
		if (!bjjb.equals(""))
		{
			bjjb=bjjb.substring(1);
		}
	}

	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
		ls_sql="delete from sq_sjsbjjb ";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int j=0;j<bjjbbm.length ;j++ )
		{
			ls_sql="insert into sq_sjsbjjb(ygbh,bjjbbm) values("+ygbh[i]+",'"+bjjbbm[j]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		ls_sql="update sq_yhxx set bjjb='"+bjjb+"'";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
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