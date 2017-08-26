<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] rkph=request.getParameterValues("rkph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;

String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<rkph.length ;i++ )
	{
		//�����ⵥ״̬
		String rkdzt=null;
		String dqbm=null;
		String rklx=null;
		String lydh=null;
		ls_sql="select rkdzt,dqbm,rklx,lydh ";
		ls_sql+=" from  jxc_rkd ";
		ls_sql+=" where rkph='"+rkph[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			rkdzt=rs.getString("rkdzt");
			dqbm=rs.getString("dqbm");
			rklx=rs.getString("rklx");
			lydh=rs.getString("lydh");
		}
		else{
			rs.close();
			ps.close();
			conn.rollback();
			out.print("������ⵥ["+rkph[i]+"]�����ڣ�");
			return;
		}
		rs.close();
		ps.close();

		if (!rkdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
		{
			conn.rollback();
			out.print("������ⵥ���ύ��"+rkph[i]);
			return;
		}


		if (rklx.equals("S"))//S���깺���
		{
			//��鹩Ӧ�̶���״̬
			String ddzt=null;
			ls_sql="select ddzt ";
			ls_sql+=" from  jxc_gysdd ";
			ls_sql+=" where gysddph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddzt=rs.getString("ddzt");
			}
			else{
				conn.rollback();
				out.print("���󣡹�Ӧ�̶�������["+lydh+"]�����ڣ�");
				return;
			}
			rs.close();
			ps.close();

			if (!ddzt.equals("4") && !ddzt.equals("1"))//7��δ�ύ��0�����ύ��1�����µ���2���ѽ��ܣ�3�����ַ�����5������ɷ�����4������⣻6�����ڰ�����⣻ 9���ѽ���
			{
				conn.rollback();
				out.print("���󣡹�Ӧ�̶���״̬����ȷ��"+ddzt);
				return;
			}

			//��Ӧ�̶�����ϸ
			ls_sql="update jxc_gysddmx set pssl=pssl-NVL((select sum(rksl) from jxc_rkmx where rkph='"+rkph[i]+"' and jxc_rkmx.clbm=jxc_gysddmx.clbm),0)";
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//��Ӧ�̶���
			ls_sql="update jxc_gysdd set ddzt='1'";//1�����µ�
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (rklx.equals("C"))//C���ɹ����
		{
			//��鹩Ӧ�̶���״̬
			String ddzt=null;
			ls_sql="select ddzt ";
			ls_sql+=" from  jxc_gysdd ";
			ls_sql+=" where gysddph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddzt=rs.getString("ddzt");
			}
			else{
				conn.rollback();
				out.print("���󣡹�Ӧ�̶�������["+lydh+"]�����ڣ�");
				return;
			}
			rs.close();
			ps.close();

			if (!ddzt.equals("4"))//7��δ�ύ��0�����ύ��1�����µ���2���ѽ��ܣ�3�����ַ�����5������ɷ�����4������⣻6�����ڰ�����⣻ 9���ѽ���
			{
				conn.rollback();
				out.print("���󣡹�Ӧ�̶���δ��⣡");
				return;
			}

			//��Ӧ�̶�����ϸ
			ls_sql="update jxc_gysddmx set pssl=pssl-(select sum(rksl) from jxc_rkmx where rkph='"+rkph[i]+"' and jxc_rkmx.clbm=jxc_gysddmx.clbm)";
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//��Ӧ�̶���
			ls_sql="update jxc_gysdd set ddzt='1'";//1�����µ�
			ls_sql+=" where gysddph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (rklx.equals("F"))//F�����������
		{
			//��鹩Ӧ�̶���״̬
			String ckdzt=null;
			ls_sql="select ckdzt ";
			ls_sql+=" from  jxc_ckd ";
			ls_sql+=" where ckph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ckdzt=rs.getString("ckdzt");
			}
			else{
				conn.rollback();
				out.print("���󣡳�������["+lydh+"]�����ڣ�");
				return;
			}
			rs.close();
			ps.close();

			if (!ckdzt.equals("8"))//8�����ܷ������
			{
				conn.rollback();
				out.print("���󣡳�������δ��⣡");
				return;
			}

			//���ⵥ
			ls_sql="update jxc_ckd set ckdzt='9'";//9���ύ
			ls_sql+=" where ckph='"+lydh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//ɾ�������
		ls_sql=" delete from jxc_rkd ";
		ls_sql+=" where rkph='"+rkph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ���������ϸ��
		ls_sql=" delete from jxc_rkmx ";
		ls_sql+=" where rkph='"+rkph[i]+"'";
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>