<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sjr=null;
java.sql.Date sjsj=null;

sjr=cf.GB2Uni(request.getParameter("sjr"));
ls=request.getParameter("sjsj");
try{
	if (!(ls.equals("")))  sjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ͻ�ʱ��]����ת����������:"+e);
	return;
}


double fkje=0;
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�տ���]����ת����������:"+e);
	return;
}
java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ʱ��]����ת����������:"+e);
	return;
}
String dsksjbz=cf.GB2Uni(request.getParameter("dsksjbz"));
String shyj=cf.GB2Uni(request.getParameter("shyj"));


String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String skdd=null;
	String getdsksjbz=null;
	String scbz=null;
	String fklxbm=null;
	String glxh=null;
	String gysbh=null;
	String ddbh=null;
	String zjxbh=null;
	String zcgysbh=null;
	String zcddbh=null;
	String zczjxbh=null;

	ls_sql="select khbh,skdd,dsksjbz,scbz,fklxbm,glxh,gysbh,ddbh,zjxbh,zcgysbh,zcddbh,zczjxbh";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		skdd=rs.getString("skdd");
		getdsksjbz=rs.getString("dsksjbz");
		scbz=rs.getString("scbz");
		fklxbm=rs.getString("fklxbm");
		glxh=rs.getString("glxh");
		gysbh=cf.fillNull(rs.getString("gysbh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxbh=cf.fillNull(rs.getString("zjxbh"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
	}
	else{
		rs.close();
		ps.close();

		out.println("���󣡲����ڵ��տ����");
		return;
	}
	rs.close();
	ps.close();

	if (scbz.equals("Y"))
	{
		out.println("�����տ����["+fkxh+"]�ѱ�ɾ��");
		return;
	}

	if (skdd.equals("2"))//1�������տ2���ǲ�����տ�
	{
		if (!getdsksjbz.equals("N"))//N:��Y:��
		{
			out.println("���������");
			return;
		}
	}
	else{
		out.println("�����Ƿ�����˲���ȷ");
		return;
	}
	
	conn.setAutoCommit(false);


	ls_sql="update cw_khfkjl set sjr=?,sjsj=?,fkje=?,shsj=SYSDATE,dsksjbz=?,shyj=?";
	ls_sql+=" where  (fkxh='"+fkxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjr);
	ps.setDate(2,sjsj);
	ps.setDouble(3,fkje);
	ps.setString(4,dsksjbz);
	ps.setString(5,shyj);
	ps.executeUpdate();
	ps.close();

	if (glxh!=null)
	{
		ls_sql="update cw_khfkjl set sjr=?,sjsj=?,fkje=?,shsj=SYSDATE,dsksjbz=?,shyj=?";
		ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjr);
		ps.setDate(2,sjsj);
		ps.setDouble(3,-1*fkje);
		ps.setString(4,dsksjbz);
		ps.setString(5,shyj);
		ps.executeUpdate();
		ps.close();
	}

	//�����տ���������Ҫ���¼���
	if ( true)//11����װ��
	{
		//��װ�����+++++++++++++++++++++++++++++++++++++++��ʼ
		double zjxssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//������ʵ�տ�
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//��װ����տ�ʱ��
		java.sql.Date getjzkscsj=null;//�״θ���װ��ʱ��
		String getjzkfkxh=null;//��װ����տ����
		int getjzkfkcs=0;//��װ�տ�����
		ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//���չ��̿�
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//ȡ�����տ����
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//�����װ����տ�ʱ��
		java.sql.Date getcwjzkscsj=null;//�����״θ���װ��ʱ��
		String getcwjzkfkxh=null;//�����װ����տ����
		int getcwjzkfkcs=0;//�����װ�տ�����

		ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//���չ��̿�
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.executeUpdate();
		ps.close();

		//��װ�����--------------------------------------------���
	}

	if (true)//52����������
	{
		double sfke=0;
		double maxsfke=0;
		java.sql.Date jlfdjsj=null;
		String lfdjbz="N";
		ls_sql="select sum(fkje),max(fkje),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//��������
			maxsfke=rs.getDouble(2);//�����������
			jlfdjsj=rs.getDate(3);//����������ʱ��
		}
		rs.close();
		ps.close();


		if (sfke>0)
		{
			lfdjbz="Y";//N��δ������Y���ѽ�����T�����˶���
		}
		else 
		{
			if (maxsfke>0)
			{
				lfdjbz="T";
			}
			else{
				lfdjbz="N";
			}
		}

		ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//��Ʒ��Ƿ��ת��
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lfdjbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jlfdjsj);
		ps.executeUpdate();
		ps.close();
	}
	if (true)//51�����������
	{
		double sfke=0;
		double maxsfke=0;
		java.sql.Date jhddjsj=null;
		String hddjbz="N";
		ls_sql="select sum(fkje),max(fkje),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//�����
			maxsfke=rs.getDouble(2);//�������
			jhddjsj=rs.getDate(3);//�������ʱ��
		}
		rs.close();
		ps.close();

		if (sfke>0)
		{
			hddjbz="Y";//N��δ������Y���ѽ�����T�����˶���
		}
		else 
		{
			if (maxsfke>0)
			{
				hddjbz="T";
			}
			else{
				hddjbz="N";
			}
		}

		ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//��Ʒ��Ƿ��ת��
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hddjbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jhddjsj);
		ps.executeUpdate();
		ps.close();
	}
	if (true)//53����Ʒ�
	{
		double sfke=0;
		double maxsfke=0;
		java.sql.Date jsjfsj=null;
		String sjfbz="N";
		ls_sql="select sum(fkje),max(fkje),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//��Ʒ�
			maxsfke=rs.getDouble(2);//�����Ʒ�
			jsjfsj=rs.getDate(3);//����Ʒ�ʱ��
		}
		rs.close();
		ps.close();


		if (sfke>0)
		{
			sjfbz="Y";//N��δ����Ʒѣ�Y���ѽ���Ʒѣ�T������Ʒ�
		}
		else 
		{
			if (maxsfke>0)
			{
				sjfbz="T";
			}
			else{
				sjfbz="N";
			}
		}

		ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjfbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jsjfsj);
		ps.executeUpdate();
		ps.close();

		//���ã���ƷѼ���ҵ��ʱ�䣫��������������������������ʼ
		double sjhtje=0;
		java.sql.Date sjfjryjsj=null;
		ls_sql="select sjhtje,sjfjryjsj";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"' and qsjhtbz='Y'";//N��δǩ��Y��ǩ��ͬ
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjhtje=rs.getDouble(1);//��ƺ�ͬ���
			sjfjryjsj=rs.getDate(2);//��ƷѼ���ҵ��ʱ��
		}
		rs.close();
		ps.close();

		double cwsssjf=0;
		java.sql.Date maxsjsj=null;
		ls_sql="select sum(fkje),max(sjsj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cwsssjf=rs.getDouble(1);//��Ʒ�
			maxsjsj=rs.getDate(2);
		}
		rs.close();
		ps.close();

		if (sjfjryjsj==null)
		{
			if (cwsssjf>=sjhtje)
			{
				sjfjryjsj=maxsjsj;
				ls_sql="update crm_zxkhxx set sjfjryjsj=?";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,sjfjryjsj);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			if (cwsssjf<sjhtje)
			{
				sjfjryjsj=null;
				ls_sql="update crm_zxkhxx set sjfjryjsj=?";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,sjfjryjsj);
				ps.executeUpdate();
				ps.close();
			}
		}
		//���ã���ƷѼ���ҵ��ʱ�䣽����������������������������
	}


	if (true)//23:����
	{
		if (!zjxbh.equals(""))
		{
			double sskje=0;//ʵ�տ���
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and zjxbh='"+zjxbh+"'";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sskje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (sskje<0)
			{
				out.println("���ѣ��ö����ۼƸ����ܶ�Ϊ����:"+sskje);
			}

			double shsskje=0;//�������ʵ�տ���
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and zjxbh='"+zjxbh+"'";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
			ls_sql+=" where zjxbh='"+zjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double getzjxze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select zjxze,yjjzsj";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where zjxbh='"+zjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			if (yjjzsj==null)
			{
				if (shsskje>=getzjxze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{
				if (shsskje<getzjxze)
				{
					yjjzsj=null;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}

		
		}
		else if (!ddbh.equals(""))
		{
			double sskje=0;//ʵ�տ���
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and ddbh='"+ddbh+"'";
			ls_sql+=" and zjxbh is null";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sskje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (sskje<0)
			{
				out.println("���ѣ��ö����ۼƸ����ܶ�Ϊ����:"+sskje);
			}

			double shsskje=0;//�������ʵ�տ���
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and ddbh='"+ddbh+"'";
			ls_sql+=" and zjxbh is null";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double gethkze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select hkze,yjjzsj";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gethkze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();


			if (yjjzsj==null)
			{
				if (shsskje>=gethkze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();

				}
			}
			else{
				if (shsskje<gethkze)
				{
					yjjzsj=null;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
	}
	if (true)//23:����
	{
		if (!zczjxbh.equals(""))
		{
			double sskje=0;//ʵ�տ���
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and zjxbh='"+zczjxbh+"'";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sskje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (sskje<0)
			{
				out.println("���ѣ��ö����ۼƸ����ܶ�Ϊ����:"+sskje);
			}

			double shsskje=0;//�������ʵ�տ���
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and zjxbh='"+zczjxbh+"'";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
			ls_sql+=" where zjxbh='"+zczjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double getzjxze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select zjxze,yjjzsj";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where zjxbh='"+zczjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			if (yjjzsj==null)
			{
				if (shsskje>=getzjxze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zczjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{
				if (shsskje<getzjxze)
				{
					yjjzsj=null;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zczjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}

		
		}
		else if (!zcddbh.equals(""))
		{
			double sskje=0;//ʵ�տ���
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and ddbh='"+zcddbh+"'";
			ls_sql+=" and zjxbh is null";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sskje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (sskje<0)
			{
				out.println("���ѣ��ö����ۼƸ����ܶ�Ϊ����:"+sskje);
			}

			double shsskje=0;//�������ʵ�տ���
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and ddbh='"+zcddbh+"'";
			ls_sql+=" and zjxbh is null";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:����
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
			ls_sql+=" where ddbh='"+zcddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double gethkze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select hkze,yjjzsj";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where ddbh='"+zcddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gethkze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();


			if (yjjzsj==null)
			{
				if (shsskje>=gethkze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+zcddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();

				}
			}
			else{
				if (shsskje<gethkze)
				{
					yjjzsj=null;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+zcddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
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