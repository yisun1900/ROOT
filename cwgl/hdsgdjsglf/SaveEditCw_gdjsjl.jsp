<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgd=null;
String jzbz=null;
double wdzgce=0;
double qye=0;
double zkl=0;
double zhzjxje=0;
double khjskze=0;
double khsskze=0;
double sjcb=0;

String tdjs=null;
double tdjsje=0;

String bz=null;
double hbssk=0;

sgd=cf.GB2Uni(request.getParameter("sgd"));
jzbz=cf.GB2Uni(request.getParameter("jzbz"));
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wdzgce������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ���۹��̶�]����ת����������:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qye������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ǩԼ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۿ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zhzjxje");
try{
	if (!(ls.equals("")))  zhzjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zhzjxje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("khjskze");
try{
	if (!(ls.equals("")))  khjskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khjskze������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("khsskze");
try{
	if (!(ls.equals("")))  khsskze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khsskze������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʵ�տ��ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjcb");
try{
	if (!(ls.equals("")))  sjcb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjcb������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʳɱ�]����ת����������:"+e);
	return;
}

tdjs=cf.GB2Uni(request.getParameter("tdjs"));

bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("hbssk");
try{
	if (!(ls.equals("")))  hbssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hbssk������");
	return;
}
catch (Exception e){
	out.println("<BR>[������Ŀʵ�տ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("tdjsje");
try{
	if (!(ls.equals("")))  tdjsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tdjsje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������]����ת����������:"+e);
	return;
}

double gckk=0;
double sjsfy=0;
double sgdfy=0;
double zjfy=0;
double gsfy=0;
double qtfy=0;
ls=request.getParameter("gckk");
try{
	if (!(ls.equals("")))  gckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gckk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̿ۿ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjsfy");
try{
	if (!(ls.equals("")))  sjsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjsfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgdfy");
try{
	if (!(ls.equals("")))  sgdfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgdfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӳе�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjfy");
try{
	if (!(ls.equals("")))  zjfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ʼ�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("gsfy");
try{
	if (!(ls.equals("")))  gsfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gsfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾�е�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtfy");
try{
	if (!(ls.equals("")))  qtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������е�����]����ת����������:"+e);
	return;
}

String jsfs=cf.GB2Uni(request.getParameter("jsfs"));

double sjsfk=0;
ls=request.getParameter("sjsfk");
try{
	if (!(ls.equals("")))  sjsfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjsfk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʦ����]����ת����������:"+e);
	return;
}
double sgdfk=0;
ls=request.getParameter("sgdfk");
try{
	if (!(ls.equals("")))  sgdfk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgdfk������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӷ���]����ת����������:"+e);
	return;
}


String kbxbz=null;
String bybxsm=null;
java.sql.Date bxkssj=null;
java.sql.Date bxjzsj=null;

kbxbz=cf.GB2Uni(request.getParameter("kbxbz"));
bybxsm=cf.GB2Uni(request.getParameter("bybxsm"));
ls=request.getParameter("bxkssj");
try{
	if (!(ls.equals("")))  bxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bxkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���޿�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("bxjzsj");
try{
	if (!(ls.equals("")))  bxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bxjzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���޽�ֹʱ��]����ת����������:"+e);
	return;
}

String[] xzbxxm=request.getParameterValues("xzbxxm");
String[] bxxm=request.getParameterValues("bxxm");
String[] qksm=request.getParameterValues("qksm");



String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsjd=null;
	String spjl=null;
	String khbh=null;
	ls_sql="select jsjd,spjl,khbh";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjd=cf.fillNull(rs.getString("jsjd"));
		spjl=cf.fillNull(rs.getString("spjl"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (jsjd.equals("2"))//1�����㲿���㣻2������������3���������
	{
		if (!spjl.equals("4"))//3��ͨ����4��δͨ��
		{
			out.println("����������ͨ�����������޸�");
			return;
		}
	}
	else if (jsjd.equals("3"))//1�����㲿���㣻2������������3���������
	{
		out.println("���󣡲����ѽ��㣬�������޸�");
		return;
	}
	int count=0;
    ls_sql="select count(*)";
	ls_sql+=" from  bj_clckd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<=0)
	{
		//out.println("<BR>���󣡸ÿͻ�û�г��ⵥ��¼����������[�ڲ�����]��ʽ���㣡");
		//return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set khjsje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,khjskze);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update cw_gdjsjl set sgd=?,jzbz=?,wdzgce=?,qye=?,zkl=?,zjxje=?,khjskze=?,khsskze=?,sjcb=?,tdjs=?,bz=?,tdjsje=?,gckk=?,sjsfy=?,sgdfy=?,zjfy=?,gsfy=?,qtfy=?,jsfs=?,sjsfk=?,sgdfk=?,jsjd='1'";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,jzbz);
	ps.setDouble(3,wdzgce);
	ps.setDouble(4,qye);
	ps.setDouble(5,zkl);
	ps.setDouble(6,zhzjxje);
	ps.setDouble(7,khjskze);
	ps.setDouble(8,khsskze);
	ps.setDouble(9,sjcb);
	ps.setString(10,tdjs);
	ps.setString(11,bz);
	ps.setDouble(12,tdjsje);
	ps.setDouble(13,gckk);
	ps.setDouble(14,sjsfy);
	ps.setDouble(15,sgdfy);
	ps.setDouble(16,zjfy);
	ps.setDouble(17,gsfy);
	ps.setDouble(18,qtfy);
	ps.setString(19,jsfs);
	ps.setDouble(20,sjsfk);
	ps.setDouble(21,sgdfk);
	ps.executeUpdate();
	ps.close();

	//�޸ı�����Ϣ
	ls_sql="update crm_khxx set kbxbz=?,bybxsm=?,bxkssj=?,bxjzsj=?";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kbxbz);
	ps.setString(2,bybxsm);
	ps.setDate(3,bxkssj);
	ps.setDate(4,bxjzsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khbxxm";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_khbxxm(khbh,bxxm,sfbx,qksm)";
	ls_sql+=" select '"+khbh+"',bxxm,'N',''";
	ls_sql+=" from crm_bxxmbm";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (!kbxbz.equals("N"))
	{
		for (int i=0;i<xzbxxm.length ;i++ )
		{
			ls_sql="update crm_khbxxm set sfbx='Y'";
			ls_sql+="  where khbh='"+khbh+"' and bxxm='"+cf.GB2Uni(xzbxxm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	for (int i=0;i<bxxm.length ;i++ )
	{
		ls_sql="update crm_khbxxm set qksm='"+cf.GB2Uni(qksm[i])+"'";
		ls_sql+="  where khbh='"+khbh+"' and bxxm='"+cf.GB2Uni(bxxm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
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