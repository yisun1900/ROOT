<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjjbbm = request.getParameter("bjjbbm");
String dqbm=request.getParameter("dqbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

String[] xmbh=request.getParameterValues("xmbh");
String[] glflbm=request.getParameterValues("glflbm");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] lx=request.getParameterValues("lx");
String[] glfxclbm=request.getParameterValues("glfxclbm");
String[] glfxclmc=request.getParameterValues("glfxclmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] bz=request.getParameterValues("bz");
String[] jqsflstr=request.getParameterValues("jqsfl");
String[] bsflstr=request.getParameterValues("bsfl");
String[] tvocsflstr=request.getParameterValues("tvocsfl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;
double jqsfl=0;
double bsfl=0;
double tvocsfl=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	//ɾ���ɵ�
	String lsxmbh="";
	for (int i=0;i<xmbh.length ;i++ )
	{
		if (lsxmbh.equals(xmbh[i]))
		{
			lsxmbh=xmbh[i];
		}
		else{
			ls_sql="delete from bj_jzglfxb ";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	//���ܷ���ѭ�������̫��
	int glbxh=0;
	ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
	ls_sql+=" from  bj_jzglfxb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		glbxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<xmbh.length ;i++ )
	{
		//[���ۼ���]�Ƿ�Ϊ��
		if (bjjbbm.equals(""))
		{
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[���ۼ���]Ϊ��");
			return;
		}

		//[���Ϸ���]�Ƿ�Ϊ��
		if (glflbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[���Ϸ���]Ϊ��");
			return;
		}

		if (glflbm[i].equals("1"))//1:���ķ�
		{
			//[���ϱ���]�Ƿ�Ϊ��
			if (glfxclbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ�[���ϱ���]Ϊ��");
				return;
			}

			String getglfxclmc="";
			String getjldwbm="";
			double cbj=0;
			ls_sql="SELECT jxc_clbm.clmc,jxc_clbm.jldwbm,jxc_cljgb.cbj";
			ls_sql+=" FROM jxc_clbm,jxc_cljgb ";
			ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.cllb='1' and jxc_cljgb.sfyh='Y'";
			ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.clbm='"+cf.GB2Uni(glfxclbm[i])+"'";
			ls_sql+=" order by jxc_clbm.clmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getglfxclmc=rs.getString("clmc");
				getjldwbm=rs.getString("jldwbm");
				cbj=rs.getDouble("cbj");
			}
			rs.close();
			ps.close();

			if (getglfxclmc.equals(""))
			{
				conn.rollback();
				out.println("���󣡲��ϱ��벻���ڣ�"+cf.GB2Uni(glfxclbm[i]));
				return;
			}

			if (!getglfxclmc.equals(cf.GB2Uni(glfxclmc[i])))
			{
				conn.rollback();
				out.println("���󣡲�������["+cf.GB2Uni(glfxclmc[i])+"]����ȷ����ȷ��������Ϊ��"+getglfxclmc);
				return;
			}
		}
		else{
			//[���ϱ���]�Ƿ�Ϊ��
			if (!glfxclbm[i].equals("") )
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ���[������]������¼��[���ϱ���]");
				return;
			}
		}


		//[��������]�Ƿ�Ϊ��
		if (glfxclmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[��������]Ϊ��");
			return;
		}
		//[������λ]�Ƿ�Ϊ��
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[������λ]Ϊ��");
			return;
		}
		//[������]�Ƿ�Ϊ��
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[������]Ϊ��");
			return;
		}
		//[����]�Ƿ�Ϊ��
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[����]Ϊ��");
			return;
		}

		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[����]���벻��ȷ:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[����]���벻��ȷ:"+djstr[i].trim());
			return;
		}

		jqsfl=0;
		try{
			jqsfl=Double.parseDouble(jqsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[��ȩ�ͷ���]���벻��ȷ:"+jqsflstr[i].trim());
			return;
		}

		bsfl=0;
		try{
			bsfl=Double.parseDouble(bsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[���ͷ���]���벻��ȷ:"+bsflstr[i].trim());
			return;
		}

		tvocsfl=0;
		try{
			tvocsfl=Double.parseDouble(tvocsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[TVOC�ͷ���]���벻��ȷ:"+tvocsflstr[i].trim());
			return;
		}

		glbxh++;

		//��װ���Ϸ�����
		ls_sql="insert into bj_jzglfxb(glbxh,bjbbh,dqbm,xmbh,glflbm,wlllbz,lx,glfxclbm,glfxclmc,jldwbm,xhl,dj,lrr,lrsj,bjjbbm,bz,jqsfl,bsfl,tvocsfl)";
		ls_sql+=" values("+glbxh+",'"+bjbbh+"','"+dqbm+"','"+xmbh[i]+"','"+glflbm[i]+"','"+cf.GB2Uni(wlllbz[i])+"','"+lx[i]+"','"+cf.GB2Uni(glfxclbm[i])+"','"+cf.GB2Uni(glfxclmc[i])+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+bjjbbm+"','"+cf.GB2Uni(bz[i])+"',"+jqsfl+","+bsfl+","+tvocsfl+")";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//���±��۳ɱ�������������������������������������ʼ
		double clcb=0;//���ϳɱ�
		double rgcb=0;//�˹��ɱ�
		double jxcb=0;//��е�ɱ�
		double cbenj=0;//�ɱ���
		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"' and glflbm='1'";//1:����
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clcb=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"' and glflbm='2'";//2:�˹�
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			rgcb=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"' and glflbm='3'";//3:��е
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jxcb=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		cbenj=cf.round(clcb+rgcb+jxcb,2);

		ls_sql="update bj_jzbjb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,clcb);
		ps.setDouble(2,rgcb);
		ps.setDouble(3,jxcb);
		ps.setDouble(4,cbenj);
		ps.executeUpdate();
		ps.close();
		//���±��۳ɱ���������������������������������������
	}

	String getxmbh=null;
	String getglfxclbm=null;
	int count=0;
	ls_sql="select xmbh,glfxclbm,count(*)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and glfxclbm is not null";
	ls_sql+=" group by xmbh,glfxclbm";
	ls_sql+=" having count(*)>1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getxmbh=rs.getString(1);
		getglfxclbm=rs.getString(2);
		count=rs.getInt(3);

		out.println("<BR>������Ŀ���["+getxmbh+"]�в��ϱ���["+getglfxclbm+"]�ظ�");
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		conn.rollback();
		out.println("<P>����ʧ�ܣ�");
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