<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String[] glbxh=request.getParameterValues("glbxh");
String[] xmbh=request.getParameterValues("xmbh");
String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xh=request.getParameterValues("xh");
String[] gg=request.getParameterValues("gg");
String[] xl=request.getParameterValues("xl");
String[] bjjbbm=request.getParameterValues("bjjbbm");
String[] wlbm=request.getParameterValues("wlbm");
String[] wlllbz=request.getParameterValues("wlllbz");
String[] bz=request.getParameterValues("bz");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	for (int i=0;i<glbxh.length ;i++ )
	{
		
		//[���ۼ���]�Ƿ�Ϊ��
		if (bjjbbm[i].equals(""))
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

/*
		if (glflbm[i].equals("1"))//1:���ķ�
		{
			//[���ϱ���]�Ƿ�Ϊ��
			if (wlbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[������ϱ���]Ϊ��");
				return;
			}

			String getglmc="";
			String getpp="";
			String getxh="";
			ls_sql="select glmc,pp,xh";
			ls_sql+=" from  bj_jscljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				getglmc=cf.fillNull(rs.getString("glmc"));
				getpp=cf.fillNull(rs.getString("pp"));
				getxh=cf.fillNull(rs.getString("xh"));

				if (!getglmc.equals(cf.GB2Uni(glmc[i])) || !getpp.equals(cf.GB2Uni(pp[i])) || !getxh.equals(cf.GB2Uni(xh[i])))
				{
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�������ϱ���["+cf.GB2Uni(wlbm[i])+"]��[�������ơ�Ʒ�ơ��ͺŹ��]��һ��");
					return;
				}
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�������ϱ���["+cf.GB2Uni(wlbm[i])+"]������");
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			//[���ϱ���]�Ƿ�Ϊ��
			if (!wlbm[i].equals("") )
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ���[������]������¼��[������ϱ���]");
				return;
			}
		}
*/
		//[��������]�Ƿ�Ϊ��
		if (glmc[i].equals(""))
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
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ�[����]Ϊ��");
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
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[����]���벻��ȷ:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[����]���벻��ȷ:"+djstr[i].trim());
			return;
		}

		if (glflbm[i].equals("1"))
		{
			if (wlllbz[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>��Ŀ���["+xmbh[i]+"]����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]����ѡ���Ƿ���Ҫ�������ϡ�");
				return;
			}
		}
		else{
			wlllbz[i]="";
		}
	
		//��װ���Ϸ�����
		ls_sql="update bj_jzglfxb set glflbm='"+glflbm[i]+"',wlllbz='"+wlllbz[i]+"',glmc='"+cf.GB2Uni(glmc[i])+"',pp='"+cf.GB2Uni(pp[i])+"',xh='"+cf.GB2Uni(xh[i])+"',gg='"+cf.GB2Uni(gg[i])+"',xl='"+cf.GB2Uni(xl[i])+"',bz='"+cf.GB2Uni(bz[i])+"'";
		ls_sql+=" ,jldwbm='"+jldwbm[i]+"',xhl="+xhl+",dj="+dj+",lrr='"+yhmc+"',lrsj=TRUNC(SYSDATE),bjjbbm='"+bjjbbm[i]+"',wlbm='"+cf.GB2Uni(wlbm[i])+"' ";
		ls_sql+=" where glbxh="+glbxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

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