<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="jzgl" scope="page" class="jxc.kcjz.Kcjz"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String ckbh=request.getParameter("ckbh");
String lrbm=request.getParameter("lrbm");
String ssfgs=request.getParameter("ssfgs");
String bz=cf.GB2Uni(request.getParameter("bz"));
String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}

String jz=jzgl.cxkcjz(ckbh);
if (jz!=null && jz.equals("0"))//0:δ��ת��1���ѽ�ת
{
	out.print("�ϸ���û�н�ת�����ܽ��п�������");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

//	���ɱ��
	String tzph=null;
	int count=0;
	ls_sql="select NVL(max(TO_NUMBER(substr(tzph,7,5))),0)";
	ls_sql+=" from  jxc_hjtzjl";
	ls_sql+=" where ckbh='"+ckbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	tzph="ZC"+ckbh+cf.addZero(count+1,5);

	ls_sql="insert into jxc_hjtzjl ( tzph,ckbh,lrr,lrsj,lrbm,ssfgs,bz,cllx,clzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'0','0' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzph);
	ps.setString(2,ckbh);
	ps.setString(3,lrr);
	ps.setDate(4,lrsj);
	ps.setString(5,lrbm);
	ps.setString(6,ssfgs);
	ps.setString(7,bz);

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
		window.location.href="EditJxc_hjtzjl.jsp?tzph=<%=tzph%>";
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>