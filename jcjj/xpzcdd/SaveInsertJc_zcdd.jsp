<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
String clgw=null;
String xmzy=null;
String ddshbz=null;
double hkze=0;
double htcxhdje=0;
java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
java.sql.Date htshsj=null;
String lrr=null;
java.sql.Date qhtsj=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
String zt=request.getParameter("zt");
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));
ls=request.getParameter("hkze");
try{
	if (!(ls.equals("")))  hkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hkze������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ܶ�]����ת����������:"+e);
	return;
}

ls=request.getParameter("htcxhdje");
try{
	if (!(ls.equals("")))  htcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htcxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhtzshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�֪ͨ�ͻ�ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɼ����ֹʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ͻ�ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qhtsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ��ͬʱ��]����ת����������:"+e);
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
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));

//String dgkh=cf.GB2Uni(request.getParameter("dgkh"));
String xshth=cf.GB2Uni(request.getParameter("xshth"));


double zczkl=0;
ls=request.getParameter("zczkl");
try{
	if (!(ls.equals("")))  zczkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zczkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
	return;
}
double jmje=0;
ls=request.getParameter("jmje");
try{
	if (!(ls.equals("")))  jmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}


double zqclf=0;
ls=request.getParameter("zqclf");
try{
	if (!(ls.equals("")))  zqclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
double qtf=0;
ls=request.getParameter("qtf");
try{
	if (!(ls.equals("")))  qtf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtf������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ���ϼӹ���]����ת����������:"+e);
	return;
}
double ycf=0;
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ycf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷�]����ת����������:"+e);
	return;
}
double zcpclf=0;
ls=request.getParameter("zcpclf");
try{
	if (!(ls.equals("")))  zcpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcpclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ʒ-���Ϸ�]����ת����������:"+e);
	return;
}
double tjpclf=0;
ls=request.getParameter("tjpclf");
try{
	if (!(ls.equals("")))  tjpclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tjpclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ؼ�Ʒ-���Ϸ�]����ת����������:"+e);
	return;
}

double djjzkje=0;
ls=request.getParameter("djjzkje");
try{
	if (!(ls.equals("")))  djjzkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djjzkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ĵ���ȯ]����ת����������:"+e);
	return;
}

double yfkzkje=0;
ls=request.getParameter("yfkzkje");
try{
	if (!(ls.equals("")))  yfkzkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yfkzkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ԥ��������ת����������:"+e);
	return;
}

double zzczkzkje=0;
ls=request.getParameter("zzczkzkje");
try{
	if (!(ls.equals("")))  zzczkzkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzczkzkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֵ��ֵ������ת����������:"+e);
	return;
}
String djqmc=cf.GB2Uni(request.getParameter("djqmc"));
double djqje=0;
ls=request.getParameter("djqje");
try{
	if (!(ls.equals("")))  djqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djqje������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʹ�ô���ȯ�������ת����������:"+e);
	return;
}

