<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] jsjlh=request.getParameterValues("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String khbh=null;
		String lx=null;
		ls_sql="select khbh,lx";
		ls_sql+=" from  cw_sjsjsmx";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			lx=rs.getString("lx");

			ls_sql=" delete from cw_sjsjsmx ";
			ls_sql+=" where jsjlh='"+jsjlh+"' and khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			if (lx.equals("1"))//ǩ�����
			{
				ls_sql=" update crm_khxx set sjstcbl=null,qdsyjsje=null,sjsjsjlh=null,sjsjsbz='0'";
				ls_sql+=" where khbh='"+khbh+"' ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (lx.equals("2"))//�������
			{
				ls_sql=" update crm_khxx set sjswgtcbl=null,wgtcje=null,wgjsjlh=null,sjsjsbz='1'";
				ls_sql+=" where khbh='"+khbh+"' ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (lx.equals("3"))//��ƿͻ���һ�������ϸ
			{
				ls_sql=" update crm_khxx set sjfsctcbl=null,sjfsctcje=null,sjssjfjsbz='0'";
				ls_sql+=" where khbh='"+khbh+"' ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (lx.equals("4"))//��ƿͻ��ڶ��������ϸ
			{
				ls_sql=" update crm_khxx set sjfectcbl=null,sjfectcje=null,sjssjfjsbz='1'";
				ls_sql+=" where khbh='"+khbh+"' ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (lx.equals("5"))//ǩ���ͻ��˵�
			{
				ls_sql=" update crm_khxx set sjsjsbz='0'";
				ls_sql+=" where khbh='"+khbh+"' and sjsjsjlh is null ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				ls_sql=" update crm_khxx set sjsjsbz='1'";
				ls_sql+=" where khbh='"+khbh+"' and sjsjsjlh is not null ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				ls_sql=" update crm_khxx set sjsjsbz='2'";
				ls_sql+=" where khbh='"+khbh+"' and wgjsjlh is not null ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (lx.equals("6"))//��Ʒ��˵�
			{
				ls_sql=" update crm_khxx set sjssjfjsbz='0'";
				ls_sql+=" where khbh='"+khbh+"' and (sjfsctcbl is null OR sjfsctcbl=0)";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				ls_sql=" update crm_khxx set sjssjfjsbz='1'";
				ls_sql+=" where khbh='"+khbh+"' and sjfsctcbl is not null and sjfsctcbl!=0 ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				ls_sql=" update crm_khxx set sjssjfjsbz='2'";
				ls_sql+=" where khbh='"+khbh+"' and sjfectcbl is not null and sjfectcbl!=0 ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();

	
		ls_sql="delete from cw_sjsjsmx ";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
		ls_sql="delete from cw_sjsjsjl ";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>