<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String[] bjjbbm=request.getParameterValues("bjjbbm");
String fgs=request.getParameter("fgs");
String wheresql=cf.GB2Uni(request.getParameter("wheresql"));


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

				bjjb+="¡¢"+bjjbmc;
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

	ls_sql="delete from sq_sjsbjjb ";
	ls_sql+=" where ygbh in(select ygbh from sq_yhxx where ssfgs='"+fgs+"' and sfzszg in('Y','N') and zwbm in('04','23') "+wheresql+")";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (bjjbbm!=null)
	{
		for (int i=0;i<bjjbbm.length ;i++ )
		{
			if (bjjbbm[i].equals(""))
			{
				continue;
			}

			ls_sql="insert into sq_sjsbjjb(ygbh,bjjbbm) ";
			ls_sql+=" select ygbh,'"+bjjbbm[i]+"'";
			ls_sql+=" from sq_yhxx";
			ls_sql+=" where ssfgs='"+fgs+"' and sfzszg in('Y','N') and zwbm in('04','23') "+wheresql;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="update sq_yhxx set bjjb='"+bjjb+"'";
	ls_sql+=" where ssfgs='"+fgs+"' and sfzszg in('Y','N') and zwbm in('04','23') "+wheresql;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	out.println(ls_sql);


	conn.commit();
	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

