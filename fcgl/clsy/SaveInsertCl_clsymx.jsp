<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String khbh=request.getParameter("khbh");
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String[] clbm=request.getParameterValues("clbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	conn.setAutoCommit(false);

	ls_sql="delete from cl_clsydj ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from cl_clycmc ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from cl_clsybm ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from cl_clsymx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	for (int i=0;i<50 ;i++ )
	{
		String[] values=request.getParameterValues("clycmc"+(i+1));

		if (values[0].equals(""))
		{
			break;
		}
		
		ls_sql="insert into cl_clycmc ( khbh,clycmc,xh) ";
		ls_sql+=" values( '"+khbh+"','"+cf.GB2Uni(values[0])+"',"+(i+1)+")";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int js=0;
		for (int j=0;j<clbm.length ;j++ )
		{
			if (values[j+1].equals(""))
			{
				continue;
			}

			js++;

			ls_sql="insert into cl_clsymx (khbh,clycmc,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,sl) ";
			ls_sql+=" select '"+khbh+"','"+cf.GB2Uni(values[0])+"',cl_clbm.clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,"+values[j+1];
			ls_sql+=" FROM cl_clbm,cl_jgmx  ";
			ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
			ls_sql+=" and cl_jgmx.dwbh='"+fgsbh+"' and cl_clbm.clbm='"+clbm[j]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		if (js==0)
		{
			conn.rollback();
			out.println("错误！材料用处名称【"+cf.GB2Uni(values[0])+"】未录入数量");
			return;
		}

	}

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cl_clsymx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		ls_sql="insert into cl_clsydj ( khbh,lrr,lrsj) ";
		ls_sql+=" values( '"+khbh+"','"+yhmc+"',SYSDATE)";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int i=0;i<clbm.length ;i++ )
		{
			ls_sql="insert into cl_clsybm ( khbh,clbm,xh) ";
			ls_sql+=" values( '"+khbh+"','"+clbm[i]+"',"+(i+1)+")";
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
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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