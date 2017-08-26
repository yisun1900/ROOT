<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date zgyssj=null;
String zgyssm=null;
String zgysr=null;
ls=request.getParameter("zgyssj");
try{
	if (!(ls.equals("")))  zgyssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zgyssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ʱ��]����ת����������:"+e);
	return;
}
zgysr=cf.GB2Uni(request.getParameter("zgysr"));
zgyssm=cf.GB2Uni(request.getParameter("zgyssm"));
String zgysjg=request.getParameter("zgysjg");

String ysjlh=request.getParameter("ysjlh");
String zgcljlh=request.getParameter("zgcljlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclbz=null;
	ls_sql="select clbz";
	ls_sql+=" from crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	if (!getclbz.equals("5") && !getclbz.equals("6"))//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
	{
		out.println("����״̬����ȷ");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_yszgcljl set cljg=?,clr=?,clsj=SYSDATE,clsm=?";
	ls_sql+=" where zgcljlh='"+zgcljlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgysjg);
	ps.setString(2,zgysr);
	ps.setString(3,zgyssm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_heysjl set zgyssj=?,zgysr=?,zgysjg=?,zgyssm=?,clbz=?";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zgyssj);
	ps.setString(2,zgysr);
	ps.setString(3,zgysjg);
	ps.setString(4,zgyssm);
	ps.setString(5,zgysjg);
	ps.executeUpdate();
	ps.close();

	rwjh.Rwjh rwjh=new rwjh.Rwjh();
	//��������״̬
	rwjh.updateYsxmZt(conn,ysjlh);

	
	if (getclbz.equals("5") )//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
	{
		if (zgysjg.equals("6"))//5���ϸ�6�����ϸ�
		{
			//���Ͷ���
			ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
			String retStr=dxxt.yszgYs(conn,ysjlh,zgysr);//���÷��Ͷ��ź���
			if (retStr.equals(""))
			{
				out.println("���ŷ��ͳɹ�");
			}
			else{
				out.println(retStr);//�����ͽ����ʾ��ҳ����
			}
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