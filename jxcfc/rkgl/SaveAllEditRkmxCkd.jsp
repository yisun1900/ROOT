<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String[] clbm=request.getParameterValues("clbm");
String[] getrkxh=request.getParameterValues("rkxh");
String[] hwbh =request.getParameterValues("hwbh");//����λ
String[] hjbh =request.getParameterValues("hjbh");//������


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//�����ⵥ״̬
	String rkdzt=null;
	ls_sql="select rkdzt ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
	}
	else{
		out.print("������ⵥ["+rkph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	{
		out.print("������ⵥ���ύ���������޸ģ�");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		//������
		if (cf.GB2Uni(hjbh[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"�������ܲ���Ϊ�գ�");
			return;
		}

		ls_sql="update jxc_rkmx set hjbh=?,hwbh=? ";
		ls_sql+=" where rkph='"+rkph+"' and rkxh='"+getrkxh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(hjbh[i]));
		ps.setString(2,cf.GB2Uni(hwbh[i]));
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>