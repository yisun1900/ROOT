<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String xmbh=request.getParameter("xmbh");
String sfxycl=request.getParameter("sfxycl");
String dqbm=request.getParameter("dqbm");

String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] jgwzmc=request.getParameterValues("jgwzmc");
String[] slstr=request.getParameterValues("sl");
String[] zcmc=request.getParameterValues("zcmc");
String[] zcgg=request.getParameterValues("zcgg");
String[] zcylstr=request.getParameterValues("zcyl");
String[] zcfstr=request.getParameterValues("zcf");
String[] zcjldwbm=request.getParameterValues("zcjldwbm");

double sl=0;
double zcyl=0;
double zcf=0;
String newjgwzmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();



	conn.setAutoCommit(false);

	ls_sql="delete from bj_gclmx";
	ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_dwgclzcyl";
	ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	for (int i=0;i<jgwzbm.length ;i++ )
	{
		//δ¼������
		if (slstr[i].trim().equals(""))
		{
			continue;
		}

		ls_sql="SELECT bj_fjxx.jgwzbm";
		ls_sql+=" FROM bj_fjxx";
		ls_sql+=" where khbh='"+khbh+"' and xuhao="+jgwzbm[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			newjgwzmc=rs.getString("jgwzbm");

			if (!newjgwzmc.equals(cf.GB2Uni(jgwzmc[i])))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ�["+cf.GB2Uni(jgwzmc[i])+"]�������ѷ����仯");
				return;
			}
		}
		rs.close();
		ps.close();


		try{
			sl=java.lang.Double.parseDouble(slstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>����ʧ�ܣ�["+cf.GB2Uni(jgwzmc[i])+"]��[������]���벻��ȷ:"+slstr[i]);
			return;
		}

		ls_sql="insert into bj_gclmx(khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz)";
		ls_sql+=" values('"+khbh+"','"+dqbm+"','"+xmbh+"','"+cf.GB2Uni(jgwzmc[i])+"',"+sl+","+sl+",0,'N') ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		if (sfxycl.equals("1"))//1����Ҫ��2������Ҫ
		{
			zcyl=0;
			if (!zcylstr[i].trim().equals(""))
			{
				try{
					zcyl=java.lang.Double.parseDouble(zcylstr[i].trim());
				}
				catch (Exception e){
					conn.rollback();
					out.println("<BR>����ʧ�ܣ�["+cf.GB2Uni(jgwzmc[i])+"]��[��������]���벻��ȷ:"+zcylstr[i].trim());
					return;
				}
			}

			zcf=0;
			if (!zcfstr[i].trim().equals(""))
			{
				try{
					zcf=java.lang.Double.parseDouble(zcfstr[i].trim());
				}
				catch (Exception e){
					conn.rollback();
					out.println("<BR>����ʧ�ܣ�["+cf.GB2Uni(jgwzmc[i])+"]��[���ķ�]���벻��ȷ:"+zcfstr[i].trim());
					return;
				}
			}

			if (zcmc[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ�["+cf.GB2Uni(jgwzmc[i])+"]��[��������]����Ϊ��");
				return;
			}

			if (zcjldwbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>����ʧ�ܣ�["+cf.GB2Uni(jgwzmc[i])+"]��[���ļ�����λ]����Ϊ��");
				return;
			}

			//��λ��������������
			ls_sql="insert into bj_dwgclzcyl(khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
			ls_sql+=" values('"+khbh+"','"+dqbm+"','"+xmbh+"','"+cf.GB2Uni(jgwzmc[i])+"','"+cf.GB2Uni(zcmc[i])+"','"+cf.GB2Uni(zcgg[i])+"','"+cf.GB2Uni(zcjldwbm[i])+"',"+zcyl+","+zcf+")";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}

	}


	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,khbh,"hd");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getBjje(conn,khbh,"hd");

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
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + ls_sql);
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