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
double oldzjje=0;
double zjje=0;
double kglf=0;
double kqtk=0;
double jzjje=0;
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
	out.println("<BR>[�������ʱ��]����ת����������:"+e);
	return;
}

khbh=cf.GB2Uni(request.getParameter("khbh"));
zjxfsjd=cf.GB2Uni(request.getParameter("zjxfsjd"));
zjxyysm=cf.GB2Uni(request.getParameter("zjxyysm"));
ls=request.getParameter("oldzjje");
try{
	if (!(ls.equals("")))  oldzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����oldzjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������]����ת����������:"+e);
	return;
}
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
ls=request.getParameter("jzjje");
try{
	if (!(ls.equals("")))  jzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ����������]����ת����������:"+e);
	return;
}

double zjxsuijin=0;
ls=request.getParameter("zjxsuijin");
try{
	if (!(ls.equals("")))  zjxsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjxsuijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ�������˰��]����ת����������:"+e);
	return;
}
double zqguanlif=0;
ls=request.getParameter("zqguanlif");
try{
	if (!(ls.equals("")))  zqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqguanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ����������]����ת����������:"+e);
	return;
}
double zhguanlif=0;
ls=request.getParameter("zhguanlif");
try{
	if (!(ls.equals("")))  zhguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zhguanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ�����������]����ת����������:"+e);
	return;
}

String zjxwcbz=request.getParameter("zjxwcbz");

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
	out.println("<BR>[����������]����ת����������:"+e);
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
double zjxzkl=0;
ls=request.getParameter("zjxzkl");
try{
	if (!(ls.equals("")))  zjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjxzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ۿ�]����ת����������:"+e);
	return;
}
double cxhdzjxzkl=0;
ls=request.getParameter("cxhdzjxzkl");
try{
	if (!(ls.equals("")))  cxhdzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdzjxzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������ۿ�]����ת����������:"+e);
	return;
}
double glfzkl=0;
ls=request.getParameter("glfzkl");
try{
	if (!(ls.equals("")))  glfzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����glfzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ۿ�]����ת����������:"+e);
	return;
}
double cxhdglfzkl=0;
ls=request.getParameter("cxhdglfzkl");
try{
	if (!(ls.equals("")))  cxhdglfzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdglfzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������ۿ�]����ת����������:"+e);
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

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

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

	if (gcjdbm.equals("5"))
	{
		out.println("���󣡿ͻ�����ᣬ�������޸�");
		return;
	}
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
	if (!newzjxxh.equals(zjxxh))
	{
		out.println("����ֻ���޸����µ��������¼:"+newzjxxh);
		return;
	}
	

	double newzjje=0;
	ls_sql="select zjje";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newzjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	if (newzjje!=oldzjje)
	{
		out.println("���󣡡�����������ͨ��������ϸ�����Զ��޸ģ����ܴ��̣���ˢ�º����±���");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set fssj=?,zjxfsjd=?,zjxyysm=?,zjxwcbz=?,lrsj=?,lrr=?";
	ls_sql+=" ,zjje=?,jzjje=?,zjxsuijin=?,zqguanlif=?,zhguanlif=?,zjxjme=?,glfjmje=?,sjjmje=?,zjxzkl=?,cxhdzjxzkl=?   ,glfzkl=?,cxhdglfzkl=?,kglf=?,kqtk=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fssj);
	ps.setString(2,zjxfsjd);
	ps.setString(3,zjxyysm);
	ps.setString(4,zjxwcbz);
	ps.setDate(5,lrsj);
	ps.setString(6,lrr);

	ps.setDouble(7,zjje);
	ps.setDouble(8,jzjje);
	ps.setDouble(9,zjxsuijin);
	ps.setDouble(10,zqguanlif);
	ps.setDouble(11,zhguanlif);
	ps.setDouble(12,zjxjme);
	ps.setDouble(13,glfjmje);
	ps.setDouble(14,sjjmje);
	ps.setDouble(15,zjxzkl);
	ps.setDouble(16,cxhdzjxzkl);

	ps.setDouble(17,glfzkl);
	ps.setDouble(18,cxhdglfzkl);
	ps.setDouble(19,kglf);
	ps.setDouble(20,kqtk);

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

	double allzjxje=0;
	double alljzjje=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;

	ls_sql="select sum(zjje),sum(jzjje),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzjxsuijin=rs.getDouble(3);
		allzqguanlif=rs.getDouble(4);
		allzhguanlif=rs.getDouble(5);
		allkglf=rs.getDouble(6);
		allkqtk=rs.getDouble(7);
	}
	rs.close();
	ps.close();


	ls_sql="update crm_khxx set zjxsj=?,zjxwcbz=? ";
	ls_sql+=" ,zjxje=?,zhzjxje=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fssj);
	ps.setString(2,zjxwcbz);

	ps.setDouble(3,allzjxje);
	ps.setDouble(4,alljzjje);
	ps.setDouble(5,allzjxsuijin);
	ps.setDouble(6,allzqguanlif);
	ps.setDouble(7,allzhguanlif);
	ps.setDouble(8,allkglf);
	ps.setDouble(9,allkqtk);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzjxsuijin);
	ps.setDouble(4,allzqguanlif);
	ps.setDouble(5,allzhguanlif);
	ps.setDouble(6,allkglf);
	ps.setDouble(7,allkqtk);
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