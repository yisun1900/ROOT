<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));

String[] glbxh=request.getParameterValues("glbxh");
String[] glflbm=request.getParameterValues("glflbm");
String[] glfxclbm=request.getParameterValues("glfxclbm");
String[] glfxclmc=request.getParameterValues("glfxclmc");
String[] djstr=request.getParameterValues("dj");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] jqsflstr=request.getParameterValues("jqsfl");
String[] bsflstr=request.getParameterValues("bsfl");
String[] tvocsflstr=request.getParameterValues("tvocsfl");
String[] lx=request.getParameterValues("lx");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;
int count=0;
double jqsfl=0;
double bsfl=0;
double tvocsfl=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);


	for (int i=0;i<glflbm.length ;i++ )
	{
		//δ¼��Ϣ
		if (glflbm[i].equals(""))
		{
			continue;
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
			ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.nbbm='"+cf.GB2Uni(glfxclbm[i])+"'";
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
			out.println("<BR>����ʧ�ܣ�[��������]Ϊ��");
			return;
		}
		//[������λ]�Ƿ�Ϊ��
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[������λ]Ϊ��");
			return;
		}
		//[������]�Ƿ�Ϊ��
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[����]Ϊ��");
			return;
		}
		//[����]�Ƿ�Ϊ��
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[����]Ϊ��");
			return;
		}

		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[����]���벻��ȷ:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[����]���벻��ȷ:"+djstr[i].trim());
			return;
		}

		//[��ȩ�ͷ���]�Ƿ�Ϊ��
		if (jqsflstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[��ȩ�ͷ���]Ϊ��");
			return;
		}

		jqsfl=0;
		try{
			jqsfl=java.lang.Double.parseDouble(jqsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[��ȩ�ͷ���]���벻��ȷ:"+jqsflstr[i].trim());
			return;
		}
		//[���ͷ���]�Ƿ�Ϊ��
		if (bsflstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[���ͷ���]Ϊ��");
			return;
		}

		bsfl=0;
		try{
			bsfl=java.lang.Double.parseDouble(bsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[���ͷ���]���벻��ȷ:"+bsflstr[i].trim());
			return;
		}
		//[TVOC�ͷ���]�Ƿ�Ϊ��
		if (tvocsflstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�[TVOC�ͷ���]Ϊ��");
			return;
		}

		tvocsfl=0;
		try{
			tvocsfl=java.lang.Double.parseDouble(tvocsflstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]��[��ȩ�ͷ���]���벻��ȷ:"+tvocsflstr[i].trim());
			return;
		}
		


		if (glflbm[i].equals("1"))
		{
			if (wlllbz[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glfxclmc[i])+"]����ѡ���Ƿ���Ҫ�������ϡ�");
				return;
			}
		}
		else{
			wlllbz[i]="";
		}

		int newglbxh=0;

		if (glbxh[i].equals(""))
		{
			ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
			ls_sql+=" from  bj_jzglfxb";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				newglbxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newglbxh++;

			//��װ���Ϸ�����
			ls_sql="insert into bj_jzglfxb(glbxh,bjbbh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz)";
			ls_sql+=" values("+newglbxh+",'"+bjbbh+"','"+dqbm+"','"+bjjbbm+"','"+xmbh+"','"+glflbm[i]+"','"+cf.GB2Uni(glfxclbm[i])+"','"+cf.GB2Uni(glfxclmc[i])+"',"+dj+",'"+jldwbm[i]+"',"+xhl+","+jqsfl+","+bsfl+","+tvocsfl+",'"+cf.GB2Uni(lx[i])+"','"+wlllbz[i]+"','"+yhmc+"',TRUNC(SYSDATE),'"+cf.GB2Uni(bz[i])+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//��װ���Ϸ�����
			ls_sql="update bj_jzglfxb set glflbm='"+glflbm[i]+"',glfxclbm='"+cf.GB2Uni(glfxclbm[i])+"',glfxclmc='"+cf.GB2Uni(glfxclmc[i])+"'";
			ls_sql+=" ,dj="+dj+",jldwbm='"+jldwbm[i]+"',xhl="+xhl+",jqsfl="+jqsfl+",bsfl="+bsfl+",tvocsfl="+tvocsfl+",lx='"+cf.GB2Uni(lx[i])+"',wlllbz='"+wlllbz[i]+"',lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE),bz='"+cf.GB2Uni(bz[i])+"'";
			ls_sql+=" where glbxh="+glbxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//���±��۳ɱ�������������������������������������ʼ
		double clcb=0;//���ϳɱ�
		double rgcb=0;//�˹��ɱ�
		double jxcb=0;//��е�ɱ�
		double cbenj=0;//�ɱ���
		ls_sql="select sum(dj*xhl)";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:����
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
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:�˹�
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
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:��е
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
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,clcb);
		ps.setDouble(2,rgcb);
		ps.setDouble(3,jxcb);
		ps.setDouble(4,cbenj);
		ps.executeUpdate();
		ps.close();
		//���±��۳ɱ���������������������������������������
	}

	String getglfxclbm=null;
	count=0;
	ls_sql="select glfxclbm,count(*)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and glfxclbm is not null";
	ls_sql+=" group by glfxclbm";
	ls_sql+=" having count(*)>1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getglfxclbm=rs.getString(1);
		count=rs.getInt(2);

		out.println("<BR>���󣡲��ϱ���["+getglfxclbm+"]�ظ�");
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