<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jcjlh=request.getParameterValues("jcjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jcjlh.length ;i++ )
	{
		String cfajlh="";
		String getclzt="";
		ls_sql="select cfajlh,clzt";
		ls_sql+=" from  gdm_gdjcjl";
		ls_sql+=" where jcjlh='"+jcjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cfajlh=cf.fillNull(rs.getString("cfajlh"));
			getclzt=cf.fillNull(rs.getString("clzt"));
		}
		rs.close();
		ps.close();

		if ( !getclzt.equals("7") && !getclzt.equals("8"))//1��δ���գ�2���ѽ��յȴ���������4���ѽ��յȴ����ֳ���6���ѳ��ֳ��ȴ���������7���ѳ������ȴ���ˣ�8���ѳ�����������ˣ�9���������ͨ����A���������δͨ����3���ѽ����B:�ط�δ�����5���᰸
		{
			conn.rollback();
			out.println("���󣡴���״̬����ȷ");
			return;
		}

		String ycfajlh="";
		ls_sql="select ycfajlh";
		ls_sql+=" from  gdm_zgfajl";
		ls_sql+=" where cfajlh='"+cfajlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ycfajlh=cf.fillNull(rs.getString("ycfajlh"));
		}
		rs.close();
		ps.close();


		ls_sql="delete from gdm_zgfajl  ";
		ls_sql+=" where cfajlh='"+cfajlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="update gdm_gdjcjl set jjfa=null,sjcfar=null,sjcfasj=null,jhjjsj=null,clzt=?,cfajlh=?";
		ls_sql+=" where jcjlh='"+jcjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"2");
		ps.setString(2,ycfajlh);
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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

