<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String shr=null;
java.sql.Date shsj=null;
String shjl=null;
String shyj=null;

shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}

shjl=cf.GB2Uni(request.getParameter("shjl"));
shyj=cf.GB2Uni(request.getParameter("shyj"));

String spxh=cf.GB2Uni(request.getParameter("spxh"));
String xgztbm=cf.GB2Uni(request.getParameter("xgztbm"));

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String yspxh=null;
	String yclzt=null;
	String yztbm=null;
	String yshjl=null;
	String yshyj=null;
	String yshr=null;
	java.sql.Date yshsj=null;
	ls_sql="select spxh,clzt,ztbm,shjl,shyj,shr,shsj";
	ls_sql+=" from  rs_ccsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yspxh=cf.fillNull(rs.getString("spxh"));
		yclzt=cf.fillNull(rs.getString("clzt"));
		yztbm=cf.fillNull(rs.getString("ztbm"));
		yshjl=cf.fillNull(rs.getString("shjl"));
		yshyj=cf.fillNull(rs.getString("shyj"));
		yshr=cf.fillNull(rs.getString("shr"));
		yshsj=rs.getDate("shsj");
	}
	rs.close();
	ps.close();

	if (!yspxh.equals(spxh))
	{
		out.println("ɾ�����������Ѹı�");
		return;
	}

	String shclzt=null;
	String shztbm=null;
	String shyztbm=null;

	ls_sql="select clzt,ztbm,yztbm";
	ls_sql+=" from  rs_ccsqspb";
	ls_sql+=" where spxh="+yspxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shclzt=cf.fillNull(rs.getString("clzt"));
		shztbm=cf.fillNull(rs.getString("ztbm"));
		shyztbm=cf.fillNull(rs.getString("yztbm"));
	}
	rs.close();
	ps.close();


	if (!yclzt.equals(shclzt))
	{
		out.println("ɾ�����󣡴���״̬�Ѹı�");
		return;
	}

	if (!yztbm.equals(shztbm))
	{
		out.println("ɾ����������״̬�Ѹı�");
		return;
	}

	if (!shyztbm.equals(xgztbm))
	{
		out.println("���󣡡�����״̬���Ѹı䣬�������޸�");
		return;
	}

	//ȡ��һ״̬
	String xyztbm=null;
	ls_sql="select xyztbm";
	ls_sql+=" from  rs_shztlc";
	ls_sql+=" where ztbm='"+shyztbm+"' and shjl='"+shjl+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xyztbm=cf.fillNull(rs.getString("xyztbm"));
	}
	rs.close();
	ps.close();

	String sqzt=null;
	ls_sql="select sqzt";
	ls_sql+=" from  rs_ztbm";
	ls_sql+=" where ztbm='"+xyztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqzt=cf.fillNull(rs.getString("sqzt"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	
	ls_sql="update rs_ccsqspb set shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=? ";
	ls_sql+=" where spxh="+spxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shr);
	ps.setDate(2,shsj);
	ps.setString(3,shjl);
	ps.setString(4,shyj);
	ps.setString(5,sqzt);
	ps.setString(6,xyztbm);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_ccsqd set shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=? ";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shr);
	ps.setDate(2,shsj);
	ps.setString(3,shjl);
	ps.setString(4,shyj);
	ps.setString(5,sqzt);
	ps.setString(6,xyztbm);
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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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