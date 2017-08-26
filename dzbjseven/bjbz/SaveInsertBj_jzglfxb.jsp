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

String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xhgg=request.getParameterValues("xhgg");
String[] wlbm=request.getParameterValues("wlbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;
int count=0;

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
			if (wlbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ�[������ϱ���]Ϊ��");
				return;
			}

			String getglmc="";
			String getpp="";
			String getxhgg="";
			ls_sql="select glmc,pp,xhgg";
			ls_sql+=" from  bj_jscljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				getglmc=cf.fillNull(rs.getString("glmc"));
				getpp=cf.fillNull(rs.getString("pp"));
				getxhgg=cf.fillNull(rs.getString("xhgg"));

				if (!getglmc.equals(cf.GB2Uni(glmc[i])) || !getpp.equals(cf.GB2Uni(pp[i])) || !getxhgg.equals(cf.GB2Uni(xhgg[i])))
				{
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<BR>����ʧ�ܣ�������ϱ���["+cf.GB2Uni(wlbm[i])+"]��[�������ơ�Ʒ�ơ��ͺŹ��]��һ��");
					return;
				}
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>����ʧ�ܣ�������ϱ���["+cf.GB2Uni(wlbm[i])+"]������");
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
		//[��������]�Ƿ�Ϊ��
		if (glmc[i].equals(""))
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
			out.println("<BR>����ʧ�ܣ�[������]Ϊ��");
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
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[����]���벻��ȷ:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[����]���벻��ȷ:"+djstr[i].trim());
			return;
		}


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

		glbxh++;


		//��װ���Ϸ�����
		ls_sql="insert into bj_jzglfxb(glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,lrr,lrsj,bjjbbm,wlbm)";
		ls_sql+=" values("+glbxh+",'"+dqbm+"','"+xmbh+"','"+glflbm[i]+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+bjjbbm+"','"+cf.GB2Uni(wlbm[i])+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	String getwlbm=null;
	count=0;
	ls_sql="select wlbm,count(*)";
	ls_sql+=" from  bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and wlbm is not null";
	ls_sql+=" group by wlbm";
	ls_sql+=" having count(*)>1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		getwlbm=rs.getString(1);
		count=rs.getInt(2);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		conn.rollback();
		out.println("<BR>����ʧ�ܣ�������ϱ���["+getwlbm+"]�Ѵ���");
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