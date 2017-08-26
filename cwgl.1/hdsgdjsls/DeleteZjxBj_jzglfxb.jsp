<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String gdjsjlh=request.getParameter("gdjsjlh");
String zjxxh=request.getParameter("zjxxh");

String[] scglbxh=request.getParameterValues("scglbxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<scglbxh.length ;i++ )
	{
		//��װ���Ϸ�����
		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"' and glbxh="+scglbxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//�����۵��ۡ������仯�����¼��㣫����������������������������ʼ
	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	double jsblxs=0;

	double sl=0;
	double dwbjje=0;


	//�ӡ��ͻ����Ϸ�����bj_khglfxb����ȡ���۵���
	ls_sql="SELECT sum(xhl*dj)";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cbdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//ȡ���������ϵ��
	ls_sql="SELECT jsblxs,sl,dwbjje";
	ls_sql+=" from cw_dejsmx ";
	ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsblxs=rs.getDouble("jsblxs");
		sl=rs.getDouble("sl");
		dwbjje=rs.getDouble("dwbjje");
	}
	rs.close();
	ps.close();


	cbdj=cf.doubleTrim(cbdj,2);//�ɱ����ۡ����۵���

	cbje=sl*cbdj;//������*�ɱ�����
	cbje=cf.doubleTrim(cbje);//�ɱ������۽��


	mll=(dwbjje-cbje)/dwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
	mll=cf.doubleTrim(mll);//ë����

	mle=dwbjje-cbje;//ë����*���ⱨ�۽��
	mle=cf.doubleTrim(mle);//ë�����


	nbjsdj=cbdj*(1+jsblxs/100);//�ɱ�����*(1+�������ϵ��)
	nbjsdj=cf.doubleTrim(nbjsdj);//�ڲ����㵥��

	nbjsje=nbjsdj*sl;//�ڲ����㵥��*��������
	nbjsje=cf.doubleTrim(nbjsje);//�ڲ�������

	gsmll=(dwbjje-nbjsje)/dwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
	gsmll=cf.doubleTrim(gsmll);//��˾ë����

	gsmlr=dwbjje-nbjsje;//��˾ë����*���ⱨ�۽��
	gsmlr=cf.doubleTrim(gsmlr);//��˾ë����


	ls_sql="update cw_dejsmx set xclbz='Y',cbdj=?,cbje=?,mll=?,mle=?,nbjsdj=?,nbjsje=?,gsmll=?,gsmlr=?";
	ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,cbdj);
	ps.setDouble(2,cbje);
	ps.setDouble(3,mll);
	ps.setDouble(4,mle);
	ps.setDouble(5,nbjsdj);
	ps.setDouble(6,nbjsje);
	ps.setDouble(7,gsmll);
	ps.setDouble(8,gsmlr);
	ps.executeUpdate();
	ps.close();

	//�����۵��ۡ������仯�����¼���===========================���

	ls_sql="SELECT sum(nbjsje)";
	ls_sql+=" from cw_dejsmx ";
	ls_sql+=" where cw_dejsmx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nbjsje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update cw_gdjsjl set dejsje="+nbjsje;
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
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