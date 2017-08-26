<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String spbz=null;
		ls_sql="select spbz";
		ls_sql+=" from  crm_dzyhsq";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			spbz=rs.getString("spbz");
		}
		rs.close();
		ps.close();

		if (spbz.equals("1"))//1��δ������2��������
		{
			conn.rollback();
			out.println("����δ����");
			return;
		}

		ls_sql="update crm_dzyhsq set spbz='1',spr=null,spsj=null,spjg=null,spsm=null,spzkl=null,spzjxzkl=null,sfpzqtyh=null,pzqtyhnr=null";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set spzkl=null,zjxzkl=null,sfpzqtyh=null,pzqtyhnr=null,zklx=null ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_dxdzyh set spdxzkl=sqdxzkl ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_sfxmmx set dxzkl=10 ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//��ʼ��
		dzbj.Dzbj dzbj=new dzbj.Dzbj();
		//���������շ���Ŀ�������շѰٷֱ�
		dzbj.updateSfxm(conn,khbh[i],"yz");
		//��ȡ���ӱ��۽��
		double dzbjze=dzbj.getAllBjje(conn,khbh[i],"yz");

		//�޸ģ����ӱ����ܶ�
		ls_sql="update crm_zxkhxx set dzbjze=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>