<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ysshjl = request.getParameterValues("ysshjl");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<ysshjl.length ;i++ )
	{
		String khbh=null;
		String zxbz=null;
		String yysshjl=null;
		String yysshbz=null;
		String getysshbz="";
		ls_sql="select khbh,zxbz,yysshjl,yysshbz,ysshbz";
		ls_sql+=" from  bj_ysshjl";
		ls_sql+=" where ysshjl='"+ysshjl[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			zxbz=cf.fillNull(rs.getString("zxbz"));
			yysshjl=cf.fillNull(rs.getString("yysshjl"));
			yysshbz=cf.fillNull(rs.getString("yysshbz"));
			getysshbz=cf.fillNull(rs.getString("ysshbz"));
		}
		else{
			conn.rollback();
			out.println("������˼�¼�Ų����ڣ�"+ysshjl[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!getysshbz.equals("Y") && !getysshbz.equals("M") && !getysshbz.equals("1"))////N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��;S���޸ķ�����Ȩ
		{
			conn.rollback();
			out.println("���������¼״̬����ȷ��"+getysshbz);
			return;
		}

		ls_sql="select ysshbz";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getysshbz=cf.fillNull(rs.getString("ysshbz"));
		}
		rs.close();
		ps.close();

		if (!getysshbz.equals("Y") && !getysshbz.equals("M"))////N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��;S���޸ķ�����Ȩ
		{
			conn.rollback();
			out.println("���󣡿ͻ�Ԥ������״̬����ȷ��"+getysshbz);
			return;
		}

		String zxzt="";
		ls_sql="select zxzt";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxzt=cf.fillNull(rs.getString("zxzt"));
		}
		rs.close();
		ps.close();

		if (!zxzt.equals("0") && !zxzt.equals("1") && !zxzt.equals("5"))
		{
			conn.rollback();
			out.println("ɾ��ʧ�ܣ��ͻ���ǩ����ʧ�ܣ���˼�¼�ţ�"+ysshjl[i]);
			return;
		}

		ls_sql="update crm_zxkhxx set ysshbz='C',ysshr=null,ysshsj=null,ysshyj=null,ysshdf=0";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_ysshjl set ysshbz='C',ysshr=null,ysshsj=null,ysshyj=null,jygq=null,jykgsj=null,jyjgsj=null,shdf=0";
		ls_sql+=" where ysshjl='"+ysshjl[i]+"'";
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
	out.print("<BR>����ʧ��,��������: " + e);
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