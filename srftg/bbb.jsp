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
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	ls_sql =" select distinct khbh";
	ls_sql+=" from bj_sfxmmx";
	ls_sql+=" where sfxmmc like '%����˰��%'";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		khbh=rs2.getString("khbh");


		String zjxxh="";
		String ssfgs=null;
		ls_sql="select crm_khxx.zjxxh,crm_khxx.khbh,crm_khxx.fgsbh";
		ls_sql+=" from  crm_khxx,crm_khqye ";
		ls_sql+=" where  crm_khxx.khbh=crm_khqye.khbh ";
		ls_sql+=" and  crm_khxx.khbh='"+khbh+"'";
//		ls_sql+=" and  crm_khxx.cxhdbm not in('����2000��4000','����2000��4000(�˸���9.5��,ˮ�粻���ۣ�')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			zjxxh=cf.fillNull(rs1.getString("zjxxh"));
			khbh=rs1.getString("khbh");
			ssfgs=rs1.getString("fgsbh");

			double yjjzcs=100;

			ls_sql="SELECT yjjzcs";
			ls_sql+=" FROM sq_dwxx";
			ls_sql+=" where dwbh='"+ssfgs+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjjzcs=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			/*
			ls_sql="SELECT yjjzcs";
			ls_sql+=" FROM crm_khqye";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjjzcs=rs.getDouble(1);
			}
			rs.close();
			ps.close();
			*/


			//��ȡ���ӱ��۽��
			dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();


			double sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
			

			double cbj=dzbjje.getCbj(conn,khbh,"yz");//�ɱ��ۣ�������ɱ��ۣ�������ɱ�������������ѡ�˰��
			double gcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//���̻������ۣ�������̻������ۣ�������̻������ۣ�����������ѡ�˰��
			
			ls_sql="update crm_khqye set  sgcbj=? ,cbj=?  ,gcjcbj=?  ";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sgcbj);
			ps.setDouble(2,cbj);
			ps.setDouble(3,gcjcbj);
			ps.executeUpdate();
			ps.close();

			if (zjxxh.equals(""))
			{
				ls_sql="update crm_khqye set zxsgcbj=sgcbj ,zxcbj=cbj,zxgcjcbj=gcjcbj ";
				ls_sql+=" where  khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				//��ʼ��
				dzbj.Zjx zjx=new dzbj.Zjx();

				double zxcbj=zjx.getCbj(conn,khbh,zjxxh,"yz");//�ɱ��ۣ�������ɱ��ۣ�������ɱ�������������ѡ�˰��
				double zxgcjcbj=zjx.getGcjcbj(conn,khbh,zjxxh,"yz");//���̻������ۣ�������̻������ۣ�������̻������ۣ�����������ѡ�˰��

				double zxsgcbj=zjx.getSgcbj(conn,khbh,zjxxh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
				
			
				ls_sql="update crm_khqye set  zxsgcbj=? ,zxcbj=?,zxgcjcbj=? ";
				ls_sql+=" where  khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,zxsgcbj);
				ps.setDouble(2,zxcbj);
				ps.setDouble(3,zxgcjcbj);
				ps.executeUpdate();
				ps.close();
			}



		}
		rs1.close();
		ps1.close();
 	}
	rs2.close();
	ps2.close();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
//	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>