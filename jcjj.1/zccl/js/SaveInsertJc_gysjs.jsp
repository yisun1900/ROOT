<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gys=null;
java.sql.Date jssj=null;
String jsr=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double kcfy=0;
double jsje=0;
String jssm=null;
gys=cf.GB2Uni(request.getParameter("gys"));
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("cbzj");
try{
	if (!(ls.equals("")))  cbzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cbzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ϳɱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycfzj");
try{
	if (!(ls.equals("")))  ycfzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycfzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtfzj");
try{
	if (!(ls.equals("")))  qtfzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[qtfzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("kcfy");
try{
	if (!(ls.equals("")))  kcfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[kcfy]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۳�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
jssm=cf.GB2Uni(request.getParameter("jssm"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String cwzq=cf.GB2Uni(request.getParameter("cwzq"));
String ssfgs=request.getParameter("ssfgs");

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	int jsjlh=0;
	ls_sql =" select NVL(max(jsjlh),0)";
	ls_sql+=" from jc_gysjs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsjlh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh++;

	ls_sql="insert into jc_gysjs ( jsjlh,gys,jssj,jsr,cbzj,ycfzj,qtfzj,kcfy,jsje,jssm,ppbm,cwzq ,shbz,lx,ssfgs,fkbl,fkje) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,'N','1',?,0,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,jsjlh);
	ps.setString(2,gys);
	ps.setDate(3,jssj);
	ps.setString(4,jsr);
	ps.setDouble(5,cbzj);
	ps.setDouble(6,ycfzj);
	ps.setDouble(7,qtfzj);
	ps.setDouble(8,kcfy);
	ps.setDouble(9,jsje);
	ps.setString(10,jssm);
	ps.setString(11,ppbm);
	ps.setString(12,cwzq);
	ps.setString(13,ssfgs);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="insert into jc_gysjsmx ( jsjlh,ddbh) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jsjlh);
		ps.setString(2,ddbh[i]);
		ps.executeUpdate();
		ps.close();

		if (ddbh[i].length()==9)
		{
			String sfjs=null;
			String clzt=null;
			String khbh=null;
			ls_sql =" select sfjs,clzt,khbh";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfjs=cf.fillNull(rs.getString("sfjs"));
				clzt=rs.getString("clzt");
				khbh=rs.getString("khbh");
			}
			rs.close();
			ps.close();

			if (sfjs.equals("Y"))
			{
				conn.rollback();
				out.println("<BR>���󣬶�����"+ddbh[i]+"���ѽ���");
				return;
			}

			ls_sql="update jc_zcdd set sfjs='Y',jssj=?,jsr=?,jsjlh=?,jssm='��������'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,jssj);
			ps.setString(2,jsr);
			ps.setInt(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			String sfjs=null;
			String clzt=null;
			String khbh=null;
			ls_sql =" select sfjs,clzt,khbh";
			ls_sql+=" from jc_zczjx";
			ls_sql+=" where zjxbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfjs=cf.fillNull(rs.getString("sfjs"));
				clzt=rs.getString("clzt");
				khbh=rs.getString("khbh");
			}
			rs.close();
			ps.close();

			if (sfjs.equals("Y"))
			{
				conn.rollback();
				out.println("<BR>���������"+ddbh[i]+"���ѽ���");
				return;
			}

			ls_sql="update jc_zczjx set sfjs='Y',jissj=?,jisr=?,jsjlh=?";
			ls_sql+=" where zjxbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,jssj);
			ps.setString(2,jsr);
			ps.setInt(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}


	conn.commit();


	response.sendRedirect("EditJc_gysjs.jsp?lx=1&jsjlh="+jsjlh);

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
