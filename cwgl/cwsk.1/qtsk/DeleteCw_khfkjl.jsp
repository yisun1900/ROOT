<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");

String[] fkxh=request.getParameterValues("fkxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String zffs=null;
String zckx=null;
String scbz=null;
String czlx=null;
String glxh=null;
String fklxbm=null;
String gljlbz=null;
String fkyjjzsj=null;

String ddbh=null;
String zjxbh=null;
String zcddbh=null;
String zczjxbh=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<fkxh.length ;i++ )
	{
		glxh=null;
		ls_sql="select khbh,scbz,zffs,zckx,czlx,glxh,fklxbm,gljlbz,yjjzsj,ddbh,zjxbh,zcddbh,zczjxbh";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			scbz=rs.getString("scbz");
			zffs=rs.getString("zffs");
			zckx=rs.getString("zckx");
			czlx=rs.getString("czlx");
			glxh=rs.getString("glxh");
			fklxbm=rs.getString("fklxbm");
			gljlbz=cf.fillNull(rs.getString("gljlbz"));
			fkyjjzsj=cf.fillNull(rs.getString("yjjzsj"));
			ddbh=cf.fillNull(rs.getString("ddbh"));
			zjxbh=cf.fillNull(rs.getString("zjxbh"));
			zcddbh=cf.fillNull(rs.getString("zcddbh"));
			zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
		}
		else{
			conn.rollback();
			out.println("���󣡲����ڵ��տ���ţ�"+fkxh[i]);
			return;
		}
		rs.close();
		ps.close();

		String khjsbz="";
		ls_sql="select khjsbz";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khjsbz=cf.fillNull(rs.getString("khjsbz"));
		}
		rs.close();
		ps.close();

		if (khjsbz.equals("Y"))
		{
			conn.rollback();
			out.println("���󣡿ͻ��ѽ��㣬�������޸�");
			return;
		}

		if (!fkyjjzsj.equals(""))
		{
//			conn.rollback();
//			out.println("�տ��¼�ѽ�ת���������޸ģ���תʱ�䣺"+yjjzsj);
//			return;
		}

		if (gljlbz.equals("Y"))//N���ǹ�����¼��Y��������¼
		{
			String glfkxh=null;
			ls_sql="select fkxh";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where glxh='"+glxh+"' and gljlbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				glfkxh=cf.fillNull(rs.getString("fkxh"));
			}
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<P>�����տ��¼["+fkxh[i]+"]�ǹ�����¼������ֱ��ɾ������ɾ��ԭʼ��¼��"+glfkxh);
			return;
		}



		if (scbz.equals("Y"))
		{
			conn.rollback();
			out.println("<P>�����տ����["+fkxh[i]+"]�ѱ�ɾ��");
			return;
		}
		if (!czlx.equals("1"))//1��¼�룻2��������3������
		{
			conn.rollback();
			out.println("<P>�����տ����["+fkxh[i]+"]ƾ֤�ѵ���");
			return;
		}

		//
		if (glxh==null)
		{
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where fkxh='"+fkxh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{//ɾ��������¼
			ls_sql="update cw_khfkjl set scbz='Y',scsj=SYSDATE,scr='"+yhmc+"'";
			ls_sql+=" where fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

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
				maxsjsj=rs.getDate(2);//����Ʒ�ʱ��
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
					maxsjsj=rs.getDate(2);//����Ʒ�ʱ��
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

					double shsskje=0;//�������ʵ�տ���
					java.sql.Date maxsksj=null;
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
						maxsksj=rs.getDate(2);
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
							yjjzsj=maxsksj;

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
						conn.rollback();
						out.println("���󣡸ö����ۼƸ����ܶ��Ϊ����:"+sskje);
						return;
					}

					double shsskje=0;//�������ʵ�տ���
					java.sql.Date maxsksj=null;
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
						maxsksj=rs.getDate(2);
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
							yjjzsj=maxsksj;

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
		}

		//�����ת��������Ƿ������޸�
		double jcfkje=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+fklxbm+"' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			jcfkje=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (jcfkje<0)
		{
			conn.rollback();
			out.println("<P>���󣡣��������տ���Ϊ����������ϸ����Ƿ��д���"+fkxh[i]);
			return;
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
	}	

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
	out.print("Exception: " + e);
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