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
	out.println("<BR>[������Ʒ����ʱ��]����ת����������:"+e);
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
	out.println("<BR>[������Ʒ��֤��]����ת����������:"+e);
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
	out.println("<BR>[������Ʒ����ȯ]����ת����������:"+e);
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


	String oldzjxxh="";
	ls_sql="select zjxxh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";//N��δ��ɣ�Y�������
	ls_sql+=" and lx in('3','4')";//1�����������2����������������ϸ��3���ײ��˲�����4���ײ͵�����Ʒ
	ls_sql+=" order by zjxxh desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldzjxxh=cf.fillNull(rs.getString("zjxxh"));
	}
	rs.close();
	ps.close();

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
	ps.setDouble(24,0);//ˮ��·������Ʒ����ǰ
	ps.setDouble(25,0);//ˮ��·������Ʒ���ۺ�
	ps.setDouble(26,kglf);
	ps.setDouble(27,zjxrzf);
	ps.setDouble(28,zjxdjjje);
	ps.setDouble(29,kqtk);
	ps.setDate(30,fssj);

	ps.setString(31,zjxfsjd);
	ps.setString(32,zjxyysm);
	ps.setString(33,"3");//1������ϸ��2������ϸ��3���ײ��˲�����4���ײ͵�����Ʒ
	ps.setString(34,"N");//N��δ��ɣ�Y�������
	ps.setString(35,"M");////N��δ��ˣ�Y�����ͨ����S�����δͨ����M���������
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



	//���µ�����Ʒ������Ϣ����������������������������������ʼ
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
	ls_sql+=" ,zqljzjx=?,zhljzjx=?,zqqtsfzjx=?,zhqtsfzjx=?,zqwjrzjx=?,zhwjrzjx=?,zqsjfzjx=?,zhsjfzjx=?";
	ls_sql+=" ,zjxxh=?,zjxsj=?	";
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
	ps.setDate(18,fssj);
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


	
	
	
	//���µ�����Ʒ������Ϣ�����������������������������������


	ls_sql="delete from bj_bjxmmxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglxmbq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglxmbq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_fjxxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_sfxmmxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khgcxmxjq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzcxmxjq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzcxmq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


