<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010112")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String ls=null;
String dzbjjc=cf.GB2Uni(request.getParameter("dzbjjc"));

double gcjcbjxs=0;
ls=request.getParameter("gcjcbjxs");
try{
	if (!(ls.equals("")))  gcjcbjxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcjcbjxs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̻�������ϵ��]����ת����������:"+e);
	return;
}
double sgcbbjxs=0;
ls=request.getParameter("sgcbbjxs");
try{
	if (!(ls.equals("")))  sgcbbjxs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sgcbbjxs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ɱ�����ϵ��]����ת����������:"+e);
	return;
}

String zdyxmshbz=cf.GB2Uni(request.getParameter("zdyxmshbz"));

int zdyxmyxq=0;
ls=request.getParameter("zdyxmyxq");
try{
	if (!(ls.equals("")))  zdyxmyxq=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zdyxmyxq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Զ�����Ŀ��Ч��]����ת����������:"+e);
	return;
}
double clfbfb=0;
ls=request.getParameter("clfbfb");
try{
	if (!(ls.equals("")))  clfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clfbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Զ�������ϷѰٷֱ�]����ת����������:"+e);
	return;
}
double cbbfb=0;
ls=request.getParameter("cbbfb");
try{
	if (!(ls.equals("")))  cbbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[cbbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Զ�����ɱ��ٷֱ�]����ת����������:"+e);
	return;
}

String sfqyyssh=cf.GB2Uni(request.getParameter("sfqyyssh"));
String bjdysq=cf.GB2Uni(request.getParameter("bjdysq"));
String sjdsfdz=cf.GB2Uni(request.getParameter("sjdsfdz"));
String yxbffydz=cf.GB2Uni(request.getParameter("yxbffydz"));

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
	
	conn.setAutoCommit(false);

	ls_sql="update sq_dwxx set dzbjjc=?,gcjcbjxs=?,sgcbbjxs=?,zdyxmshbz=?,zdyxmyxq=?,clfbfb=?,sfqyyssh=?,bjdysq=?,cbbfb=?,sjdsfdz=?,yxbffydz=? ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dzbjjc);
	ps.setDouble(2,gcjcbjxs);
	ps.setDouble(3,sgcbbjxs);
	ps.setString(4,zdyxmshbz);
	ps.setInt(5,zdyxmyxq);
	ps.setDouble(6,clfbfb);
	ps.setString(7,sfqyyssh);
	ps.setString(8,bjdysq);
	ps.setDouble(9,cbbfb);
	ps.setString(10,sjdsfdz);
	ps.setString(11,yxbffydz);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_zdyxmb set sgdbj=ROUND(bj/"+gcjcbjxs+",2),sgcbj=ROUND(ROUND(bj/"+gcjcbjxs+",2)*"+sgcbbjxs+",2),cbenj=bj*"+cbbfb+"/100,clcb=bj*"+cbbfb+"/100 ";
	ls_sql+=" where dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

//	out.println(ls_sql);

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
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






