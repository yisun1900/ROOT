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
long qye=0;
String sfyyh=null;
long pmjj=0;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
long skje=0;
java.sql.Date skrq=null;
java.sql.Date zkrq=null;
java.sql.Date jgrq=null;
long zkje=0;
String fzxm=null;
String dwbh=null;
java.sql.Date sbrq=null;
String pdlx="1";//1�������ɵ���2��ָ���ɵ�
String hdbz=null;
String khlxbm=null;
String lrr=null;
String bz=null;

String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));
hdsgbz=cf.GB2Uni(request.getParameter("hdsgbz"));
hdsjs=cf.GB2Uni(request.getParameter("hdsjs"));

String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String yhyy=cf.GB2Uni(request.getParameter("yhyy"));
String ybjbh=cf.GB2Uni(request.getParameter("ybjbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
zxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
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
	if (!(ls.equals("")))  qye=Long.parseLong(ls.trim());
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
ls=request.getParameter("zkrq");
try{
	if (!(ls.equals("")))  zkrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zkrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ڿ�����]����ת����������:"+e);
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
ls=request.getParameter("skje");
try{
	if (!(ls.equals("")))  skje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����skje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�׿���]����ת����������:"+e);
	return;
}
ls=request.getParameter("skrq");
try{
	if (!(ls.equals("")))  skrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����skrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�׿�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zkje");
try{
	if (!(ls.equals("")))  zkje=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�п���]����ת����������:"+e);
	return;
}
fzxm=cf.GB2Uni(request.getParameter("fzxm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("sbrq");
try{
	if (!(ls.equals("")))  sbrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sbrq������");
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
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	if (count>0)
	{
		out.println("���󣡴˷��ݵ�ַ�Ѵ��ڣ������ظ�����");
		return;
	}

	//�ι��������
	if (!ybjbh.equals(""))
	{
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+ybjbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		ps.close();
		rs.close();

		if (count<1)
		{
			out.println("���󣡲����ڵĲι��������");
			return;
		}
	}

	//�ͻ����
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_khxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	String khbh=cf.addZero(xh,7);

	ls_sql="insert into crm_khxx ( khxm,xb,fwdz,lxfs,hxbm,fgflbm,zxjwbm,hxmjbm,ysbm,hth,sjs,qye,sfyyh,pmjj,qyrq,kgrq,skje,skrq,zkje,fzxm,dwbh,sbrq,pdlx,hdbz,khlxbm,lrr,bz,khbh,lrsj,zt,tsbz,tkbz,pdclzt,ybjbz,cqbm,yhyy,fwmj,gcjdbm,wgbz,zkrq,jgrq,ybjbh,cgdz,hdsgd,hdsgbz,hdsjs,hdsfss) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,'2','N','N','1','N',?,?,?,'1','N',?,?,?,?,?,?,?,'0' ) ";
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
	ps.setLong(12,qye);
	ps.setString(13,sfyyh);
	ps.setLong(14,pmjj);
	ps.setDate(15,qyrq);
	ps.setDate(16,kgrq);
	ps.setLong(17,skje);
	ps.setDate(18,skrq);
	ps.setLong(19,zkje);
	ps.setString(20,fzxm);
	ps.setString(21,dwbh);
	ps.setDate(22,sbrq);
	ps.setString(23,pdlx);
	ps.setString(24,hdbz);
	ps.setString(25,khlxbm);
	ps.setString(26,lrr);
	ps.setString(27,bz);
	ps.setString(28,khbh);
	ps.setString(29,cqbm);
	ps.setString(30,yhyy);
	ps.setLong(31,fwmj);
	ps.setDate(32,zkrq);
	ps.setDate(33,jgrq);
	ps.setString(34,ybjbh);
	ps.setString(35,cgdz);
	ps.setString(36,hdsgd);
	ps.setString(37,hdsgbz);
	ps.setString(38,hdsjs);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ������ɿͻ����<<%=khbh%>>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
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