<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,org.apache.commons.fileupload.FileItem,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
String ls=null;
String  lrr=(String)session.getAttribute("yhmc");

String xjjlh=request.getParameter("xjjlh");
String zgjlh=request.getParameter("zgjlh");
String zgxm=cf.GB2Uni(request.getParameter("zgxm"));
String zgsm=cf.GB2Uni(request.getParameter("zgsm"));
String fkbm=request.getParameter("fkbm");
String ygbh=request.getParameter("ygbh");
String oldygbh=request.getParameter("oldygbh");



java.sql.Date yqjjsj=null;
ls=request.getParameter("yqjjsj");
try{
	if (!(ls.equals("")))  yqjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yqjjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ҫ����ʱ��]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	if (count==0)
	{
		out.println("����ʧ�ܣ�����¼�Ų����ڣ��ѱ�ɾ��");
		return;
	}

	String fkbmjsr=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkbmjsr=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update kp_zggdmx set yqjjsj=?,zgxm=?,zgsm=?,fkbm=?,ygbh=?,fkbmjsr=?,lrr=?,lrsj=SYSDATE";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,yqjjsj);
	ps.setString(2,zgxm);
	ps.setString(3,zgsm);
	ps.setString(4,fkbm);
	ps.setString(5,ygbh);
	ps.setString(6,fkbmjsr);
	ps.setString(7,lrr);
	ps.executeUpdate();
	ps.close();

	String wtclbz="";//B�������ģ�N������δ���գ�C���ڴ���Y���ѽ��
	wtclbz="N";

	ls_sql="update kp_xjgdjl set wtclbz='"+wtclbz+"'";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	//���Ͷ���
	if (!oldygbh.equals(ygbh))
	{
		ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
		String retStr=dxxt.jcgdzgYgFs(conn,zgjlh,lrr);//���÷��Ͷ��ź���
		if (retStr.equals(""))
		{
			out.println("���ŷ��ͳɹ�");
		}
		else{
			out.println(retStr);//�����ͽ����ʾ��ҳ����
		}
	}

	%>
	<SCRIPT language=javascript >
	<!--
	alert("����ɹ���");
	window.close();
	//-->
	</SCRIPT>	
	<%	
		
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
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
</body>
</html>
