<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String xzjg=cf.GB2Uni(request.getParameter("xzjg"));
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ������]����ת����������:"+e);
	return;
}

String zcpzwzbm=null;
String zcysbm=null;
double sl=0;
double je=0;
double ycf=0;

zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));


ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����je������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
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

String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
double qtfyje=0;
ls=request.getParameter("qtfyje");
try{
	if (!(ls.equals("")))  qtfyje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtfyje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ѽ��]����ת����������:"+e);
	return;
}

double cxhdbl=0;
double cxhdje=0;
double cbj=0;
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
ls=request.getParameter("cxhdje");
try{
	if (!(ls.equals("")))  cxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɱ���]����ת����������:"+e);
	return;
}

String bz=cf.GB2Uni(request.getParameter("bz"));

String ddbh=request.getParameter("ddbh");
String zcbm=request.getParameter("zcbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	String fgsbh=null;
	String qddm=null;
	String jzsjs=null;
	String ppbm=null;
	String gys=null;
	String ppmc=null;
	ls_sql =" select clzt,khbh,fgsbh,qddm,jzsjs,ppbm,gys,ppmc";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		qddm=rs.getString("qddm");
		jzsjs=rs.getString("jzsjs");
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("07"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ���ͬ�����");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"' and zcbm='"+zcbm+"'";
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
		out.println("<BR>���󣡸��������ѱ�ѡ��");
		return;
	}

	String getppbm=null;
	String getgys=null;
	String getppmc=null;
	ls_sql="select dwbh,gys,ppmc";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getppbm=cf.fillNull(rs.getString("dwbh"));
		getgys=cf.fillNull(rs.getString("gys"));
		getppmc=cf.fillNull(rs.getString("ppmc"));
	}
	else{
		out.println("���󣡸������Ĳ�����");
		return;
	}
	rs.close();
	ps.close();

	if (!getppbm.equals(ppbm) || !getgys.equals(gys) || !getppmc.equals(ppmc))
	{
		out.println("����[��Ʒ�ơ���Ӧ�̡�Ʒ��]�붩����һ��");
		return;
	}


	String cxhdbz=null;
	if (cxhdbl>0)
	{
		cxhdbz="Y";
	}
	else{
		cxhdbz="N";
	}

	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_zcddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();
	xh++;
	
    ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj,cbj,sl,je,ycf,qtfy,qtfyje,zjhsl,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj  ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz  ,bzjsbl,cxjsbl,jsbl)"; 
	ls_sql+="                select ?,?,?,?          ,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xh,gg       ,?     ,jldwbm,sfbhpj,pjts,lsj,yhj  ,cbj  ,cxhdbl  ,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,?,?,?,?,?,?,?,?,?,?,?,?                                       ,?,?,?,?,'1',?,SYSDATE                      ,?,?,?,?,?,?   ,jsbl,cxjsbl,0";//xzjg 1:�����޼ۣ�2:������
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,ddbh);
	ps.setString(3,khbh);
	ps.setString(4,zcbm);

	ps.setString(5,zcysbm);

	ps.setString(6,xzjg);
	ps.setDouble(7,dj);
	ps.setDouble(8,cbj);
	ps.setDouble(9,sl);
	ps.setDouble(10,je);
	ps.setDouble(11,ycf);
	ps.setString(12,qtfy);
	ps.setDouble(13,qtfyje);
	ps.setDouble(14,sl);
	ps.setDouble(15,je);
	ps.setDouble(16,ycf);
	ps.setDouble(17,qtfyje);

	ps.setString(18,zcpzwzbm);
	ps.setString(19,cxhdbz);
	ps.setDouble(20,cxhdbl);
	ps.setDouble(21,cxhdje);
	ps.setString(22,yhmc);

	ps.setString(23,"1");//1������д��2����д
	ps.setString(24,"");
	ps.setString(25,fgsbh);
	ps.setString(26,qddm);
	ps.setString(27,jzsjs);
	ps.setString(28,bz);
	ps.executeUpdate();
	ps.close();

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
	out.print("Exception: " + e);
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