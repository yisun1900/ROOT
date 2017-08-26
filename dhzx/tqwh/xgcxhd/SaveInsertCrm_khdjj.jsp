<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));

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

	
	conn.setAutoCommit(false);

	ls_sql="delete from crm_khdjj ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khfqfw ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_khdjj ( khbh,djjzsfs,zsjs,khfqje,khfqbfb) ";
	ls_sql+=" values ( ?,?,?,0,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
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
			out.println("<BR>[������]��������:"+e);
			return;
		}

		try{
			zd=Double.parseDouble(zdStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[����ֹ��]��������:"+e);
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
				out.println("<BR>[��ȯ���]��������:"+e);
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
				out.println("<BR>[��ȯ�ٷֱ�]��������:"+e);
				return;
			}
		}
 
		ls_sql="insert into crm_khfqfw ( khbh,qd,zd,fqje,fqbfb ) ";
		ls_sql+=" values ( ?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setDouble(2,qd);
		ps.setDouble(3,zd);
		ps.setDouble(4,fqje);
		ps.setDouble(5,fqbfb);
		ps.executeUpdate();
		ps.close();
	}

	dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
	newdzbj.updateHtDjj(conn,khbh,"yz");

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
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