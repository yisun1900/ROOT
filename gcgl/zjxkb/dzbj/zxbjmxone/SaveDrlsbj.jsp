<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=request.getParameter("khbh");
String bjjb=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
String dqbm=request.getParameter("dqbm");
String mbmc=cf.GB2Uni(request.getParameter("sclsbjmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
int count=0;
String xmbh=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: �ɵ����δͨ����3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	String zklx="";
	double spzkl=10;
	ls_sql="SELECT zxzt,zklx,spzkl";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		zklx=cf.fillNull(rs.getString("zklx"));
		spzkl=rs.getDouble("spzkl");
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


	//�ͻ�������ۿ�
	double qdhdzk=10;
	double glfzk=10;
	ls_sql="select qdhdzk,glfzk ";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
	}
	rs.close();
	ps.close();

	ls_sql=" select count(*)";
	ls_sql+=" from bj_mbbjxmmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"' and bjjb!='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("����[��ʱ����]��[�ÿͻ�]�ı��ۼ���һ��");
		return;
	}


	conn.setAutoCommit(false);


	ls_sql=" delete from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_dwgclzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_zcbjmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//������Ϣ
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao) ";
	ls_sql+=" select khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao";
	ls_sql+=" from bj_mbfjxx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ģ�幤������ϸ
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
	ls_sql+=" select khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh";
	ls_sql+=" from bj_mbgclmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//ģ�������շ���Ŀ��ϸ
	ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje  ,bz)";
	ls_sql+=" select               khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,10   ,10     ,zqsfje,bz";
	ls_sql+=" from bj_mbsfxmmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//����ȡ�������ۿۡ�
	if (zklx.equals("1"))
	{
		ls_sql="update bj_sfxmmx set dxzkl=?,sfje=zqsfje*cxhdzkl/10*?/10.0";
		ls_sql+=" where khbh='"+khbh+"' and sflx!='3'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,spzkl);
		ps.setDouble(2,spzkl);
		ps.executeUpdate();
		ps.close();
	}
	else if (zklx.equals("2"))
	{
		//����ȡ�������ۿۡ�
		String sfxmbm=null;
		ls_sql=" select khbh,sfxmbm";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			sfxmbm=rs1.getString("sfxmbm");

			double spdxzkl=10;
			ls_sql="select spdxzkl";
			ls_sql+=" from  crm_dxdzyh,crm_dzyhsq";
			ls_sql+=" where crm_dxdzyh.khbh=crm_dzyhsq.khbh and crm_dxdzyh.khbh='"+khbh+"' and sfxmbm='"+sfxmbm+"' and spbz='2'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				spdxzkl=rs.getDouble("spdxzkl");
			}
			rs.close();
			ps.close();
		
			ls_sql="update bj_sfxmmx set dxzkl=?,sfje=zqsfje*cxhdzkl/10*?/10.0";
			ls_sql+=" where khbh='"+khbh+"' and sfxmbm='"+sfxmbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,spdxzkl);
			ps.setDouble(2,spdxzkl);
			ps.executeUpdate();
			ps.close();
		
		}
		rs1.close();
		ps1.close();
	}


	//�ͻ�������ۿۣ���������������������������������
	ls_sql="update bj_sfxmmx set cxhdzkl=?,sfje=zqsfje*dxzkl/10*?/10.0";
	ls_sql+=" where khbh='"+khbh+"' and sflx='5'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,glfzk);
	ps.setDouble(2,glfzk);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmx set cxhdzkl=?,sfje=zqsfje*dxzkl/10*?/10.0";
	ls_sql+=" where khbh='"+khbh+"' and sflx not in('3','5')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,qdhdzk);
	ps.setDouble(2,qdhdzk);
	ps.executeUpdate();
	ps.close();
	//�ͻ�������ۿۣ�������������������������������������

	

	//ģ�������շ���Ŀ��ϸ
	ls_sql="insert into bj_zcbjmx (xh,khbh,zcmc,jldwbm,dj,sl,je,bz)";
	ls_sql+=" select xh,khbh,zcmc,jldwbm,dj,sl,je,bz";
	ls_sql+=" from bj_mbzcbjmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	//������Ŀ��ϸ

	ls_sql="insert into bj_bjxmmx(xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bz,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx,sfzgzc)";
	ls_sql+=" select "+xh+"+rownum,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,bz,bjjb,dqbm,bjlx,jzbz,xmlx,ckxm,sfxycl,xmpx,sfzgzc ";
	ls_sql+=" from bj_mbbjxmmx ";
	ls_sql+=" where mbmc='"+mbmc+"' and khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"hmy");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,khbh,"hmy");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	double zcbjje=0;
	ls_sql="SELECT sum(je)";
	ls_sql+=" FROM bj_zcbjmx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcbjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
		
	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set zcbjje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zcbjje);
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
	out.print("����ʧ��,��������: " + e);
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>