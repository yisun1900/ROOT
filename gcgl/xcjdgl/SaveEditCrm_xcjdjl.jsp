<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
java.sql.Date jhjdrq=null;
long jhjdsj=0;
String sqsm=null;
java.sql.Date zcwcsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
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
	if (!(ls.equals("")))  jhjdsj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jhjdsj]������");
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
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String jdlxbm=cf.GB2Uni(request.getParameter("jdlxbm"));
String[] jdxmbm=request.getParameterValues("jdxmbm");

String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String jdqrjg=null;
	ls_sql="SELECT khbh,clzt,jdqrjg";
	ls_sql+=" FROM crm_xcjdjl";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		clzt=rs.getString("clzt");
		jdqrjg=rs.getString("jdqrjg");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("1"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
	{
		out.println("����״̬����ȷ");
		return;
	}

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

	ls_sql="update crm_xcjdjl set sqrq=?,sqr=?,sqrlxdh=?,sfxtp=?,jhjdrq=?,jhjdsj=?,sqsm=?,zcwcsj=?,lrr=?,lrsj=?,lrbm=?,jdlxbm=?,sfycp=?,cplx=? ";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqrq);
	ps.setString(2,sqr);
	ps.setString(3,sqrlxdh);
	ps.setString(4,sfxtp);
	ps.setDate(5,jhjdrq);
	ps.setLong(6,jhjdsj);
	ps.setString(7,sqsm);
	ps.setDate(8,zcwcsj);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,jdlxbm);
	ps.setString(13,sfycp);
	ps.setString(14,cplx);
	ps.executeUpdate();
	ps.close();

		
	if (sfycp.equals("1"))//1���в�Ʒ��2���޲�Ʒ
	{
		ls_sql="delete from crm_jdxmmx ";
		ls_sql+=" where jdjlh='"+jdjlh+"' and "+cf.arrayToNotInSQL(jdxmbm,"jdxmbm");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int i=0;i<jdxmbm.length ;i++ )
		{
			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_jdxmmx";
			ls_sql+=" where jdjlh='"+jdjlh+"' and jdxmbm='"+jdxmbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count==0)
			{
				ls_sql="insert into crm_jdxmmx ( jdjlh,jdxmbm,jdry,jdrydh,jdnr,clzt) ";
				ls_sql+=" values('"+jdjlh+"','"+jdxmbm[i]+"','0','0','0','1')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
	}
	else{
		ls_sql="delete from crm_jdxmmx ";
		ls_sql+=" where jdjlh='"+jdjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
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
	out.print("<BR>����:" + e);
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