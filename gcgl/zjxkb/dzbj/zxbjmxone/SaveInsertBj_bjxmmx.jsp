<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String bjjb=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
String jzbz=request.getParameter("jzbz");
String dqbm=request.getParameter("dqbm");
String[] xmbh=request.getParameterValues("xmbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
long xh=0;
int count=0;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  bj_bjxmmxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	int xmpx=0;//��Ŀ����
	ls_sql="select NVL(max(xmpx)+1,1)";
	ls_sql+=" from  bj_bjxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmpx=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ȡ������Ϣ����������������������ʼ
	String xmxlmc=null;
	ls_sql =" select xmxlmc ";
	ls_sql+=" from bj_jzbjb,bdm_xmxlbm ";
	ls_sql+=" where bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.xmbh='"+xmbh[0]+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmxlmc=rs.getString("xmxlmc");
	}
	rs.close();
	ps.close();

	count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_fjxxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and oldjgwzbm='"+xmxlmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String jgwzbm=null;
	if (count>0)//���ڣ�ȡ��������·�������
	{
		ls_sql="SELECT jgwzbm ";
		ls_sql+=" FROM bj_fjxxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and oldjgwzbm='"+xmxlmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jgwzbm=rs.getString("jgwzbm");
		}
		rs.close();
		ps.close();
	}
	else{//�����ڣ�Ϊ��ĿС������
		jgwzbm=xmxlmc;
	}
	//��ȡ������Ϣ����������������������������

	conn.setAutoCommit(false);

	//�Զ����ӷ�����Ϣ��������������������ʼ
	if (count==0)//�����ڣ�����
	{
		int xuhao=0;
		ls_sql="SELECT max(xuhao)";
		ls_sql+=" FROM bj_fjxxh";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xuhao=rs.getInt(1);
		}
		rs.close();
		ps.close();

		xuhao++;

		ls_sql="insert into bj_fjxxh (zjxxh,khbh,jgwzbm,xuhao,oldjgwzbm ) values('"+zjxxh+"','"+khbh+"','"+jgwzbm+"',"+xuhao+",'"+jgwzbm+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	
	//�Զ����ӷ�����Ϣ������������������������������

	for (int i=0;i<xmbh.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  bj_bjxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("������Ŀ��š�"+xmbh[i]+"���Ѵ���");
			return;
		}

		String ckxm=null;
		String bjlx=null;

		ls_sql="select ckxm,bjlx";
		ls_sql+=" from  bj_jzbjb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ckxm=rs.getString("ckxm");
			bjlx=rs.getString("bjlx");
		}
		rs.close();
		ps.close();

		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,gycl,bz,dqbm,bjjb,bjlx,xmlx,cbenj,sgdbj,jzbz,ckxm,xmpx,sfxycl,sfzgzc,lrr,lrsj ) ";
		ls_sql+=" select ?,?,?,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clbj,rgbj,jxbj,bj,gycl,bz,dqbm,?,bjlx,'1',cbenj,sgdbj,'1',ckxm,?,'2','N','"+yhdlm+"',SYSDATE";//1����Ҫ��2������Ҫ
		ls_sql+=" from bj_jzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and xmbh='"+xmbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setLong(2,xh);
		ps.setString(3,khbh);
		ps.setString(4,bjjb);
		ps.setInt(5,xmpx);
		ps.executeUpdate();
		ps.close();

		xh++;
		xmpx++;

		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//�ͻ����Ϸ�����bj_khglfxbh��
		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,xl,bz,jldwbm,xhl,dj,wlbm,wlllbz,jqsfl,bsfl,tvocsfl) ";
			ls_sql+=" select ?,?,glbxh,dqbm,xmbh,bjjbbm,glflbm,glmc,pp,xh,gg,xl,bz,jldwbm,xhl,dj,wlbm,wlllbz,jqsfl,bsfl,tvocsfl";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zjxxh);
			ps.setString(2,khbh);
			ps.executeUpdate();
			ps.close();
		}
	
		//�Զ����ӹ�������ϸ��������������������ʼ
		count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and jgwzbm='"+jgwzbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		if (count==0)//�����ڣ�����
		{
			ls_sql="insert into bj_gclmxh(zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
			ls_sql+=" values('"+zjxxh+"','"+khbh+"','"+dqbm+"','"+xmbh[i]+"','"+jgwzbm+"',0,0,0,'N') ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		//�Զ����ӹ�������ϸ������������������������������

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