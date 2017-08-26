<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="ck" scope="page" class="jxc.ckgl.Ckgl"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ckph = request.getParameterValues("ckph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	//����Ƿ�¼��������
	int count=0;

	conn.setAutoCommit(false);

	for (int i=0;i<ckph.length ;i++ )
	{
		String ckdzt=null;
		String cklx=null;
		String lydh=null;
		ls_sql=" select ckdzt,cklx,lydh";
		ls_sql+=" from jxc_ckd ";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			ckdzt=cf.fillNull(rs.getString("ckdzt"));
			cklx=cf.fillNull(rs.getString("cklx"));
			lydh=cf.fillNull(rs.getString("lydh"));
		}
		else
		{
			conn.rollback();
			out.print("�����ڵĳ������ţ�"+ckph[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!ckdzt.equals("0"))//0:δ�ύ�� 1���ȴ�������ˣ�2���ȴ��˻���ˣ�3���ȴ�������⣻4���ѽ��㣻5���˻����ͨ��6���������δͨ����7���˻����δͨ����8:���ͨ����9���ύ
		{
			conn.rollback();
			out.print("���󣡳��ⵥ���ύ����ɾ��������ɾ���ύ��"+ckph[i]);
			return;
		}

		//ɾ��������ϸ
		ls_sql="delete from jxc_ckmx ";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//ɾ����������
		ls_sql="delete from jxc_ckd ";
		ls_sql+=" where ckph='"+ckph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("���ⵥɾ���ɹ���");
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