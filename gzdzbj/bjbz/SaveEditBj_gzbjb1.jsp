<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dybjjb=(String)session.getAttribute("bjjb");
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

String ls=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double bj=0;
double bbj=0;
double cbj=0;
int xh=0;

String gycl=cf.GB2Uni(request.getParameter("gycl"));
String bgycl=cf.GB2Uni(request.getParameter("bgycl"));
String cgycl=cf.GB2Uni(request.getParameter("cgycl"));

String zcjldwbm=null;
zcjldwbm=cf.GB2Uni(request.getParameter("zcjldwbm"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));

//************************************************************************
double sgdbj=0;
ls=request.getParameter("sgdbj");


try{
	if (!(ls.equals("")))  sgdbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgdbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӱ���]����ת����������:"+e);
	return;
}
double cbenj=0;
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cbenj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɱ���]����ת����������:"+e);
	return;
}
//*************************************************************************
double clf=0;
double zcf=0;//A�����ķ�
double rgf=0;//A���˹���
double jjf=0;//A����е��
double glfbl=0;//A������Ѱٷֱ�
double lrbl=0;//A������ٷֱ�
String zcmc=null;//A����������
String zcgg=null;//A�����Ĺ��

double bclf=0;
double bzcf=0;//�����ķ�
double brgf=0;//���˹���
double bjjf=0;//����е��
double bglfbl=0;//������Ѱٷֱ�
double blrbl=0;//������ٷֱ�
String bzcmc=null;//����������
String bzcgg=null;//�����Ĺ��

double cclf=0;
double czcf=0;//�����ķ�
double crgf=0;//���˹���
double cjjf=0;//����е��
double cglfbl=0;//������Ѱٷֱ�
double clrbl=0;//������ٷֱ�
String czcmc=null;//����������
String czcgg=null;//�����Ĺ��





//************************************************************************************


