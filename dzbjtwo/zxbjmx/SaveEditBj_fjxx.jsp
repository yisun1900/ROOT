<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] oldjgwzbm=request.getParameterValues("oldjgwzbm");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] fjmj=request.getParameterValues("fjmj");
String[] fjg=request.getParameterValues("fjg");
String[] zdyxmmj=request.getParameterValues("zdyxmmj");
String[] zdybzmj=request.getParameterValues("zdybzmj");
String[] xuhao=request.getParameterValues("xuhao");
String[] bz=request.getParameterValues("bz");
String[] fjzcxq=request.getParameterValues("fjzcxq");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	String getbjjb="";
	ls_sql="SELECT zxzt,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		getbjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1��δ��ɣ�2����ɣ�3��ҵ����ת
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("���󣡿ͻ���ǩ�����������޸ı���");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("���󣡿ͻ�ǩ��ʧ�ܣ��������޸ı���");
		return;
	}



	conn.setAutoCommit(false);

	//������
	ls_sql="update bj_fjxx set xuhao=-1 where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<oldjgwzbm.length ; i++)
	{
		try{
			Double.parseDouble(fjmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]���󣡷������["+cf.GB2Uni(fjmj[i])+"]��������");
			return;
		}
		try{
			Double.parseDouble(fjg[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]���󣡷����["+cf.GB2Uni(fjg[i])+"]��������");
			return;
		}
		try{
			Double.parseDouble(zdyxmmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]�����Զ���ľ�����["+cf.GB2Uni(zdyxmmj[i])+"]��������");
			return;
		}
		try{
			Double.parseDouble(zdybzmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]�����Զ����ֽ���["+cf.GB2Uni(zdybzmj[i])+"]��������");
			return;
		}

		try{
			Integer.parseInt(xuhao[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]���󣡷���˳���["+cf.GB2Uni(xuhao[i])+"]��������");
			return;
		}

		
		if (jgwzbm[i].trim().equals(""))
		{
			conn.rollback();
			out.println("���󣡷�������["+cf.GB2Uni(oldjgwzbm[i])+"]����Ϊ��ֵ");
			return;
		}
		if (xuhao[i].trim().equals(""))
		{
			conn.rollback();
			out.println("���󣡷���˳��Ų���Ϊ��ֵ");
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_fjxx";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm!='"+cf.GB2Uni(oldjgwzbm[i])+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
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
			conn.rollback();
			out.println("����˳���["+xuhao[i]+"]���󣡷�������["+cf.GB2Uni(jgwzbm[i])+"]�Ѵ���");
			return;
		}

		ls_sql="update bj_fjxx set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"',fjzcxq='"+cf.GB2Uni(fjzcxq[i])+"',bz='"+cf.GB2Uni(bz[i])+"',fjmj="+fjmj[i]+",fjg="+fjg[i]+",zdyxmmj="+zdyxmmj[i]+",zdybzmj="+zdybzmj[i]+",xuhao="+xuhao[i]+" where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_gclmx set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		ls_sql="update bj_khzcxmxj set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_khzcxm set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' where khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
	}

	//�������
	int pxxh=0;
	String lsjgwzbm=null;
	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsjgwzbm=rs.getString(1);

		pxxh++;

		ls_sql="update bj_fjxx set xuhao="+pxxh+" where khbh='"+khbh+"' and jgwzbm='"+lsjgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>