<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String fgsbh=request.getParameter("fgsbh");
String tcmc=cf.GB2Uni(request.getParameter("sctcmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;

int count=0;
String xmbh=null;
String bjjb=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString(1);
	}
	rs.close();
	ps.close();


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


	//������Ϣ
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,xuhao) ";
	ls_sql+=" select '"+khbh+"',jgwzbm,xuhao";
	ls_sql+=" from bj_tcfjxx ";
	ls_sql+=" where tcmc='"+tcmc+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��������ϸ
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
	ls_sql+=" select '"+khbh+"',dqbm,xmbh,jgwzbm,sl,sl,0,'N',fjnxh";
	ls_sql+=" from bj_tcgclmx ";
	ls_sql+=" where tcmc='"+tcmc+"' and fgsbh='"+fgsbh+"'";
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

	ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,gycl,dqbm,bjjb,bjlx,xmlx,cbenj,sgdbj,jzbz,ckxm,xmpx,sfxycl,tcxm ) ";
	ls_sql+=" select "+xh+"+rownum,'"+khbh+"',bj_tcbjxmmx.xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,gycl,bj_tcbjxmmx.dqbm,'"+bjjb+"',bjlx,'1',cbenj,sgdbj,'1',ckxm,bj_tcbjxmmx.xmpx,'2','1'";//1����Ҫ��2������Ҫ,1���ײ���Ŀ��2�����ײ���Ŀ
	
	ls_sql+=" from bj_tcbjxmmx,bj_jzbjb ";
	ls_sql+=" where bj_tcbjxmmx.tcmc='"+tcmc+"' and bj_tcbjxmmx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and bj_tcbjxmmx.xmbh=bj_jzbjb.xmbh and bj_tcbjxmmx.dqbm=bj_jzbjb.dqbm";
	ls_sql+=" and bj_jzbjb.bjjbbm='"+bjjb+"'";
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
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?,tcmc=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.setString(2,tcmc);
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>