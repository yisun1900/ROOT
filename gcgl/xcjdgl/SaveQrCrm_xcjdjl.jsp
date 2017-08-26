<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] jdxmbm=request.getParameterValues("jdxmbm");
String[] sfty=request.getParameterValues("sfty");
String[] qrsj=request.getParameterValues("qrsj");
String[] qrr=request.getParameterValues("qrr");
String[] qrsm=request.getParameterValues("qrsm");
String[] jdry=request.getParameterValues("jdry");
String[] jdrydh=request.getParameterValues("jdrydh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfxtp=null;
	String clzt=null;
	int jdqrcs=0;
	ls_sql=" SELECT clzt,jdqrcs,sfxtp";
	ls_sql+=" FROM crm_xcjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		jdqrcs=rs.getInt("jdqrcs");
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
	}
	rs.close();
	ps.close();

	if (sfxtp.equals("N") && !clzt.equals("1")  && !clzt.equals("2") && !clzt.equals("3"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
	{
		out.print("�����ѷ������������޸�");
		return;
	}
	if (sfxtp.equals("Y") && !clzt.equals("4") && !clzt.equals("2") && !clzt.equals("3"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
	{
		out.print("�����ѷ������������޸�");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<jdxmbm.length ;i++ )
	{
		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_jdqrjl ";
		ls_sql+=" where jdjlh='"+jdjlh+"' and jdxmbm='"+jdxmbm[i]+"' and jdqrcs="+jdqrcs;
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
			ls_sql="update crm_jdqrjl set qrsj=SYSDATE,sfty=?,qrr=?,qrsm=? ";
			ls_sql+=" where jdjlh='"+jdjlh+"' and jdxmbm='"+jdxmbm[i]+"' and jdqrcs="+jdqrcs;
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sfty[i]);
			ps.setString(2,cf.GB2Uni(qrr[i]));
			ps.setString(3,cf.GB2Uni(qrsm[i]));
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into crm_jdqrjl (jdjlh,jdxmbm,jdqrcs,qrsj,sfty,qrr,qrsm) ";
			ls_sql+=" values(?,?,?,SYSDATE,?,?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jdjlh);
			ps.setString(2,jdxmbm[i]);
			ps.setInt(3,jdqrcs);
			ps.setString(4,sfty[i]);
			ps.setString(5,cf.GB2Uni(qrr[i]));
			ps.setString(6,cf.GB2Uni(qrsm[i]));
			ps.executeUpdate();
			ps.close();
		}



		if (sfty[i].equals("N"))//Y��ͬ�⣻N����ͬ�⣻M������ȷ��
		{
			clzt="3";
		}
		else
		{
			clzt="2";//1��δȷ�ϣ�2��ȷ��ͬ�⣻3��ȷ�ϲ�ͬ��
		}

		ls_sql="update crm_jdxmmx set clzt='"+clzt+"',jdry=?,jdrydh=?";
		ls_sql+=" where jdjlh='"+jdjlh+"' and jdxmbm='"+jdxmbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(jdry[i]));
		ps.setString(2,cf.GB2Uni(jdrydh[i]));
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_xcjdjl set clzt='3'";//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_khxx set xcjdbz='5' ";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int count=0;
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM crm_jdxmmx ";
    ls_sql+=" where jdjlh='"+jdjlh+"' and clzt='3'";//1��δȷ�ϣ�2��ȷ��ͬ�⣻3��ȷ�ϲ�ͬ��
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
		ls_sql="update crm_xcjdjl set clzt='2',jdqrjg='N',jdqrwcsj=SYSDATE";
		ls_sql+=" where jdjlh='"+jdjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="update crm_khxx set xcjdbz='4' ";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	}
	else{
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_jdxmmx ";
		ls_sql+=" where jdjlh='"+jdjlh+"' and clzt='1'";//1��δȷ�ϣ�2��ȷ��ͬ�⣻3��ȷ�ϲ�ͬ��
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
			ls_sql="update crm_xcjdjl set clzt='2',jdqrjg='Y',jdqrwcsj=SYSDATE";
			ls_sql+=" where jdjlh='"+jdjlh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update crm_khxx set xcjdbz='3' ";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


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