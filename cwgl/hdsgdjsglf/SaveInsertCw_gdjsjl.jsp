<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
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
String jsr=null;
java.sql.Date jssj=null;
String jsdw=null;
String bz=null;
String gdjsjlh=null;
gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
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
	out.println("<BR>����zjxje������");
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

jsr=cf.GB2Uni(request.getParameter("jsr"));
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
jsdw=cf.GB2Uni(request.getParameter("jsdw"));
bz=cf.GB2Uni(request.getParameter("bz"));

double hbssk=0;
double tdjsje=0;
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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String gdjsjd=null;
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();

	if (gdjsjd.equals("1"))//0��δ���㣻1���ѽ���
	{
		out.println("�����ѽ���");
		return;
	}


	
	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set gdjsjd='1',gdjsjlh='"+gdjsjlh+"',khjsje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,khjskze);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_gdjsjl ( khbh,sgd,jzbz,wdzgce,qye,zkl,zjxje,khjskze,khsskze,sjcb   ,tdjs,jsr,jssj,jsdw,jsjd,fkbz,bz,gdjsjlh,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,gdjskze,dejsje,jsfs,sjsfk,sgdfk ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,0,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sgd);
	ps.setString(3,jzbz);
	ps.setDouble(4,wdzgce);
	ps.setDouble(5,qye);
	ps.setDouble(6,zkl);
	ps.setDouble(7,zhzjxje);
	ps.setDouble(8,khjskze);
	ps.setDouble(9,khsskze);
	ps.setDouble(10,sjcb);

	ps.setString(11,tdjs);
	ps.setString(12,jsr);
	ps.setDate(13,jssj);
	ps.setString(14,jsdw);
	ps.setString(15,"1");
	ps.setString(16,"1");
	ps.setString(17,bz);
	ps.setString(18,gdjsjlh);
	ps.setDouble(19,tdjsje);
	ps.setDouble(20,gckk);
	ps.setDouble(21,sjsfy);
	ps.setDouble(22,sgdfy);
	ps.setDouble(23,zjfy);
	ps.setDouble(24,gsfy);
	ps.setDouble(25,qtfy);
	ps.setString(26,jsfs);
	ps.setDouble(27,sjsfk);
	ps.setDouble(28,sgdfk);
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
	out.print("����ʧ��,��������: " + e);
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