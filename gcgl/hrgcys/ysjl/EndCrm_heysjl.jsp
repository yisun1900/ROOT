<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yscsjlh=request.getParameter("yscsjlh");

String ls=null;
java.sql.Date yqjjsj=null;
ls=request.getParameter("yqjjsj");
try{
	if (!(ls.equals("")))  yqjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yqjjsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Ҫ����ʱ��]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int wwcsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh ='"+yscsjlh+"'";
	ls_sql+=" and clbz='9'";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wwcsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (wwcsl==0)
	{
		out.println("���������");
		return;
	}

	rwjh.Rwjh rwjh=new rwjh.Rwjh();

	conn.setAutoCommit(false);

	String ysjlh = null;
	String khbh = null;
	String gcysxmbm = null;
	java.sql.Date yssj=null;
	String lrr = null;
	java.sql.Date lrsj=null;
	String ysr = null;
	String sjysjg = null;
	String xlrmx = null;
	int zpsl=0;
	ls_sql="select ysjlh,khbh,gcysxmbm,ysr,yssj,lrr,lrsj,sjysjg,xlrmx,zpsl";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh ='"+yscsjlh+"'";
	ls_sql+=" and clbz='9'";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
	ls_sql+=" order by ysjlh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ysjlh=cf.fillNull(rs1.getString("ysjlh"));
		khbh=cf.fillNull(rs1.getString("khbh"));
		gcysxmbm=cf.fillNull(rs1.getString("gcysxmbm"));
		ysr=cf.fillNull(rs1.getString("ysr"));
		yssj=rs1.getDate("yssj");
		lrr=cf.fillNull(rs1.getString("lrr"));
		lrsj=rs1.getDate("lrsj");
		sjysjg=cf.fillNull(rs1.getString("sjysjg"));//0���ϸ�1�����ϸ�
		xlrmx=cf.fillNull(rs1.getString("xlrmx"));
		zpsl=rs1.getInt("zpsl");


		if (xlrmx.equals("2"))//1������¼�룻2����¼�룻3����¼��
		{
			conn.rollback();
			out.println("����δ¼��������Ŀ�����ռ�¼��:"+ysjlh);
			return;
		}
		if (zpsl==0)
		{
			conn.rollback();
			out.println("����δ�ϴ���Ƭ�����ռ�¼��:"+ysjlh);
			return;
		}


		String clbz="";//0��û���⣻1:δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
		if (sjysjg.equals("1"))//0���ϸ�1�����ϸ�
		{
			clbz="1";

			if (yqjjsj==null)
			{
				conn.rollback();
				out.println("���󣡷������ģ�δ¼�롾����Ҫ����ʱ�䡿:"+ysjlh);
				return;
			}
		}
		else{
			clbz="0";
		}

		ls_sql="update crm_heysjl set clbz=?,yqjjsj=? ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clbz);
		ps.setDate(2,yqjjsj);
		ps.executeUpdate();
		ps.close();

		if (sjysjg.equals("1"))//���ϸ�������
		{
			continue;
		}


		//��ȡ�ͻ��طú͹��̽�����Ϣ
		String nowgcjdbm=null;
		java.sql.Date nowhfrq=null;
		String nowhflxbm=null;
		String nowsfxhf=null;
		String nowysjlh=null;
		String nowzqysxmbm=null;
		java.sql.Date nowszqsj=null;
		double fwmj = 0;
		String fgsbh=null;
		ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq,ysjlh,zqysxmbm,sgyssj,fwmj,fgsbh";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			nowhflxbm=cf.fillNull(rs.getString("hflxbm"));
			nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
			nowhfrq=rs.getDate("hfrq");
			nowysjlh=cf.fillNull(rs.getString("ysjlh"));
			nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
			nowszqsj=rs.getDate("sgyssj");
			fwmj=rs.getDouble("fwmj");
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
		}
		rs.close();
		ps.close();

		String qdysxm="";//�������������Ŀ
		ls_sql="SELECT qdysxm";
		ls_sql+=" FROM sq_dwxx ";
		ls_sql+=" where  dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qdysxm=cf.fillNull(rs.getString("qdysxm"));
		}
		rs.close();
		ps.close();

		if (qdysxm.equals(""))
		{
			conn.rollback();
			out.println("����δ���á��������������Ŀ��");
			return;
		}

		//��ȡ������Ŀ��Ϣ
		String dygcjdbm="";
		String getsfxhf="";
		String gethflxbm="";
		String sfsgjdb = null;//�Ƿ����ʩ�����ȱ�
		String jdbm = null;//ʩ�����Ƚ��Ƚڵ�
		ls_sql="SELECT dygcjdbm,sfhf,hflxbm,sfsgjdb,jdbm";
		ls_sql+=" FROM dm_heysxm ";
		ls_sql+=" where  gcysxmbm='"+gcysxmbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
			getsfxhf=cf.fillNull(rs.getString("sfhf"));
			gethflxbm=cf.fillNull(rs.getString("hflxbm"));
			sfsgjdb=cf.fillNull(rs.getString("sfsgjdb"));
			jdbm=cf.fillNull(rs.getString("jdbm"));
		}
		rs.close();
		ps.close();

		if (!dygcjdbm.equals(""))
		{
			//����Ƿ������ù��̽���
			if (dygcjdbm.equals("1"))//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������
			{
				if (nowgcjdbm.equals("2") || nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
				{
					conn.rollback();
					out.println("���󣡿ͻ��ѿ������������ó�δ����");
					return;
				}
			}
			else if (dygcjdbm.equals("2"))
			{
				if (nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
				{
					conn.rollback();
					out.println("���󣡿ͻ��Ѿ�������������������");
					return;
				}
			}
			else if (dygcjdbm.equals("6"))
			{
				if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
				{
					conn.rollback();
					out.println("���󣡿ͻ����깤�����ô���");
					return;
				}
			}
			else if (dygcjdbm.equals("3"))
			{
				if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
				{
					conn.rollback();
					out.println("���󣡿ͻ����깤�����ô���");
					return;
				}
			}
			else if (dygcjdbm.equals("4"))
			{
				if (nowgcjdbm.equals("5"))
				{
					conn.rollback();
					out.println("���󣡿ͻ�����ᣬ���ô���");
					return;
				}
			}



			if (dygcjdbm.equals("1"))//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������
			{
				ls_sql="update crm_khxx set gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("2"))
			{
				ls_sql="update crm_khxx set sjkgrq=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("6"))
			{
				ls_sql="update crm_khxx set sybgcrq=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("3"))
			{
				ls_sql="update crm_khxx set szqsj=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("4"))
			{
				ls_sql="update crm_khxx set sjjgrq=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
		}




		String hfszjlh=null;
		if (getsfxhf.equals("Y"))//�Զ����ûط�
		{
			ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?+1 ";
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,gethflxbm);
			ps.setDate(2,yssj);
			ps.executeUpdate();
			ps.close();

			//���룺�ط����ü�¼������������������������������������������ʼ
			String yhfszjlh=null;
			ls_sql="select hfszjlh";
			ls_sql+=" from  crm_hfszjl";
			ls_sql+=" where khbh='"+khbh+"' and zxszbz='Y'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yhfszjlh=rs.getString("hfszjlh");
			}
			rs.close();
			ps.close();

			ls_sql=" update crm_hfszjl set zxszbz='N'";	
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			int count=0;
			ls_sql="select NVL(max(substr(hfszjlh,8,3)),0)";
			ls_sql+=" from  crm_hfszjl";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			hfszjlh=khbh+cf.addZero(count+1,3);

			String hfszyy=ysjlh+":��������";
			ls_sql=" insert into crm_hfszjl (hfszjlh,khbh,hflxbm,hfsj,hfszr,hfszsj,hfszyy,lx,hfzcgjz,sfyhf,zxszbz,yhfszjlh) ";	
			ls_sql+=" values ( ?,?,?,?+1,?,SYSDATE,?,'5',?,'N','Y',?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfszjlh);
			ps.setString(2,khbh);
			ps.setString(3,gethflxbm);
			ps.setDate(4,yssj);
			ps.setString(5,lrr);
			ps.setString(6,hfszyy);
			ps.setString(7,ysjlh);
			ps.setString(8,yhfszjlh);
			ps.executeUpdate();
			ps.close();
			//���룺�ط����ü�¼��������������������������������������������
		}


		ls_sql="update crm_heysjl set sfszhf=?,hfszjlh=?,gcjdbm=?,sfsgjdb=?,jdbm=?  ";
		ls_sql+=" ,ygcjdbm=?,ysfxhf=?,yhfrq=?,yhflxbm=? ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,getsfxhf);
		ps.setString(2,hfszjlh);
		ps.setString(3,dygcjdbm);
		ps.setString(4,sfsgjdb);
		ps.setString(5,jdbm);

		ps.setString(6,nowgcjdbm);
		ps.setString(7,nowsfxhf);
		ps.setDate(8,nowhfrq);
		ps.setString(9,nowhflxbm);

		ps.executeUpdate();
		ps.close();


		if (gcysxmbm.equals(qdysxm))
		{
			//ɾ������ʼ�����ͻ�ʩ���ƻ���
			rwjh.deleteInitRw(conn,khbh);


			//��ʼ�����ͻ�ʩ���ƻ���
			rwjh.initRw(conn,khbh,lrr);
			//���ո��£��ͻ�ʩ���ƻ���
			rwjh.updateYsxmYsHr(conn,yscsjlh);
		}
		else{
			//���ո��£��ͻ�ʩ���ƻ���
			rwjh.updateYsxmYsHr(conn,yscsjlh);
		}
	}
	rs1.close();
	ps1.close();
	


	conn.commit();

	//���Ͷ���
	ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
	String retStr=dxxt.gcysKhFsHr(conn,yscsjlh,lrr);//���÷��Ͷ��ź���
	if (retStr.equals(""))
	{
		out.println("���ŷ��ͳɹ�");
	}
	else{
		out.println(retStr);//�����ͽ����ʾ��ҳ����
	}

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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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