if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
{
		zcmc=cf.GB2Uni(request.getParameter("zcmc"));
		zcgg=cf.GB2Uni(request.getParameter("zcgg"));
		ls=request.getParameter("bj");
		try{
			if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����bj������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[��ͨ����]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("zcf");
		try{
			if (!(ls.equals("")))  zcf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����zcf������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[zcf]����ת����������:"+e);
			return;
		}

		ls=request.getParameter("rgf");
		try{
			if (!(ls.equals("")))  rgf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����rgf������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[rgf]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("jjf");
		try{
			if (!(ls.equals("")))  jjf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����jjf������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[jjf]����ת����������:"+e);
			return;
		}

		ls=request.getParameter("glfbl");
		try{
			if (!(ls.equals("")))  glfbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����glfbl������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[glfbl]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("lrbl");
		try{
			if (!(ls.equals("")))  lrbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����glfbl������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[lrbl]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("clf");
		try{
			if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����clf������");
			return;
		}
		catch (Exception e){
			out.println("<BR>["+dzbjzjmc+"���Ϸ�]����ת����������:"+e);
			return;
		}
			gycl=cf.GB2Uni(request.getParameter("gycl"));
}

	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
		bzcmc=cf.GB2Uni(request.getParameter("bzcmc"));
		bzcgg=cf.GB2Uni(request.getParameter("bzcgg"));
		ls=request.getParameter("bbj");
		try{
			if (!(ls.equals("")))  bbj=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����bbj������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[��Ʒ����]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("bzcf");
		try{
			if (!(ls.equals("")))  bzcf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����bzcf������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[bzcf]����ת����������:"+e);
			return;
		}

		ls=request.getParameter("brgf");
		try{
			if (!(ls.equals("")))  brgf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����brgf������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[brgf]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("bjjf");
		try{
			if (!(ls.equals("")))  bjjf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����bjjf������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[bjjf]����ת����������:"+e);
			return;
		}

		ls=request.getParameter("bglfbl");
		try{
			if (!(ls.equals("")))  bglfbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����bglfbl������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[bglfbl]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("blrbl");
		try{
			if (!(ls.equals("")))  blrbl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����bglfbl������");
			return;
		}
		catch (Exception e){
			out.println("<BR>[blrbl]����ת����������:"+e);
			return;
		}
		ls=request.getParameter("bclf");
		try{
			if (!(ls.equals("")))  bclf=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����bclf������");
			return;
		}
		bgycl=cf.GB2Uni(request.getParameter("bgycl"));
	}

if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
{
	czcmc=cf.GB2Uni(request.getParameter("czcmc"));
	czcgg=cf.GB2Uni(request.getParameter("czcgg"));
	ls=request.getParameter("cbj");
	try{
		if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����cbj������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[�ֻ�÷������]����ת����������:"+e);
		return;
	}
	ls=request.getParameter("czcf");
	try{
		if (!(ls.equals("")))  czcf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����czcf������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[czcf]����ת����������:"+e);
		return;
	}

	ls=request.getParameter("crgf");
	try{
		if (!(ls.equals("")))  crgf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����crgf������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[crgf]����ת����������:"+e);
		return;
	}
	ls=request.getParameter("cjjf");
	try{
		if (!(ls.equals(""))) cjjf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����cjjf������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[cjjf]����ת����������:"+e);
		return;
	}

	ls=request.getParameter("cglfbl");
	try{
		if (!(ls.equals("")))  cglfbl=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����cglfbl������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[cglfbl]����ת����������:"+e);
		return;
	}
	ls=request.getParameter("clrbl");
	try{
		if (!(ls.equals("")))  clrbl=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����bglfbl������");
		return;
	}
	catch (Exception e){
		out.println("<BR>[clrbl]����ת����������:"+e);
		return;
	}
	ls=request.getParameter("cclf");
	try{
		if (!(ls.equals("")))  cclf=Double.parseDouble(ls.trim());
	}
	catch (java.lang.NullPointerException nulle){
		out.println("<BR>����cclf������");
		return;
	}
	catch (Exception e){
		out.println("<BR>["+dzbjgjmc+"���Ϸ�]����ת����������:"+e);
		return;
	}
	cgycl=cf.GB2Uni(request.getParameter("cgycl"));
}

ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xh������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
String oldxmbh=request.getParameter("oldxmbh");
String wybh=request.getParameter("wybh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (!oldxmbh.equals(xmbh))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_gzbjb";
		ls_sql+=" where xmbh='"+xmbh+"'  and dqbm='"+dqbm+"'";
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
			out.println("������Ŀ����Ѵ���");
			return;
		}
	}


	ls_sql="update bj_gzbjb set dqbm=?,xmbh=?,xmmc=?,xmdlbm=?,xmxlbm=?,smbm=?,jldwbm=?,bj=?,bbj=?,cbj=?,gycl=?,bgycl=?,cgycl=?,xh=?,cbenj=?,sgdbj=?,clf=?,bclf=?,cclf=?,lrr='"+yhdlm+"',lrsj=trunc(SYSDATE),zcmc=?,zcgg=?,zcf=?,rgf=?,jjf=?,glfbl=?,lrbl=?,bzcmc=?,bzcgg=?,bzcf=?,brgf=?,bjjf=?,bglfbl=?,blrbl=?,czcmc=?,czcgg=?,czcf=?,crgf=?,cjjf=?,cglfbl=?,clrbl=?,zcjldwbm=?";
	ls_sql+=" where  (wybh='"+wybh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xmbh);
	ps.setString(3,xmmc);
	ps.setString(4,xmdlbm);
	ps.setString(5,xmxlbm);
	ps.setString(6,smbm);
	ps.setString(7,jldwbm);
	ps.setDouble(8,bj);
	ps.setDouble(9,bbj);
	ps.setDouble(10,cbj);
	ps.setString(11,gycl);
	ps.setString(12,bgycl);
	ps.setString(13,cgycl);
	ps.setInt(14,xh);
	ps.setDouble(15,cbenj);
	ps.setDouble(16,sgdbj);


	ps.setDouble(17,clf);

	ps.setDouble(18,bclf);

	ps.setDouble(19,cclf);
	ps.setString(20,zcmc);
	ps.setString(21,zcgg);


	ps.setDouble(22,zcf);
	ps.setDouble(23,rgf);
	ps.setDouble(24,jjf);
	ps.setDouble(25,glfbl);
	ps.setDouble(26,lrbl);
	ps.setString(27,bzcmc);
	ps.setString(28,bzcgg);


	ps.setDouble(29,bzcf);
	ps.setDouble(30,brgf);
	ps.setDouble(31,bjjf);
	ps.setDouble(32,bglfbl);
	ps.setDouble(33,blrbl);
	ps.setString(34,czcmc);
	ps.setString(35,czcgg);


	ps.setDouble(36,czcf);
	ps.setDouble(37,crgf);
	ps.setDouble(38,cjjf);
	ps.setDouble(39,cglfbl);
	ps.setDouble(40,clrbl);
	ps.setString(41,zcjldwbm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>