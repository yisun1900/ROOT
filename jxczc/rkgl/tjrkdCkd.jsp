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

	//�����ⵥ״̬
	String rkdzt=null;
	String gysmc=null;
	String dqbm=null;
	String ckbh=null;
	String lydh=null;
	java.sql.Date rksj=null;
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
		out.print("������ⵥ["+rkph+"]�����ڣ�");
		return;
	}
	rs.close();
	ps.close();

	if (!rkdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	{
		out.print("������ⵥ���ύ");
		return;
	}

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		out.print("������ⵥû���κ���ϸ�������ύ");
		return;
	}

	//����Ƿ�¼������
	double rksl=0;
	String clbm=null;
	ls_sql=" select rksl,clbm ";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ls_sql+=" order by rkxh";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		rksl=rs.getDouble("rksl");
		clbm=cf.fillNull(rs.getString("clbm"));

		if (rksl==0)
		{
			rs.close();
			ps.close();
			out.print("���󣡲��ϱ��롾"+clbm+"��¼���������");
			return;
		}
		else if (rksl<0)
		{
			rs.close();
			ps.close();
			out.print("���󣡲��ϱ��롾"+clbm+"�������������С���㣺"+rksl);
			return;
		}
	}
	rs.close();
	ps.close();

	jxc.JxcClass jxc=new jxc.JxcClass();
	String jz=jxc.isJz(conn,ckbh);
	if (jz.equals("N"))//Nδ��ת��Y���ѽ�ת
	{
		out.print("�ϸ���û�н�ת�����ܽ��п�������"+jz);
		return;
	}

	conn.setAutoCommit(false);

	double rkzje=0;
	double zcpzje=0;
	double ccpzje=0;
	double wldszje=0;
	double thclzje=0;
	double bfclzje=0;
	ls_sql=" select sum(rkje),sum(rkj*zcpsl),sum(rkj*ccpsl),sum(rkj*wldssl),sum(rkj*thpsl),sum(rkj*bfpsl)";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		rkzje=rs.getDouble(1);
		zcpzje=rs.getDouble(2);
		ccpzje=rs.getDouble(3);
		wldszje=rs.getDouble(4);
		thclzje=rs.getDouble(5);
		bfclzje=rs.getDouble(6);
	}
	rs.close();
	ps.close();
		
	//�޸���ⵥ״̬����ⵥ���
	ls_sql="update jxc_rkd set rkdzt='3',rkzje=?,zcpzje=?,ccpzje=?,wldszje=?,thclzje=?,bfclzje=?";//0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	ls_sql+=" where  rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,rkzje);
	ps.setDouble(2,zcpzje);
	ps.setDouble(3,ccpzje);
	ps.setDouble(4,wldszje);
	ps.setDouble(5,thclzje);
	ps.setDouble(6,bfclzje);
	ps.executeUpdate();
	ps.close();


	int rkxh=0;
	double rkj=0;
	double zcpsl=0;
	double ccpsl=0;
	double bfpsl=0;
	double ccpzkl=0;
	String scrq=null;
	String scph=null;
	String hjbh=null;
	String nbbm=null;
	String hwbh=null;

	ls_sql=" select rkxh,clbm,nbbm,rkj,rksl,zcpsl,ccpsl,bfpsl,ccpzkl,scrq,scph,hjbh,hwbh";
	ls_sql+=" from jxc_rkmx ";
	ls_sql+=" where rkph='"+rkph+"' ";
	ls_sql+=" order by  rkxh";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		rkxh=rs.getInt("rkxh");
		clbm=rs.getString("clbm");
		nbbm=rs.getString("nbbm");
		rkj=rs.getDouble("rkj");
		rksl=rs.getDouble("rksl");
		zcpsl=rs.getDouble("zcpsl");
		ccpsl=rs.getDouble("ccpsl");
		bfpsl=rs.getDouble("bfpsl");
		ccpzkl=rs.getDouble("ccpzkl");
		scrq=cf.fillNull(rs.getString("scrq"));
		scph=cf.fillNull(rs.getString("scph"));
		hjbh=cf.fillNull(rs.getString("hjbh"));
		hwbh=cf.fillNull(rs.getString("hwbh"));


		if (hjbh.equals(""))
		{
			conn.rollback();
			out.println("���󣡲��ϡ�"+nbbm+"�������ܲ���Ϊ��");
			return;
		}

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

		if (zcpzsl<0)//�и����
		{
			if (!xsfs.equals("4"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
			{
				conn.rollback();
				out.println("���󣡲��ϡ�"+clbm+"�����۷�ʽ��������棬��ʵ�ʳ����˸����["+zcpzsl+"]������ϵϵͳ����Ա��ȷ�ϴ˲��Ͽ�����Ƿ���ȷ");
				return;
			}

			double zcpfkcs=0;
			ls_sql="SELECT sum(fkcs)";
			ls_sql+=" FROM jxc_ckmx";
			ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='1'";//1���޸���棻2���и����
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcpfkcs=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
			if (zcpzsl!=-1*zcpfkcs)
			{
				conn.rollback();
				out.println("���󣡲��ϡ�"+clbm+"���۸�����Ϊ��"+zcpzsl+"����������ϸ�и����Ϊ��"+zcpfkcs);
				return;
			}
		}


		if (ccpzsl<0)//�и����
		{
			if (!xsfs.equals("4"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
			{
				conn.rollback();
				out.println("���󣡲��ϡ�"+clbm+"�����۷�ʽ��������棬��ʵ�ʳ����˸����["+ccpzsl+"]������ϵϵͳ����Ա��ȷ�ϴ˲��Ͽ�����Ƿ���ȷ");
				return;
			}

			double ccpfkcs=0;
			ls_sql="SELECT sum(fkcs)";
			ls_sql+=" FROM jxc_ckmx";
			ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='2'";//1���޸���棻2���и����
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ccpfkcs=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
			if (ccpzsl!=-1*ccpfkcs)
			{
				conn.rollback();
				out.println("���󣡲��ϡ�"+clbm+"���۸�����Ϊ��"+ccpzsl+"����������ϸ�и����Ϊ��"+ccpfkcs);
				return;
			}
		}

		if (bfpzsl<0 )//�и����
		{
			if (!xsfs.equals("4"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
			{
				conn.rollback();
				out.println("���󣡲��ϡ�"+clbm+"�����۷�ʽ��������棬��ʵ�ʳ����˸����["+bfpzsl+"]������ϵϵͳ����Ա��ȷ�ϴ˲��Ͽ�����Ƿ���ȷ");
				return;
			}
			double bfpfkcs=0;
			ls_sql="SELECT sum(fkcs)";
			ls_sql+=" FROM jxc_ckmx";
			ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='3'";//1���޸���棻2���и����
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bfpfkcs=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();


			if (bfpzsl!=-1*bfpfkcs)
			{
				conn.rollback();
				out.println("���󣡲��ϡ�"+clbm+"���۸�����Ϊ��"+bfpzsl+"����������ϸ�и����Ϊ��"+bfpfkcs);
				return;
			}

		}

		String lsh=null;
		ls_sql=" select lsh ";
		ls_sql+=" from jxc_cklsb ";
		ls_sql+=" where ckph='"+lydh+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		while (rs1.next())
		{
			lsh=cf.fillNull(rs1.getString("lsh"));

			ls_sql=" update jxc_kcb set ztbz='N',rkph=?,rkxh=?,rksj=?,hwbh=?,hjbh=?,ckbh=?";
			ls_sql+=" where  lsh='"+lsh+"' ";
			ps2= conn.prepareStatement(ls_sql);
			ps2.setString(1,rkph);
			ps2.setInt(2,rkxh);
			ps2.setDate(3,rksj);
			ps2.setString(4,hwbh);
			ps2.setString(5,hjbh);
			ps2.setString(6,ckbh);
			ps2.executeUpdate();
			ps2.close();

		}
		rs1.close();
		ps1.close();

		//��Ȩƽ���ɱ���
		jxc.JsJqpjRkcbj(conn,dqbm,clbm,rkph);

	}
	rs.close();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ύ�ɹ���");
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