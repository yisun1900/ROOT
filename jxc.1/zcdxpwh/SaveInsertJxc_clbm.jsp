<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String ls=null;
String clmc=null;
String sfyh=null;
String cldlbm=null;
String clxlbm=null;
String xh=null;
String gg=null;
double lsj=0;
double xsj=0;
String ppmc=null;
String zp=null;
String bz=null;
String cllbbm=null;
String clysbm=null;
String jldwbm=null;
String sfbhpj=null;
long pjts=0;
clmc=cf.GB2Uni(request.getParameter("clmc"));
sfyh=cf.GB2Uni(request.getParameter("sfyh"));
cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ls=request.getParameter("lsj");
try{
	if (!(ls.equals("")))  lsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ۼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xsj");
try{
	if (!(ls.equals("")))  xsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݼ�]����ת����������:"+e);
	return;
}
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
zp=cf.GB2Uni(request.getParameter("zp"));
bz=cf.GB2Uni(request.getParameter("bz"));
cllbbm=cf.GB2Uni(request.getParameter("cllbbm"));
clysbm=cf.GB2Uni(request.getParameter("clysbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
sfbhpj=cf.GB2Uni(request.getParameter("sfbhpj"));
ls=request.getParameter("pjts");
try{
	if (!(ls.equals("")))  pjts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pjts������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}

double cbj=0;
double cxcbj=0;
double lscxhdbl=0;
String sfycx=null;
double cxj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjzsj=null;

ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxcbj");
try{
	if (!(ls.equals("")))  cxcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxcbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("lscxhdbl");
try{
	if (!(ls.equals("")))  lscxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lscxhdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ڼ�������]����ת����������:"+e);
	return;
}
sfycx=request.getParameter("sfycx");
ls=request.getParameter("cxj");
try{
	if (!(ls.equals("")))  cxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxjzsj");
try{
	if (!(ls.equals("")))  cxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxjzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ʱ��]����ת����������:"+e);
	return;
}
String dqbm=request.getParameter("dqbm");

double jsbl=0;
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jsbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
double cxhdbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
String cpjb=cf.GB2Uni(request.getParameter("cpjb"));
String fgsx=cf.GB2Uni(request.getParameter("fgsx"));
String cd=cf.GB2Uni(request.getParameter("cd"));
String cpsm=cf.GB2Uni(request.getParameter("cpsm"));
String sftjcp=request.getParameter("sftjcp");

double zdxsj=0;
ls=request.getParameter("zdxsj");
try{
	if (!(ls.equals("")))  zdxsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������޼�]����ת����������:"+e);
	return;
}
double yjjrbl=0;
ls=request.getParameter("yjjrbl");
try{
	if (!(ls.equals("")))  yjjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ҵ���������]����ת����������:"+e);
	return;
}
double cxyjjrbl=0;
ls=request.getParameter("cxyjjrbl");
try{
	if (!(ls.equals("")))  cxyjjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxyjjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ҵ���������]����ת����������:"+e);
	return;
}
String jsfs=request.getParameter("jsfs");
double cxjsbl=0;
ls=request.getParameter("cxjsbl");
try{
	if (!(ls.equals("")))  cxjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxjsbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String scsmc=null;
	ls_sql=" select scsmc" ;
	ls_sql+=" from jxc_ppxx " ;
	ls_sql+=" where ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		scsmc = rs.getString("scsmc");			    
	}
	else{
		rs.close();
		ps.close();
		out.println("<BR>���󣬲����ڵ�[��Ʒ��]��"+ppmc);
		return;
	}
	rs.close();
	ps.close();

	String gysmc=null;
	ls_sql=" select gysmc" ;
	ls_sql+=" from jxc_ppgysdzb " ;
	ls_sql+=" where ppmc='"+ppmc+"' and ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		gysmc = rs.getString("gysmc");			    
	}
	else{
		rs.close();
		ps.close();
		out.println("<BR>������Ʒ����[��Ʒ�ƶ��ձ�]�в�����");
		return;
	}
	rs.close();
	ps.close();


	//���ɲ��ϱ���
	String clbm=null;
	int count=0;
	ls_sql="select NVL(max(SUBSTR(clbm,4,11)),0)";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where cllb='0'";//0�����ģ�1������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	count++;

	clbm="ZC1"+cf.addZero(count,10);
	zp=clbm+".jpg";

	conn.setAutoCommit(false);

	ls_sql="insert into jxc_clbm (clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,cllbbm,xh,gg   ,clysbm,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,lrr   ,lrsj,lrbm,bz)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,SYSDATE,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clbm);
	ps.setString(2,clmc);
	ps.setString(3,"0");//0�����ģ�1������
	ps.setString(4,cldlbm);
	ps.setString(5,clxlbm);
	ps.setString(6,scsmc);
	ps.setString(7,ppmc);
	ps.setString(8,cllbbm);
	ps.setString(9,xh);
	ps.setString(10,gg);

	ps.setString(11,clysbm);
	ps.setString(12,jldwbm);
	ps.setString(13,sfbhpj);
	ps.setLong(14,pjts);
	ps.setString(15,cpjb);
	ps.setString(16,fgsx);
	ps.setString(17,cpsm);
	ps.setString(18,cd);
	ps.setString(19,zp);
	ps.setString(20,yhmc);

	ps.setString(21,lrbm);
	ps.setString(22,bz);
	ps.executeUpdate();
	ps.close();


	ls_sql=" insert into jxc_cljgb (clbm,dqbm,gysmc,sftjcp,sfyh,cbj,jsbl,jqpjcbj,lsj,xsj  ";
	ls_sql+=" ,dfgsjg,dgzjg,zxqdl,sfcy,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj ";
	ls_sql+=" ,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
	ls_sql+=" ,lrr,lrsj,lrbm,ssfgs,jsfs,zdxsj,yjjrbl,cxyjjrbl,zdkcsl,zdkcje) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,SYSDATE,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clbm);
	ps.setString(2,dqbm);
	ps.setString(3,gysmc);
	ps.setString(4,sftjcp);
	ps.setString(5,sfyh);
	ps.setDouble(6,cbj);
	ps.setDouble(7,jsbl);
	ps.setDouble(8,0);
	ps.setDouble(9,lsj);
	ps.setDouble(10,xsj);

	ps.setDouble(11,0);
	ps.setDouble(12,0);
	ps.setDouble(13,0);
	ps.setString(14,"N");
	ps.setDouble(15,cxhdbl);
	ps.setDouble(16,0);
	ps.setString(17,sfycx);
	ps.setDate(18,cxkssj);
	ps.setDate(19,cxjzsj);
	ps.setDouble(20,cxj);

	ps.setDouble(21,cxcbj);
	ps.setDouble(22,cxjsbl);
	ps.setDouble(23,lscxhdbl);
	ps.setDouble(24,0);
	ps.setString(25,"1");//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4����������
	ps.setDouble(26,0);
	ps.setDouble(27,0);
	ps.setDouble(28,0);
	ps.setDouble(29,0);
	ps.setDouble(30,0);

	ps.setString(31,yhmc);
	ps.setString(32,lrbm);
	ps.setString(33,ssfgs);
	ps.setString(34,jsfs);
	ps.setDouble(35,zdxsj);
	ps.setDouble(36,yjjrbl);
	ps.setDouble(37,cxyjjrbl);
	ps.setDouble(38,0);
	ps.setDouble(39,0);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ������ɲ��ϱ��[<%=clbm%>]");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>