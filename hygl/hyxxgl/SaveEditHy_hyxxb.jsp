<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hymm=null;
String hyxm=null;
String xb=null;
String yzbm=null;
String hydz=null;
String sfzhm=null;
String dh=null;
String sj=null;
String dzxx=null;
java.sql.Date csrq=null;
String zydm=null;
String ysrdm=null;
String hyzk=null;
java.sql.Date jhjnr=null;
String arxm=null;
java.sql.Date arsr=null;
String jgyxbm=null;
String fwyxbm=null;
String fgyxbm=null;
String gyyxbm=null;
String zdfgbm=null;
String psahbm=null;
String bzzz=null;
String sztlpp=null;
String shop=null;
String hzppp=null;
String fzpp=null;
String dwbh=null;
java.sql.Date rhrq=null;
java.sql.Date yxrq=null;
String hykh=null;
String hyjb=null;
String fwlx=null;
long gmcs=0;
double xfzje=0;
long jf=0;
long wdhjf=0;
String bz=null;
hymm=cf.GB2Uni(request.getParameter("hymm"));
hyxm=cf.GB2Uni(request.getParameter("hyxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
yzbm=cf.GB2Uni(request.getParameter("yzbm"));
hydz=cf.GB2Uni(request.getParameter("hydz"));
sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
dh=cf.GB2Uni(request.getParameter("dh"));
sj=cf.GB2Uni(request.getParameter("sj"));
dzxx=cf.GB2Uni(request.getParameter("dzxx"));
ls=request.getParameter("csrq");
try{
	if (!(ls.equals("")))  csrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����csrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
zydm=cf.GB2Uni(request.getParameter("zydm"));
ysrdm=cf.GB2Uni(request.getParameter("ysrdm"));
hyzk=cf.GB2Uni(request.getParameter("hyzk"));
ls=request.getParameter("jhjnr");
try{
	if (!(ls.equals("")))  jhjnr=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhjnr������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
arxm=cf.GB2Uni(request.getParameter("arxm"));
ls=request.getParameter("arsr");
try{
	if (!(ls.equals("")))  arsr=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����arsr������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
jgyxbm=cf.GB2Uni(request.getParameter("jgyxbm"));
fwyxbm=cf.GB2Uni(request.getParameter("fwyxbm"));
fgyxbm=cf.GB2Uni(request.getParameter("fgyxbm"));
gyyxbm=cf.GB2Uni(request.getParameter("gyyxbm"));
zdfgbm=cf.GB2Uni(request.getParameter("zdfgbm"));
psahbm=cf.GB2Uni(request.getParameter("psahbm"));
bzzz=cf.GB2Uni(request.getParameter("bzzz"));
sztlpp=cf.GB2Uni(request.getParameter("sztlpp"));
shop=cf.GB2Uni(request.getParameter("shop"));
hzppp=cf.GB2Uni(request.getParameter("hzppp"));
fzpp=cf.GB2Uni(request.getParameter("fzpp"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("rhrq");
try{
	if (!(ls.equals("")))  rhrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����rhrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("yxrq");
try{
	if (!(ls.equals("")))  yxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yxrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч����]����ת����������:"+e);
	return;
}
hykh=cf.GB2Uni(request.getParameter("hykh"));
hyjb=cf.GB2Uni(request.getParameter("hyjb"));
fwlx=cf.GB2Uni(request.getParameter("fwlx"));
ls=request.getParameter("gmcs");
try{
	if (!(ls.equals("")))  gmcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gmcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("xfzje");
try{
	if (!(ls.equals("")))  xfzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xfzje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jf");
try{
	if (!(ls.equals("")))  jf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jf������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("wdhjf");
try{
	if (!(ls.equals("")))  wdhjf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wdhjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ�һ�����]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherehybh=null;
wherehybh=cf.GB2Uni(request.getParameter("wherehybh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

String kdlb=null;
String sfyfk=null;
String skdw=null;
int count=0;
try {
	conn=cf.getConnection();

	//ȡ�ɵ�ˮ�ʷ�������
	String oldhykh=null;
	ls_sql = "select hykh from hy_hyxxb where hybh='"+wherehybh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		oldhykh=rs.getString(1).trim();
	}
	rs.close();
	ps.close();

	ls_sql = "select kdlb,sfyfk,dwbh from hy_khxxb where hykh='"+hykh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		kdlb=rs.getString("kdlb");
		sfyfk=rs.getString("sfyfk");
		skdw=rs.getString("dwbh");
	}
	else{
		out.println("���󣡲����ڵ�ˮ�ʷ�������");
		return;
	}
	rs.close();
	ps.close();

	if (sfyfk.equals("N"))
	{
		out.println("���󣡴˿���δ�ַ�");
		return;
	}
	if (!skdw.equals(dwbh))
	{
		out.println("�����տ���λ����ȷ");
		return;
	}
	if (!kdlb.equals(hyjb))
	{
		out.println("���󣡻�Ա������ȷ");
		return;
	}

	if (!oldhykh.equals(hykh))//�ı�ˮ�ʷ�������
	{
//		out.println("oldhykh="+oldhykh+";hykh="+hykh);
		ls_sql = "select count(*) from hy_hyxxb where hykh='"+hykh+"' and sfzf='N'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("����ˮ�ʷ������ѱ�ʹ��");
			return;
		}
	}


	conn.setAutoCommit(false);

	if (!oldhykh.equals(hykh))//�ı�ˮ�ʷ�������
	{
		//�޸��µ�
		ls_sql="update hy_khxxb set sfysy='Y',hybh=?,syrq=TRUNC(SYSDATE) where hykh='"+hykh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherehybh);
		ps.executeUpdate();
		ps.close();

		//�ɵĻ�ԭ
		ls_sql="update hy_khxxb set sfysy='N',hybh=null,syrq=null where hykh='"+oldhykh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	}

	ls_sql="update hy_hyxxb set bz=?,hymm=?,hyxm=?,xb=?,yzbm=?,hydz=?,sfzhm=?,dh=?,sj=?,dzxx=?,csrq=?,zydm=?,ysrdm=?,hyzk=?,jhjnr=?,arxm=?,arsr=?,jgyxbm=?,fwyxbm=?,fgyxbm=?,gyyxbm=?,zdfgbm=?,psahbm=?,bzzz=?,sztlpp=?,shop=?,hzppp=?,fzpp=?,dwbh=?,rhrq=?,yxrq=?,hykh=?,hyjb=?,fwlx=?,gmcs=?,xfzje=?,jf=?,wdhjf=? ";
	ls_sql+=" where  (hybh='"+wherehybh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bz);
	ps.setString(2,hymm);
	ps.setString(3,hyxm);
	ps.setString(4,xb);
	ps.setString(5,yzbm);
	ps.setString(6,hydz);
	ps.setString(7,sfzhm);
	ps.setString(8,dh);
	ps.setString(9,sj);
	ps.setString(10,dzxx);
	ps.setDate(11,csrq);
	ps.setString(12,zydm);
	ps.setString(13,ysrdm);
	ps.setString(14,hyzk);
	ps.setDate(15,jhjnr);
	ps.setString(16,arxm);
	ps.setDate(17,arsr);
	ps.setString(18,jgyxbm);
	ps.setString(19,fwyxbm);
	ps.setString(20,fgyxbm);
	ps.setString(21,gyyxbm);
	ps.setString(22,zdfgbm);
	ps.setString(23,psahbm);
	ps.setString(24,bzzz);
	ps.setString(25,sztlpp);
	ps.setString(26,shop);
	ps.setString(27,hzppp);
	ps.setString(28,fzpp);
	ps.setString(29,dwbh);
	ps.setDate(30,rhrq);
	ps.setDate(31,yxrq);
	ps.setString(32,hykh);
	ps.setString(33,hyjb);
	ps.setString(34,fwlx);
	ps.setLong(35,gmcs);
	ps.setDouble(36,xfzje);
	ps.setLong(37,jf);
	ps.setLong(38,wdhjf);
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