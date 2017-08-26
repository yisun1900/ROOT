<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String oldcgsjs=cf.GB2Uni(request.getParameter("oldcgsjs"));
String cgsjs=cf.GB2Uni(request.getParameter("cgsjs"));
String sjsgpyybm=cf.GB2Uni(request.getParameter("sjsgpyybm"));
String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdsm=cf.GB2Uni(request.getParameter("pdsm"));
java.sql.Date pdsj=null;

ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɵ�ʱ��]����ת����������:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (clzt.equals("00") || clzt.equals("01") || clzt.equals("33") || clzt.equals("35") || clzt.equals("98") || clzt.equals("99"))
	{
		out.println("�����󣬴���״̬����ȷ");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set cgsjs=?,pdr=?,pdsj=?,pdsm=?,sjsgpyybm=?";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgsjs);
	ps.setString(2,pdr);
	ps.setDate(3,pdsj);
	ps.setString(4,pdsm);
	ps.setString(5,sjsgpyybm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_cgzjx set cgsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgsjs);
	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="update jc_jcdd set jjsjs=? ";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='2'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgsjs);
	ps.executeUpdate();
	ps.close();

	//����������ʦ���ɼ�¼
	if (!oldcgsjs.equals(cgsjs))
	{
		ls_sql="insert into jc_cgsjsgpjl(ddbh,cgsjs,ycgsjs,sjsgpyybm,pdsm,lrr,lrsj)";
		ls_sql+=" values(?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,cgsjs);
		ps.setString(3,oldcgsjs);
		ps.setString(4,sjsgpyybm);
		ps.setString(5,pdsm);
		ps.setString(6,pdr);
		ps.setDate(7,pdsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jc_cgsjsgpjl set sjsgpyybm=?,pdsm=?";
		ls_sql+=" where ddbh='"+ddbh+"' and cgsjs='"+cgsjs+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjsgpyybm);
		ps.setString(2,pdsm);
		ps.executeUpdate();
		ps.close();
	}

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