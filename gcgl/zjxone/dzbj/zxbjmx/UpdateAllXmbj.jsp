<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String bjjb=null;
String xmbh=null;
String ckxm=null;
String bjlx=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqbm=null;

double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
String gycl=null;
String bz=null;

double zcf=0;
double clf=0;
double rgf=0;
double jjf=0;
double glfbl=0;


try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
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


	conn.setAutoCommit(false);

	//���±���

	//������Ŀ��ϸ
	ls_sql="select bj_bjxmmx.xmbh,bj_jzbjb.ckxm,bj_jzbjb.bjlx,bj_jzbjb.xmmc,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_bjxmmx.dqbm,bj_jzbjb.clbj,bj_jzbjb.rgbj,bj_jzbjb.jxbj,bj_jzbjb.bj,bj_jzbjb.gycl,bj_jzbjb.bz";
	ls_sql+=" from  bj_bjxmmx,bj_jzbjb";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.bjjb=bj_jzbjb.bjjbbm and bj_bjxmmx.xmbh=bj_jzbjb.xmbh and bj_bjxmmx.dqbm=bj_jzbjb.dqbm";
	ls_sql+=" order by bj_bjxmmx.xh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmbh=rs1.getString("xmbh");
		ckxm=rs1.getString("ckxm");
		bjlx=rs1.getString("bjlx");
		xmmc=rs1.getString("xmmc");
		xmdlbm=rs1.getString("xmdlbm");
		xmxlbm=rs1.getString("xmxlbm");
		dqbm=rs1.getString("dqbm");

		clbj=rs1.getDouble("clbj");
		rgbj=rs1.getDouble("rgbj");
		jxbj=rs1.getDouble("jxbj");
		bj=rs1.getDouble("bj");
		gycl=cf.fillNull(rs1.getString("gycl"));
		bz=cf.fillNull(rs1.getString("bz"));

		ls_sql="update bj_bjxmmx";
		ls_sql+=" set cldj="+clbj+",rgdj="+rgbj+",jxdj="+jxbj+",dj="+bj+",gycl='"+gycl+"',bz='"+bz+"'";
		ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}
	rs1.close();
	ps1.close();


	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"hmy");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,khbh,"hmy");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

