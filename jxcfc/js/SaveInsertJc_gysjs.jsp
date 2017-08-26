<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jssj=null;
String jsr=null;
double cbzj=0;
double kcfy=0;
double jsje=0;


ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算时间]类型转换发生意外:"+e);
	return;
}
jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("cbzj");
try{
	if (!(ls.equals("")))  cbzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cbzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料成本]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("kcfy");
try{
	if (!(ls.equals("")))  kcfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[kcfy]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣除费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算金额]类型转换发生意外:"+e);
	return;
}

String jssm=cf.GB2Uni(request.getParameter("jssm"));

String gys=cf.GB2Uni(request.getParameter("gys"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));

String ssfgs=request.getParameter("ssfgs");

String[] ckph=request.getParameterValues("ckph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	int jsjlh=0;
	ls_sql =" select NVL(max(jsjlh),0)";
	ls_sql+=" from jc_fcgysjs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsjlh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh++;

	ls_sql="insert into jc_fcgysjs ( jsjlh,gys,jssj,jsr,cbzj,ycfzj,qtfzj,kcfy,jsje,jssm,ppbm,cwzq ,shbz,lx,ssfgs) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,'N','1',? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,jsjlh);
	ps.setString(2,gys);
	ps.setDate(3,jssj);
	ps.setString(4,jsr);
	ps.setDouble(5,cbzj);
	ps.setDouble(6,0);
	ps.setDouble(7,0);
	ps.setDouble(8,kcfy);
	ps.setDouble(9,jsje);
	ps.setString(10,jssm);
	ps.setString(11,ppbm);
	ps.setString(12,"");
	ps.setString(13,ssfgs);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ckph.length ;i++ )
	{
		ls_sql="insert into jc_fcgysjsmx ( jsjlh,ckph) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,jsjlh);
		ps.setString(2,ckph[i]);
		ps.executeUpdate();
		ps.close();


		String sfjz=null;
		ls_sql =" select sfjz";
		ls_sql+=" from jxc_ckd";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfjz=cf.fillNull(rs.getString("sfjz"));
		}
		rs.close();
		ps.close();

		if (sfjz.equals("Y"))
		{
			conn.rollback();
			out.println("<BR>错误，出库单【"+ckph[i]+"】已结算");
			return;
		}

		ls_sql="update jxc_ckd set sfjz='Y',jzsj=?,jzr=?,jsjlh=? ";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,jssj);
		ps.setString(2,jsr);
		ps.setInt(3,jsjlh);
		ps.executeUpdate();
		ps.close();

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
