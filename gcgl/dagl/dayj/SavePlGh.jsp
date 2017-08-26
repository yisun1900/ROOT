<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");


String[] jlh=request.getParameterValues("jlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<jlh.length ;i++ )
	{
		String khbh=null;
		String damxbm=null;
		String zt=null;
		ls_sql="select khbh,damxbm,zt";
		ls_sql+=" from crm_gcdayjjl";
		ls_sql+=" where jlh='"+jlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			damxbm=cf.fillNull(rs.getString("damxbm"));
			zt=cf.fillNull(rs.getString("zt"));
		}
		rs.close();
		ps.close();

		if (!zt.equals("1"))//1�������2���鷵
		{
			conn.rollback();
			out.println("���󣡿ͻ���"+khbh+"�������ѹ黹:"+damxbm);
			return;
		}


		ls_sql="update crm_gcdayjjl set ghlrr=?,ghlrrssbm=?,ghlrsj=TRUNC(SYSDATE),zt='2'";
		ls_sql+=" where jlh='"+jlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
		ps.setString(2,dwbh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_gcdagl set bgr='"+yhmc+"', bgrdw='"+dwbh+"',bgrfgs='"+ssfgs+"',bgsj=TRUNC(SYSDATE),gdbz='Y'";//Y���鵵��N��δ�鵵
		ls_sql+=" where khbh='"+khbh+"' and damxbm='"+damxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from crm_gcdagl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and gdbz='N'";//Y���鵵��N�����
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String dalqbz="";
		if (count>0)
		{
			dalqbz="4";//1��δ��������2���ѽ�������3���ѹ鵵��4�����
		}
		else{
			dalqbz="3";
		}

		ls_sql="update crm_khxx set dalqbz='"+dalqbz+"'";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
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
	out.print("����ʧ��,��������: " + e );
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