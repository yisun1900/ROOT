<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jdjlh=null;
String khbh=null;
java.sql.Date sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
java.sql.Date jhjdrq=null;
double jhjdsj=0;
String sqsm=null;
java.sql.Date zcwcsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sqrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
sqr=cf.GB2Uni(request.getParameter("sqr"));
sqrlxdh=cf.GB2Uni(request.getParameter("sqrlxdh"));
sfxtp=cf.GB2Uni(request.getParameter("sfxtp"));
ls=request.getParameter("jhjdrq");
try{
	if (!(ls.equals("")))  jhjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhjdrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���������]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhjdsj");
try{
	if (!(ls.equals("")))  jhjdsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhjdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}
sqsm=cf.GB2Uni(request.getParameter("sqsm"));
ls=request.getParameter("zcwcsj");
try{
	if (!(ls.equals("")))  zcwcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zcwcsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));

lrbm=cf.GB2Uni(request.getParameter("lrbm"));

String jdlxbm=cf.GB2Uni(request.getParameter("jdlxbm"));
String[] jdxmbm=request.getParameterValues("jdxmbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt="1";//1�����룻2��ȷ�ϣ�3��������ɣ�4��������5���ѽ���

	String sfycp="1";//1���в�Ʒ��2���޲�Ʒ
	String cplx="";//��Ʒ����
	for (int i=0;i<jdxmbm.length ;i++ )
	{
		if (jdxmbm[i].equals("00"))
		{
			sfycp="2";
			cplx="�޲�Ʒ";
		}
		else{
			ls_sql="SELECT jdxmmc";
			ls_sql+=" FROM dm_jdxmbm";
			ls_sql+=" where jdxmbm='"+jdxmbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cplx+=rs.getString("jdxmmc")+"��";
			}
			rs.close();
			ps.close();
		}
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_xcjdjl ( jdjlh,khbh,sqrq,sqr,sqrlxdh,sfxtp,cplx,jhjdrq,jhjdsj,sqsm   ,zcwcsj,lrr,lrsj,lrbm,clzt,sfycp,jdlxbm,sfxtx,jdqrcs ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,SYSDATE,?,?,?,?,'N',1) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdjlh);
	ps.setString(2,khbh);
	ps.setDate(3,sqrq);
	ps.setString(4,sqr);
	ps.setString(5,sqrlxdh);
	ps.setString(6,sfxtp);
	ps.setString(7,cplx);
	ps.setDate(8,jhjdrq);
	ps.setDouble(9,jhjdsj);
	ps.setString(10,sqsm);

	ps.setDate(11,zcwcsj);
	ps.setString(12,lrr);
	ps.setString(13,lrbm);
	ps.setString(14,clzt);
	ps.setString(15,sfycp);
	ps.setString(16,jdlxbm);
	ps.executeUpdate();
	ps.close();

	int sj=0;
	ls_sql="select jhjdrq-TRUNC(lrsj)";
	ls_sql+=" from  crm_xcjdjl";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sj=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY)>15)
	{
		if (sj<4 && sfxtp.equals("N"))
		{
			conn.rollback();
			out.println("����3���¼�룬Ҫ��ǰ4���ύ���룬��ѡ������������"+sj);
			return;
		}
	}
	else{
		if (sj<3 && sfxtp.equals("N"))
		{
			conn.rollback();
			out.println("����Ҫ��ǰ3���ύ���룬��ѡ������������"+sj);
			return;
		}
	}


	
	ls_sql="delete from crm_jdxmmx ";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (sfycp.equals("1"))//1���в�Ʒ��2���޲�Ʒ
	{
		for (int i=0;i<jdxmbm.length ;i++ )
		{
			ls_sql="insert into crm_jdxmmx ( jdjlh,jdxmbm,jdry,jdrydh,jdnr,clzt) ";
			ls_sql+=" values('"+jdjlh+"','"+jdxmbm[i]+"','0','0','0','1')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	String setxcjdbz="";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����
	if (sfxtp.equals("Y"))//Y���ǣ�N����
	{
		setxcjdbz="2";
	}
	else{
		setxcjdbz="1";
	}

	
	ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>����ʧ��,��������: " + e);
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