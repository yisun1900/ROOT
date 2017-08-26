<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

String[] lrxh=request.getParameterValues("lrxh");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] slstr=request.getParameterValues("sl");
String[] djstr=request.getParameterValues("dj");
String[] ycfstr=request.getParameterValues("ycf");
String[] qtfy=request.getParameterValues("qtfy");
String[] qtfyjestr=request.getParameterValues("qtfyje");

double sl=0;
double dj=0;
double ycf=0;
double qtfyje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
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

//������ѡ����
	if (lrxh!=null)
	{
		for (int i=0;i<lrxh.length ;i++ )
		{
			if (jgwzbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>�޸ĳ���[�ṹλ��]Ϊ��");
				return;
			}

			sl=0;
			try{
				sl=java.lang.Double.parseDouble(slstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>�޸ĳ���[����]���벻��ȷ:"+slstr[i].trim());
				return;
			}

			dj=0;
			try{
				dj=java.lang.Double.parseDouble(djstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>�޸ĳ���[����]���벻��ȷ:"+djstr[i].trim());
				return;
			}

			ycf=0;
			if (!ycfstr[i].trim().equals(""))
			{
				try{
					ycf=java.lang.Double.parseDouble(ycfstr[i].trim());
				}
				catch (Exception e){
					conn.rollback();
					out.println("<BR>�޸ĳ���[Զ�̷�]���벻��ȷ:"+ycfstr[i].trim());
					return;
				}
			}

			qtfyje=0;
			if (!qtfyjestr[i].trim().equals(""))
			{
				try{
					qtfyje=java.lang.Double.parseDouble(qtfyjestr[i].trim());
				}
				catch (Exception e){
					conn.rollback();
					out.println("<BR>�޸ĳ���[������]���벻��ȷ:"+qtfyjestr[i].trim());
					return;
				}
			}


			if (qtfyje!=0 && qtfy[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>�޸ĳ���[��������Ŀ]δѡ��");
				return;
			}


			String jsfs="";
			double zqdj=0;
			double cxhdbl=0;
			double yjjrbl=0;
			double cbj=0;
			double jsbl=0;
			String xinghao="";
			double zdxsj=0;
			ls_sql="select zqdj,cxhdbl,yjjrbl,jsfs,cbj,jsbl,xinghao,zdxsj";
			ls_sql+=" from  bj_khzcmx";
			ls_sql+=" where xh='"+lrxh[i]+"' and khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zqdj=rs.getDouble("zqdj");
				cxhdbl=rs.getDouble("cxhdbl");
				yjjrbl=rs.getDouble("yjjrbl");
				jsfs=cf.fillNull(rs.getString("jsfs"));
				cbj=rs.getDouble("cbj");
				jsbl=rs.getDouble("jsbl");
				xinghao=cf.fillNull(rs.getString("xinghao"));
				zdxsj=rs.getDouble("zdxsj");
			}
			rs.close();
			ps.close();

			double je=0;
			double cxhdje=0;
			double yjjrje=0;

			je=cf.round(dj*sl,2);
			cxhdje=cf.round(je*cxhdbl/100,2);
			yjjrje=cf.round(je*yjjrbl/100,2);

			double dpzk=10;
			if (zqdj!=0)
			{
				dpzk=cf.round(dj*10/zqdj,2);
			}

			if (jsfs.equals("2"))//1������ۣ�2�����������3����Ӧ��ͳһ����
			{
				cbj=cf.round(dj*jsbl/100,2);
			}
			if (dj<zdxsj)
			{
				conn.rollback();
				out.println("�ͺ�["+xinghao+"]���󣡵��۲���С��������ۼۡ�"+zdxsj+"��");
				return;
			}


		//	if (dj<cbj)
			//{
				//conn.rollback();
				//out.println("�ͺ�["+xinghao+"]���󣡵��۲���С�ڳɱ���");
			//	return;
		//	}



			ls_sql ="update bj_khzcmx ";
			ls_sql+=" set dpzk=?,dj=?,sl=?,je=?,cxhdje=?,yjjrje=?,zcpzwzbm=?,ycf=?,qtfy=?,qtfyje=?,cbj=?";
			ls_sql+=" where xh='"+lrxh[i]+"' and khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,dpzk);
			ps.setDouble(2,dj);
			ps.setDouble(3,sl);
			ps.setDouble(4,je);
			ps.setDouble(5,cxhdje);
			ps.setDouble(6,yjjrje);
			ps.setString(7,cf.GB2Uni(jgwzbm[i]));
			ps.setDouble(8,ycf);
			ps.setString(9,qtfy[i]);
			ps.setDouble(10,qtfyje);
			ps.setDouble(11,cbj);
			ps.executeUpdate();
			ps.close();

		}
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