//////////

	ls_sql="delete from bj_bjxmmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglxmbh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglxmbh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_fjxxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_sfxmmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglfxbh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	ls_sql="delete from bj_khgcxmxjh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzcxmxjh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzcxmh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_zjxzcbgqd ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_tckhqyeq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_tckhqyeh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zjxtckhqye ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_khzctcmcq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzctcmxq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzctcmch ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzctcmxh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_khwntcmcq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khwntcmxq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khwntcmch ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khwntcmxh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcmcq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcfjslq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcmxq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcmch ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcfjslh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khcltcmxh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	
	
	ls_sql="delete from bj_khppsjcjbq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khppsjcjbh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��������ǰ��ĶԱ���ϸ
	if (oldzjxxh.equals(""))//Ŀǰ�޵�����Ʒ��ȡԭ����
	{
		//���������Ʒǰ������Ϣ��������������������������������������������ʼ
/*
		ls_sql="insert into bj_bjxmmxq (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,NVL(sgcbj,0),cldj,rgdj,jxdj,NVL(zcf,0),NVL(shf,0),NVL(ysf,0),NVL(qtf,0),NVL(sfyxdz,'1'),NVL(zdzk,0),zqdj,zk,dj,NVL(sgdbj,0),gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglxmbq (zjxxh,khbh,xmbh,glxmbh)";
		ls_sql+=" select '"+zjxxh+"',khbh,xmbh,glxmbh";
		ls_sql+=" from bj_khglxmb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxq (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxq (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh";
		ls_sql+=" from bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxq (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,NVL(zdzk,0),sfbfb,dj,NVL(cbjbfb,100),NVL(sgcbjbfb,100),NVL(gcjcbjbfb,100),NVL(JLDW,'JLDW'),sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx)";
		ls_sql+=" select           '"+zjxxh+"',khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx";
		ls_sql+=" from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//���������Ʒǰ������Ϣ���������������������������������������������

		//���������Ʒ�󱨼���Ϣ��������������������������������������������ʼ
/*
		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,NVL(sgcbj,0),cldj,rgdj,jxdj,NVL(zcf,0),NVL(shf,0),NVL(ysf,0),NVL(qtf,0),NVL(sfyxdz,'1'),NVL(zdzk,0),zqdj,zk,dj,NVL(sgdbj,0),gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglxmbh (zjxxh,khbh,xmbh,glxmbh)";
		ls_sql+=" select '"+zjxxh+"',khbh,xmbh,glxmbh";
		ls_sql+=" from bj_khglxmb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxh (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxh (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh";
		ls_sql+=" from bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxh (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,NVL(zdzk,0),sfbfb,dj,NVL(cbjbfb,100),NVL(sgcbjbfb,100),NVL(gcjcbjbfb,100),NVL(JLDW,'JLDW'),sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx)";
		ls_sql+=" select           '"+zjxxh+"',khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx";
		ls_sql+=" from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khgcxmxjq (zjxxh,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
		ls_sql+=" from bj_khgcxmxj ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/

		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khzcxmxjq (zjxxh,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje,khbjjbbm,bjjbbm,sjsfsl,sjcj,sjsfje,sjsfycx)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,NVL(JLDW,'JLDW'),sfxzsl,bzsl,NVL(sfkjm,'2'),jmfl,jmjldw,NVL(yxjmzdsl,0),NVL(JMDJ,0),NVL(SFKGH,'2'),NVL(KHZDSL,0),NVL(GHZJ,0),sfyqxtpp,sjsl,sjjshsl,NVL(SJJMSL,0),NVL(SJJMJE,0),khbjjbbm,bjjbbm,NVL(sjsfsl,0),NVL(sjcj,0),NVL(sjsfje,0),sjsfycx";
		ls_sql+=" from bj_khzcxmxj ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������嵥
		ls_sql="insert into bj_khzcxmq (zjxxh,sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw            ,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,ywdhslbz) ";
		ls_sql+=" select          '"+zjxxh+"',sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,NVL(JLDW,'JLDW'),xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,'Y'";
		ls_sql+=" from bj_khzcxm ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khgcxmxjh (zjxxh,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
		ls_sql+=" from bj_khgcxmxj ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khzcxmxjh (zjxxh,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje,khbjjbbm,bjjbbm,sjsfsl,sjcj,sjsfje,sjsfycx)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,NVL(JLDW,'JLDW'),sfxzsl,bzsl,NVL(sfkjm,'2'),jmfl,jmjldw,NVL(yxjmzdsl,0),NVL(JMDJ,0),NVL(SFKGH,'2'),NVL(KHZDSL,0),NVL(GHZJ,0),sfyqxtpp,sjsl,sjjshsl,NVL(SJJMSL,0),NVL(SJJMJE,0),khbjjbbm,bjjbbm,NVL(sjsfsl,0),NVL(sjcj,0),NVL(sjsfje,0),sjsfycx";
		ls_sql+=" from bj_khzcxmxj ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������嵥
		ls_sql="insert into bj_khzcxmh (zjxxh,sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw            ,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,lx ,ywdhslbz) ";
		ls_sql+=" select          '"+zjxxh+"',sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,NVL(JLDW,'JLDW'),xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,'1','Y'";//1��ԭ��Ŀ��2�����3������
		ls_sql+=" from bj_khzcxm ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ײͿͻ�ǩԼ��
		ls_sql="insert into crm_tckhqyeq (zjxxh,khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,0      ,0        ,tcwzjzc,0     ,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje";
		ls_sql+=" from crm_tckhqye ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//�������ײͿͻ�ǩԼ��
		ls_sql="insert into crm_tckhqyeh (zjxxh,khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,0      ,0        ,tcwzjzc,0     ,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje";
		ls_sql+=" from crm_tckhqye ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		//����ǰ�ͻ������ײ�����
		ls_sql="insert into bj_khzctcmcq (zjxxh,khbh,tcbm,tcmc,yj,tcj,bz,lx)";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,tcmc,yj,tcj,bz,lx";
		ls_sql+=" from bj_khzctcmc ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ�����
		ls_sql="insert into bj_khzctcmch (zjxxh,khbh,tcbm,tcmc,yj,tcj,bz,lx,zjlx)";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,tcmc,yj,tcj,bz,lx,'1'";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ls_sql+=" from bj_khzctcmc ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײ���ϸ
		ls_sql="insert into bj_khzctcmxq (zjxxh,khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,'Y'";
		ls_sql+=" from bj_khzctcmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ���ϸ
		ls_sql="insert into bj_khzctcmxh (zjxxh,khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,'Y'";
		ls_sql+=" from bj_khzctcmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ���ů�ײ�����
		ls_sql="insert into bj_khwntcmcq (zjxxh,khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,sjmj) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,sjmj";
		ls_sql+=" from bj_khwntcmc ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ���ů�ײ�����
		ls_sql="insert into bj_khwntcmch (zjxxh,khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,zjlx ,sjmj) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,'1',sjmj";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ls_sql+=" from bj_khwntcmc ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		//����ǰ�ͻ���ů�ײ���ϸ
		ls_sql="insert into bj_khwntcmxq (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,'Y'";
		ls_sql+=" from bj_khwntcmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ���ů�ײ���ϸ
		ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,'Y'";
		ls_sql+=" from bj_khwntcmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײ�
		ls_sql="insert into bj_khcltcmcq (zjxxh,khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx";
		ls_sql+=" from bj_khcltcmc ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ�
		ls_sql="insert into bj_khcltcmch (zjxxh,khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx,zjlx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx,'1'";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ls_sql+=" from bj_khcltcmc ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײͷ�������
		ls_sql="insert into bj_khcltcfjslq (zjxxh,khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl)";
		ls_sql+=" select              '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl";
		ls_sql+=" from bj_khcltcfjsl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײͷ�������
		ls_sql="insert into bj_khcltcfjslh (zjxxh,khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl)";
		ls_sql+=" select              '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl";
		ls_sql+=" from bj_khcltcfjsl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײ���ϸ
		ls_sql="insert into bj_khcltcmxq (zjxxh,khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,'Y'";
		ls_sql+=" from bj_khcltcmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ���ϸ
		ls_sql="insert into bj_khcltcmxh (zjxxh,khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,'Y'";
		ls_sql+=" from bj_khcltcmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		

		//����ǰ�ͻ�Ʒ��������۱�
		ls_sql="insert into bj_khppsjcjbq (zjxxh,khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm)";
		ls_sql+=" select             '"+zjxxh+"',khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm";
		ls_sql+=" from bj_khppsjcjb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ�Ʒ��������۱�
		ls_sql="insert into bj_khppsjcjbh (zjxxh,khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm)";
		ls_sql+=" select             '"+zjxxh+"',khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm";
		ls_sql+=" from bj_khppsjcjb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//���������Ʒ�󱨼���Ϣ���������������������������������������������
	}
	else{//ȡ������Ʒ����
		//���������Ʒǰ������Ϣ��������������������������������������������ʼ
/*
		ls_sql="insert into bj_bjxmmxq (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,NVL(sgcbj,0),cldj,rgdj,jxdj,NVL(zcf,0),NVL(shf,0),NVL(ysf,0),NVL(qtf,0),NVL(sfyxdz,'1'),NVL(zdzk,0),zqdj,zk,dj,NVL(sgdbj,0),gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglxmbq (zjxxh,khbh,xmbh,glxmbh)";
		ls_sql+=" select '"+zjxxh+"',khbh,xmbh,glxmbh";
		ls_sql+=" from bj_khglxmbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxq (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxq (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh";
		ls_sql+=" from bj_gclmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxq (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,NVL(zdzk,0),sfbfb,dj,NVL(cbjbfb,100),NVL(sgcbjbfb,100),NVL(gcjcbjbfb,100),NVL(JLDW,'JLDW'),sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz";
		ls_sql+=" from bj_sfxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx)";
		ls_sql+=" select           '"+zjxxh+"',khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx";
		ls_sql+=" from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���������Ʒǰ������Ϣ���������������������������������������������

		//���������Ʒ�󱨼���Ϣ��������������������������������������������ʼ
		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,NVL(sgcbj,0),cldj,rgdj,jxdj,NVL(zcf,0),NVL(shf,0),NVL(ysf,0),NVL(qtf,0),NVL(sfyxdz,'1'),NVL(zdzk,0),zqdj,zk,dj,NVL(sgdbj,0),gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglxmbh (zjxxh,khbh,xmbh,glxmbh)";
		ls_sql+=" select '"+zjxxh+"',khbh,xmbh,glxmbh";
		ls_sql+=" from bj_khglxmbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxh (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxh (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh";
		ls_sql+=" from bj_gclmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxh (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,NVL(zdzk,0),sfbfb,dj,NVL(cbjbfb,100),NVL(sgcbjbfb,100),NVL(gcjcbjbfb,100),NVL(JLDW,'JLDW'),sl,zqsfje,dxzkl,sfje,bz,sffqsk,cbjjsfs,sfjrhtjz";
		ls_sql+=" from bj_sfxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx)";
		ls_sql+=" select           '"+zjxxh+"',khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx";
		ls_sql+=" from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khgcxmxjq (zjxxh,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
		ls_sql+=" from bj_khgcxmxjh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khzcxmxjq (zjxxh,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje,khbjjbbm,bjjbbm,sjsfsl,sjcj,sjsfje,sjsfycx)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,NVL(JLDW,'JLDW'),sfxzsl,bzsl,NVL(sfkjm,'2'),jmfl,jmjldw,NVL(yxjmzdsl,0),NVL(JMDJ,0),NVL(SFKGH,'2'),NVL(KHZDSL,0),NVL(GHZJ,0),sfyqxtpp,sjsl,sjjshsl,NVL(SJJMSL,0),NVL(SJJMJE,0),khbjjbbm,bjjbbm,NVL(sjsfsl,0),NVL(sjcj,0),NVL(sjsfje,0),sjsfycx";
		ls_sql+=" from bj_khzcxmxjh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������嵥
		ls_sql="insert into bj_khzcxmq (zjxxh,sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw            ,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,ywdhslbz) ";
		ls_sql+=" select          '"+zjxxh+"',sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,NVL(JLDW,'JLDW'),xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,ywdhslbz";
		ls_sql+=" from bj_khzcxmh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khgcxmxjh (zjxxh,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
		ls_sql+=" from bj_khgcxmxjh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//����ǰ�ͻ�������ĿС��
		ls_sql="insert into bj_khzcxmxjh (zjxxh,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje,khbjjbbm,bjjbbm,sjsfsl,sjcj,sjsfje,sjsfycx)";
		ls_sql+=" select           '"+zjxxh+"' ,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,NVL(JLDW,'JLDW'),sfxzsl,bzsl,NVL(sfkjm,'2'),jmfl,jmjldw,NVL(yxjmzdsl,0),NVL(JMDJ,0),NVL(SFKGH,'2'),NVL(KHZDSL,0),NVL(GHZJ,0),sfyqxtpp,sjsl,sjjshsl,NVL(SJJMSL,0),NVL(SJJMJE,0),khbjjbbm,bjjbbm,NVL(sjsfsl,0),NVL(sjcj,0),NVL(sjsfje,0),sjsfycx";
		ls_sql+=" from bj_khzcxmxjh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������嵥
		ls_sql="insert into bj_khzcxmh (zjxxh,sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw            ,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,lx ,ywdhslbz) ";
		ls_sql+=" select          '"+zjxxh+"',sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,NVL(JLDW,'JLDW'),xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,sfkgdj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,zclx,ddcljjfs,sl,xdsl,ptcpsm,bjjbbm,fjddbh,'1',ywdhslbz";//1��ԭ��Ŀ��2�����3������
		ls_sql+=" from bj_khzcxmh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//����ǰ�ײͿͻ�ǩԼ��
		ls_sql="insert into crm_tckhqyeq (zjxxh,khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,0      ,0        ,tcwzjzc,0     ,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje";
		ls_sql+=" from crm_tckhqyeh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//�������ײͿͻ�ǩԼ��
		ls_sql="insert into crm_tckhqyeh (zjxxh,khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,0      ,0        ,tcwzjzc,0     ,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje";
		ls_sql+=" from crm_tckhqyeh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//����ǰ�ͻ������ײ�����
		ls_sql="insert into bj_khzctcmcq (zjxxh,khbh,tcbm,tcmc,yj,tcj,bz,lx)";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,tcmc,yj,tcj,bz,lx";
		ls_sql+=" from bj_khzctcmch ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ls_sql+=" and zjlx!='3' ";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ�����
		ls_sql="insert into bj_khzctcmch (zjxxh,khbh,tcbm,tcmc,yj,tcj,bz,lx,zjlx)";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,tcmc,yj,tcj,bz,lx,'1'";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ls_sql+=" from bj_khzctcmch ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ls_sql+=" and zjlx!='3' ";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײ���ϸ
		ls_sql="insert into bj_khzctcmxq (zjxxh,khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,sfbpx";
		ls_sql+=" from bj_khzctcmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ���ϸ
		ls_sql="insert into bj_khzctcmxh (zjxxh,khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcbm,cpmc,cpsl,cpbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,bz,lx,sfbpx";
		ls_sql+=" from bj_khzctcmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ���ů�ײ�����
		ls_sql="insert into bj_khwntcmcq (zjxxh,khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,sjmj) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,sjmj";
		ls_sql+=" from bj_khwntcmch ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ls_sql+=" and zjlx!='3' ";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ���ů�ײ�����
		ls_sql="insert into bj_khwntcmch (zjxxh,khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,zjlx ,sjmj) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,'1',sjmj";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ls_sql+=" from bj_khwntcmch ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ls_sql+=" and zjlx!='3' ";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		//����ǰ�ͻ���ů�ײ���ϸ
		ls_sql="insert into bj_khwntcmxq (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx";
		ls_sql+=" from bj_khwntcmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ���ů�ײ���ϸ
		ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx";
		ls_sql+=" from bj_khwntcmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײ�
		ls_sql="insert into bj_khcltcmcq (zjxxh,khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx";
		ls_sql+=" from bj_khcltcmch ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ls_sql+=" and zjlx!='3' ";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ�
		ls_sql="insert into bj_khcltcmch (zjxxh,khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx,zjlx) ";
		ls_sql+=" select            '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,tcjg,zcsfxxz,lx,'1'";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ls_sql+=" from bj_khcltcmch ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ls_sql+=" and zjlx!='3' ";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײͷ�������
		ls_sql="insert into bj_khcltcfjslq (zjxxh,khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl)";
		ls_sql+=" select              '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl";
		ls_sql+=" from bj_khcltcfjslh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײͷ�������
		ls_sql="insert into bj_khcltcfjslh (zjxxh,khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl)";
		ls_sql+=" select              '"+zjxxh+"',khbh,dqbm,hxbm,tcmc,jgwzbm,bzsl,sl";
		ls_sql+=" from bj_khcltcfjslh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//����ǰ�ͻ������ײ���ϸ
		ls_sql="insert into bj_khcltcmxq (zjxxh,khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx";
		ls_sql+=" from bj_khcltcmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ������ײ���ϸ
		ls_sql="insert into bj_khcltcmxh (zjxxh,khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx)  ";
		ls_sql+=" select            '"+zjxxh+"',khbh,tcmc,cpmc,cpbm,dqbm,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj,lx,bz,sfbpx";
		ls_sql+=" from bj_khcltcmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		
		//����ǰ�ͻ�Ʒ��������۱�
		ls_sql="insert into bj_khppsjcjbq (zjxxh,khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm)";
		ls_sql+=" select             '"+zjxxh+"',khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//������ͻ�Ʒ��������۱�
		ls_sql="insert into bj_khppsjcjbh (zjxxh,khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm)";
		ls_sql+=" select             '"+zjxxh+"',khbh,jgwzbm,tccplbbm,ppmc,jldw,sjsfsl,sjcj,sjsfje,tcsjflbm,khbjjbbm,bjjbbm";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���������Ʒ�󱨼���Ϣ���������������������������������������������
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