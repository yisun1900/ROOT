<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%

String ls=null;
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

//=====================================���������д�����ݿ�======================================================
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
String jzph=dwbh+ls.substring(0,4)+ls.substring(5,7);

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

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+="  from cl_ydjz where dwbh='"+dwbh+"' and  jzph='"+jzph+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1); 
	} 
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("���󣡱����ѽ�ת�������ٽ��г��������������������ɾ����ת��¼");
		return;
	}

	if (!sgph.equals(""))
	{
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

	ls_sql="insert into cl_rkd ( rkph,dwbh,gysmc,rkr,rksj,rkzsl,rkzje,rkzt,lrr,lrsj,bz,sgph,rklx,sgd ) ";
	ls_sql+=" values ( ?,?,?,?,?,0,0,'1',?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rkph);
	ps.setString(2,dwbh);
	ps.setString(3,gysmc);
	ps.setString(4,rkr);
	ps.setDate(5,rksj);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,bz);
	ps.setString(9,sgph);
	ps.setString(10,rklx);
	ps.setString(11,sgd);

	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
			alert("���̳ɹ�,��ѡ�����!!!");
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
