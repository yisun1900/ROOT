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

String khbh=null;
String clzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		ls_sql="select khbh,clzt ";
		ls_sql+=" from jc_jjdd";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();
		if (!clzt.equals("17"))
		{
			conn.rollback();
			out.println("����ɾ��ʧ�ܣ�������"+ddbh[i]+"������״̬����ȷ");
			return;
		}

		ls_sql="update jc_jjdd set pdgc=null,pdgcmc=null,jjgys=null,jjppmc=null,xcmgc=null,xcmgcmc=null,xcmgys=null,xcmppmc=null,pgcr=null,pgcsj=null,pgcsm=null,clzt='15'";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_jjzjx set pdgc=null,pdgcmc=null,jjgys=null,jjppmc=null,xcmgc=null,xcmgcmc=null,xcmgys=null,xcmppmc=null";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	

		//���²�����Ϣ
		ls_sql="update cw_khfkjl set gysbh=null";
		ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh[i]+"' and scbz='N' and fklxbm='24'";//24���Ҿ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set zcgysbh=null";
		ls_sql+=" where khbh='"+khbh+"' and zcddbh='"+ddbh[i]+"' and scbz='N' and zckx='24'";//24���Ҿ�
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���ɶ���
		ls_sql="update jc_jcdd set pdgc=null,pdgcmc=null,gys=null,ppmc=null,pdgc1=null,pdgcmc1=null,gys1=null,ppmc1=null";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and lx='3'";//1��ľ�ţ�2������3���Ҿߣ�4������
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
	out.print("Exception: " + e);
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