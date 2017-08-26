<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbhbox=request.getParameterValues("khbhbox");
String[] khbh=request.getParameterValues("khbh");
String[] hflxbm=request.getParameterValues("hflxbm");
String[] hfrqstr=request.getParameterValues("hfrq");
String[] xh=request.getParameterValues("xh");

java.sql.Date hfrq=null;
String ls=null;

String hfdjbz=null;
int jdsj=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		if (!cf.searchArray(khbhbox,khbh[i]))
		{
			continue;
		}
		if (hfrqstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>�������Ϊ["+xh[i]+"]��[�ط�����]Ϊ��");
			return;
		}
		if (hflxbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>�������Ϊ["+xh[i]+"]��[�ط�����]Ϊ��");
			return;
		}
		

		try{
			hfrq=java.sql.Date.valueOf(hfrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�������Ϊ["+xh[i]+"]��[�ط�����]��ʽ���벻��ȷ:��"+hfrqstr[i]+"��");
			return;
		}

		ls_sql="select hfdjbz,NVL(jhjdsj-TRUNC(SYSDATE),1)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
			jdsj=rs.getInt(2);
		}
		rs.close();
		ps.close();

		if (jdsj>0)
		{
			if (hfdjbz.equals("3"))//1�����̻طö��᣻2��Ͷ�߱��޻طö��᣻3��ȫ������
			{
				conn.rollback();
				out.println("<BR>�������Ϊ["+xh[i]+"]�Ŀͻ�ȫ���ط��Ѷ���");
				return;
			}
			else if (hfdjbz.equals("1")){
				if (hflxbm[i].equals("21") || hflxbm[i].equals("22") || hflxbm[i].equals("23") || hflxbm[i].equals("24"))//���̻ط�
				{
					conn.rollback();
					out.println("<BR>�������Ϊ["+xh[i]+"]�Ŀͻ����̻ط��Ѷ���");
					return;
				}
			}
		}
/*
*/
		ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hflxbm[i]);
		ps.setDate(2,hfrq);
		ps.executeUpdate();
		ps.close();
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