<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String wherekkjlh=null;
String []kkjlh=request.getParameterValues("kkjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for(int i=0;i<kkjlh.length;i++)
	{
		String jsbz=null;
		String sjsjsbz=null;
		String zjjsbz=null;
		ls_sql="select jsbz,sjsjsbz,zjjsbz";
		ls_sql+=" from  cw_gckkjl";
		ls_sql+=" where  (kkjlh='"+kkjlh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jsbz=cf.fillNull(rs.getString("jsbz"));
			sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
			zjjsbz=cf.fillNull(rs.getString("zjjsbz"));
		}
		rs.close();
		ps.close();

		if (jsbz.equals("Y"))
		{
			conn.rollback();
			out.println("����ʩ�����ѽ��㣬������ɾ��:"+kkjlh[i]);
			return;
		}
		if (sjsjsbz.equals("Y"))
		{
			conn.rollback();
			out.println("�������ʦ�ѽ��㣬������ɾ��:"+kkjlh[i]);
			return;
		}
		if (zjjsbz.equals("Y"))
		{
			conn.rollback();
			out.println("�����ʼ��ѽ��㣬������ɾ��:"+kkjlh[i]);
			return;
		}

		
		ls_sql="update cw_gckkjl set spbz='2',spr=null,spsj=null,spyj=null ";   //��Ϊû��ɾ����־���޷�����������ɾ��
		ls_sql+=" where  kkjlh='"+kkjlh[i]+"'   ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>