String dzyy=cf.GB2Uni(request.getParameter("dzyy"));
String xclbz="1";//1���Ƕ���ʽ��Ʒ��2������ʽ��Ʒ
String sjbh=cf.GB2Uni(request.getParameter("sjbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//���ͻ����㣫������������������������ʼ
	String getkhjsbz="";
	ls_sql=" select khjsbz ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (!getkhjsbz.equals("N") && !getkhjsbz.equals("") && !getkhjsbz.equals("3"))//N��δ���㣻Y���ѽ��㣻2������ͬ�⣻3��������ͬ��
	{
		out.println("<font color=\"#FF0000\">���󣡿ͻ��ѽ���</font>:"+getkhjsbz);
		return;
	}
	//���ͻ����㣽����������������������������

	String ppmc=null;
	String gys=null;
	String sfyyh=null;
	java.sql.Date yhkssj=null;
	java.sql.Date yhjzsj=null;
	String yhnr=null;
	double xpjsbl=0;
	double xpcxjsbl=0;
	double xptcjrbl=0;
	double xptccxjrbl=0;

	double azfjsbl=0;
	double ycfjsbl=0;
	ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc,sfyyh,yhkssj,yhjzsj,yhnr,jxc_ppgysdzb.xpjsbl,jxc_ppgysdzb.xpcxjsbl,jxc_ppgysdzb.xpkhfdbl,jxc_ppgysdzb.xpkhcxfdbl,jxc_ppgysdzb.xptcjrbl,jxc_ppgysdzb.xptccxjrbl ";
	ls_sql+=" ,jxc_ppgysdzb.azfjsbl,jxc_ppgysdzb.ycfjsbl ";
	ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
    ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
    ls_sql+=" and jxc_ppxx.pplb='1' ";
    ls_sql+=" and jxc_gysxx.cllx='1' ";
	ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
	ls_sql+=" and jxc_ppgysdzb.ssfgs='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		azfjsbl=rs.getDouble("azfjsbl");
		ycfjsbl=rs.getDouble("ycfjsbl");

		ppmc = rs.getString("scsmc");			    
		gys = rs.getString("gysmc");			    
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=rs.getDate("yhkssj");
		yhjzsj=rs.getDate("yhjzsj");
		yhnr=cf.fillNull(rs.getString("yhnr"));
		xpjsbl=rs.getDouble("xpjsbl");
		xpcxjsbl=rs.getDouble("xpcxjsbl");
		xptcjrbl=rs.getDouble("xptcjrbl");
		xptccxjrbl=rs.getDouble("xptccxjrbl");
	}
	rs.close();
	ps.close();

	if (xpjsbl==0)
	{
		out.println("<BR>����������δ��ʼ������Ʒ�������");
		return;
	}

	if (xpcxjsbl==0)
	{
		out.println("<BR>����������δ��ʼ���ؼ�Ʒ�������");
		return;
	}

	double xpkhfdbl=0;
	double xpkhcxfdbl=0;
	ls_sql="select jxc_khfdbl.xpkhfdbl,jxc_khfdbl.xpkhcxfdbl ";
	ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
	ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
	ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
	ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xpkhfdbl=rs.getDouble("xpkhfdbl");
		xpkhcxfdbl=rs.getDouble("xpkhcxfdbl");
	}
	rs.close();
	ps.close();

	
	if (gys==null)
	{
		out.println("<BR>����������[Ʒ��]��"+ppbm+"�޶�Ӧ�ģ���Ӧ��");
		return;
	}


	//������Ƿ��㹻��������������������������ʼ	
	//����Ԥ����
	double getzcyfk=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���� 
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62������Ԥ���� 
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcyfk+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���Ĵ���ȯ
	double getzcdjj=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55�����Ĵ���ȯ
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
	ls_sql+=" and zffs!='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcdjj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='55'";//55�����Ĵ���ȯ
	ls_sql+=" and zffs='31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getzcdjj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (getzcdjj<djjzkje)
	{
		out.println("<BR>���󣬡����Ĵ���ȯ�����㣡ת�"+djjzkje+"�����ý�"+getzcdjj);
		return;
	}

	if (getzcyfk<yfkzkje)
	{
		out.println("<BR>���󣬡�����Ԥ������㣡ת�"+yfkzkje+"�����ý�"+getzcyfk);
		return;
	}

	double djqcdbl=0;
	ls_sql="select djqcdbl";
	ls_sql+=" from  cw_djq";
	ls_sql+=" where fgsbh='"+fgsbh+"' ";
	ls_sql+=" and djqmc='"+djqmc+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djqcdbl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	String khxm=null;
	String fwdz=null;
	ls_sql="SELECT khxm,fwdz";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
	}
	rs.close();
	ps.close();

	//������Ƿ��㹻----------------------����	

	conn.setAutoCommit(false);

	if (zt.equals("4"))//2:��װ�ͻ�;4:�Ǽ�װ�ͻ�
	{
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String zxdm=null;
		ls_sql="SELECT zxdm";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdm=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (zxdm==null)
		{
			zxdm=dwbh;
		}


		if (count==0)
		{
			//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
			ls_sql="insert into crm_khxx ( khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,dwbh,fgsbh,khjl,xxlysm,sjs,sjsgh,lrsj,lrr,bz    ,zt,tsbz,pdclzt,ybjbz   ,sfxhf,kpbz,bxbz,hfdjbz,sjssjfjsbz,htshbz ,sffj,sfyrz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,gcjdbm,hdbz,xmzy,zjxwcbz,sffk,wtkhbz,khjsbz,sjhtsjf,wdzgce,qye,zjjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,zqsuijin,zqzjxsuijin,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,fjtcbz,zhhtzcbj,zqhtzcbj,suijin,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,zqqtsf,zhqtsf) ";
			ls_sql+=" select               khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,?   ,ssfgs,khjl,xxlysm,sjs,sjsgh,?   ,?  ,bz    ,'4','N','4'   ,'N'     ,'N'  ,'Y' ,'N' ,'0'   ,'0'       ,'Y'    ,'N' ,'N'  ,'1'   ,'0'   ,'0'    ,'0'    ,'0'   ,'1' ,?   ,'1'    ,'N' ,'N'   ,'N'   ,NVL(sjhtje,0) ,0     ,0  ,'0'   ,'N'   ,0       ,0      ,0     ,0       ,0          ,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,'M'   ,0       ,0,0,0,0,0,0,0,0";
			ls_sql+=" from  crm_zxkhxx";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setDate(2,lrsj);
			ps.setString(3,lrr);
			ps.setString(4,xmzy);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set sfjczjz='1'";//1���ǣ�2����
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}

	double tjpfdbl=xpcxjsbl;
	double tjpkhfdbl=xpkhcxfdbl;
	double tjptcjrbl=xptccxjrbl;
	

	double cbze=zcpclf*xpjsbl/100+tjpclf*tjpfdbl/100;
	double zhclf=zqclf;

	double wdzje=zqclf+qtf+ycf;
	hkze=wdzje;
	zczkl=10;

	//��ͬҵ��������
	double htyjjrje=0;
	htyjjrje=cf.round(zcpclf*xptcjrbl/100,2)+cf.round(tjpclf*tjptcjrbl/100,2);

	ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
	ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
	ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
	ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,jhshsj,jmje ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
	ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfck,ycksl,yckje,zsje,zjxzsje,sfkgsl,qtycf,sfjrht";
	ls_sql+=" ,xshth,zcpclf,fdbl,khfdbl,tcjrbl,tjpclf,tjpfdbl,tjpkhfdbl,tjptcjrbl,djqmc,djqje,djqcdbl,sjbh,azfjsbl,ycfjsbl,htyjjrje,zjxyjjrje,sskje )";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
	ls_sql+=" ,?,?,?,?   ,0,0,0,0   ,0,0,0,'N','09','C','1',0,0,0,0,'N',0,'N' ";//C��ѡ����������
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,khbh);
	ps.setString(3,clgw);
	ps.setString(4,ztjjgw);
	ps.setString(5,xmzy);
	ps.setString(6,jjsjs);
	ps.setString(7,khjl);
	ps.setString(8,ddshbz);
	ps.setDate(9,kjxsj);
	ps.setDate(10,htshsj);

	ps.setDate(11,qhtsj);
	ps.setDate(12,jhtzshsj);
	ps.setString(13,zcdlbm);
	ps.setString(14,zcxlbm);
	ps.setString(15,ppbm);
	ps.setString(16,gys);
	ps.setString(17,ppmc);
	ps.setDouble(18,zczkl);
	ps.setString(19,dzyy);
	ps.setString(20,xclbz);

	ps.setDouble(21,wdzje);
	ps.setDouble(22,hkze);
	ps.setDouble(23,cbze);
	ps.setDouble(24,htcxhdje);
	ps.setDouble(25,0);
	ps.setString(26,sfyyh);
	ps.setDate(27,yhkssj);
	ps.setDate(28,yhjzsj);
	ps.setString(29,yhnr);
	ps.setString(30,fgsbh);

	ps.setString(31,qddm);
	ps.setString(32,jzsjs);
	ps.setString(33,dwbh);
	ps.setString(34,lrr);
	ps.setString(35,bz);
	ps.setDate(36,htshsj);
	ps.setDouble(37,jmje);
	
	ps.setDouble(38,zqclf);
	ps.setDouble(39,zhclf);
	ps.setDouble(40,ycf);
	ps.setDouble(41,qtf);
	
	ps.setString(42,xshth);
	ps.setDouble(43,zcpclf);
	ps.setDouble(44,xpjsbl);
	ps.setDouble(45,xpkhfdbl);
	ps.setDouble(46,xptcjrbl);
	ps.setDouble(47,tjpclf);
	ps.setDouble(48,tjpfdbl);
	ps.setDouble(49,tjpkhfdbl);
	ps.setDouble(50,tjptcjrbl);
	ps.setString(51,djqmc);
	ps.setDouble(52,djqje);
	ps.setDouble(53,djqcdbl);
	ps.setString(54,sjbh);
	ps.setDouble(55,azfjsbl);
	ps.setDouble(56,ycfjsbl);
	ps.setDouble(57,htyjjrje);

	ps.executeUpdate();
	ps.close();


	//���븶���¼����������������������������������������������ʼ
	String fklxbm="23";//23:����
	String zkfklxbm="";
	double sfkje=0;

	if (djjzkje>0)//�������Ĵ���ȯ
	{
		zkfklxbm="55";//55�����Ĵ���ȯ

		sfkje=djjzkje;

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1�������տ2���ǲ�����տ�
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"ѡ����������¼��");
		ps.setString(13,"31");//31:ת��
		ps.setString(14,zkfklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1�������տ2���ǲ�����տ�
		ps.setString(27,"N");//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();

		
		//ת�����ʽ�����ɹ�����¼
		int glxh=0;//�������
		count=0;

		//��ȡ�������
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		//������������¼ 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//����glxh
		//����gljlbz
		//����gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=gysbh
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zkfklxbm);
		ps.setDouble(5,-1*sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"ѡ����������¼��");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,ppbm);
		ps.setString(23,ddbh);

		ps.setString(24,"");
		ps.setDate(25,null);
		ps.setInt(26,glxh);

		ps.setString(27,"2");//1�������տ2���ǲ�����տ�
		ps.setString(28,"N");//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps.setString(29,khxm);
		ps.setString(30,fwdz);
		ps.executeUpdate();
		ps.close();


		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}

	if (yfkzkje>0)//��������Ԥ�����ҪԤ����֧��
	{
		zkfklxbm="62";//62������Ԥ����

		if (hkze>yfkzkje)//����Ԥ�����
		{
			sfkje=yfkzkje;
			yfkzkje=0;//Ԥ����ʣ����
			hkze=hkze-yfkzkje;//����δ������
		}
		else{//����Ԥ������ʣ��
			sfkje=hkze;
			yfkzkje=yfkzkje-hkze;//Ԥ����ʣ����
			hkze=0;//����δ������
		}

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1�������տ2���ǲ�����տ�
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"ѡ����������¼��");
		ps.setString(13,"31");//31:ת��
		ps.setString(14,zkfklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1�������տ2���ǲ�����տ�
		ps.setString(27,"N");//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();

		
		//ת�����ʽ�����ɹ�����¼
		int glxh=0;//�������
		count=0;

		//��ȡ�������
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		//������������¼ 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//����glxh
		//����gljlbz
		//����gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=gysbh
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zkfklxbm);
		ps.setDouble(5,-1*sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"ѡ����������¼��");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,ppbm);
		ps.setString(23,ddbh);

		ps.setString(24,"");
		ps.setDate(25,null);
		ps.setInt(26,glxh);

		ps.setString(27,"2");//1�������տ2���ǲ�����տ�
		ps.setString(28,"N");//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps.setString(29,khxm);
		ps.setString(30,fwdz);
		ps.executeUpdate();
		ps.close();


		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}


	if (zzczkzkje>0)//��������Ԥ�����ҪԤ����֧��
	{
		zkfklxbm="67";//67����ֵ��ֵ��

		sfkje=zzczkzkje;

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1�������տ2���ǲ�����տ�
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"ѡ����������¼��");
		ps.setString(13,"31");//31:ת��
		ps.setString(14,zkfklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1�������տ2���ǲ�����տ�
		ps.setString(27,"N");//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();

		
		//ת�����ʽ�����ɹ�����¼
		int glxh=0;//�������
		count=0;

		//��ȡ�������
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps=conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		//������������¼ 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//����glxh
		//����gljlbz
		//����gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=gysbh
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zkfklxbm);
		ps.setDouble(5,-1*sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"ѡ����������¼��");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,dwbh);

		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,ppbm);
		ps.setString(23,ddbh);

		ps.setString(24,"");
		ps.setDate(25,null);
		ps.setInt(26,glxh);

		ps.setString(27,"2");//1�������տ2���ǲ�����տ�
		ps.setString(28,"N");//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps.setString(29,khxm);
		ps.setString(30,fwdz);
		ps.executeUpdate();
		ps.close();


		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}
	if (djqje>0)//����ֽ�ʲ���ȯ
	{
		String zffs="16";//16��ֽ�ʲ���ȯ

		sfkje=djqje;

		String fkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz ) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?                                  ,'1','0','0',?,?                  ,'N',?,?,?,?) ";//1�������տ2���ǲ�����տ�
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,sjbh);
		ps.setString(4,fklxbm);
		ps.setDouble(5,sfkje);
		ps.setString(6,"");
		ps.setString(7,lrr);
		ps.setDate(8,lrsj);
		ps.setString(9,dwbh);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,"ѡ����������¼��");
		ps.setString(13,zffs);
		ps.setString(14,"");
		ps.setString(15,dwbh);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,jzsjs);
		ps.setString(19,"");
		ps.setString(20,qddm);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,"");
		ps.setDate(25,null);

		ps.setString(26,"2");//1�������տ2���ǲ�����տ�
		ps.setString(27,"N");//N: δ��ˣ�Y: ���ͨ����M:���δͨ��
		ps.setString(28,khxm);
		ps.setString(29,fwdz);
		ps.executeUpdate();
		ps.close();
	}
	//���븶���¼������������������������������������������������


	//�ۼƸ��������������������������������ʼ
	double sskje=0;//ʵ�տ���
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and ddbh='"+ddbh+"'";
	ls_sql+=" and zjxbh is null";
	ls_sql+=" and fklxbm='23'";//23:����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sskje=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	String getddlx="";
	ls_sql="select ddlx";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getddlx=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (!getddlx.equals("E") && !getddlx.equals("5"))
	{
		if (sskje<0)
		{
//			conn.rollback();
//			out.println("���󣡸ö����ۼƸ����ܶ��Ϊ����:"+sskje);
//			return;
		}
	}


	double shsskje=0;//�������ʵ�տ���
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and ddbh='"+ddbh+"'";
	ls_sql+=" and zjxbh is null";
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ls_sql+=" and fklxbm='23'";//23:����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shsskje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,sskje);
	ps.setDouble(2,shsskje);
	ps.executeUpdate();
	ps.close();

	double gethkze=0;
	java.sql.Date yjjzsj=null;
	ls_sql="select hkze,yjjzsj";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gethkze=rs.getDouble(1);
		yjjzsj=rs.getDate(2);
	}
	rs.close();
	ps.close();


	if (yjjzsj==null)
	{
		if (shsskje>=gethkze)
		{
			yjjzsj=lrsj;

			ls_sql="update jc_zcdd set yjjzsj=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjjzsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{
		if (shsskje<gethkze)
		{
			yjjzsj=null;

			ls_sql="update jc_zcdd set yjjzsj=?";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjjzsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	//�ۼƸ����������������������������������

	//��飺��Ϊ����
	double allwdzje=0;
	double allhkze=0;
	double allzqclf=0;
	double allzhclf=0;
	double allzcpclf=0;
	double alltjpclf=0;
	double allycf=0;
	double allqtf=0;
	ls_sql="select sum(wdzje),sum(hkze),sum(zqclf),sum(zhclf),sum(ycf),sum(qtf),sum(zcpclf),sum(tjpclf)";
	ls_sql+=" from jc_zcdd ";
	ls_sql+=" where ppbm='"+ppbm+"'";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" and ddlx='C'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		allwdzje=rs.getDouble(1);
		allhkze=rs.getDouble(2);
		allzqclf=rs.getDouble(3);
		allzhclf=rs.getDouble(4);
		allycf=rs.getDouble(5);
		allqtf=rs.getDouble(6);
		allzcpclf=rs.getDouble(7);
		alltjpclf=rs.getDouble(8);

		if (allwdzje<0 )
		{
			conn.rollback();
			out.println("����Ʒ�ƶ����ܶ�Ϊ����:"+allwdzje);
			return;
		}
		if ( allhkze<0)
		{
			conn.rollback();
			out.println("����Ʒ�ƶ����ܶ�Ϊ����:"+allhkze);
			return;
		}
		if ( allzqclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[��ǰ���Ϸ�]Ϊ����:"+allzqclf);
			return;
		}
		if ( allzhclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[�ۺ���Ϸ�]Ϊ����:"+allzhclf);
			return;
		}
		if ( allycf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[Զ�̷�]Ϊ����:"+allycf);
			return;
		}
		if ( allqtf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[������]Ϊ����:"+allqtf);
			return;
		}
		if ( allzcpclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[����Ʒ���Ϸ�]Ϊ����:"+allzcpclf);
			return;
		}
		if ( alltjpclf<0)
		{
			conn.rollback();
			out.println("����Ʒ��[�ؼ�Ʒ���Ϸ�]Ϊ����:"+alltjpclf);
			return;
		}

	}
	rs.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>