<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String gcjdbm=null;
		String sfyzczbj=null;
		double wdzgce=0;
		double suijin=0;
		double suijinbfb=0;
		double gxqqye=0;
		double gxhqye=0;
		double zkl=0;
		double guanlif=0;
		double qye=0;

		ls_sql="select gcjdbm,qye,zkl,sfyzczbj";
		ls_sql+=" from  crm_khxx,crm_czbjjl";
		ls_sql+=" where  crm_khxx.khbh=crm_czbjjl.khbh and crm_czbjjl.khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gcjdbm=rs.getString("gcjdbm");
			gxqqye=rs.getDouble("qye");
			zkl=rs.getDouble("zkl");
			sfyzczbj=rs.getString("sfyzczbj");
		}
		else{
			conn.rollback();
			out.println("���󣡿ͻ���Ȩ��Ϣ�����ڣ�"+khbh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!sfyzczbj.equals("1"))
		{
			conn.rollback();
			out.println("�������������Ѹ��£�"+khbh[i]);
			return;
		}

		String jzbz=null;
		String bjjb=null;
		String zklx="";
		double spzkl=0;
		ls_sql="select jzbz,bjjb,zklx,spzkl";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jzbz=rs.getString("jzbz");
			bjjb=rs.getString("bjjb");
			zklx=cf.fillNull(rs.getString("zklx"));
			spzkl=rs.getDouble("spzkl");
		}
		else{
			conn.rollback();
			out.println("������ѯ�ͻ���Ϣ�����ڣ�"+khbh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (bjjb==null)
		{
			ls_sql="update crm_czbjjl ";
			ls_sql+=" set sfyzczbj='2',qyegxsj=SYSDATE,qyegxr='"+yhmc+"'";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			out.println("<P>���棡��ѯ�ͻ����ۼ��𲻴��ڣ�����ʧ�ܣ�"+khbh[i]);
			continue;
		}

		dzbj.Dzbj dzbj=new dzbj.Dzbj();
		wdzgce=dzbj.getBjje(conn,khbh[i],"yz");//����ԭ����
		suijinbfb=dzbj.getSuijinBfb(conn,khbh[i],"yz");//˰��ٷֱ�
		suijin=dzbj.getZqSuijinJe(conn,khbh[i],"yz");//˰��
		guanlif=dzbj.getZqGlfJe(conn,khbh[i],"yz");//�����

		if (zklx.equals("1"))//1��ȫ���ۿۣ�2�������ۿ�
		{
			qye=wdzgce*spzkl/10;//ǩԼ�����
			qye=cf.round(qye,2);

			suijin=suijin*spzkl/10;//˰�����
			suijin=cf.round(suijin,2);

			guanlif=guanlif*spzkl/10;//����Ѵ���
			guanlif=cf.round(guanlif,2);

		}
		else if (zklx.equals("2"))//1��ȫ���ۿۣ�2�������ۿ�
		{
			double zjf=dzbj.getZjf(conn,khbh[i],"yz");//��ȡֱ�ӷ�
			double zhqtsf=dzbj.getZhQtsf(conn,khbh[i],"yz");//��ȡ���ۺ������շѣ���������������ǩԼ���Ŀ

			qye=zjf*spzkl/10+zhqtsf;//ǩԼ�����
			qye=cf.round(qye,2);

			suijin=dzbj.getZhSuijinJe(conn,khbh[i],"yz");//˰�����
			guanlif=dzbj.getZhGlfJe(conn,khbh[i],"yz");//����Ѵ���
		}
		else{
			qye=wdzgce;
		}

		gxhqye=qye;

		ls_sql="update crm_czbjjl ";
		ls_sql+=" set sfyzczbj='2',qyegxsj=SYSDATE,qyegxr='"+yhmc+"',gxqqye="+gxqqye+",gxhqye="+gxhqye;
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx ";
		ls_sql+=" set wdzgce="+wdzgce+",qye="+gxhqye+",suijin="+suijin+",suijinbfb="+suijinbfb+",guanlif="+guanlif+",jzbz='"+jzbz+"',bjjb='"+bjjb+"'";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	
		//���ɣ��ͻ����Ϸ�����bj_khglfxb��
		String dqbm=null;
		String xmbh=null;
		String bjjbbm=null;
		String ckxm=null;
		String bjlx=null;

		ls_sql=" delete from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="select dqbm,xmbh,bjjb,ckxm,bjlx";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			dqbm=rs1.getString("dqbm");
			xmbh=rs1.getString("xmbh");
			bjjbbm=rs1.getString("bjjb");
			ckxm=rs1.getString("ckxm");
			bjlx=rs1.getString("bjlx");

			if (jzbz.equals("1"))//1����װ��2����װ
			{
				//�ͻ����Ϸ�����bj_khglfxb��
				if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
				{
					ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
					ls_sql+=" select ?,glbxh,dqbm,xmbh,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
					ls_sql+=" from bj_jzglfxb ";
					ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh[i]);
					ps.executeUpdate();
					ps.close();
				}
				else{
					ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
					ls_sql+=" select ?,glbxh,?,?,bjjbbm,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
					ls_sql+=" from bj_jzglfxb ";
					ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjbbm='"+bjjbbm+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh[i]);
					ps.setString(2,dqbm);
					ps.setString(3,xmbh);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{
				//�ͻ����Ϸ�����bj_khglfxb��
				if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
				{
					ls_sql="insert into bj_khglfxb (khbh,bjjb,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
					ls_sql+=" select ?,bjjbbm,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
					ls_sql+=" from bj_gzglfxb ";
					ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh[i]);
					ps.executeUpdate();
					ps.close();
				}
				else{
					ls_sql="insert into bj_khglfxb (khbh,bjjb,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz) ";
					ls_sql+=" select ?,bjjbbm,glbxh,?,?,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,wlbm,wlllbz";
					ls_sql+=" from bj_gzglfxb ";
					ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjbbm='"+bjjbbm+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,khbh[i]);
					ps.setString(2,dqbm);
					ps.setString(3,xmbh);
					ps.executeUpdate();
					ps.close();
				}
			}

		}
		rs1.close();
		ps1.close();
	
	
	}

	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
