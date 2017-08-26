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
		
		if (glflbm[i].equals("1"))//1:���Ϸ�
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
			String getjldwbm="";
			double getdj=0;
			ls_sql="select glmc,pp,xhgg,jldwbm,dj";
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

				if (!getglmc.equals(cf.GB2Uni(glmc[i])) || !getpp.equals(cf.GB2Uni(pp[i])) || !getxhgg.equals(cf.GB2Uni(xhgg[i])) || !getjldwbm.equals(cf.GB2Uni(jldwbm[i])) || getdj!=dj)
				{
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<BR>������ϱ���["+cf.GB2Uni(wlbm[i])+"]����ʧ�ܣ�¼��ֵ���׼��[�������ơ�Ʒ�ơ��ͺŹ�񡢼�����λ������]��һ��");
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
			ls_sql+=" values('"+khbh+"',"+newglbxh+",'"+dqbm+"','"+xmbh+"','"+glflbm[i]+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+bjjbbm+"','"+cf.GB2Uni(wlbm[i])+"','N')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//��װ���Ϸ�����
			ls_sql="update bj_khglfxb set glflbm='"+glflbm[i]+"',glmc='"+cf.GB2Uni(glmc[i])+"',pp='"+cf.GB2Uni(pp[i])+"'";
			ls_sql+=" ,xhgg='"+cf.GB2Uni(xhgg[i])+"',jldwbm='"+jldwbm[i]+"',xhl="+xhl+",dj="+dj+",wlbm='"+cf.GB2Uni(wlbm[i])+"',wlllbz='N'";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"' and glbxh="+glbxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	if (mark>0)
	{
		//�����۵��ۡ������仯�����¼��㣫����������������������������ʼ
		double cbdj=0;
		double cbje=0;
		double mll=0;
		double mle=0;
		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;
		double jsblxs=0;

		double sl=0;
		double dwbjje=0;


		//�ӡ��ͻ����Ϸ�����bj_khglfxb����ȡ���۵���
		ls_sql="SELECT sum(xhl*dj)";
		ls_sql+=" FROM bj_khglfxb  ";
		ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbdj=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		//ȡ���������ϵ��
		ls_sql="SELECT jsblxs,sl,dwbjje";
		ls_sql+=" from cw_dejsmx ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jsblxs=rs.getDouble("jsblxs");
			sl=rs.getDouble("sl");
			dwbjje=rs.getDouble("dwbjje");
		}
		rs.close();
		ps.close();


		cbdj=cf.doubleTrim(cbdj,2);//�ɱ����ۡ����۵���

		cbje=sl*cbdj;//������*�ɱ�����
		cbje=cf.doubleTrim(cbje);//�ɱ������۽��


		mll=(dwbjje-cbje)/dwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
		mll=cf.doubleTrim(mll);//ë����

		mle=dwbjje-cbje;//ë����*���ⱨ�۽��
		mle=cf.doubleTrim(mle);//ë�����


		nbjsdj=cbdj*(1+jsblxs/100);//�ɱ�����*(1+�������ϵ��)
		nbjsdj=cf.doubleTrim(nbjsdj);//�ڲ����㵥��

		nbjsje=nbjsdj*sl;//�ڲ����㵥��*��������
		nbjsje=cf.doubleTrim(nbjsje);//�ڲ�������

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
		gsmll=cf.doubleTrim(gsmll);//��˾ë����

		gsmlr=dwbjje-nbjsje;//��˾ë����*���ⱨ�۽��
		gsmlr=cf.doubleTrim(gsmlr);//��˾ë����


		ls_sql="update cw_dejsmx set xclbz='Y',cbdj=?,cbje=?,mll=?,mle=?,nbjsdj=?,nbjsje=?,gsmll=?,gsmlr=?";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbdj);
		ps.setDouble(2,cbje);
		ps.setDouble(3,mll);
		ps.setDouble(4,mle);
		ps.setDouble(5,nbjsdj);
		ps.setDouble(6,nbjsje);
		ps.setDouble(7,gsmll);
		ps.setDouble(8,gsmlr);
		ps.executeUpdate();
		ps.close();

		//�����۵��ۡ������仯�����¼���===========================���

		ls_sql="SELECT sum(nbjsje)";
		ls_sql+=" from cw_dejsmx ";
		ls_sql+=" where cw_dejsmx.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nbjsje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update cw_gdjsjl set dejsje="+nbjsje;
		ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
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
	}
	else{
		out.println("�������κ�����");
	}


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