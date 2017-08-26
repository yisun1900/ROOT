<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String ssfgs=null;
	String ysshbz=null;
	ls_sql="select ssfgs,ysshbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString(1);
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
	}
	rs.close();
	ps.close();


	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//�Ƿ�����Ԥ�����  Y�����ã�N��������
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y") && !ysshbz.equals("N") && !ysshbz.equals("M"))//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��
	{
		out.println("����������[Ԥ�����]�������ٵ��ۿ�");
		return;
	}

	/*��������Ƿ�ɹ�������������������������������������ʼ*/
	String kgxqthd="";
	if (!cxhdbm.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if (!cxhdbmxq.equals("") || !cxhdbmzh.equals(""))
			{
				out.println("<BR>���󣡣�����˾�����["+cxhdbm+"]���ɹ��������");
				return;
			}
		}
	}

	if (!cxhdbmxq.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmxq+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if ( (!cxhdbm.equals("�޻") && !cxhdbm.equals("")) || !cxhdbmzh.equals(""))
			{
				out.println("<BR>���󣡣���С�������["+cxhdbmxq+"]���ɹ��������");
				return;
			}
		}
	}

	if (!cxhdbmzh.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmzh+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1�����ɹ���2���ɹ���
		{
			if ((!cxhdbm.equals("�޻") && !cxhdbm.equals("")) || !cxhdbmxq.equals(""))
			{
				out.println("<BR>���󣡣���չ������["+cxhdbmzh+"]���ɹ��������");
				return;
			}
		}
	}
	/*��������Ƿ�ɹ���=====================================����*/


	//��ȡ��ͬ��ֵ����ͬ��ֵ�����̷ѣ������ѣ����������������;�ֵ����Ȩ���;�ֵ�����ʹ���ȯ
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ
	if (htjz<0)
	{
		out.println("���󣡺�ͬ��ֵΪ��ֵ��"+htjz);
		return;
	}

	
	conn.setAutoCommit(false);

	ls_sql="update crm_zxkhxx set cxhdbm=?,cxhdbmxq=?,cxhdbmzh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdbm);
	ps.setString(2,cxhdbmxq);
	ps.setString(3,cxhdbmzh);
	ps.executeUpdate();
	ps.close();


	dzbj.Tzk tzk=new dzbj.Tzk();
	//���ݴ���������¿ͻ��ۿ�
	tzk.updateHdZkl(conn,khbh,"yz");
	//���±����ۿ�
	tzk.updateBjZkl(conn,khbh,"yz");

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
	newdzbj.updateSfxm(conn,khbh,"yz");

	//��ȡ���ӱ��۽��
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();
	//�������ӱ��۴�����ۿۣ�������������������������������������


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
	out.print("<BR>SQL=" + ls_sql);
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