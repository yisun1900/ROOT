<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String zjxfsjd=null;
String zjxyysm=null;

double kglf=0;
double kqtk=0;

java.sql.Date fssj=null;
ls=request.getParameter("fssj");
try{
	if (!(ls.equals("")))  fssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������Ʒ����ʱ��]����ת����������:"+e);
	return;
}

khbh=cf.GB2Uni(request.getParameter("khbh"));
zjxfsjd=cf.GB2Uni(request.getParameter("zjxfsjd"));
zjxyysm=cf.GB2Uni(request.getParameter("zjxyysm"));

ls=request.getParameter("kglf");
try{
	if (!(ls.equals("")))  kglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kglf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۹����]����ת����������:"+e);
	return;
}
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kqtk������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}



String lrr=cf.GB2Uni(request.getParameter("lrr"));
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


double zjxjme=0;
ls=request.getParameter("zjxjme");
try{
	if (!(ls.equals("")))  zjxjme=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjxjme������");
	return;
}
catch (Exception e){
	out.println("<BR>[������Ʒ�����]����ת����������:"+e);
	return;
}
double glfjmje=0;
ls=request.getParameter("glfjmje");
try{
	if (!(ls.equals("")))  glfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����glfjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ѽ����]����ת����������:"+e);
	return;
}
double sjjmje=0;
ls=request.getParameter("sjjmje");
try{
	if (!(ls.equals("")))  sjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰������]����ת����������:"+e);
	return;
}


String[] zjxyybm=null;
zjxyybm=request.getParameterValues("zjxyybm");

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newzjxxh="";
	String gcjdbm="";
	String gdjsjd="";
	String sjsjsbz="";
	ls_sql="select gcjdbm,zjxxh,gdjsjd,sjsjsbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//���̽���
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
	}
	rs.close();
	ps.close();

	if (sjsjsbz.equals("2"))//0��δ���㣻1��ǩ�����㣻2���깤����
	{
		out.println("�������ʦ�ѽ��㣬�������޸�");
		return;
	}
	if (gdjsjd.equals("1"))//0��δ���㣻1���ѽ���
	{
		out.println("����ʩ�����ѽ��㣬�������޸�");
		return;
	}

	ls_sql="select zjxxh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";//N��δ��ɣ�Y�������
	ls_sql+=" and lx in('3','4')";//1�����������2����������������ϸ��3���ײ��˲�����4���ײ͵�����Ʒ
	ls_sql+=" order by zjxxh desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		newzjxxh=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (!newzjxxh.equals(zjxxh))
	{
		out.println("����ֻ���޸����µĵ�����Ʒ��¼:"+newzjxxh);
		return;
	}
	

	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set fssj=?,zjxfsjd=?,zjxyysm=?,lrsj=?,lrr=?";
	ls_sql+=" ,zjxjme=?,glfjmje=?,sjjmje=?,kglf=?,kqtk=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fssj);
	ps.setString(2,zjxfsjd);
	ps.setString(3,zjxyysm);
	ps.setDate(4,lrsj);
	ps.setString(5,lrr);

	ps.setDouble(6,zjxjme);
	ps.setDouble(7,glfjmje);
	ps.setDouble(8,sjjmje);
	ps.setDouble(9,kglf);
	ps.setDouble(10,kqtk);

	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zjxyydj ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<zjxyybm.length ;i++ )
	{
		ls_sql="insert into crm_zjxyydj ( zjxxh,khbh,zjxyybm) ";
		ls_sql+=" values ( ?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,zjxyybm[i]);
		ps.executeUpdate();
		ps.close();
	}



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