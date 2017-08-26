<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double pjde=0;
	ls_sql="select pjde ";
	ls_sql+=" from  kp_yzfdzpdcs";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pjde=rs.getDouble("pjde");//��һ��ȵ�ƽ������
	}
	rs.close();
	ps.close();

	String sgd=null;
	String getsgdjbbm="";
	ls_sql="select sgd,sgdjbbm";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where ssfgs='"+ssfgs+"' and sgdjbbm is not null and cxbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sgd=rs.getString("sgd");
		getsgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));

		String bzmc=null;
		String sgdjbbm="";
		ls_sql="select bzmc,sgdjbbm";
		ls_sql+=" from  sq_bzxx";
		ls_sql+=" where sgd='"+sgd+"' and tdbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			bzmc=rs1.getString("bzmc");
			sgdjbbm=cf.fillNull(rs1.getString("sgdjbbm"));
	
			double kjdzxz=0;
			double kjdzdz=0;
			
			if (getsgdjbbm.equals("A"))//���
			{
				if (sgdjbbm.equals("A"))//��������,�ӵ���>=2*ƽ������
				{
					kjdzxz=pjde*2;
					kjdzdz=pjde*1000;
				}
				else if (sgdjbbm.equals("B"))//���������,3*ƽ������>�ӵ���>=ƽ������
				{
					kjdzxz=pjde;
					kjdzdz=pjde*3;
				}
				else if (sgdjbbm.equals("C"))//�������ͨ,�ӵ��ƽ������
				{
					kjdzxz=0;
					kjdzdz=pjde;
				}
			}
			else if (getsgdjbbm.equals("B"))//����
			{
				if (sgdjbbm.equals("A"))//���㡢���,3*ƽ������>�ӵ���>=1.5*ƽ������
				{
					kjdzxz=pjde*1.5;
					kjdzdz=pjde*3;
				}
				else if (sgdjbbm.equals("B"))//���㡢����,2*ƽ������>�ӵ���>=ƽ������
				{
					kjdzxz=pjde;
					kjdzdz=pjde*2;
				}
				else if (sgdjbbm.equals("C"))//���㡢��ͨ,�ӵ���<ƽ������
				{
					kjdzxz=0;
					kjdzdz=pjde;
				}
			}
			else if (getsgdjbbm.equals("C"))//��ͨ
			{
				if (sgdjbbm.equals("A"))//��ͨ�����
				{
				}
				else if (sgdjbbm.equals("B"))//��ͨ������,1.5*ƽ������>�ӵ���>=ƽ������
				{
					kjdzxz=pjde;
					kjdzdz=pjde*1.5;
				}
				else if (sgdjbbm.equals("C"))//��ͨ����ͨ,�ӵ���<ƽ������
				{
					kjdzxz=0;
					kjdzdz=pjde;
				}
			}
			
			ls_sql="update sq_bzxx set kjdzxz=?,kjdzdz=? ";
			ls_sql+=" where sgd='"+sgd+"' and bzmc='"+bzmc+"' and sgdjbbm is not null";
			ps2= conn.prepareStatement(ls_sql);
			ps2.setDouble(1,kjdzxz);
			ps2.setDouble(2,kjdzdz);
			ps2.executeUpdate();
			ps2.close();
		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

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
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>