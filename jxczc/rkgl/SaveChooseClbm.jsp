<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] clbm=request.getParameterValues("clbm");
String rkph = request.getParameter("rkph");	


int rkxh=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //�õ�����


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
		out.print("������ⵥ���ύ��������¼�����ݣ�");
		return;
	}

	conn.setAutoCommit(false);

	//��ѯ������Ʒ����
	ls_sql="select NVL(max(rkxh),0) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ѯ��ѡ��Ĳ��ϱ���
	for (int i=0;i<clbm.length ;i++ )
	{
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_rkmx ";
		ls_sql+=" where clbm='"+clbm[i]+"' and rkph='"+rkph+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.print("<BR>���ѣ����ϡ�"+clbm[i]+"����ѡ��");
		}

		rkxh++;

		//д�������ϸ
		ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm ,rksl,rkj,rkje,zcpsl,ccpsl,wldssl,thpsl,bfpsl,ccpzkl ) ";
		ls_sql+=" values ( ?,?,? ,0,0,0,0,0,0,0,0,10 ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,rkph);
		ps.setLong(2,rkxh);
		ps.setString(3,clbm[i]);
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
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if(rs!=null) rs.close();
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
