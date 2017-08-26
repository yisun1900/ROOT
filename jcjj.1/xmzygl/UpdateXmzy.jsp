<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbhstr=request.getParameterValues("ddbh");
String xmzy=cf.GB2Uni(request.getParameter("xmzy"));

String ddbh=null;
String lx=null;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	int pos=0;
	for (int i=0;i<ddbhstr.length ;i++ )
	{
		ls=cf.GB2Uni(ddbhstr[i]);
		pos=ls.indexOf("*");
		ddbh=ls.substring(0,pos);
		lx=ls.substring(pos+1);


		if (lx.equals("木门"))
		{
			ls_sql="update jc_mmydd set xmzy=?";
			ls_sql+=" where yddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			ls_sql="update jc_mmzjx set xmzy=?";
			ls_sql+=" where yddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz in( select yddbh||'+'||zjxxh from jc_mmzjx where yddbh='"+ddbh+"') and lx='1'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz='"+ddbh+"' and lx='1'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();
		}
		else if (lx.equals("橱柜"))
		{
			ls_sql="update jc_cgdd set xmzy=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			ls_sql="update jc_cgzjx set xmzy=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz in( select ddbh||'+'||zjxxh from jc_cgzjx where ddbh='"+ddbh+"') and lx='2'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz='"+ddbh+"' and lx='2'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();
		}
		else if (lx.equals("家具"))
		{
			ls_sql="update jc_jjdd set xmzy=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			ls_sql="update jc_jjzjx set xmzy=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz='"+ddbh+"' and lx='3'";//1：木门；2：橱柜；3：家具；4：主材
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz in( select zjxxh from jc_jjzjx where ddbh='"+ddbh+"') and lx='3'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();
		}
		else if (lx.equals("主材"))
		{
			ls_sql="update jc_zcdd set xmzy=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			ls_sql="update jc_zczjx set xmzy=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz='"+ddbh+"' and lx='4'";//1：木门；2：橱柜；3：家具；4：主材
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
			ps.executeUpdate();
			ps.close();

			//集成订单
			ls_sql="update jc_jcdd set xmzy=?";
			ls_sql+=" where gjz in( select zjxbh from jc_zczjx where ddbh='"+ddbh+"') and lx='4'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,xmzy);
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
	out.print("SQL: " + ls_sql);
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