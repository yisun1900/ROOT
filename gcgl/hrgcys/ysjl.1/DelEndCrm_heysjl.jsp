<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yscsjlh=request.getParameter("yscsjlh");

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
	ls_sql+=" and clbz in('0','1')";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
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
		out.println("����δ���");
		return;
	}

	rwjh.Rwjh rwjh=new rwjh.Rwjh();

	conn.setAutoCommit(false);

	String ysjlh=null;
	String khbh=null;
	String oldgcysxmbm=null;
	String oldsfszhf=null;
	String oldhfszjlh=null;
	String oldgcjdbm=null;
	String oldygcjdbm=null;
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;

	String oldyysjlh=null;
	String oldygcysxmbm=null;
	java.sql.Date oldyyssj=null;
	int sjysjg=0;
	ls_sql="select ysjlh,khbh,gcysxmbm,sfszhf,hfszjlh,gcjdbm,ygcjdbm,ysfxhf,yhfrq,yhflxbm   ,yysjlh,ygcysxmbm,yyssj,sjysjg";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh ='"+yscsjlh+"'";
	ls_sql+=" and clbz in('0','1')";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��
	ls_sql+=" order by ysjlh desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ysjlh=rs1.getString("ysjlh");
		khbh=rs1.getString("khbh");
		oldgcysxmbm=rs1.getString("gcysxmbm");
		oldsfszhf=cf.fillNull(rs1.getString("sfszhf"));
		oldhfszjlh=cf.fillNull(rs1.getString("hfszjlh"));
		oldgcjdbm=cf.fillNull(rs1.getString("gcjdbm"));
		oldygcjdbm=cf.fillNull(rs1.getString("ygcjdbm"));
		oldysfxhf=cf.fillNull(rs1.getString("ysfxhf"));
		oldyhfrq=rs1.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs1.getString("yhflxbm"));

		oldyysjlh=cf.fillNull(rs1.getString("yysjlh"));
		oldygcysxmbm=cf.fillNull(rs1.getString("ygcysxmbm"));
		oldyyssj=rs1.getDate("yyssj");
		sjysjg=rs1.getInt("sjysjg");


		String clbz="9";//9��¼��δ��ɣ�0��û���⣻1:δ���գ�2�����գ�3���Ѵ���4���ѽ����5������ͨ����6������δͨ��

		ls_sql="update crm_heysjl set clbz=? ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clbz);
		ps.executeUpdate();
		ps.close();

		if (sjysjg==1)//���ϸ�������
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
		ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq,ysjlh,zqysxmbm,sgyssj,fwmj";
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
		}
		rs.close();
		ps.close();


		if (nowgcjdbm.equals("5"))
		{
			conn.rollback();
			out.println("��������ᣬ������ɾ��");
			return;
		}

		String nowyscsjlh="";//���մ�����¼��
		ls_sql="SELECT yscsjlh";
		ls_sql+=" FROM crm_heysjl ";
		ls_sql+=" where  ysjlh='"+nowysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nowyscsjlh=cf.fillNull(rs.getString("yscsjlh"));
		}
		rs.close();
		ps.close();

		if (!nowyscsjlh.equals(yscsjlh))
		{
			conn.rollback();
			out.println("����ֻ��ɾ�����µ����մ�����¼��:"+nowyscsjlh);
			return;
		}

		//��ȡ�ط����ü�¼��Ϣ
		String getsfyhf="";//�Ƿ��ѻط� ,Y���طã�N��δ�ط�
		String getzxszbz="";//�������ñ�־  ,Y���ǣ�N����
		String yhfszjlh=null;
		ls_sql="SELECT sfyhf,zxszbz,yhfszjlh ";
		ls_sql+=" FROM crm_hfszjl ";
		ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfyhf=cf.fillNull(rs.getString("sfyhf"));
			getzxszbz=cf.fillNull(rs.getString("zxszbz"));
			yhfszjlh=cf.fillNull(rs.getString("yhfszjlh"));
		}
		rs.close();
		ps.close();



		//ɾ���ط�������Ϣ��������������������������������ʼ
		if (oldsfszhf.equals("Y"))//��ǰ���ù��ط�, Y���ǣ�N����
		{
			if (getsfyhf.equals("N"))//�ͷ�û��ʵ�ʻط�
			{
				if (getzxszbz.equals("Y"))//�����¼�¼����ɾ��
				{
					//��ԭ����ǰ������Ϣ
					ls_sql="update crm_khxx set sfxhf=?,hflxbm=?,hfrq=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldysfxhf);
					ps.setString(2,oldyhflxbm);
					ps.setDate(3,oldyhfrq);
					ps.executeUpdate();
					ps.close();

					//ɾ���ط����ü�¼
					ls_sql="delete from crm_hfszjl ";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql=" update crm_hfszjl set zxszbz='Y'";	
					ls_sql+=" where hfszjlh='"+yhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{//δ�ط�,������,��һ����ǰһ������,ɾ������
					//ȡ��һ��
					String nexthfszjlh=null;
					ls_sql="SELECT hfszjlh ";
					ls_sql+=" FROM crm_hfszjl ";
					ls_sql+=" where  khbh='"+khbh+"' and yhfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						nexthfszjlh=cf.fillNull(rs.getString("hfszjlh"));
					}
					rs.close();
					ps.close();

					//��һ����ǰһ������
					ls_sql=" update crm_hfszjl set yhfszjlh=?";	
					ls_sql+=" where hfszjlh='"+nexthfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,yhfszjlh);
					ps.executeUpdate();
					ps.close();

					//ɾ�������ط����ü�¼
					ls_sql="delete from crm_hfszjl ";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
		//ɾ���ط�������Ϣ����������������������������������

		//ɾ�����̽���������Ϣ��������������������������������ʼ
		if (!oldgcjdbm.equals(""))//��ǰ���
		{
			if (!oldgcjdbm.equals(nowgcjdbm))//���õĹ��̽��ȱ����Ѹı䣬�������޸�
			{
//				conn.rollback();
//				out.println(ysjlh+":���󣡹��̽����Ѹı䣬�������޸ģ��ͻ����ڹ��̽���:"+nowgcjdbm+"���������ù��̽���:"+oldgcjdbm);
//				return;
			}
			else{//���޸�
				//����ɾ���ɵģ���������������������������ʼ
				if (oldgcjdbm.equals("1"))//1��δ������2���ѿ�����3���������գ�4���깤��5���ͻ���᣻6�����ι������
				{
					ls_sql="update crm_khxx set gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("2"))
				{
					ls_sql="update crm_khxx set sjkgrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();

				}
				else if (oldgcjdbm.equals("6"))
				{
					ls_sql="update crm_khxx set sybgcrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("3"))
				{
					ls_sql="update crm_khxx set szqsj=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("4"))
				{
					ls_sql="update crm_khxx set sjjgrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				//����ɾ���ɵģ�����������������������������
			}
		}
		//ɾ�����̽���������Ϣ����������������������������������



		ls_sql="update crm_heysjl set sfszhf='N',hfszjlh=null,gcjdbm=null,ygcjdbm=null,ysfxhf=null,yhfrq=null,yhflxbm=null,jdbm=null  ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		if (oldgcjdbm.equals("2"))
		{
			//ɾ������ʼ�����ͻ�ʩ���ƻ���
			rwjh.deleteInitRw(conn,khbh);

			//ɾ�������ո��£��ͻ�ʩ���ƻ���
			rwjh.deleteUpdateYsxmYsHr(conn,yscsjlh);
		}
		else{
			//ɾ�������ո��£��ͻ�ʩ���ƻ���
			rwjh.deleteUpdateYsxmYsHr(conn,yscsjlh);
		}
	}
	rs1.close();
	ps1.close();
	

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