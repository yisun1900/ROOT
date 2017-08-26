<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fgsbh=null;
	String ddlx=null;
	String sfjs=null;
	String xclbz=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		sfjs="";
		ls_sql =" select fgsbh,ddlx,xclbz,sfjs";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=rs.getString("fgsbh");
			ddlx=rs.getString("ddlx");
			sfjs=rs.getString("sfjs");
			xclbz=rs.getString("xclbz");
		}
		rs.close();
		ps.close();

		if (!sfjs.equals("C"))
		{
			conn.rollback();
			out.println("<BR>����ɾ��ʧ�ܣ�������"+ddbh[i]+"��״̬����ȷ");
			return;
		}

		String dqbm=null;
		ls_sql =" select dqbm";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dqbm=rs.getString("dqbm");
		}
		rs.close();
		ps.close();

		//int count=0;
//		ls_sql="select count(*)";
//		ls_sql+=" from  jc_zczjx";
//		ls_sql+=" where ddbh='"+ddbh[i]+"'";
//		ps= conn.prepareStatement(ls_sql);
//		rs =ps.executeQuery();
//		if (rs.next())
//		{
//			count=rs.getInt(1);
//		}
//		rs.close();
//		ps.close();
//
//		if (count>0)
//		{
//			conn.rollback();
//			out.println("��ɾ��ʧ�ܣ�����["+ddbh[i]+"]������������Ҫɾ��������ɾ�������");
//			return;
//		}

		ls_sql="update jc_zcdd set sfjs='N'";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and sfjs='C'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
//
//		if (ddlx.equals("4"))//1��ϵͳ����Ʒ�ƶ�����2��ϵͳ������Ʒ�ƶ�����3����¼��ͬ��4���п�涩��
//		{
//			//���ϼ۸��jxc_cljgb��,�ͻ���������
//			ls_sql="update jxc_cljgb set dhsl=dhsl-(select sl from jc_zcddmx where jc_zcddmx.zcbm=jxc_cljgb.clbm and jc_zcddmx.ddbh='"+ddbh[i]+"')";
//			ls_sql+=" where dqbm='"+dqbm+"' ";
//			ls_sql+=" and clbm in(select zcbm from jc_zcddmx where ddbh='"+ddbh[i]+"')";
//			ps= conn.prepareStatement(ls_sql);
//			ps.executeUpdate();
//			ps.close();
//		}
//
//
//		//���ɶ���
//		ls_sql="delete from jc_jcdd";
//		ls_sql+=" where ddbh='"+ddbh[i]+"'";
//		ps= conn.prepareStatement(ls_sql);
//		ps.executeUpdate();
//		ps.close();
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