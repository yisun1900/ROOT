<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="jzgl" scope="page" class="jxc.kcjz.Kcjz"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String dqbm=null;
String ckbh=null;
String fgsbh=null;
String tzr=yhmc;
String bz=null;
long tzph=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
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
	ls_sql=" select NVL(max(tzph),0)+1 tzph ";
	ls_sql+=" from jxc_zltzjl ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	if (rs.next())
	{
		tzph=rs.getLong("tzph");
	}
	rs.close();
	ps.close();
	if (tzph<=0)
	{tzph=1;}

	ls_sql="insert into jxc_zltzjl ( tzph,dqbm,ckbh,tzr,tzrq,ssfgs,ssbm,bz ) ";
	ls_sql+=" values ( ?,?,?,?,SYSDATE,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,tzph);
	ps.setString(2,dqbm);
	ps.setString(3,ckbh);
	ps.setString(4,tzr);
	ps.setString(5,fgsbh);
	ps.setString(6,dwbh);
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
		window.location.href="Insertclbm.jsp?tzph=<%=tzph%>";
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