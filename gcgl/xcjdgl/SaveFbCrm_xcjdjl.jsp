<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date zzqrjdrq=null;
double zzqrjdsj=0;
String fbr=null;
java.sql.Date fbsj=null;
ls=request.getParameter("zzqrjdrq");
try{
	if (!(ls.equals("")))  zzqrjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zzqrjdrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȷ�Ͻ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzqrjdsj");
try{
	if (!(ls.equals("")))  zzqrjdsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zzqrjdsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȷ�Ͻ���ʱ��]����ת����������:"+e);
	return;
}
fbr=cf.GB2Uni(request.getParameter("fbr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fbsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���׷���ʱ��]����ת����������:"+e);
	return;
}

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String sfycp=null;
	String sfxtp=null;
	String clzt=null;
	String jdqrjg=null;
	String tpsftg=null;
	ls_sql=" SELECT khbh,sfycp,sfxtp,clzt,jdqrjg,tpsftg";
	ls_sql+=" FROM crm_xcjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sfycp=cf.fillNull(rs.getString("sfycp"));
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
		clzt=cf.fillNull(rs.getString("clzt"));
		jdqrjg=cf.fillNull(rs.getString("jdqrjg"));
		tpsftg=cf.fillNull(rs.getString("tpsftg"));
	}
	rs.close();
	ps.close();

	if (sfycp.equals("1"))//1���в�Ʒ��2���޲�Ʒ
	{
		if (!clzt.equals("2"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
		{
			out.print("���󣡴���״̬����ȷ");
			return;
		}
		else{
			if (!jdqrjg.equals("Y"))//����ȷ�Ͻ��  Y��ͨ����N��δͨ��
			{
				out.print("����δȷ��");
				return;
			}
		}
	}
	else{
		if (sfxtp.equals("Y") )//�Ƿ�������:Y���ǣ�N����
		{
			if (!clzt.equals("4") )
			{
				out.print("�����ѷ���");
				return;
			}
		}
		else{
			if (!clzt.equals("1") )
			{
				out.print("�����ѷ���");
				return;
			}
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_xcjdjl set zzqrjdrq=?,zzqrjdsj=?,fbr=?,fbsj=?,clzt='5' ";
	ls_sql+=" where  jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zzqrjdrq);
	ps.setDouble(2,zzqrjdsj);
	ps.setString(3,fbr);
	ps.setDate(4,fbsj);
	ps.executeUpdate();
	ps.close();

	String setxcjdbz="8";//0��δ���룻1����ͨ���룻2���������룻3��ȷ��ͨ����4��ȷ��ʧ�ܣ�5������ȷ�ϣ�6������ͬ�⣻7��������ͬ�⣻8��������9�����׳ɹ���A������ʧ�ܣ�B��ʧ���ѳ�����

	
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