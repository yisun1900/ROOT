<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));

String ls=null;

String[] qdStr=request.getParameterValues("qd");
String[] zdStr=request.getParameterValues("zd");
String[] zdfxdjStr=request.getParameterValues("zdfxdj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cxhdmc=null;
	String fgsbh=null;
	ls_sql=" SELECT cxhdmc,fgsbh ";
	ls_sql+=" FROM jc_cxhd ";
    ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	else{
		out.print("错误！促销活动不存在");
		return;
	}
	rs.close();
	ps.close();
	
	conn.setAutoCommit(false);

	ls_sql="delete from jc_cxhddjfxbz ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	for (int i=0;i<qdStr.length ;i++ )
	{
		if (qdStr[i].trim().equals(""))
		{
			continue;
		}
		
		double zd=0;
		double qd=0;
		double zdfxdj=0;

		try{
			qd=Double.parseDouble(qdStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[金额起点]不是数字:"+e);
			return;
		}

		try{
			zd=Double.parseDouble(zdStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[金额截止点]不是数字:"+e);
			return;
		}

		if (zdfxdjStr[i].trim().equals(""))
		{
			zdfxdj=0;
		}
		else{
			try{
				zdfxdj=Double.parseDouble(zdfxdjStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[最大返现订金]不是数字:"+e);
				return;
			}
		}

		if (zdfxdj==0)
		{
			conn.rollback();
			out.println("<BR>错误！请录入[最大返现订金]");
			return;
		}


		ls_sql="insert into jc_cxhddjfxbz ( cxhdbm,qd,zd,zdfxdj ) ";
		ls_sql+=" values ( ?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cxhdbm);
		ps.setDouble(2,qd);
		ps.setDouble(3,zd);
		ps.setDouble(4,zdfxdj);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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