<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String psph=null;
String ssbm=null;
String psfs=null;
String fclb=null;
java.sql.Date jhshsj=null;
double fkje=0;
String lrr=null;
String bz=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
psph=cf.GB2Uni(request.getParameter("psph"));
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
fclb=cf.GB2Uni(request.getParameter("fclb"));
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ��ͻ�ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
bz=cf.GB2Uni(request.getParameter("bz"));
String lx=cf.GB2Uni(request.getParameter("lx"));
double yf=0;
ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˷�]����ת����������:"+e);
	return;
}
double qtsf=0;
ls=request.getParameter("qtsf");
try{
	if (!(ls.equals("")))  qtsf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtsf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շ�]����ת����������:"+e);
	return;
}
java.sql.Date lrrq=null;
ls=request.getParameter("lrrq");
try{
	if (!(ls.equals("")))  lrrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	ls_sql=" SELECT psdzt ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("0"))//0���ȴ��ύ��2���ȴ����⣻3���ѳ��⣻5�����ֳ���
	{
		out.print("���󣡲��ϵ�["+psph+"]���ύ���������޸ģ�");
		return;
	}

	ls_sql="update jxc_clpsd set psfs=?,jhshsj=?,fkje=?,yf=?,qtsf=?,lrr=?,lrrq=?,ssbm=?,bz=?, fclb=?";
	ls_sql+=" where psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,psfs);
	ps.setDate(2,jhshsj);
	ps.setDouble(3,fkje);
	ps.setDouble(4,yf);
	ps.setDouble(5,qtsf);
	ps.setString(6,lrr);
	ps.setDate(7,lrrq);
	ps.setString(8,ssbm);
	ps.setString(9,bz);
	ps.setString(10,fclb);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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