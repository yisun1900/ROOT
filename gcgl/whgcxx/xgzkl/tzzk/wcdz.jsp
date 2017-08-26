<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String yhdlm=(String)session.getAttribute("yhdlm");

String tzjlh=request.getParameter("tzjlh");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//����ۿ�
		zdmll=rs.getDouble("zdmll");//ǩ�����ë����
	}
	rs.close();
	ps.close();

	String zklx="";//1���������ۣ�2��������ۣ�3�����ַ��ô���
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_tzzkjl";
    ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");//�����ۿ�
		gcfqdzk=rs.getDouble("gcfqdzk");//���̷��ۿ�
	}
	rs.close();
	ps.close();

	String ysshbz="";
	String ssfgs="";
	ls_sql="select ysshbz,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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

 
	conn.setAutoCommit(false);

	dzbj.Tzk tzk=new dzbj.Tzk();
	//�����޸ģ����¿ͻ��ۿ�
	tzk.updateTzZkl(conn,tzjlh,khbh,"yz");
	//���±����ۿ�
	tzk.updateBjZkl(conn,khbh,"yz");

	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
	newdzbj.updateSfxm(conn,khbh,"yz");

	//��ȡ���ӱ��۽��
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();


	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//��ͬ��ֵ�����̷ѣ�����ҵ�������ѣ��������м���������;�ֵ�����ʹ���ȯ
	if (htjz<0)
	{
		conn.rollback();
		out.println("���󣡺�ͬ��ֵΪ��ֵ��"+htjz);
		return;
	}

	double  sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//ʩ���ɱ��ۣ�������ʩ���ɱ��ۣ�������ʩ���ɱ�������������ѡ�˰��
	
	double  mle=cf.round(htjz-sgcbj,2);//ë����=��ͬ��ֵ��ʩ���ɱ���

	double mll=0;
	if (htjz==0)
	{
		mll=100;
	}
	else{
		mll=cf.round(mle/htjz*100,2);//ë���ʣ�ë����º�ͬ��ֵ
	}


	//�ɱ��ۣ�ʩ���ɱ��ۣ����������������ѡ�˰��
	//ë���ʣ�����ͬ��ֵ���ɱ��ۣ��º�ͬ��ֵ
	String clzt="2";//1��δ��ɣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��

	if (kzdzfs.equals("1"))//1������ë���ʣ�2�������ۿ�
	{
		if (mll<zdmll || mll>100)
		{
			conn.rollback();

			clzt="3";
		}
		else{
			clzt="2";
		}
	}
	else if (kzdzfs.equals("2"))//1������ë���ʣ�2�������ۿ�
	{
		if (zklx.equals("1"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
		{
			if (zdzk<zdzkl)
			{

				conn.rollback();
				clzt="3";
			}
			else{
				clzt="2";
			}
		}
		else{
			if (gcfqdzk<zdzkl)
			{
				conn.rollback();
				clzt="3";
			}
			else{
				clzt="2";
			}
		}
	}


	ls_sql="update crm_tzzkjl set tzhmll=?,clzt=?";
	ls_sql+=" where khbh='"+khbh+"' and clzt not in('2','4','5')";//1��δ��ɣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,mll);
	ps.setString(2,clzt);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	if (clzt.equals("3"))
	{
		out.println("ֱ���޸��ۿ�ʧ�ܣ�������");
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

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