<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String khbjjbbm=cf.GB2Uni(request.getParameter("khbjjbbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String sjsfycx=cf.GB2Uni(request.getParameter("sjsfycx"));

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


	String getzxzt=null;//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1��δ��ɣ�2����ɣ�3��ҵ����ת
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("���󣡿ͻ���ǩ�����������޸ı���");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("���󣡿ͻ�ǩ��ʧ�ܣ��������޸ı���");
		return;
	}

	int count=0;

	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	ls_sql="select bjbbh,ssfgs,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	//�ײ�������������
	int sjslmax=0;
	ls_sql="select sl";
	ls_sql+=" from  bj_tcsjslxz";
	ls_sql+=" where fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjslmax=rs.getInt("sl");
	}
	rs.close();
	ps.close();


	String getsjsfycx=null;
	String cxkssj=null;
	String cxjssj=null;
	double sjcj=0;
	double cxsjcj=0;

	ls_sql="SELECT sjsfycx,sjcj,cxsjcj,cxkssj,cxjssj";
	ls_sql+=" FROM bj_tcsjcjb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+khbjjbbm+"' and bjjbbm1='"+bjjbbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsjsfycx=cf.fillNull(rs.getString("sjsfycx"));
		sjcj=rs.getDouble("sjcj");
		cxsjcj=rs.getDouble("cxsjcj");
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
	}
	rs.close();
	ps.close();

	if (getsjsfycx==null)
	{
		out.println("����û��������ۣ�����ϵ����Ա:"+ls_sql);
		return;
	}

	if (getsjsfycx.equals("2") || getsjsfycx.equals("3"))//�ж��Ƿ����
	{
		if (cxkssj.compareTo(cf.today())>0)//δ��ʼ
		{
			getsjsfycx="1";
		}

		if (cxjssj.compareTo(cf.today())<0)//�ѽ���
		{
			getsjsfycx="1";
		}
	}

 	if (getsjsfycx.equals("3"))//1���޴�����2�����������ƴ�����3�����������ƴ���
	{
		if (sjsfycx.equals(bjjbbm))//��ʾ�ͻ�ѡ�����Ż�
		{
			sjsfycx="3";//1���޴�����2�����������ƴ�����3�����������ƴ���
		}
		else
		{
			sjsfycx="1";
		}
	}
	else{
		sjsfycx=getsjsfycx;
	}

 
	if (sjsfycx.equals("2") || sjsfycx.equals("3"))//�д�����ȡ�����������
	{
		sjcj=cxsjcj;
	}

	conn.setAutoCommit(false);

	//ɾ����ѡ����
	ls_sql=" delete from  bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�ͻ�Ʒ��������۱�bj_khppsjcjb��
	ls_sql=" delete from bj_khppsjcjb "; 
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" and tccplbbm in(select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update  bj_khzcxmxj set bjjbbm='"+bjjbbm+"',sjsfycx='"+sjsfycx+"'";
	ls_sql+=" ,sjsl=0,sjjshsl=0,sjsfsl=0,sjcj="+sjcj+",sjsfje=0";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update  bj_khzcxmxj set sjcj=0,sjsfycx='1'";//1���޴�����2�����������ƴ�����3�����������ƴ���
	ls_sql+=" where khbh='"+khbh+"' and sfyxsj='N'";//�����Ƿ��շ�  Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	
	int cxsl=0;
	ls_sql="select count(distinct tcsjflbm)";
	ls_sql+=" from  bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and sjsfycx='3'";//1���޴�����2�����������ƴ�����3�����������ƴ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (cxsl>sjslmax)
	{
		conn.rollback();
		out.println("�������ͬʱ��["+sjslmax+"��]�����������ۿۣ�Ŀǰ�ͻ�����["+cxsl+"]���������ۣ��ѳ�������");
		return;
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs2!= null) rs2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>