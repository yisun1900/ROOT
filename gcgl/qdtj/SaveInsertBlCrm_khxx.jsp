<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String hxmjbm=null;
String ysbm=null;
String hth=null;
String sjs=null;
long fwmj=0;
double qye=0;
double wdzgce=0;
double suijinbfb=0;
double zqsuijin=0;
double suijin=0;
double sjf=0;
double glf=0;
double zqguanlif=0;
double guanlif=0;
double hbqye=0;
String sfyyh=null;
long pmjj=0;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
java.sql.Date jgrq=null;
String dwbh=null;
java.sql.Date lrsj=null;
String hdbz=null;
String khlxbm=null;
String lrr=null;
String bz=null;

String cgdz=null;
String hdr=null;
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdr=cf.GB2Uni(request.getParameter("hdr"));

String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String rddqbm=cf.GB2Uni(request.getParameter("rddqbm"));
String hxwzbm=cf.GB2Uni(request.getParameter("hxwzbm"));
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String ysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
String yhyy=cf.GB2Uni(request.getParameter("yhyy"));
String[] xxlybm=request.getParameterValues("xxlybm");
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
hth=cf.GB2Uni(request.getParameter("hth"));
sjs=cf.GB2Uni(request.getParameter("sjs"));
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fwmj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
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
	out.println("<BR>[ǩԼ��]����ת����������:"+e);
	return;
}
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
ls=request.getParameter("suijinbfb");
try{
	if (!(ls.equals("")))  suijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����suijinbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰��ٷֱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqsuijin");
try{
	if (!(ls.equals("")))  zqsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqsuijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ǰ��˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("suijin");
try{
	if (!(ls.equals("")))  suijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����suijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ�˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjf");
try{
	if (!(ls.equals("")))  sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("glf");
try{
	if (!(ls.equals("")))  glf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����glf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
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
	out.println("<BR>[��ǰ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("guanlif");
try{
	if (!(ls.equals("")))  guanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����guanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ󣭹����]����ת����������:"+e);
	return;
}
ls=request.getParameter("hbqye");
try{
	if (!(ls.equals("")))  hbqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hbqye������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ĿǩԼ��]����ת����������:"+e);
	return;
}
sfyyh=cf.GB2Uni(request.getParameter("sfyyh"));
ls=request.getParameter("pmjj");
try{
	if (!(ls.equals("")))  pmjj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pmjj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿƽ�׾���]����ת����������:"+e);
	return;
}
ls=request.getParameter("qyrq");
try{
	if (!(ls.equals("")))  qyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qyrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩԼ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("kgrq");
try{
	if (!(ls.equals("")))  kgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kgrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jgrq");
try{
	if (!(ls.equals("")))  jgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jgrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ��������]����ת����������:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ϱ�����]����ת����������:"+e);
	return;
}
hdbz=cf.GB2Uni(request.getParameter("hdbz"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
bz=cf.GB2Uni(request.getParameter("bz"));

String nlqjbm=request.getParameter("nlqjbm");
String zybm=request.getParameter("zybm");
String czbm=request.getParameter("czbm");
String fjfwbm=cf.GB2Uni(request.getParameter("fjfwbm"));

String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String sffj=cf.GB2Uni(request.getParameter("sffj"));
double fjje=0;
double gsfje=0;
ls=request.getParameter("fjje");
try{
	if (!(ls.equals("")))  fjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("gsfje");
try{
	if (!(ls.equals("")))  gsfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gsfje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˾�е������]����ת����������:"+e);
	return;
}
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));
String sfyrz=cf.GB2Uni(request.getParameter("sfyrz"));
String kgsjqd=cf.GB2Uni(request.getParameter("kgsjqd"));

java.sql.Date jyjdrq=null;
ls=request.getParameter("jyjdrq");
try{
	if (!(ls.equals("")))  jyjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jyjdrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[���齻������]����ת����������:"+e);
	return;
}

String ywy=cf.GB2Uni(request.getParameter("ywy"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String sfcjq=cf.GB2Uni(request.getParameter("sfcjq"));
String sffby=cf.GB2Uni(request.getParameter("sffby"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

String hykh=cf.GB2Uni(request.getParameter("hykh"));
String hyklxbm=cf.GB2Uni(request.getParameter("hyklxbm"));
String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
java.sql.Date yxsjs=null;
ls=request.getParameter("yxsjs");
try{
	if (!(ls.equals("")))  yxsjs=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yxsjs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ա��Чʱ��ʼ]����ת����������:"+e);
	return;
}
java.sql.Date yxsjz=null;
ls=request.getParameter("yxsjz");
try{
	if (!(ls.equals("")))  yxsjz=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yxsjz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ա��Чʱ��ֹ]����ת����������:"+e);
	return;
}


String louhao=cf.GB2Uni(request.getParameter("louhao"));
String sffk=cf.GB2Uni(request.getParameter("sffk"));
String djkh=cf.GB2Uni(request.getParameter("djkh"));
java.sql.Date fkrq=null;
ls=request.getParameter("fkrq");
try{
	if (!(ls.equals("")))  fkrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}

//�ۿ���
double zkl=0;
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


String hdsfss=null;
if (!hdbz.equals("1"))
{
	hdsfss="0";
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));

if (khxm.indexOf("����")>0 || khxm.indexOf("С��")>0 || khxm.indexOf("Ůʿ")>0 || khxm.indexOf("����")>0 || khxm.indexOf("����")>0)
{
	out.println("<BR>����[����]������ȫ�ƣ��磺����������С�㡢��Ůʿ�ȶ����淶");
	return;
}

if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[����]���м䲻��������ո�");
	return;
}
if (cf.isHanzi(fwdz)!=2 && cf.isHanzi(fwdz)!=4)//0:�Ǻ����޿ո�1:�Ǻ����пո�2��ȫ�����޿ո�3��ȫ�����пո�4�����������޿ո�5�����������пո�
{
	out.println("<BR>���󣬴���ʧ�ܣ���������ȷ��[���ݵ�ַ]���м䲻��������ո�");
	return;
}

String rzsc=cf.GB2Uni(request.getParameter("rzsc"));
String dzbjjc=cf.GB2Uni(request.getParameter("dzbjjc"));//���õ��ӱ��ۼ��
String qtdh=cf.GB2Uni(request.getParameter("qtdh"));
String email=cf.GB2Uni(request.getParameter("email"));

String sjsgh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="select zxjwbm";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	ls_sql="select hxmjbm";
	ls_sql+=" from  dm_hxmjbm";
	ls_sql+=" where  qd<"+fwmj+" and "+fwmj+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hxmjbm=rs.getString("hxmjbm");
	}
	rs.close();
	ps.close();



	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where fwdz='"+fwdz+"' and zt in('2','5')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>���󣡴˷��ݵ�ַ�Ѵ���");
		return;
	}

	//��ͬ�ż��
	int hthsfcz=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  hth='"+hth+"' and khbh!='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hthsfcz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (hthsfcz>0)
	{
		out.println("<BR>���󣡺�ͬ���ѱ������ͻ�ʹ��");
		return;
	}



	//��ĿרԱ
	String xmzy=null;
	ls_sql="select xmzy";
	ls_sql+=" from  sq_xmzy";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzy=rs.getString("xmzy");
	}
	rs.close();
	ps.close();

	//�ͻ�����
	String mqzt=null;
	String mqxmzy=null;
	ls_sql="select zt,xmzy";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mqzt=rs.getString("zt");//2����װ�ͻ���3���˵��ͻ���4���Ǽ�װ�ͻ���5����ƿͻ�
		mqxmzy=rs.getString("xmzy");
	}
	rs.close();
	ps.close();



	conn.setAutoCommit(false);

	if (mqzt!=null)
	{
		if (mqzt.equals("4"))//����ת��װ�ͻ�
		{
			ls_sql="delete from  crm_khxx ";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	ls_sql="update crm_zxkhxx set zxzt='3',khxm=?,xb=?,fwdz=?,lxfs=?,qtdh=?,email=?,cqbm=?,xqbm=?,louhao=?,hth=?,qdsj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,qtdh);
	ps.setString(6,email);
	ps.setString(7,cqbm);
	ps.setString(8,xqbm);
	ps.setString(9,louhao);
	ps.setString(10,hth);
	ps.setDate(11,qyrq);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_hthxx set sybz='Y',khbh=? ";
	ls_sql+=" where  hth='"+hth+"' and sybz='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xxlybm.length ;i++ )
	{
		ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
		ls_sql+=" values ( ?,?,'1')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,xxlybm[i]);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="insert into crm_khxx ( khbh,khxm,xb,fwdz,lxfs,hxbm,fgflbm,zxjwbm,hxmjbm,ysbm,hth,sjs,qye,sfyyh,pmjj";
	ls_sql+=" ,qyrq,kgrq,dwbh,hdbz,khlxbm,lrr,lrsj,bz,cqbm,yhyy,fwmj,jgrq,cgdz,hdr,hdsfss,ysrbm";
	ls_sql+=" ,nlqjbm,zybm,fjfwbm,czbm,zkl,xqbm,sffj,sfyrz,jyjdrq,qtdh,email,fjje,cxhdbm,bjjb,ywy";
	ls_sql+=" ,sjf,glf,wdzgce,gsfje,jzbz,sfcjq,sffby,sjsbh,fgsbh,sfzhm,hykh,hyklxbm,yxsjs,yxsjz,kgsjqd";
	ls_sql+=" ,hbqye,xmzy,rddqbm,hxwzbm,sffk,djkh,fkrq,louhao,zt,rzsc";
	ls_sql+=" ,sjsgh,suijinbfb,suijin,guanlif,cxhdbmxq,cxhdbmzh,zqsuijin,zqguanlif ";
	ls_sql+=" ,tsbz,pdclzt,ybjbz,gcjdbm,sfxhf   ,kpbz,bxbz,hfdjbz,gdjsjd,htshbz";
	ls_sql+=" ,kbxbz,dalqbz,kgzbz,clf,sge    ,sfke,tgbz,sjsjsbz,ywyjsbz,zjxje";
	ls_sql+=" ,zjxwcbz,wtkhbz,sfyfdx,zhzjxje,zjxsuijin   ,khjsbz ,zjjsbz,sjssjfjsbz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,SYSDATE,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,?,?,?,?,?,?,?,? ";
	ls_sql+=" ,'N','1','N','1','N'   ,'N','N','0','0','N' ";
	ls_sql+=" ,'0','1','N',0,0    ,0,'W','0','0',0 ";
	ls_sql+=" ,'1','N','1',0,0  ,'N','0','0') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,fwdz);
	ps.setString(5,lxfs);
	ps.setString(6,hxbm);
	ps.setString(7,fgflbm);
	ps.setString(8,zxjwbm);
	ps.setString(9,hxmjbm);
	ps.setString(10,ysbm);
	ps.setString(11,hth);
	ps.setString(12,sjs);
	ps.setDouble(13,qye);
	ps.setString(14,sfyyh);
	ps.setLong(15,pmjj);


	ps.setDate(16,qyrq);
	ps.setDate(17,kgrq);
	ps.setString(18,dwbh);
	ps.setString(19,hdbz);
	ps.setString(20,khlxbm);
	ps.setString(21,lrr);
	ps.setString(22,bz);
	ps.setString(23,cqbm);
	ps.setString(24,yhyy);
	ps.setLong(25,fwmj);
	ps.setDate(26,jgrq);
	ps.setString(27,cgdz);
	ps.setString(28,hdr);
	ps.setString(29,hdsfss);
	ps.setString(30,ysrbm);

	ps.setString(31,nlqjbm);
	ps.setString(32,zybm);
	ps.setString(33,fjfwbm);
	ps.setString(34,czbm);
	ps.setDouble(35,zkl);
	ps.setString(36,xqbm);
	ps.setString(37,sffj);
	ps.setString(38,sfyrz);
	ps.setDate(39,jyjdrq);
	ps.setString(40,qtdh);
	ps.setString(41,email);
	ps.setDouble(42,fjje);
	ps.setString(43,cxhdbm);
	ps.setString(44,bjjb);
	ps.setString(45,ywy);



	ps.setDouble(46,sjf);
	ps.setDouble(47,glf);
	ps.setDouble(48,wdzgce);
	ps.setDouble(49,gsfje);
	ps.setString(50,jzbz);
	ps.setString(51,sfcjq);
	ps.setString(52,sffby);
	ps.setString(53,sjsbh);
	ps.setString(54,fgsbh);
	ps.setString(55,sfzhm);
	ps.setString(56,hykh);
	ps.setString(57,hyklxbm);
	ps.setDate(58,yxsjs);
	ps.setDate(59,yxsjz);
	ps.setString(60,kgsjqd);


	ps.setDouble(61,hbqye);
	ps.setString(62,xmzy);
	ps.setString(63,rddqbm);
	ps.setString(64,hxwzbm);
	ps.setString(65,sffk);
	ps.setString(66,djkh);
	ps.setDate(67,fkrq);
	ps.setString(68,louhao);
	ps.setString(69,"2");//2����װ�ͻ���3���˵��ͻ���4���Ǽ�װ�ͻ���5����ƿͻ�
	ps.setString(70,rzsc);

	ps.setString(71,sjsgh);
	ps.setDouble(72,suijinbfb);
	ps.setDouble(73,suijin);
	ps.setDouble(74,guanlif);
	ps.setString(75,cxhdbmxq);
	ps.setString(76,cxhdbmzh);
	ps.setDouble(77,zqsuijin);
	ps.setDouble(78,zqguanlif);

	ps.executeUpdate();
	ps.close();



	//���ɣ��ͻ����Ϸ�����bj_khglfxb����������������������������ʼ
	String dqbm=null;
	String xmbh=null;
	String bjjbbm=null;
	String ckxm=null;
	String bjlx=null;

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select dqbm,xmbh,bjjb,ckxm,bjlx";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		dqbm=rs1.getString("dqbm");
		xmbh=rs1.getString("xmbh");
		bjjbbm=rs1.getString("bjjb");
		ckxm=rs1.getString("ckxm");
		bjlx=rs1.getString("bjlx");

		//�ͻ����Ϸ�����bj_khglfxb��
		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,glbxh,dqbm,xmbh,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
			ls_sql+=" select ?,glbxh,?,?,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjbbm='"+bjjbbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,dqbm);
			ps.setString(3,xmbh);
			ps.executeUpdate();
			ps.close();
		}

	}
	rs1.close();
	ps1.close();

	//���ɣ��ͻ����Ϸ�����bj_khglfxb��========================���


	//ɾ����ʱ���ۣ�������������������������ʼ

	//��ʱ����--��Ŀ��ϸ
	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--���Ϸ�����
	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--������Ϣ
	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--��������ϸ
	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--��������
	ls_sql="delete from bj_mbzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//��ʱ����--�����շ���Ŀ��ϸ
	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ɾ����ʱ����========================���

	//���¼��ɶ�����������������������������������������������������
	ls_sql="update jc_jcdd set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmydd set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmzjx set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_cgdd set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_cgzjx set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjdd set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_jjzjx set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_zcdd set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zcddmx set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zczjx set fgsbh=?,qddm=?,jzsjs=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.executeUpdate();
	ps.close();
	//���¼��ɶ�������������������������������������������������������������������

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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>