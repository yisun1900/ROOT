<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String sql=null;
//get����cUserID��cPassword
String yhdlm=request.getParameter("yhdlm").trim();
String yhkl=request.getParameter("yhkl").trim();

//�Ƿ�Ͷ�߱���������
String gzrq=new Date(System.currentTimeMillis()).toString();//��������
String ip=request.getRemoteHost();

String kdlbz="";
String hth="";
String sfzhm="";
String khbh="";
String getYhkl="";
String yhmc="";

int logonvalue=0;
//��ѯ�û���½��Ϣ

try {
	conn=cf.getConnection();   //�õ�����
//	out.println("<BR>conn="+conn);

//����������ӵ�����2006-04-21

	sql="select khxm,yhkl,kdlbz,hth,khbh";//��ͬ��Ϊ�û���
	sql+=" from crm_khxx";
	sql+=" WHERE  crm_khxx.yhdlm='"+yhdlm+ "'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())//�û�����
	{
		getYhkl=cf.fillNull(rs.getString("yhkl")).trim();
		yhmc=cf.fillNull(rs.getString("khxm")).trim();
		kdlbz=cf.fillNull(rs.getString("kdlbz")).trim();
		hth=cf.fillNull(rs.getString("hth")).trim();
		khbh=cf.fillNull(rs.getString("khbh")).trim();

		//��֤�����Ƿ���ȷ
		
		if (getYhkl.equals(yhkl) && !kdlbz.equals("02") )
		{//������ȷ

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'1',?,?,SYSDATE) ";//���û�����½��2����ͬ�ŵ�½��3�������ȷ��4�����֤�Ų���ȷ��5���û���½��������
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,cf.GB2Uni(yhdlm));
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			
			session.setAttribute("yhdlm",yhdlm);
			session.setAttribute("hth",hth);
			session.setAttribute("khbh",khbh);
			session.setAttribute("yhmc",yhmc);
			session.setAttribute("zgsmc","�����ڴ�");//��˾����ʾ����
			response.sendRedirect("khhdpt.html");

			return;
		}
		else
		{

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'3',?,?,SYSDATE) ";//���û�����½��2����ͬ�ŵ�½��3�������ȷ��4�����֤�Ų���ȷ��5���û���½��������
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,yhdlm);
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			%>
			<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
			<TR><TD WIDTH="253"></TD><TD WIDTH="385">
			<table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
			  <TR>
				<TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[ϵͳ��ʾ]</strong></font></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="51"><div align="center">�û������벻��ȷ!!</div></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
					<input type="button"  value="����" onClick="window.history.back()">
				  </div></TD>
			  </TR>
			  </TABLE>
			  </TD><TD WIDTH="339"></TD>
			  <TR>
			</TABLE>
			<%

			return;
			
		}
	}
	rs.close();
	ps.close();


	sql="select khxm,yhkl,kdlbz,hth,khbh,sfzhm";//��ͬ��Ϊ�û���
	sql+=" from crm_khxx";
	sql+=" WHERE  crm_khxx.hth='"+yhdlm+ "'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())//�û�����
	{
		getYhkl=cf.fillNull(rs.getString("sfzhm")).trim();
		yhmc=cf.fillNull(rs.getString("khxm")).trim();
		kdlbz=cf.fillNull(rs.getString("kdlbz")).trim();
		hth=cf.fillNull(rs.getString("hth")).trim();
		khbh=cf.fillNull(rs.getString("khbh")).trim();

		//��֤�����Ƿ���ȷ
		
		if (getYhkl.equals(yhkl) && !kdlbz.equals("02") )
		{//������ȷ

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'2',?,?,SYSDATE) ";//���û�����½��2����ͬ�ŵ�½��3�������ȷ��4�����֤�Ų���ȷ��5���û���½��������
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,yhdlm);
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			sql="update crm_khxx set yhkl='"+yhkl+"',yhdlm='"+yhdlm+"' where khbh='"+khbh+"'";
			ps1= conn.prepareStatement(sql);
			ps1.executeUpdate();
			ps1.close();


			session.setAttribute("yhdlm",yhdlm);
			session.setAttribute("hth",hth);
			session.setAttribute("khbh",khbh);
			session.setAttribute("yhmc",yhmc);
			session.setAttribute("zgsmc","�����ڴ�");//��˾����ʾ����
			response.sendRedirect("khhdpt.html");

			return;
		}
		else
		{

			sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
			sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'4',?,?,SYSDATE) ";//���û�����½��2����ͬ�ŵ�½��3�������ȷ��4�����֤�Ų���ȷ��5���û���½��������
			ps1= conn.prepareStatement(sql);
			ps1.setString(1,ip);
			ps1.setString(2,yhdlm);
			ps1.setString(3,yhkl);
			ps1.setString(4,khbh);
			ps1.setString(5,yhmc);
			ps1.executeUpdate();
			ps1.close();

			%>
			<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
			<TR><TD WIDTH="253"></TD><TD WIDTH="385">
			<table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
			  <TR>
				<TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[ϵͳ��ʾ]</strong></font></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="51"><div align="center">�û������벻��ȷ!!</div></TD>
			  </TR>
			  <TR>
				<TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
					<input type="button"  value="����" onClick="window.history.back()">
				  </div></TD>
			  </TR>
			  </TABLE>
			  </TD><TD WIDTH="339"></TD>
			  <TR>
			</TABLE>
			<%

			return;
			
		}
	}
	else{

		sql="insert into hd_xtrz ( xh,ip,yhdlm,yhkl,dlqk,khbh,khxm,dlsj ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from hd_xtrz),?,?,?,'5',?,?,SYSDATE) ";//���û�����½��2����ͬ�ŵ�½��3�������ȷ��4�����֤�Ų���ȷ��5���û���½��������
		ps1= conn.prepareStatement(sql);
		ps1.setString(1,ip);
		ps1.setString(2,yhdlm);
		ps1.setString(3,yhkl);
		ps1.setString(4,khbh);
		ps1.setString(5,yhmc);
		ps1.executeUpdate();
		ps1.close();

		%>
		<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
		<TR><TD WIDTH="253"></TD><TD WIDTH="385">
		<table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
		  <TR>
			<TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[ϵͳ��ʾ]</strong></font></TD>
		  </TR>
		  <TR>
			<TD width="100%" height="51"><div align="center">�û������벻��ȷ!!</div></TD>
		  </TR>
		  <TR>
			<TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
				<input type="button"  value="����" onClick="window.history.back()">
			  </div></TD>
		  </TR>
		  </TABLE>
		  </TD><TD WIDTH="339"></TD>
		  <TR>
		</TABLE>
		<%
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}

%>


