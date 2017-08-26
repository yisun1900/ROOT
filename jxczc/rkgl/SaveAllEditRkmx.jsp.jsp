<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String[] clbm=request.getParameterValues("clbm");
String[] getrkxh=request.getParameterValues("rkxh");
String[] rkjstr=request.getParameterValues("rkj");
String[] rkslstr=request.getParameterValues("rksl");
String[] scrqstr=request.getParameterValues("scrq");
String[] scph=request.getParameterValues("scph");
String[] hwbh =request.getParameterValues("hwbh");//����λ
String[] hjbh =request.getParameterValues("hjbh");//������

double rkj=0;
double rksl=0;
java.sql.Date scrq=null;


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
		//��ⵥ��
		if (cf.GB2Uni(rkjstr[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"����ⵥ�۲���Ϊ�գ�");
			return;
		}

		try{
			rkj=Double.parseDouble(rkjstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"��[��ⵥ��]��������:"+e);
			return;
		}

		//�������
		if (rkslstr[i]==null || rkslstr[i].trim().equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"�������������Ϊ�գ�");
			return;
		}
		try{
			rksl=Double.parseDouble(rkslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"��[�������]��������:"+e);
			return;
		}

		if (rksl==0)
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"�������������Ϊ0��");
			return;
		}

		//��������
		if (cf.GB2Uni(scrqstr[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"���������ڲ���Ϊ�գ�");
			return;
		}

		try{
			scrq=java.sql.Date.valueOf(scrqstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"��[��������]��ʽ����ȷ��ӦΪ��YYYY-MM-DD��:"+e);
			return;
		}

		//��������
		if (cf.GB2Uni(scph[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"���������Ų���Ϊ�գ�");
			return;
		}

		//������
		if (cf.GB2Uni(hjbh[i]).equals(""))
		{
			conn.rollback();
			out.print("<BR>�ڡ�"+(i+1)+"���д��󣡲��ϱ��롾"+clbm[i]+"�������ܲ���Ϊ�գ�");
			return;
		}


		//�޸������ϸ
		double rkje=rkj*rksl;
		ls_sql="update jxc_rkmx set rkj=?,rksl=?,rkje=?,scrq=?,scph=?,zcpsl=?,hjbh=?,hwbh=? ";
		ls_sql+=" where rkph='"+rkph+"' and rkxh='"+getrkxh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,rkj);
		ps.setDouble(2,rksl);
		ps.setDouble(3,rkje);
		ps.setDate(4,scrq);
		ps.setString(5,cf.GB2Uni(scph[i]));
		ps.setDouble(6,rksl);
		ps.setString(7,cf.GB2Uni(hjbh[i]));
		ps.setString(8,cf.GB2Uni(hwbh[i]));
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