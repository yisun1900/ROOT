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
String sfyyh=null;
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
String hdsgd=null;
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));

String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
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
sfyyh=cf.GB2Uni(request.getParameter("sfyyh"));
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
int fj=0;

ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
String sffj=cf.GB2Uni(request.getParameter("sffj"));
String sfyrz=cf.GB2Uni(request.getParameter("sfyrz"));

String yqbm=cf.GB2Uni(request.getParameter("yqbm"));
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

String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String gcjdbm=request.getParameter("gcjdbm");
String gdjsjd=request.getParameter("gdjsjd");
String kbxbz=request.getParameter("kbxbz");
String sjsjsbz=request.getParameter("sjsjsbz");
String ywyjsbz=request.getParameter("ywyjsbz");

java.sql.Date sybgcrq=null;
ls=request.getParameter("sybgcrq");
try{
	if (!(ls.equals("")))  sybgcrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sybgcrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�����ι���������]����ת����������:"+e);
	return;
}
java.sql.Date sjkgrq=null;
ls=request.getParameter("sjkgrq");
try{
	if (!(ls.equals("")))  sjkgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjkgrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʿ�������]����ת����������:"+e);
	return;
}
java.sql.Date sjjgrq=null;
ls=request.getParameter("sjjgrq");
try{
	if (!(ls.equals("")))  sjjgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjjgrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʿ�������]����ת����������:"+e);
	return;
}
java.sql.Date sjwjrq=null;
ls=request.getParameter("sjwjrq");
try{
	if (!(ls.equals("")))  sjwjrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjwjrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ���������]����ת����������:"+e);
	return;
}
java.sql.Date bxjzsj=null;
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

String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

double zkl=10;
String pdclzt=null;
if (sgd!=null)
{
	pdclzt="2";
}
else{
	pdclzt="1";
}


String khbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where fwdz='"+fwdz+"' and zt='2'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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


	String sjsgh="";
	ls_sql="select ygbh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsgh=cf.fillNull(rs.getString("ygbh"));
	}
	rs.close();
	ps.close();

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



	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  hth='"+hth+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>���󣡺�ͬ���ѱ�ʹ��");
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

	conn.setAutoCommit(false);

	//�ͻ����
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_zxkhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	khbh=cf.addZero(xh,7);

	//�ͻ����
	while (true)
	{
		khbh=cf.addZero(xh,7);

		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			xh++;
		}
		else{
			break;
		}
	}



	ls_sql="update crm_hthxx set sybz='Y',khbh=? ";
	ls_sql+=" where  hth='"+hth+"' and sybz='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_khxx ( khxm,xb,fwdz,lxfs,hxbm,fgflbm,zxjwbm,hxmjbm,ysbm,hth,sjs,qye,wdzgce,sfyyh,qyrq,kgrq,dwbh,lrsj,hdbz,khlxbm,lrr,bz,khbh    ,zt,tsbz,pdclzt,ybjbz,cqbm,yhyy,fwmj,gcjdbm   ,jgrq,sfxhf,kpbz,bxbz,hfdjbz    ,nlqjbm,zybm,fj,czbm,zkl,sffj,sfyrz,yqbm,jyjdrq    ,htshbz,gdjsjd   ,zjxm,sgd,sgbz,sybgcrq,sjkgrq,sjjgrq,sjwjrq,bxjzsj,dalqbz,kbxbz,sjsjsbz,ywyjsbz,fgsbh,zjxwcbz,wtkhbz,xmzy,sffk,sjsgh,khjsbz,zjjsbz,sjssjfjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,ZQSUIJIN,ZQZJXSUIJIN,FJTCBZ,SJHTSJF) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?   ,'2','N',?,'N',?,?,?,?   ,?,'N','Y','N','0'   ,?,?,?,?,?,?,?,?,?    ,'Y',?    ,?,?,?,?,?,?,?,?,'3',?,?,?,?,'1','N',?,'N',?,'Y','0','0','N',0,0,0,0,0,'M',0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,hxbm);
	ps.setString(6,fgflbm);
	ps.setString(7,zxjwbm);
	ps.setString(8,hxmjbm);
	ps.setString(9,ysbm);
	ps.setString(10,hth);
	ps.setString(11,sjs);
	ps.setDouble(12,qye);
	ps.setDouble(13,qye);
	ps.setString(14,sfyyh);
	ps.setDate(15,qyrq);
	ps.setDate(16,kgrq);
	ps.setString(17,dwbh);
	ps.setDate(18,lrsj);
	ps.setString(19,hdbz);
	ps.setString(20,khlxbm);
	ps.setString(21,lrr);
	ps.setString(22,bz);
	ps.setString(23,khbh);

	ps.setString(24,pdclzt);
	ps.setString(25,cqbm);
	ps.setString(26,yhyy);
	ps.setLong(27,fwmj);
	ps.setString(28,gcjdbm);

	ps.setDate(29,jgrq);

	ps.setString(30,nlqjbm);
	ps.setString(31,zybm);
	ps.setInt(32,fj);
	ps.setString(33,czbm);
	ps.setDouble(34,zkl);
	ps.setString(35,sffj);
	ps.setString(36,sfyrz);
	ps.setString(37,yqbm);
	ps.setDate(38,jyjdrq);

	ps.setString(39,gdjsjd);


	ps.setString(40,zjxm);
	ps.setString(41,sgd);
	ps.setString(42,sgbz);
	ps.setDate(43,sybgcrq);
	ps.setDate(44,sjkgrq);
	ps.setDate(45,sjjgrq);
	ps.setDate(46,sjwjrq);
	ps.setDate(47,bxjzsj);
	ps.setString(48,kbxbz);
	ps.setString(49,sjsjsbz);
	ps.setString(50,ywyjsbz);
	ps.setString(51,fgsbh);
	ps.setString(52,xmzy);
	ps.setString(53,sjsgh);
	
	
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ������ɿͻ����<<%=khbh%>>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" +ls_sql);
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