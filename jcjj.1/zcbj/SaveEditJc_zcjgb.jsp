<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String zcmc=null;
String sfyh=null;
String zcdlbm=null;
String zcxlbm=null;
String xh=null;
String gg=null;
double lsj=0;
double yhj=0;
String dwbh=null;
String zp=null;
String bz=null;
String zclbbm=null;
String zcysbm=null;
String jldwbm=null;
String sfbhpj=null;
long pjts=0;
zcmc=cf.GB2Uni(request.getParameter("zcmc"));
sfyh=cf.GB2Uni(request.getParameter("sfyh"));
zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
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
ls=request.getParameter("yhj");
try{
	if (!(ls.equals("")))  yhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݼ�]����ת����������:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
zp=cf.GB2Uni(request.getParameter("zp"));
bz=cf.GB2Uni(request.getParameter("bz"));
zclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
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

String zcbm=cf.GB2Uni(request.getParameter("zcbm"));
String sftjcp=request.getParameter("sftjcp");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ppmc=null;
	String gys=null;
	ls_sql=" select ppmc,gys" ;
	ls_sql+=" from sq_gysxx " ;
	ls_sql+=" where gysmc='"+dwbh+"' and dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		ppmc = rs.getString("ppmc");			    
		gys = rs.getString("gys");			    
	}
	else{
		rs.close();
		ps.close();
		out.println("<BR>���󣬲����ڵ�[Ʒ�ƹ�Ӧ������]��"+dwbh);
		return;
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcjgb set zcdlbm=?,zcxlbm=?,dwbh=?,ppmc=?,gys=?,zclbbm=?,zcmc=?,xh=?,gg=?,zcysbm=?   ,jldwbm=?,lsj=?,yhj=?,cbj=?,jsbl=?,cxhdbl=?,sfycx=?,cxkssj=?,cxjzsj=?,cxj=?  ,cxcbj=?,lscxhdbl=?,sfbhpj=?,pjts=?,sfyh=?,cpjb=?,fgsx=?,cpsm=?,cd=?,dqbm=?  ,lrr=?,lrsj=SYSDATE,bz=?,sftjcp=? ";
	ls_sql+=" where  (zcbm='"+zcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcdlbm);
	ps.setString(2,zcxlbm);
	ps.setString(3,dwbh);
	ps.setString(4,ppmc);
	ps.setString(5,gys);
	ps.setString(6,zclbbm);
	ps.setString(7,zcmc);
	ps.setString(8,xh);
	ps.setString(9,gg);
	ps.setString(10,zcysbm);

	ps.setString(11,jldwbm);
	ps.setDouble(12,lsj);
	ps.setDouble(13,yhj);
	ps.setDouble(14,cbj);
	ps.setDouble(15,jsbl);
	ps.setDouble(16,cxhdbl);
	ps.setString(17,sfycx);
	ps.setDate(18,cxkssj);
	ps.setDate(19,cxjzsj);
	ps.setDouble(20,cxj);

	ps.setDouble(21,cxcbj);
	ps.setDouble(22,lscxhdbl);
	ps.setString(23,sfbhpj);
	ps.setLong(24,pjts);
	ps.setString(25,sfyh);
	ps.setString(26,cpjb);
	ps.setString(27,fgsx);
	ps.setString(28,cpsm);
	ps.setString(29,cd);
	ps.setString(30,dqbm);

	ps.setString(31,yhmc);
	ps.setString(32,bz);
	ps.setString(33,sftjcp);



	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>