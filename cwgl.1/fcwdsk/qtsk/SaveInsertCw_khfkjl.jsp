<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String fkxh=null;
String sjbh=null;
String jsjlh=null;
String fklxbm=null;
double fkje=0;
String jkr=null;
String skr=null;
java.sql.Date sksj=null;
String skdw=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
fkxh=cf.GB2Uni(request.getParameter("fkxh"));
sjbh=cf.GB2Uni(request.getParameter("sjbh"));
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
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
jkr=cf.GB2Uni(request.getParameter("jkr"));
skr=cf.GB2Uni(request.getParameter("skr"));
ls=request.getParameter("sksj");
try{
	if (!(ls.equals("")))  sksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sksj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�տ�ʱ��]����ת����������:"+e);
	return;
}
skdw=cf.GB2Uni(request.getParameter("skdw"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String zffs=request.getParameter("zffs");
String zckx=request.getParameter("zckx");
String lrdw=request.getParameter("lrdw");

String sjs=cf.GB2Uni(request.getParameter("sjs"));
String sjsbh=request.getParameter("sjsbh");
String dwbh=request.getParameter("dwbh");
String fgsbh=request.getParameter("fgsbh");
String zcgysbh=cf.GB2Uni(request.getParameter("zcgysbh"));
String zzyhkh=cf.GB2Uni(request.getParameter("zzyhkh"));
String fkkhxm=cf.GB2Uni(request.getParameter("fkkhxm"));
String fkfwdz=cf.GB2Uni(request.getParameter("fkfwdz"));

String skdd="2";//�Ƿ������  1��������ˣ�2�������
String dsksjbz="N";//��˱�־  N: δ��ˣ�Y: �����

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zcddbh="";
	String zczjxbh="";
	int pos=zcgysbh.indexOf("*");
	if (pos!=-1)
	{
		zcddbh=zcgysbh.substring(pos+1);
		zcgysbh=zcgysbh.substring(0,pos);
	}
	pos=zcddbh.indexOf("*");
	if (pos!=-1)
	{
		zczjxbh=zcddbh.substring(pos+1);
		zcddbh=zcddbh.substring(0,pos);
	}

	//�ж�ת�����Ƿ����
	if (zffs.equals("31"))//31��ת��
	{
		if (zckx.equals("23"))//23:����
		{
			String zcmmbz="";//�����տ���
			ls_sql=" select zcmmbz ";
			ls_sql+=" from sq_dwxx";
			ls_sql+=" where dwbh='"+fgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
			}
			rs.close();
			ps.close();

			if (zcmmbz.equals("Y"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
			{
				if (zczjxbh.equals(""))
				{
					double yfk=0;
					ls_sql="select sum(fkje)";
					ls_sql+=" from  cw_khfkjl";
					ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and ddbh='"+zcddbh+"' and zjxbh is null and scbz='N'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						yfk=rs.getDouble(1);//����ת����
					}
					rs.close();
					ps.close();

					double ddje=0;
					ls_sql="select sum(hkze)";
					ls_sql+=" from  jc_zcdd";
					ls_sql+=" where ddbh='"+zcddbh+"'";
					ls_sql+=" and clzt not in('98','99')";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						ddje=rs.getDouble(1);//�������
					}
					rs.close();
					ps.close();

					if (fkje>(yfk-ddje))
					{
						out.print("����ת����㣬��ת��"+(yfk-ddje)+"������["+zcddbh+"]�Ѹ��"+yfk+"��������"+ddje);
						return;
					}

				}
				else{
					double yfk=0;
					ls_sql="select sum(fkje)";
					ls_sql+=" from  cw_khfkjl";
					ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and ddbh='"+zcddbh+"' and zjxbh='"+zczjxbh+"' and scbz='N'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						yfk=rs.getDouble(1);//����ת����
					}
					rs.close();
					ps.close();

					double ddje=0;
					ls_sql="select sum(zjxze)";
					ls_sql+=" from  jc_zczjx";
					ls_sql+=" where zjxbh='"+zczjxbh+"'";
					ls_sql+=" and clzt not in('00','99')";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						ddje=rs.getDouble(1);//�������
					}
					rs.close();
					ps.close();

					if (fkje>(yfk-ddje))
					{
						out.print("����ת����㣬��ת��"+(yfk-ddje)+"��������["+zczjxbh+"]�Ѹ��"+yfk+"��������"+ddje);
						return;
					}
				}
			}
			else if (zcmmbz.equals("N"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
			{
				double yfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and gysbh='"+zcgysbh+"' and scbz='N'";
		//		out.println(ls_sql);
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					yfk=rs.getDouble(1);//����ת����
				}
				rs.close();
				ps.close();

				double ddje=0;
				ls_sql="select sum(hkze+zjhze)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and ppbm='"+zcgysbh+"'";
				ls_sql+=" and clzt not in('98','99')";
				ls_sql+=" and (hkze!=0 OR hkze!=0)";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ddje=rs.getDouble(1);//�������
				}
				rs.close();
				ps.close();

				if (fkje>(yfk-ddje))
				{
					out.print("����ת����㣬��ת��"+(yfk-ddje)+"��Ʒ��["+zcgysbh+"]�Ѹ��"+yfk+"��Ʒ�ƶ�����"+ddje);
					return;
				}
			}
			else if (zcmmbz.equals("M"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
			{
				double yfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and scbz='N'";
		//		out.println(ls_sql);
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					yfk=rs.getDouble(1);//����ת����
				}
				rs.close();
				ps.close();

				double ddje=0;
				ls_sql="select sum(hkze+zjhze)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and clzt not in('98','99')";
				ls_sql+=" and (hkze!=0 OR hkze!=0)";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ddje=rs.getDouble(1);//�������
				}
				rs.close();
				ps.close();

				if (fkje>(yfk-ddje))
				{
					out.print("����ת����㣬��ת��"+(yfk-ddje)+"�������Ѹ��"+yfk+"�����ĸ����"+ddje);
					return;
				}
			}
		}
		//ת������
		else 
		{
			double yfk=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yfk=rs.getDouble(1);//����ת����
			}
			rs.close();
			ps.close();

			if (fkje>yfk)
			{
				out.print("����ת����㣬[ת����]���ý�"+yfk);
				return;
			}
		}
	}

	conn.setAutoCommit(false);

	ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,sjs,sjsbh,dwbh,fgsbh,sjfkzc   ,zcgysbh,zcddbh,zczjxbh,czlx,zrkdcpz,zckdcpz,scbz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ) ";
	ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?,?,?,?,?,?                                  ,?,?,?,'1','0','0','N',?,?                                    ,'N',?,?,?,?,?) ";//1�������տ2���ǲ�����տ�
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,fkxh);
	ps.setString(3,sjbh);
	ps.setString(4,fklxbm);
	ps.setDouble(5,fkje);
	ps.setString(6,jkr);
	ps.setString(7,skr);
	ps.setDate(8,sksj);
	ps.setString(9,skdw);
	ps.setString(10,lrr);

	ps.setDate(11,lrsj);
	ps.setString(12,bz);
	ps.setString(13,zffs);
	ps.setString(14,zckx);
	ps.setString(15,lrdw);
	ps.setString(16,sjs);
	ps.setString(17,sjsbh);
	ps.setString(18,dwbh);
	ps.setString(19,fgsbh);
	ps.setString(20,"");

	ps.setString(21,zcgysbh);
	ps.setString(22,zcddbh);
	ps.setString(23,zczjxbh);
	ps.setString(24,null);
	ps.setDate(25,null);

	ps.setString(26,skdd);
	ps.setString(27,dsksjbz);
	ps.setString(28,fkkhxm);
	ps.setString(29,fkfwdz);
	ps.setString(30,zzyhkh);
	ps.executeUpdate();
	ps.close();


	//��飺�������Ϊ����������������������������������������ʼ 
	double allze=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ls_sql+=" and fklxbm='"+fklxbm+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (fkje<0 && allze<0)
	{
		conn.rollback();
		out.println("���󣡸ø��������ۼƸ����ܶ��Ϊ����:"+allze);
		return;
	}
	//��飺�������Ϊ������������������������������������������ 



	//ת�����ʽ�����ɹ�����¼
	int glxh=0;//�������
	int count=0;

	if (zffs.equals("31") )//ת�ʿ�����ɹ�����¼
	{
		//��ȡ�������
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		
		//������������¼ 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,gysbh,ddbh,zjxbh,fkje,jkr,skr,sksj   ,skdw,lrr,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,sjs,sjsbh,dwbh,fgsbh,sjfkzc   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ) ";
		ls_sql+=" values (             ?,?,?,?,?,?,?,?,?,?,?                                       ,?,?,?,?,?,?,?                     ,'N'    ,?,?,?,?,?                     ,'1','0','0',?,?,?                     ,'Y',?,?,?,?,?) ";//1�������տ2���ǲ�����տ�
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,sjbh);
		ps.setString(4,zckx);
		ps.setString(5,zcgysbh);
		ps.setString(6,zcddbh);
		ps.setString(7,zczjxbh);
		ps.setDouble(8,-1*fkje);
		ps.setString(9,jkr);
		ps.setString(10,skr);
		ps.setDate(11,sksj);

		ps.setString(12,skdw);
		ps.setString(13,lrr);
		ps.setDate(14,lrsj);
		ps.setString(15,bz);
		ps.setString(16,zffs);
		ps.setString(17,fklxbm);
		ps.setString(18,lrdw);


		ps.setString(19,sjs);
		ps.setString(20,sjsbh);
		ps.setString(21,dwbh);
		ps.setString(22,fgsbh);
		ps.setString(23,"");

		ps.setString(24,null);
		ps.setDate(25,null);
		ps.setInt(26,glxh);

		ps.setString(27,skdd);
		ps.setString(28,dsksjbz);
		ps.setString(29,fkkhxm);
		ps.setString(30,fkfwdz);
		ps.setString(31,zzyhkh);
		ps.executeUpdate();
		ps.close();

		//���������¼ 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_zxkhxx set sjfkzc=?";//��Ʒ��Ƿ��ת��
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"");
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set sjfkzc=?";//��Ʒ��Ƿ��ת��
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"");
	ps.executeUpdate();
	ps.close();


	//���£����������־��������־����Ʒѱ�־
	if (fklxbm.equals("52"))//52����������
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
	else if (fklxbm.equals("51"))//51�����������
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
	else if (fklxbm.equals("53"))//53����Ʒ�
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
		else if (sfke==0)
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
	}


	if (zffs.equals("31"))//ת�ʿ���
	{
		if ( zckx.equals("11"))//11����װ��
		{
			//��װ�����+++++++++++++++++++++++++++++++++++++++
			double getsfke=0;//
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getsfke=rs.getDouble(1);//���չ��̿�
			}
			rs.close();
			ps.close();

			//ȡ�����տ����
			double getcwsfke=0;//

			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
			ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getcwsfke=rs.getDouble(1);//���չ��̿�
			}
			rs.close();
			ps.close();

			double getzjxssk=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxssk=rs.getDouble(1);//������ʵ�տ�
			}
			rs.close();
			ps.close();

			//���£����̿�ʵ�տ��ʡ����̿�ʵ�տ��
			ls_sql="update crm_khxx set sfke=?,cwsfke=?,zjxssk=?";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,getsfke);
			ps.setDouble(2,getcwsfke);
			ps.setDouble(3,getzjxssk);
			ps.executeUpdate();
			ps.close();

			//��װ�����--------------------------------------------
		}
		else if (zckx.equals("52"))//52����������
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
		else if (zckx.equals("51"))//51�����������
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
		else if (zckx.equals("53"))//53����Ʒ�
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
		}
		else if (zckx.equals("23"))//23:����
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
					conn.rollback();
					out.println("���󣡸ö����ۼƸ����ܶ��Ϊ����:"+sskje);
					return;
				}

				ls_sql="update jc_zczjx set sskje=? ";
				ls_sql+=" where zjxbh='"+zczjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.executeUpdate();
				ps.close();
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
					conn.rollback();
					out.println("���󣡸ö����ۼƸ����ܶ��Ϊ����:"+sskje);
					return;
				}

				ls_sql="update jc_zcdd set sskje=? ";
				ls_sql+=" where ddbh='"+zcddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.executeUpdate();
				ps.close();
			}
		}
	}

	double getkhfkze=0;
	java.sql.Date minkhsksj=null;
	java.sql.Date maxkhsksj=null;
	ls_sql="select sum(fkje),min(sksj),max(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhfkze=rs.getDouble(1);
		minkhsksj=rs.getDate(2);
		maxkhsksj=rs.getDate(3);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_zxkhxx set scfksj=?,zjfksj=?,fkze=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,minkhsksj);
	ps.setDate(2,maxkhsksj);
	ps.setDouble(3,getkhfkze);
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
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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