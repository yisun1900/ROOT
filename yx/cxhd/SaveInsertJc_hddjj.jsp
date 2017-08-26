<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));

String ls=null;
String djjzsfs=cf.GB2Uni(request.getParameter("djjzsfs"));
String zsjs=cf.GB2Uni(request.getParameter("zsjs"));

String[] qdStr=request.getParameterValues("qd");
String[] zdStr=request.getParameterValues("zd");
String[] fqjeStr=request.getParameterValues("fqje");
String[] fqbfbStr=request.getParameterValues("fqbfb");


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

	ls_sql="delete from jc_hddjj ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_cxhdfqbz ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_hddjj ( cxhdbm,djjzsfs,zsjs) ";
	ls_sql+=" values ( ?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdbm);
	ps.setString(2,djjzsfs);
	ps.setString(3,zsjs);
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
		double fqje=0;
		double fqbfb=0;

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

		if (fqjeStr[i].trim().equals(""))
		{
			fqje=0;
		}
		else{
			try{
				fqje=Double.parseDouble(fqjeStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[返券金额]不是数字:"+e);
				return;
			}
		}

		if (fqbfbStr[i].trim().equals(""))
		{
			fqbfb=0;
		}
		else{
			try{
				fqbfb=Double.parseDouble(fqbfbStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[返券百分比]不是数字:"+e);
				return;
			}
		}
 
		ls_sql="insert into jc_cxhdfqbz ( cxhdbm,qd,zd,fqje,fqbfb ) ";
		ls_sql+=" values ( ?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cxhdbm);
		ps.setDouble(2,qd);
		ps.setDouble(3,zd);
		ps.setDouble(4,fqje);
		ps.setDouble(5,fqbfb);
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