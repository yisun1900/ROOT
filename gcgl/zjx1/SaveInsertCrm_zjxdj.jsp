<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String[] zjxyybm=null;
String zjxyysm=null;
java.sql.Date lrsj=null;
java.sql.Date fssj=null;
String lrdw=request.getParameter("lrdw");
String zjxxh=request.getParameter("zjxxh");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String zjxfsjd=request.getParameter("zjxfsjd");
khbh=cf.GB2Uni(request.getParameter("khbh"));
zjxyybm=request.getParameterValues("zjxyybm");
zjxyysm=cf.GB2Uni(request.getParameter("zjxyysm"));

double zjje=0;
double jzjje=0;
double zjxjme=0;

double zqguanlif=0;
double zhguanlif=0;
double glfjmje=0;

double zqzjxsuijin=0;
double zjxsuijin=0;
double sjjmje=0;

double kglf=0;
double kqtk=0;
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ϼ�-��ǰ]����ת����������:"+e);
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
	out.println("<BR>[�����ϼ�-�ۺ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxjme");
try{
	if (!(ls.equals("")))  zjxjme=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjxjme������");
	return;
}
catch (Exception e){
	out.println("<BR>[�̷Ѽ����]����ת����������:"+e);
	return;
}


ls=request.getParameter("zqguanlif");
try{
	if (!(ls.equals("")))  zqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqguanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����-��ǰ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zhguanlif");
try{
	if (!(ls.equals("")))  zhguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zhguanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����-�ۺ�]����ת����������:"+e);
	return;
}
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

ls=request.getParameter("zqzjxsuijin");
try{
	if (!(ls.equals("")))  zqzjxsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqzjxsuijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰��-��ǰ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjxsuijin");
try{
	if (!(ls.equals("")))  zjxsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjxsuijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰��-�ۺ�]����ת����������:"+e);
	return;
}

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


ls=request.getParameter("kglf");
try{
	if (!(ls.equals("")))  kglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kglf������");
	return;
}
catch (Exception e){
	out.println("<BR>[����۹����]����ת����������:"+e);
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

double gczxzq=0;
ls=request.getParameter("gczxzq");
try{
	if (!(ls.equals("")))  gczxzq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gczxzq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������ǰ]����ת����������:"+e);
	return;
}
double gcjxzq=0;
ls=request.getParameter("gcjxzq");
try{
	if (!(ls.equals("")))  gcjxzq=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcjxzq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̼����ǰ]����ת����������:"+e);
	return;
}
double gczxzh=0;
ls=request.getParameter("gczxzh");
try{
	if (!(ls.equals("")))  gczxzh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gczxzh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ۺ�]����ת����������:"+e);
	return;
}
double gcjxzh=0;
ls=request.getParameter("gcjxzh");
try{
	if (!(ls.equals("")))  gcjxzh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcjxzh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̼���ۺ�]����ת����������:"+e);
	return;
}


double zjxrzf=0;
ls=request.getParameter("zjxrzf");
try{
	if (!(ls.equals("")))  zjxrzf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjxrzf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������֤��]����ת����������:"+e);
	return;
}
double zjxdjjje=0;
ls=request.getParameter("zjxdjjje");
try{
	if (!(ls.equals("")))  zjxdjjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zjxdjjje]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������ȯ]����ת����������:"+e);
	return;
}

double zqzjze=0;
ls=request.getParameter("zqzjze");
try{
	if (!(ls.equals("")))  zqzjze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqzjze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܶ��ǰ]����ת����������:"+e);
	return;
}
double zhzjze=0;
ls=request.getParameter("zhzjze");
try{
	if (!(ls.equals("")))  zhzjze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhzjze]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܶ�ۺ�]����ת����������:"+e);
	return;
}


double zqqtsf=0;
ls=request.getParameter("zqqtsf");
try{
	if (!(ls.equals("")))  zqqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqqtsf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�������ѣ���ǰ]����ת����������:"+e);
	return;
}
double zhqtsf=0;
ls=request.getParameter("zhqtsf");
try{
	if (!(ls.equals("")))  zhqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhqtsf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�������ѣ��ۺ�]����ת����������:"+e);
	return;
}

double zqwjrqyexm=0;
ls=request.getParameter("zqwjrqyexm");
try{
	if (!(ls.equals("")))  zqwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqwjrqyexm]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�������ѣ���ǰ]����ת����������:"+e);
	return;
}
double zhwjrqyexm=0;
ls=request.getParameter("zhwjrqyexm");
try{
	if (!(ls.equals("")))  zhwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhwjrqyexm]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ҵ�������ѣ��ۺ�]����ת����������:"+e);
	return;
}

