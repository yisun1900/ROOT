<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph = request.getParameter("ckph");

String[] clbm =request.getParameterValues("clbm");
String[] ckxh =request.getParameterValues("ckxh");
String[] ckslstr =request.getParameterValues("cksl");
String[] xsfs =request.getParameterValues("xsfs");
String[] kcslstr =request.getParameterValues("kcsl");
String[] xckslstr =request.getParameterValues("xcksl");
String[] ckdjstr =request.getParameterValues("ckdj");


double cksl=0;
double kcsl=0;
double xcksl=0;//���������
double ckdj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//��ѯ���ⵥ
	String ckdzt = null;
	ls_sql = " select ckdzt ";
	ls_sql+= " from jxc_ckd ";
	ls_sql +=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdzt=cf.fillNull(rs.getString("ckdzt"));
	}
	else
	{
		out.print("���󣡲����ڵĳ��ⵥ");
		return;
	}
	rs.close();
	ps.close();
	if (!ckdzt.equals("0"))
	{
		out.print("���󣡳��ⵥ���ύ");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<ckxh.length ;i++ )
	{
		//��������
		try{
			cksl=Double.parseDouble(ckslstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>���󣡡�"+clbm[i]+"��[��������]�����������ͣ�"+ckslstr[i]);
			return;
		}



		if (cksl<=0)
		{
			out.println("<BR>���󣡡�"+clbm[i]+"�����������������0");
			conn.rollback();
			return;
		}

		kcsl=Double.parseDouble(kcslstr[i].trim());
		xcksl=Double.parseDouble(xckslstr[i].trim());
		ckdj=Double.parseDouble(ckdjstr[i].trim());

		//��飺�����������ܴ�����Ҫ��������������������������������ʼ
		//��������������������������������ѳ�������
		if (cksl>xcksl)
		{
			conn.rollback();
			out.print("<BR>���󣡲��ϡ�"+clbm[i]+"��������������"+cksl+"�����ܴ��ڡ������������"+xcksl+"��");
			return;
		}
		//��飺�����������ܴ�����Ҫ����������������������������������

		//��飺�����������ܴ��ڿ������������������������������ʼ
		//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
		if (xsfs[i].equals("2") || xsfs[i].equals("3"))
		{
			if (cksl>kcsl)
			{
				conn.rollback();
				out.print("<BR>���󣡲��ϡ�"+clbm[i]+"��������������"+cksl+"�����ܴ��ڡ����������"+kcsl+"��");
				return;
			}
		}
		//��飺�����������ܴ��ڿ��������������������������������

		ls_sql="update jxc_ckmx set cksl=?,ckdj=?,ckje=?*?,cbje=cbdj*?";
		ls_sql+=" where jxc_ckmx.ckxh='"+ckxh[i]+"' and jxc_ckmx.ckph='"+ckph+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cksl);
		ps.setDouble(2,ckdj);
		ps.setDouble(3,cksl);
		ps.setDouble(4,ckdj);
		ps.setDouble(5,cksl);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>