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
double gczxzk=0;

double zqguanlif=0;
double zhguanlif=0;
double glfjmje=0;
double zxglfzk=0;

double zqzjxsuijin=0;
double zjxsuijin=0;
double sjjmje=0;
double zxsjzk=0;

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
ls=request.getParameter("gczxzk");
try{
	if (!(ls.equals("")))  gczxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gczxzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������ۿ�]����ת����������:"+e);
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
ls=request.getParameter("zxglfzk");
try{
	if (!(ls.equals("")))  zxglfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zxglfzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������ۿ�]����ת����������:"+e);
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

ls=request.getParameter("zxsjzk");
try{
	if (!(ls.equals("")))  zxsjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zxsjzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[����˰���ۿ�]����ת����������:"+e);
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

double gcjxzk=0;
ls=request.getParameter("gcjxzk");
try{
	if (!(ls.equals("")))  gcjxzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gcjxzk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̼����ۿ�]����ת����������:"+e);
	return;
}
double jxglfzk=0;
ls=request.getParameter("jxglfzk");
try{
	if (!(ls.equals("")))  jxglfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jxglfzk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������ۿ�]����ת����������:"+e);
	return;
}
double jxsjzk=0;
ls=request.getParameter("jxsjzk");
try{
	if (!(ls.equals("")))  jxsjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jxsjzk]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����˰���ۿ�]����ת����������:"+e);
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String oldzjxwcbz=null;
	String oldzjxxh=null;
	double getzqgczjf=0;
	double getzjxje=0;
	double getzqguanlif=0;
	double getzqzjxguanlif=0;
	double getzqsuijin=0;
	double getzqzjxsuijin=0;

	ls_sql="select zjxwcbz,zjxxh,zqgczjf,zjxje,zqguanlif,zqzjxguanlif,zqsuijin,zqzjxsuijin";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldzjxwcbz=rs.getString("zjxwcbz");//��������ɱ�־
		oldzjxxh=cf.fillNull(rs.getString("zjxxh"));
		getzqgczjf=rs.getDouble("zqgczjf");
		getzjxje=rs.getDouble("zjxje");
		getzqguanlif=rs.getDouble("zqguanlif");
		getzqzjxguanlif=rs.getDouble("zqzjxguanlif");
		getzqsuijin=rs.getDouble("zqsuijin");
		getzqzjxsuijin=rs.getDouble("zqzjxsuijin");
	}
	rs.close();
	ps.close();
	if (oldzjxwcbz.equals("2"))//1��δ��ɣ�2�������
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

	double yqgcze=getzqgczjf+getzjxje;//����ǰ�����ܶ�
	double yglf=getzqguanlif+getzqzjxguanlif;//����ǰ������ܶ�
	double ysuijin=getzqsuijin+getzqzjxsuijin;//����ǰ˰���ܶ�

	conn.setAutoCommit(false);

	ls_sql="insert into crm_zjxdj (zjxxh,khbh,zjje,jzjje,zjxjme,zqzjxsuijin,zjxsuijin,sjjmje,zqguanlif,zhguanlif   ,glfjmje,gczxzk,zxglfzk,zxsjzk,kglf,kqtk,fssj,zjxfsjd,zjxyysm,yqgcze   ,yglf,ysuijin,lx,sfwc,shbz,lrr,lrsj,lrdw   ,gczxzq,gcjxzq,gczxzh,gcjxzh,gcjxzk,jxglfzk,jxsjzk,zjxrzf,zjxdjjje) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setDouble(3,zjje);
	ps.setDouble(4,jzjje);
	ps.setDouble(5,zjxjme);
	ps.setDouble(6,zqzjxsuijin);
	ps.setDouble(7,zjxsuijin);
	ps.setDouble(8,sjjmje);
	ps.setDouble(9,zqguanlif);
	ps.setDouble(10,zhguanlif);

	ps.setDouble(11,glfjmje);
	ps.setDouble(12,gczxzk);
	ps.setDouble(13,zxglfzk);
	ps.setDouble(14,zxsjzk);
	ps.setDouble(15,kglf);
	ps.setDouble(16,kqtk);
	ps.setDate(17,fssj);
	ps.setString(18,zjxfsjd);
	ps.setString(19,zjxyysm);
	ps.setDouble(20,yqgcze);

	ps.setDouble(21,yglf);
	ps.setDouble(22,ysuijin);
	ps.setString(23,"1");//1������ϸ
	ps.setString(24,"N");//N��δ��ɣ�Y�������
	ps.setString(25,"N");//N��δ��ˣ�Y�����
	ps.setString(26,lrr);
	ps.setDate(27,lrsj);
	ps.setString(28,lrdw);

	ps.setDouble(29,gczxzq);
	ps.setDouble(30,gcjxzq);
	ps.setDouble(31,gczxzh);
	ps.setDouble(32,gcjxzh);
	ps.setDouble(33,gcjxzk);
	ps.setDouble(34,jxglfzk);
	ps.setDouble(35,jxsjzk);
	ps.setDouble(36,zjxrzf);
	ps.setDouble(37,zjxdjjje);
	

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
	double allzqzjxsuijin=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;

	ls_sql="select sum(zjje),sum(jzjje),sum(zqzjxsuijin),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk)";
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
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set zjxxh=?,zjxsj=? ";
	ls_sql+=" ,zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setDate(2,fssj);

	ps.setDouble(3,allzjxje);
	ps.setDouble(4,alljzjje);
	ps.setDouble(5,allzqzjxsuijin);
	ps.setDouble(6,allzjxsuijin);
	ps.setDouble(7,allzqguanlif);
	ps.setDouble(8,allzhguanlif);
	ps.setDouble(9,allkglf);
	ps.setDouble(10,allkqtk);
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


	//��������ǰ��ĶԱ���ϸ
	if (oldzjxxh.equals(""))//Ŀǰ�������ȡԭ����
	{
		//����������ǰ������Ϣ��������������������������������������������ʼ
		ls_sql="insert into bj_bjxmmxq (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
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

		ls_sql="insert into bj_sfxmmxq (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz";
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

		//����������ǰ������Ϣ���������������������������������������������

		//����������󱨼���Ϣ��������������������������������������������ʼ
		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
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

		ls_sql="insert into bj_sfxmmxh (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz";
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

		//����������󱨼���Ϣ���������������������������������������������
	}
	else{//ȡ�������
		//����������ǰ������Ϣ��������������������������������������������ʼ
		ls_sql="insert into bj_bjxmmxq (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
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

		ls_sql="insert into bj_sfxmmxq (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz";
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

		//����������ǰ������Ϣ���������������������������������������������

		//����������󱨼���Ϣ��������������������������������������������ʼ
		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select                    ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,?,?";
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

		ls_sql="insert into bj_sfxmmxh (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz)";
		ls_sql+=" select          '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfssjf,sfkdz,zdzk,sfbfb,dj,cbjbfb,sgcbjbfb,gcjcbjbfb,jldw,sl,zqsfje,dxzkl,sfje,bz";
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

		//����������󱨼���Ϣ���������������������������������������������
	}

	dzbj.Zjx dzbj=new dzbj.Zjx();

	//ˮ��Ԥ���Զ�����
	dzbj.setSDysJx(conn,zjxxh,"yz");

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