double zqsjf=0;
ls=request.getParameter("zqsjf");
try{
	if (!(ls.equals("")))  zqsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zqsjf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒѣ���ǰ]����ת����������:"+e);
	return;
}
double zhsjf=0;
ls=request.getParameter("zhsjf");
try{
	if (!(ls.equals("")))  zhsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zhsjf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒѣ��ۺ�]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="insert into crm_zjxdj (zjxxh,khbh,zqzjze,zhzjze,zjje,jzjje,gczxzq,gczxzh,gcjxzq,gcjxzh ";
	ls_sql+=" ,zjxjme,zqguanlif,zhguanlif,glfjmje,zqzjxsuijin,zjxsuijin,sjjmje,zqqtsf,zhqtsf,zqwjrqyexm";
	ls_sql+=" ,zhwjrqyexm,zqsjf,zhsjf,zqsdlzjx,zhsdlzjx,kglf,zjxrzf,zjxdjjje,kqtk,fssj ";
	ls_sql+=" ,zjxfsjd,zjxyysm,lx,sfwc,shbz,lrr,lrsj,lrdw)  ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setDouble(3,zqzjze);
	ps.setDouble(4,zhzjze);
	ps.setDouble(5,zjje);
	ps.setDouble(6,jzjje);
	ps.setDouble(7,gczxzq);
	ps.setDouble(8,gczxzh);
	ps.setDouble(9,gcjxzq);
	ps.setDouble(10,gcjxzh);

	ps.setDouble(11,zjxjme);
	ps.setDouble(12,zqguanlif);
	ps.setDouble(13,zhguanlif);
	ps.setDouble(14,glfjmje);
	ps.setDouble(15,zqzjxsuijin);
	ps.setDouble(16,zjxsuijin);
	ps.setDouble(17,sjjmje);
	ps.setDouble(18,zqqtsf);
	ps.setDouble(19,zhqtsf);
	ps.setDouble(20,zqwjrqyexm);

	ps.setDouble(21,zhwjrqyexm);
	ps.setDouble(22,zqsjf);
	ps.setDouble(23,zhsjf);
	ps.setDouble(24,0);//ˮ��·�������ǰ
	ps.setDouble(25,0);//ˮ��·������ۺ�
	ps.setDouble(26,kglf);
	ps.setDouble(27,zjxrzf);
	ps.setDouble(28,zjxdjjje);
	ps.setDouble(29,kqtk);
	ps.setDate(30,fssj);

	ps.setString(31,zjxfsjd);
	ps.setString(32,zjxyysm);
	ps.setString(33,"2");//1������ϸ��2������ϸ��3���ײ�����
	ps.setString(34,"Y");//N��δ��ɣ�Y�������
	ps.setString(35,"M");//N��δ��ˣ�Y�����ͨ����S�����δͨ����M���������
	ps.setString(36,lrr);
	ps.setDate(37,lrsj);
	ps.setString(38,lrdw);
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


	//���������������Ϣ����������������������������������ʼ
	double allzjxje=0;
	double alljzjje=0;
	double allzqzjxsuijin=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;
	double allzjxrzf=0;
	double allzjxdjjje=0;

	double zqljzjx=0;
	double zhljzjx=0;
	double zqqtsfzjx=0;
	double zhqtsfzjx=0;
	double zqwjrzjx=0;
	double zhwjrzjx=0;
	double zqsjfzjx=0;
	double zhsjfzjx=0;
	
	ls_sql="select sum(zjje),sum(jzjje),sum(zqzjxsuijin),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk),sum(zjxrzf)";
	ls_sql+=" ,sum(zqzjze),sum(zhzjze),sum(zqqtsf),sum(zhqtsf),sum(zqwjrqyexm),sum(zhwjrqyexm),sum(zqsjf),sum(zhsjf),sum(zjxdjjje)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfwc='Y'";//N��δ��ɣ�Y�������
	ls_sql+=" and (shbz='Y' OR shbz='M') ";//N��δ��ˣ�Y�����ͨ����S�����δͨ����M��������� 
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzqzjxsuijin=rs.getDouble(3);
		allzjxsuijin=rs.getDouble(4);
		allzqguanlif=rs.getDouble(5);
		allzhguanlif=rs.getDouble(6);
		allkglf=rs.getDouble(7);
		allkqtk=rs.getDouble(8);
		allzjxrzf=rs.getDouble(9);

		zqljzjx=rs.getDouble(10);
		zhljzjx=rs.getDouble(11);
		zqqtsfzjx=rs.getDouble(12);
		zhqtsfzjx=rs.getDouble(13);
		zqwjrzjx=rs.getDouble(14);
		zhwjrzjx=rs.getDouble(15);
	
		zqsjfzjx=rs.getDouble(16);
		zhsjfzjx=rs.getDouble(17);
		allzjxdjjje=rs.getDouble(18);
	
	}
	rs.close();
	ps.close();


	ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" ,zqljzjx=?,zhljzjx=?,zqqtsfzjx=?,zhqtsfzjx=?,zqwjrzjx=?,zhwjrzjx=?,zqsjfzjx=?,zhsjfzjx=?,zjxxh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzqzjxsuijin);
	ps.setDouble(4,allzjxsuijin);
	ps.setDouble(5,allzqguanlif);
	ps.setDouble(6,allzhguanlif);
	ps.setDouble(7,allkglf);
	ps.setDouble(8,allkqtk);

	ps.setDouble(9,zqljzjx);
	ps.setDouble(10,zhljzjx);
	ps.setDouble(11,zqqtsfzjx);
	ps.setDouble(12,zhqtsfzjx);
	ps.setDouble(13,zqwjrzjx);
	ps.setDouble(14,zhwjrzjx);
	ps.setDouble(15,zqsjfzjx);
	ps.setDouble(16,zhsjfzjx);
	ps.setString(17,zjxxh);

	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxrzf);
	ps.setDouble(2,allzjxdjjje);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzqzjxsuijin);
	ps.setDouble(4,allzjxsuijin);
	ps.setDouble(5,allzqguanlif);
	ps.setDouble(6,allzhguanlif);
	ps.setDouble(7,allkglf);
	ps.setDouble(8,allkqtk);
	ps.executeUpdate();
	ps.close();

	//���������������Ϣ�����������������������������������


 
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
	out.print("<BR>SQL=" + ls_sql);
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