<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String xcmgc=cf.GB2Uni(request.getParameter("xcmgc"));
String pgcr=cf.GB2Uni(request.getParameter("pgcr"));
String pgcsm=cf.GB2Uni(request.getParameter("pgcsm"));
java.sql.Date pgcsj=null;

ls=request.getParameter("pgcsj");
try{
	if (!(ls.equals("")))  pgcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pgcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɵ�ʱ��]����ת����������:"+e);
	return;
}


String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String khbh=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,khbh";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("17"))
	{
		out.println("�����󣬴���״̬����ȷ");
		return;
	}

	String pdgcmc=null;
	String jjppmc=null;
	String jjgys=null;
	if (!pdgc.equals(""))
	{
		ls_sql="select gysmc,ppmc,gys";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where  gysbh='"+pdgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pdgcmc=rs.getString("gysmc");
			jjppmc=rs.getString("ppmc");
			jjgys=rs.getString("gys");
		}
		rs.close();
		ps.close();

		if (pdgcmc==null)
		{
			out.println("������ʧ�ܣ�[�Ҿ߹�������]Ϊ�ա�");
			return;
		}
		if (jjppmc==null)
		{
			out.println("������ʧ�ܣ�[�Ҿ�Ʒ��]Ϊ�ա�");
			return;
		}
		if (jjgys==null)
		{
			out.println("������ʧ�ܣ�[�Ҿ߹�Ӧ��]Ϊ�ա�");
			return;
		}
	}

	String xcmgcmc=null;
	String xcmppmc=null;
	String xcmgys=null;
	if (!xcmgc.equals(""))
	{
		ls_sql="select gysmc,ppmc,gys";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where  gysbh='"+xcmgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xcmgcmc=rs.getString("gysmc");
			xcmppmc=rs.getString("ppmc");
			xcmgys=rs.getString("gys");
		}
		rs.close();
		ps.close();

		if (xcmgcmc==null)
		{
			out.println("������ʧ�ܣ�[�Ͳ��Ź�������]Ϊ�ա�");
			return;
		}
		if (xcmppmc==null)
		{
			out.println("������ʧ�ܣ�[�Ͳ���Ʒ��]Ϊ�ա�");
			return;
		}
		if (xcmgys==null)
		{
			out.println("������ʧ�ܣ�[�Ͳ��Ź�Ӧ��]Ϊ�ա�");
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_jjdd set pdgc=?,pdgcmc=?,jjgys=?,jjppmc=?,xcmgc=?,xcmgcmc=?,xcmgys=?,xcmppmc=?,pgcr=?,pgcsj=?,pgcsm=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='17'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,jjgys);
	ps.setString(4,jjppmc);
	ps.setString(5,xcmgc);
	ps.setString(6,xcmgcmc);
	ps.setString(7,xcmgys);
	ps.setString(8,xcmppmc);
	ps.setString(9,pgcr);
	ps.setDate(10,pgcsj);
	ps.setString(11,pgcsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_jjzjx set pdgc=?,pdgcmc=?,jjgys=?,jjppmc=?,xcmgc=?,xcmgcmc=?,xcmgys=?,xcmppmc=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,jjgys);
	ps.setString(4,jjppmc);
	ps.setString(5,xcmgc);
	ps.setString(6,xcmgcmc);
	ps.setString(7,xcmgys);
	ps.setString(8,xcmppmc);
	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="update jc_jcdd set pdgc=?,pdgcmc=?,gys=?,ppmc=?,pdgc1=?,pdgcmc1=?,gys1=?,ppmc1=?";
	ls_sql+=" where  ddbh='"+ddbh+"' and lx='3'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgc);
	ps.setString(2,pdgcmc);
	ps.setString(3,jjgys);
	ps.setString(4,jjppmc);
	ps.setString(5,xcmgc);
	ps.setString(6,xcmgcmc);
	ps.setString(7,xcmgys);
	ps.setString(8,xcmppmc);
	ps.executeUpdate();
	ps.close();

	if (pdgcmc==null || pdgcmc.equals(""))
	{
		pdgcmc=xcmgcmc;
	}

	//���²�����Ϣ
	ls_sql="update cw_khfkjl set gysbh=?";
	ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and scbz='N' and fklxbm='24'";//24���Ҿ�
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgcmc);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_khfkjl set zcgysbh=?";
	ls_sql+=" where khbh='"+khbh+"' and zcddbh='"+ddbh+"' and scbz='N' and zckx='24'";//24���Ҿ�
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdgcmc);
	ps.executeUpdate();
	ps.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>