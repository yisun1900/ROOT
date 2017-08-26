<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String fcsm=cf.GB2Uni(request.getParameter("fcsm"));
String fclrr=cf.GB2Uni(request.getParameter("fclrr"));

String ls=null;
java.sql.Date sfcsj=null;
ls=request.getParameter("sfcsj");
try{
	if (!(ls.equals("")))  sfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sfcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ����ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date fclrsj=null;
ls=request.getParameter("fclrsj");
try{
	if (!(ls.equals("")))  fclrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fclrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����¼��ʱ��]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	String jgclzt=null;
	ls_sql="select jgclzt";
	ls_sql+=" from  jdm_mmclzt";
	ls_sql+=" where cdmc='ľ�Ÿ���' and bclzt='"+clzt+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jgclzt=rs.getString("jgclzt");
	}
	rs.close();
	ps.close();
	
	if (jgclzt==null)
	{
		out.println("������ʧ�ܣ�����״̬����ȷ��");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update jc_mmydd set sfcsj=?,fcsm=?,fclrr=?,fclrsj=?,clzt='"+jgclzt+"'";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sfcsj);
	ps.setString(2,fcsm);
	ps.setString(3,fclrr);
	ps.setDate(4,fclrsj);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into jc_mmfcd (xh,yddbh,mmdglxbm,mlx,mmxh,ysbm,czbm,azwzbm,kqfxbm,dczlbm,dbh,qh,mdk,mdg,ctbs,tjx,dsk,sfysblm,blxhbm,sfsmjcc,sfydc,dj,sl,bz) ";
	ls_sql+=" select xh,yddbh,mmdglxbm,mlx,mmxh,ysbm,czbm,azwzbm,kqfxbm,dczlbm,dbh,qh,mdk,mdg,ctbs,tjx,dsk,sfysblm,blxhbm,sfsmjcc,sfydc,dj,sl,bz";
	ls_sql+=" from jc_mmdgdmx ";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	
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
	out.print("Exception: " + e);
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