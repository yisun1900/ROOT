<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ysshbz=null;
String ysshr=null;
java.sql.Date ysshsj=null;
String ysshyj=null;
long jygq=0;
java.sql.Date jykgsj=null;
java.sql.Date jyjgsj=null;
ysshbz=cf.GB2Uni(request.getParameter("ysshbz"));
ysshr=cf.GB2Uni(request.getParameter("ysshr"));
ls=request.getParameter("ysshsj");
try{
	if (!(ls.equals("")))  ysshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ysshsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
ysshyj=cf.GB2Uni(request.getParameter("ysshyj"));
/*ls=request.getParameter("jygq");
try{
	if (!(ls.equals("")))  jygq=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jygq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���鹤��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jykgsj");
try{
	if (!(ls.equals("")))  jykgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jykgsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���鿪��ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jyjgsj");
try{
	if (!(ls.equals("")))  jyjgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jyjgsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���鿢��ʱ��]����ת����������:"+e);
	return;
}*/
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));
String cqhtbz=request.getParameter("cqhtbz");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String zxzt="";
	ls_sql="select zxzt";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxzt=cf.fillNull(rs.getString("zxzt"));
	}
	rs.close();
	ps.close();

	if (!zxzt.equals("0") && !zxzt.equals("1") && !zxzt.equals("5"))
	{
		out.println("���󣬲������޸ģ��ͻ���ǩ����ʧ��");
		return;
	}

	String getysshbz="";
	ls_sql="select ysshbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getysshbz=cf.fillNull(rs.getString("ysshbz"));
	}
	rs.close();
	ps.close();

	if (!getysshbz.equals("C"))////N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��;S���޸ķ�����Ȩ
	{
		out.println("���󣡿ͻ�Ԥ������״̬����ȷ��"+getysshbz);
		return;
	}

	getysshbz="";
	ls_sql="select ysshbz";
	ls_sql+=" from  bj_ysshjl";
	ls_sql+=" where  (ysshjl='"+ysshjl+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getysshbz=cf.fillNull(rs.getString("ysshbz"));
	}
	rs.close();
	ps.close();

	if (!getysshbz.equals("C"))////N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��;S���޸ķ�����Ȩ
	{
		out.println("���������¼״̬����ȷ��"+getysshbz);
		return;
	}


	conn.setAutoCommit(false);

	double shdf=0;
	ls_sql="select sum(bhgsl*kf)";
	ls_sql+=" from  bj_ysshmx";
	ls_sql+=" where  ysshjl='"+ysshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shdf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_ysshjl set ysshbz=?,ysshr=?,ysshsj=SYSDATE,ysshyj=?,jygq=?,jykgsj=?,jyjgsj=?,shdf=? ";
	ls_sql+=" where  ysshjl='"+ysshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysshbz);
	ps.setString(2,ysshr);
	ps.setString(3,ysshyj);
	ps.setLong(4,jygq);
	ps.setDate(5,jykgsj);
	ps.setDate(6,jyjgsj);
	ps.setDouble(7,shdf);
	ps.executeUpdate();
	ps.close();

	double ysshdf=0;

	
	if (ysshbz.equals("Y"))//Y�����ͨ���������ܷ�
	{
		
		ls_sql="select sum(shdf)";
		ls_sql+=" from  bj_ysshjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ysshdf=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		
		ysshdf=100-ysshdf;
		
		
		ls_sql="update crm_zxkhxx set ysshbz=?,ysshr=?,ysshsj=SYSDATE,ysshyj=?,ysshdf=?,cqhtbz=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysshbz);
		ps.setString(2,ysshr);
		ps.setString(3,ysshyj);
		ps.setDouble(4,ysshdf);
		ps.setString(5,cqhtbz);
		ps.executeUpdate();
		ps.close();

		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���Ԥ����˵÷֣�<%=ysshdf%>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	else{
		ls_sql="update crm_zxkhxx set ysshbz=?,ysshr=?,ysshsj=?,ysshyj=?,ysshdf=0,cqhtbz=?";
		ls_sql+=" where  (khbh='"+khbh+"') ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysshbz);
		ps.setString(2,ysshr);
		ps.setDate(3,ysshsj);
		ps.setString(4,ysshyj);
		ps.setString(5,cqhtbz);
		ps.executeUpdate();
		ps.close();

		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ����۷֣�<%=shdf%>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

	conn.commit();

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
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