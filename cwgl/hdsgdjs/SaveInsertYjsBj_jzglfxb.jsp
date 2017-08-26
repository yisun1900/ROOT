<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String gdjsjlh=request.getParameter("gdjsjlh");

String[] glbxh=request.getParameterValues("glbxh");
String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] wlbm=request.getParameterValues("wlbm");
String[] djstr=request.getParameterValues("dj");

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

	int mark=0;


	for (int i=0;i<glflbm.length ;i++ )
	{
		//δ¼��Ϣ
		if (glflbm[i].equals(""))
		{
			continue;
		}

		mark++;



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
		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ���������Ϊ["+cf.GB2Uni(glmc[i])+"]��[������]���벻��ȷ:"+xhlstr[i].trim());
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


		String getglmc="";
		String getpp="";
		String getxhgg="";
		String getjldwbm="";
		double getdj=0;
		String getwlllbz="";
		
		if (glflbm[i].equals("1"))//1:���Ϸ�
		{
			//[���ϱ���]�Ƿ�Ϊ��
			if (wlbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ����Ϸ�[������ϱ���]����Ϊ�գ���û�п���0");
				return;
			}

			if (!wlbm[i].equals("0"))
			{
				ls_sql="select glmc,pp,xhgg,jldwbm,dj,wlllbz";
				ls_sql+=" from  bj_jscljgb";
				ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					getglmc=cf.fillNull(rs.getString("glmc"));
					getpp=cf.fillNull(rs.getString("pp"));
					getxhgg=cf.fillNull(rs.getString("xhgg"));
					getjldwbm=cf.fillNull(rs.getString("jldwbm"));
					getdj=rs.getDouble("dj");
					getwlllbz=cf.fillNull(rs.getString("wlllbz"));

					if (!getglmc.equals(cf.GB2Uni(glmc[i])) || !getjldwbm.equals(cf.GB2Uni(jldwbm[i])) || getdj!=dj )
					{
						rs.close();
						ps.close();

						conn.rollback();
						out.println("<BR>������ϱ���["+cf.GB2Uni(wlbm[i])+"]����ʧ�ܣ�¼��ֵ���׼��[�������ơ�������λ������]��һ��");
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
				getwlllbz="N";
			}
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

		int newglbxh=0;

		if (glbxh[i].equals(""))
		{
			ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
			ls_sql+=" from  bj_khglfxb";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
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
			ls_sql="insert into bj_khglfxb(khbh,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,bjjb,wlbm,wlllbz)";
			ls_sql+=" values('"+khbh+"',"+newglbxh+",'"+dqbm+"','"+xmbh+"','"+glflbm[i]+"','"+cf.GB2Uni(glmc[i])+"','"+getpp+"','"+getxhgg+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+bjjbbm+"','"+cf.GB2Uni(wlbm[i])+"','"+getwlllbz+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//��װ���Ϸ�����
			ls_sql="update bj_khglfxb set glflbm='"+glflbm[i]+"',glmc='"+cf.GB2Uni(glmc[i])+"',pp='"+getpp+"'";
			ls_sql+=" ,xhgg='"+getxhgg+"',jldwbm='"+jldwbm[i]+"',xhl="+xhl+",dj="+dj+",wlbm='"+cf.GB2Uni(wlbm[i])+"'";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"' and glbxh="+glbxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	ls_sql="update cw_deyjsmx set xclbz='Y'";
	ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cw_deyjsmx set cbdj=0,cbje=0,mll=0,mle=0,nbjsdj=0,nbjsje=0,gsmll=0,gsmlr=0";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%


	conn.commit();

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