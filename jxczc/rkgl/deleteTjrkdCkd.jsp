<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	jxc.JxcClass jxc=new jxc.JxcClass();

	conn.setAutoCommit(false);


	//�����ⵥ״̬
	String rkdzt=null;
	String gysmc=null;
	String dqbm=null;
	String ckbh=null;
	java.sql.Date rksj=null;
	String lydh=null;
	ls_sql="select rkdzt,gysmc,dqbm,ckbh,rksj,lydh ";
	ls_sql+=" from  jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rkdzt=rs.getString("rkdzt");
		gysmc=rs.getString("gysmc");
		dqbm=rs.getString("dqbm");
		ckbh=rs.getString("ckbh");
		rksj=rs.getDate("rksj");
		lydh=rs.getString("lydh");
	}
	else{
		conn.rollback();
		out.print("������ⵥ["+rkph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	String jz=jxc.isJz(conn,ckbh);
	if (jz.equals("N"))//Nδ��ת��Y���ѽ�ת
	{
		out.print("�ϸ���û�н�ת�����ܽ��п�������"+jz);
		return;
	}

	if (!rkdzt.equals("3"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	{
		conn.rollback();
		out.print("������ⵥδ�ύ��"+rkph);
		return;
	}

	
	//�޸���ⵥ״̬����ⵥ���
	ls_sql="update jxc_rkd set rkdzt='0',rkzje=0,zcpzje=0,ccpzje=0,wldszje=0,thclzje=0,bfclzje=0";//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int rkxh=0;
	double rkj=0;
	double zcpsl=0;//����Ʒ����
	double zcpfkcsl=0;//����Ʒ����������
	double ccpsl=0;//�д�Ʒ����
	double ccpfkcsl=0;//�д�Ʒ����������
	double bfpsl=0;//����Ʒ����
	double bfpfkcsl=0;//����Ʒ����������
	double ccpzkl=0;
	double rksl=0;
	String clbm=null;

	ls_sql=" select rkxh,clbm,rkj,rksl,zcpsl,zcpfkcsl,ccpsl,ccpfkcsl,bfpsl,bfpfkcsl,ccpzkl";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ls_sql+=" order by rkxh";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		rkxh=rs.getInt("rkxh");
		clbm=rs.getString("clbm");
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		zcpsl=rs.getDouble("zcpsl");
		zcpfkcsl=rs.getDouble("zcpfkcsl");
		ccpsl=rs.getDouble("ccpsl");
		ccpfkcsl=rs.getDouble("ccpfkcsl");
		bfpsl=rs.getDouble("bfpsl");
		bfpfkcsl=rs.getDouble("bfpfkcsl");
		ccpzkl=rs.getDouble("ccpzkl");

		double zcpzsl=0;
		double ccpzsl=0;
		double bfpzsl=0;
		String xsfs="";
		ls_sql="SELECT zcpzsl,ccpzsl,bfpzsl,xsfs";
		ls_sql+=" FROM jxc_cljgb";
		ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcpzsl=rs1.getDouble("zcpzsl");
			ccpzsl=rs1.getDouble("ccpzsl");
			bfpzsl=rs1.getDouble("bfpzsl");
			xsfs=rs1.getString("xsfs");
		}
		rs1.close();
		ps1.close();


		double kcsl=0;
		double cksl=0;
		String ckph="";

		if (zcpzsl<zcpsl)
		{
			conn.rollback();
			out.println("���󣡲��ϡ�"+clbm+"���ѳ��⣬������ɾ�����������"+zcpsl+"���������"+zcpzsl);
			return;
		}
		if (ccpzsl<ccpsl)
		{
			conn.rollback();
			out.println("���󣡲��ϡ�"+clbm+"���ѳ��⣬������ɾ�����������"+ccpsl+"���������"+ccpzsl);
			return;
		}
		if (bfpzsl<bfpsl)
		{
			conn.rollback();
			out.println("���󣡲��ϡ�"+clbm+"���ѳ��⣬������ɾ�����������"+bfpsl+"���������"+bfpzsl);
			return;
		}

		if (zcpsl!=0)
		{
			ls_sql="  SELECT sum(kcsl) kcsl";
			ls_sql+=" FROM jxc_kcb";
			ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='1'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				kcsl=rs1.getDouble("kcsl");
			}
			rs1.close();
			ps1.close();
			if (zcpsl!=kcsl)
			{
				conn.rollback();
				out.println("�����š�"+rkxh+"�����󣡲��ϡ�"+clbm+"���ѳ��⣬������ɾ�����������"+zcpsl+"���������"+kcsl+ls_sql);
				return;
			}
		}
		if (ccpsl!=0)
		{
			ls_sql="  SELECT sum(kcsl) kcsl";
			ls_sql+=" FROM jxc_kcb";
			ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='2'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				kcsl=rs1.getDouble("kcsl");
			}
			rs1.close();
			ps1.close();
			if (ccpsl!=kcsl)
			{
				conn.rollback();
				out.println("�����š�"+rkxh+"�����󣡲��ϡ�"+clbm+"���ѳ��⣬������ɾ�����������"+ccpsl+"���������"+kcsl);
				return;
			}

		}
		if (bfpsl!=0)
		{
			ls_sql="  SELECT sum(kcsl) kcsl";
			ls_sql+=" FROM jxc_kcb";
			ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"' and clbm='"+clbm+"' and ckbh='"+ckbh+"' and zljb='3'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				kcsl=rs1.getDouble("kcsl");
			}
			rs1.close();
			ps1.close();
			if (bfpsl!=kcsl)
			{
				conn.rollback();
				out.println("�����š�"+rkxh+"�����󣡲��ϡ�"+clbm+"���ѳ��⣬������ɾ�����������"+bfpsl+"���������"+kcsl);
				return;
			}
		}


		String lsh=null;
		ls_sql=" select lsh ";
		ls_sql+=" from jxc_cklsb ";
		ls_sql+=" where ckph='"+lydh+"' and clbm='"+clbm+"'";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			lsh=cf.fillNull(rs1.getString("lsh"));

			ls_sql=" update jxc_kcb set ztbz='Y',rkph=null,rkxh=null,rksj=null,hwbh=null,hjbh=null,ckbh=null";
			ls_sql+=" where  lsh='"+lsh+"' ";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();

		}
		rs1.close();
		ps1.close();


		jxc.JsJqpjRkcbjSc(conn,dqbm,clbm,rkph[i]);
	}
	rs.close();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>