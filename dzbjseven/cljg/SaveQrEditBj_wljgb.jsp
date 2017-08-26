<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ls=null;
String jswlbm=null;
double dj=0;
double wljsbz=0;

jswlbm=cf.GB2Uni(request.getParameter("jswlbm"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wljsbz");
try{
	if (!(ls.equals("")))  wljsbz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wljsbz������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������������λ��ֵ]����ת����������:"+e);
	return;
}
String wheredqbm=request.getParameter("wheredqbm");
String wherewlbm=request.getParameter("wherewlbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
   
	String jsjldwbm="";
	if (!jswlbm.equals(""))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_jscljgb";
		ls_sql+=" where dqbm='"+wheredqbm+"' AND wlbm='"+jswlbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
		   count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count<1)
		{
			conn.rollback();
			out.println("���󣡲����ڵ�[������ϱ���]��"+jswlbm);
			return;
		}
  
		
		ls_sql="select jldwbm";
		ls_sql+=" from  bj_jscljgb";
		ls_sql+=" where  dqbm='"+wheredqbm+"' and wlbm='"+jswlbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jsjldwbm=cf.fillNull(rs.getString("jldwbm"));
		}
		rs.close();
		ps.close();

		if (wljsbz==0)
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[������ϱ���]"+jswlbm+"��[����/���������λ��ֵ]����Ϊ0");
			return;
		}
   }
   else{
	   wljsbz=0;
   }

	
	conn.setAutoCommit(false);
	
	ls_sql="update bj_jzcljgb set jswlbm=?,jsjldwbm=?,wljsbz=?,qrbz='Y'";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and wlbm='"+wherewlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jswlbm);
	ps.setString(2,jsjldwbm);
	ps.setDouble(3,wljsbz);
	ps.executeUpdate();
	ps.close();

	if (!jswlbm.equals(""))
	{
		ls_sql="update bj_jscljgb set dj=?/?";
		ls_sql+=" where  dqbm='"+wheredqbm+"' and wlbm='"+jswlbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dj);
		ps.setDouble(2,wljsbz);
		ps.executeUpdate();
		ps.close();
	   
		ls_sql="update bj_jzglfxb set dj=?/?";
		ls_sql+=" where  dqbm='"+wheredqbm+"' and wlbm='"+jswlbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dj);
		ps.setDouble(2,wljsbz);
		ps.executeUpdate();
		ps.close();
	}
		
		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	parent.close();
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