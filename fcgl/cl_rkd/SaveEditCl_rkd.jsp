<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

//=====================================���������д�����ݿ�======================================================
String ls=null;
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String gysmc=cf.GB2Uni(request.getParameter("gysmc"));
String rkr=cf.GB2Uni(request.getParameter("rkr"));
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String sgph=cf.GB2Uni(request.getParameter("sgph"));
String rklx=cf.GB2Uni(request.getParameter("rklx"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));

java.sql.Date rksj=null;
ls=request.getParameter("rksj");
try{
	if (!(ls.equals("")))  rksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rksj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}

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


try {
	conn=cf.getConnection();

	if (!sgph.equals(""))
	{
		int count=0;
		ls_sql="select count(*) ";
		ls_sql+="  from cl_clsgd where dwbh='"+dwbh+"' and  sgph='"+sgph+"' ";  
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1); 
		} 
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("�����깺����["+sgph+"]������");
			return;
		}
	}

	ls_sql="update cl_rkd set dwbh=?,gysmc=?,rkr=?,rksj=?,lrr=?,lrsj=?,bz=?,sgph=?,rklx=?,sgd=?";
	ls_sql+=" where rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,gysmc);
	ps.setString(3,rkr);
	ps.setDate(4,rksj);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,bz);
	ps.setString(8,sgph);
	ps.setString(9,rklx);
	ps.setString(10,sgd);

	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
			alert("���̳ɹ�!!!");
			window.close();
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
