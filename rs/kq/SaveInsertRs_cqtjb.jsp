<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String nian=null;
String yue=null;
long ygbh=0;
long qqts=0;
long cqts=0;
String bz=null;
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
nian=cf.GB2Uni(request.getParameter("nian"));
yue=cf.GB2Uni(request.getParameter("yue"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ygbh������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ա�����]����ת����������:"+e);
	return;
}

ls=request.getParameter("qqts");
try{
	if (!(ls.equals("")))  qqts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qqts������");
	return;
}
catch (Exception e){
	out.println("<BR>[ȫ������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cqts");
try{
	if (!(ls.equals("")))  cqts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cqts������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String bianhao=null;
	String yhmc=null;
	String dwbh=null;
	ls_sql=" select bianhao,yhmc,dwbh" ;
	ls_sql+=" from sq_yhxx" ;
	ls_sql+=" where  (ygbh="+ygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next()){         
		bianhao = rs.getString("bianhao");			    
		yhmc = rs.getString("yhmc");			    
		dwbh = rs.getString("dwbh");			    
	}
	else{
		out.println("���������󣬲����ڵ�Ա����ţ�"+ygbh);
		return;
	}
	rs.close();
	ps.close();

	ls_sql=" select xh" ;
	ls_sql+=" from rs_cqtjb" ;
	ls_sql+=" where nian='"+nian+"' and yue='"+yue+"' and ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next()){         
		out.println("���������󣬸�[Ա������]�Ѵ��ڣ�");
		return;
	}
	rs.close();
	ps.close();


	int xh=0;

	ls_sql=" select max(xh)" ;
	ls_sql+=" from rs_cqtjb" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next()){         
		xh = rs.getInt(1);			    
	}
	rs.close();
	ps.close();

	xh++;


	ls_sql="insert into rs_cqtjb ( xh,nian,yue,ygbh,bianhao,yhmc,dwbh,qqts,cqts,bz,ssfgs ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setString(2,nian);
	ps.setString(3,yue);
	ps.setLong(4,ygbh);
	ps.setString(5,bianhao);
	ps.setString(6,yhmc);
	ps.setString(7,dwbh);
	ps.setLong(8,qqts);
	ps.setLong(9,cqts);
	ps.setString(10,bz);
	ps.setString(11,ssfgs);
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
		window.close();
		//-->
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>