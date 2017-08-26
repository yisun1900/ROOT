<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String hfr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");

String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	String oldsgd=null;
	String oldjlbz=null;
	String deflbm=null;
	int depjz=0;
	int qye=0;
	int kpjlh=0;
	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql=" select sgdkpjlh,jlbz,sgd,qye,deflbm,depjz";
		ls_sql+=" from  crm_khxx,kp_deflbm";
		ls_sql+=" where khbh='"+khbh[i]+"'";//
		ls_sql+=" and qye>dedy and qye<dexy";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			kpjlh=rs.getInt("sgdkpjlh");
			oldjlbz=rs.getString("jlbz");
			oldsgd=rs.getString("sgd");
			qye=rs.getInt("qye");
			deflbm=rs.getString("deflbm");
			depjz=rs.getInt("depjz");
		}
		rs.close();
		ps.close();

		if (kpjlh==0)
		{
			conn.rollback();
			out.println("����ʩ���ӿ�����¼�Ų���ȷ");
			return;
		}

		if (deflbm.equals("1"))//1����
		{
			//�ѽӴ���
			if (oldjlbz.equals("5"))//5+�󵥵�С��
			{
				ls_sql="update kp_sgdkpjg set yjzds=yjzds-2,yjzdje=yjzdje-"+qye;
				ls_sql+=" where kpjlh="+kpjlh;
				ls_sql+=" and sgd='"+oldsgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

			}
			else if (oldjlbz.equals("6"))//6+С���ִ�
			{
				conn.rollback();
				out.println("�����󣬲��ܽ���С���ִ�");
				return;
			}
			else if (oldjlbz.equals("1") || oldjlbz.equals("2"))//1+�ص�����&2+��˾����
			{
			}
			else
			{
				ls_sql="update kp_sgdkpjg set yjdds=yjdds-1,yjddje=yjddje-"+qye;
				ls_sql+=" where kpjlh="+kpjlh;
				ls_sql+=" and sgd='"+oldsgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		else if (deflbm.equals("2"))//2���е�
		{
			if (oldjlbz.equals("5"))//5+�󵥵�С��
			{
				//�ѽӴ���
				ls_sql="update kp_sgdkpjg set yjxds=yjxds-2,yjxdje=yjxdje-"+qye;
				ls_sql+=" where kpjlh="+kpjlh;
				ls_sql+=" and sgd='"+oldsgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (oldjlbz.equals("6"))//6+С���ִ�
			{
				//�ѽӴ���
				ls_sql="update kp_sgdkpjg set yjdds=yjdds-0.5,yjddje=yjddje-"+qye;
				ls_sql+=" where kpjlh="+kpjlh;
				ls_sql+=" and sgd='"+oldsgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (oldjlbz.equals("1") || oldjlbz.equals("2"))//1+�ص�����&2+��˾����
			{
			}
			else
			{
				//�ѽӴ���
				ls_sql="update kp_sgdkpjg set yjzds=yjzds-1,yjzdje=yjzdje-"+qye;
				ls_sql+=" where kpjlh="+kpjlh;
				ls_sql+=" and sgd='"+oldsgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		else if (deflbm.equals("3"))//3��С��
		{
			if (oldjlbz.equals("5"))//5+�󵥵�С��
			{
				conn.rollback();
				out.println("�����󣬲��ܽ��д󵥵�С��");
				return;
			}
			else if (oldjlbz.equals("6"))//6+С���ִ�
			{
				//�ѽӴ���
				ls_sql="update kp_sgdkpjg set yjzds=yjzds-0.5,yjzdje=yjzdje-"+qye;
				ls_sql+=" where kpjlh="+kpjlh;
				ls_sql+=" and sgd='"+oldsgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (oldjlbz.equals("1") || oldjlbz.equals("2"))//1+�ص�����&2+��˾����
			{
			}
			else
			{
				//�ѽӴ���
				ls_sql="update kp_sgdkpjg set yjxds=yjxds-1,yjxdje=yjxdje-"+qye;
				ls_sql+=" where kpjlh="+kpjlh;
				ls_sql+=" and sgd='"+oldsgd+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		
		
		ls_sql="delete from pd_pdjl ";
		ls_sql+=" where khbh='"+khbh[i]+"' and hfjl='0' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set pdsj=null,pdr=null,sgd=null,sgbz=null,pdsm=null,pdclzt='1',jlbz=null,zjxm=null,sgdkpjlh=null";
		ls_sql+=" where khbh='"+khbh[i]+"' and pdclzt='2' ";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("����ɾ��ʧ��");
			return;
		}
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɵ��ɹ���");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>