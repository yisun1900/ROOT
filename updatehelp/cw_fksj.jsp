<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	String fkxh=null;
	String khbh=null;
	String glxh=null;
	String sksjstr=null;
	ls_sql="select fkxh,khbh,glxh,sksj";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where scbz='N' and skdd='2' and dsksjbz='Y' and gljlbz='N'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		fkxh=rs1.getString("fkxh");
		khbh=rs1.getString("khbh");
		glxh=rs1.getString("glxh");
		sksjstr=rs1.getString("sksj");



		ls_sql="update cw_khfkjl set sksj=sjsj,bz=bz||'�������տ�ʱ�䣺"+sksjstr+"' ";
		ls_sql+=" where  (fkxh='"+fkxh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (glxh!=null)
		{
			ls_sql="update cw_khfkjl set sksj=sjsj,bz=bz||'�������տ�ʱ�䣺"+sksjstr+"' ";
			ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		java.sql.Date getjzkfksj=null;//��װ����տ�ʱ��
		java.sql.Date getjzkscsj=null;//�״θ���װ��ʱ��
		ls_sql="select max(sksj),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			getjzkfksj=rs.getDate(1);
			getjzkscsj=rs.getDate(2);
		}
		rs.close();
		ps.close();


		//���£����̿�ʵ�տ��ʡ����̿�ʵ�տ��
		ls_sql="update crm_khxx set jzkfksj=?,jzkscsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,getjzkfksj);
		ps.setDate(2,getjzkscsj);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();



	
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
	out.print("Exception: " + e);
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