<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String djbh=null;
String hfdjbz=null;
String ydjbh=null;
String yhfdjbz=null;
String ydjyy=null;
java.sql.Date ydjsj=null;
String ydjr=null;
java.sql.Date yjhjdsj=null;
java.sql.Date ysjjdsj=null;
String yjdr=null;
String gcsfxhf=null;
java.sql.Date gchfrq=null;
String gchflxbm=null;

String tsjlh=null;
String tssfxhf=null;
java.sql.Date tshfsj=null;

try {
	conn=cf.getConnection();


	ls_sql="select djbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		djbh=rs.getString("djbh");
	}
	rs.close();
	ps.close();

	ls_sql="select hfdjbz,ydjbh,yhfdjbz,ydjyy,ydjsj,ydjr,yjhjdsj,ysjjdsj,yjdr,gcsfxhf,gchfrq,gchflxbm";
	ls_sql+=" from  crm_hfdjjl";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdjbz=rs.getString("hfdjbz");
		ydjbh=rs.getString("ydjbh");
		yhfdjbz=rs.getString("yhfdjbz");
		ydjyy=rs.getString("ydjyy");
		ydjsj=rs.getDate("ydjsj");
		ydjr=rs.getString("ydjr");
		yjhjdsj=rs.getDate("yjhjdsj");
		ysjjdsj=rs.getDate("ysjjdsj");
		yjdr=rs.getString("yjdr");
		gcsfxhf=rs.getString("gcsfxhf");
		gchfrq=rs.getDate("gchfrq");
		gchflxbm=rs.getString("gchflxbm");
	}
	else{
		out.println("���󣡲����ڵĻطö����¼");
		return;
	}
	rs.close();
	ps.close();

	
	conn.setAutoCommit(false);

	//ɾ���طö����¼
	ls_sql="delete from crm_hfdjjl ";
	ls_sql+=" where  djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	//�޸Ŀͻ���Ϣ��
	ls_sql =" update  crm_khxx";
	ls_sql+=" set djbh=?,hfdjbz=?,djyy=?,djsj=?,djr=?,jhjdsj=?,sjjdsj=?,jdr=?,sfxhf=?,hfrq=?,hflxbm=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ydjbh);
	ps.setString(2,yhfdjbz);
	ps.setString(3,ydjyy);
	ps.setDate(4,ydjsj);
	ps.setString(5,ydjr);
	ps.setDate(6,yjhjdsj);
	ps.setDate(7,ysjjdsj);
	ps.setString(8,yjdr);
	ps.setString(9,gcsfxhf);
	ps.setDate(10,gchfrq);
	ps.setString(11,gchflxbm);
	ps.executeUpdate();
	ps.close();

	if (hfdjbz.equals("2") || hfdjbz.equals("3"))//1�����̻طö��᣻2��Ͷ�߱��޻طö��᣻3��ȫ������
	{
		if (yhfdjbz.equals("2") || yhfdjbz.equals("3"))//1�����̻طö��᣻2��Ͷ�߱��޻طö��᣻3��ȫ������
		{
			yhfdjbz="Y";
		}
		else{
			yhfdjbz="N";
		}

		ls_sql="select tsjlh,tssfxhf,tshfsj";
		ls_sql+=" from  crm_tshfdjjl";
		ls_sql+=" where  djbh='"+djbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			tsjlh=rs1.getString("tsjlh");
			tssfxhf=rs1.getString("tssfxhf");
			tshfsj=rs1.getDate("tshfsj");

			//�����������Ͷ�߱���
			ls_sql =" update  crm_tsjl";
			ls_sql+=" set djbh=?,hfdjbz=?,djyy=?,djsj=?,djr=?,jhjdsj=?,sjjdsj=?,jdr=?,sfxhf=?,hfsj=? ";
			ls_sql+=" where tsjlh='"+tsjlh+"'";//3���᰸
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ydjbh);
			ps.setString(2,yhfdjbz);
			ps.setString(3,ydjyy);
			ps.setDate(4,ydjsj);
			ps.setString(5,ydjr);
			ps.setDate(6,yjhjdsj);
			ps.setDate(7,ysjjdsj);
			ps.setString(8,yjdr);

			ps.setString(9,tssfxhf);
			ps.setDate(10,tshfsj);

			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();

		//ɾ���طö����¼
		ls_sql="delete from crm_tshfdjjl ";
		ls_sql+=" where  djbh='"+djbh+"'";
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
	out.print("����ʧ��,��������: " + e);
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