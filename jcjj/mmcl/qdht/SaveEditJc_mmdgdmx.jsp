<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
int sl=0;
String ysbm=null;
String czbm=null;
String azwzbm=null;
String kqfxbm=null;
int dbh=0;
int qh=0;
int mdk=0;
int mdg=0;
String ctbs=null;
double tjx=0;
double dj=0;
String blxhbm=null;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
mlx=cf.GB2Uni(request.getParameter("mlx"));
mmxh=cf.GB2Uni(request.getParameter("mmxh"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
czbm=cf.GB2Uni(request.getParameter("czbm"));
azwzbm=cf.GB2Uni(request.getParameter("azwzbm"));
kqfxbm=cf.GB2Uni(request.getParameter("kqfxbm"));
ls=request.getParameter("dbh");
try{
	if (!(ls.equals("")))  dbh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dbh������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ذ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("qh");
try{
	if (!(ls.equals("")))  qh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qh������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǽ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("mdk");
try{
	if (!(ls.equals("")))  mdk=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mdk������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ŷ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("mdg");
try{
	if (!(ls.equals("")))  mdg=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mdg������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ŷ���]����ת����������:"+e);
	return;
}
ctbs=cf.GB2Uni(request.getParameter("ctbs"));
ls=request.getParameter("tjx");
try{
	if (!(ls.equals("")))  tjx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tjx������");
	return;
}
catch (Exception e){
	out.println("<BR>[�߽��߻�ƽ̨�Ͽ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String dczlbm=cf.GB2Uni(request.getParameter("dczlbm"));
String sfsmjcc=cf.GB2Uni(request.getParameter("sfsmjcc"));
String sfydc=cf.GB2Uni(request.getParameter("sfydc"));
String dsk=cf.GB2Uni(request.getParameter("dsk"));
String mtxbm=cf.GB2Uni(request.getParameter("mtxbm"));
String mxxbm=cf.GB2Uni(request.getParameter("mxxbm"));

String wherexh=request.getParameter("wherexh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	String dqbm=null;
	double mmzkl=10;
	//��ȡ����С������������������������������ʼ
	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql="select sq_dwxx.dqbm,jc_mmydd.mmzkl,NVL(sq_dwxx.jcddblxs,-100) jcddblxs,NVL(sq_dwxx.jcddmxblxs,-100) jcddmxblxs";
	ls_sql+=" from  jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		mmzkl=rs.getDouble("mmzkl");
		jcddblxs=rs.getInt("jcddblxs");
		jcddmxblxs=rs.getInt("jcddmxblxs");
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������

	String blxh=null;
	ls_sql="select blxh";
	ls_sql+=" from  jc_blbj";
	ls_sql+=" where blxhbm='"+blxhbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		blxh=rs.getString("blxh");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	
	ls_sql="update jc_mmdgdmx set mmdglxbm=?,mlx=?,mmxh=?,sl=?,zjhsl=?,ysbm=?,czbm=?,azwzbm=?,kqfxbm=?,dbh=?   ,qh=?,mdk=?,mdg=?,ctbs=?,tjx=?,bzdj=?,dj=ROUND(?,"+jcddmxblxs+"),blxhbm=?,bz=?,dczlbm=?,sfsmjcc=?,sfydc=?,dsk=?,mtxbm=?,mxxbm=?,blxh=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmdglxbm);
	ps.setString(2,mlx);
	ps.setString(3,mmxh);
	ps.setLong(4,sl);
	ps.setLong(5,sl);
	ps.setString(6,ysbm);
	ps.setString(7,czbm);
	ps.setString(8,azwzbm);
	ps.setString(9,kqfxbm);
	ps.setLong(10,dbh);

	ps.setLong(11,qh);
	ps.setLong(12,mdk);
	ps.setLong(13,mdg);
	ps.setString(14,ctbs);
	ps.setDouble(15,tjx);
	ps.setDouble(16,dj);
	ps.setDouble(17,dj*mmzkl/10);
	ps.setString(18,blxhbm);
	ps.setString(19,bz);
	ps.setString(20,dczlbm);
	ps.setString(21,sfsmjcc);
	ps.setString(22,sfydc);
	ps.setString(23,dsk);
	ps.setString(24,mtxbm);
	ps.setString(25,mxxbm);
	ps.setString(26,blxh);
	ps.executeUpdate();
	ps.close();

	double zqmmhtje=0;
	double mmhtje=0;
	ls_sql="select sum(bzdj*sl), sum(dj*sl)";
	ls_sql+=" from  jc_mmdgdmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqmmhtje=rs.getDouble(1);
		mmhtje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_mmydd set zqmmhtje=? ,mmhtje=ROUND(?,"+jcddblxs+")  ";
	ls_sql+="                  ,zqzjhmmje=?,zjhmmje=ROUND(?,"+jcddblxs+") ";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zqmmhtje);
	ps.setDouble(2,mmhtje);

	ps.setDouble(3,zqmmhtje);
	ps.setDouble(4,mmhtje);
	ps.executeUpdate();
	ps.close();

	double wdzje=0;
	double htje=0;
	ls_sql="select fwf+zqwjhtje+zqblhtje+zqmmhtje,fwf+wjhtje+blhtje+mmhtje";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzje=rs.getDouble(1);
		htje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_mmydd set  wdzje=?  ,htje=ROUND(?,"+jcddblxs+")";
	ls_sql+="                   ,zqzjhze=?,zjhze=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htje);

	ps.setDouble(3,wdzje);
	ps.setDouble(4,htje);
	ps.executeUpdate();
	ps.close();
	
	
	//���ɶ���
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where gjz='"+yddbh+"' and lx='1' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htje);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���ľ�Ž��=<%=mmhtje%>����ͬ�ܶ�=<%=htje%>");
	parent.window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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