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
	java.sql.Date rksj=null;
	ls_sql="select rkdzt,gysmc,dqbm,ckbh,rksj ";
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

	//����������ˮ��
	int maxlsh=0;
	ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
	ls_sql+=" from jxc_kcb ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())//����л� ֱ�Ӹ�������
	{
		maxlsh=rs.getInt("lsh");
	}
	rs.close();
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

	ls_sql=" select rkxh,clbm,nbbm,rkj,rksl,zcpsl,ccpsl,bfpsl,ccpzkl,scrq,scph,hjbh";
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

		if (scrq.equals(""))
		{
			conn.rollback();
			out.println("���󣡲��ϡ�"+nbbm+"���������ڲ���Ϊ��");
			return;
		}

		if (scph.equals(""))
		{
			conn.rollback();
			out.println("���󣡲��ϡ�"+nbbm+"���������Ų���Ϊ��");
			return;
		}

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

		String lsh="";
		String zljb="";//1������Ʒ��2���д�Ʒ��3������Ʒ
		double rkje=0;

		//����Ʒ��⣫������������������������ʼ
		if (zcpsl!=0)
		{
			zljb="1";//1������Ʒ��2���д�Ʒ��3������Ʒ
			double clzk=10;//�д�Ʒ�ۿ���

			double zcpfkcsl=0;//����Ʒ����������

			//������棫������������������������������ʼ
			if (zcpzsl<0)//�и����
			{
				//��ѯ���������¼
				String ckph=null;
				int ckxh=0;
				double fkcs=0;
				double ckdj=0;
				ls_sql="SELECT ckph,ckxh,ckdj,fkcs";
				ls_sql+=" FROM jxc_ckmx";
				ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='"+zljb+"'";//1���޸���棻2���и����
				ls_sql+=" order by ckph,ckxh";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					ckph=rs1.getString("ckph");
					ckxh=rs1.getInt("ckxh");
					fkcs=rs1.getDouble("fkcs");
					ckdj=rs1.getDouble("ckdj");


					double cksl=0;
					if (zcpsl>=fkcs)//�������������
					{
						cksl=fkcs;

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1���޸���棻2���и����
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}
					else{//�����������ָ����
						cksl=zcpsl;

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set fkcs="+(fkcs-zcpsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1���޸���棻2���и����
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}

					zcpfkcsl+=cksl;//����Ʒ����������

					double ckje=cksl*ckdj;//������
					String fkcckbz="2";//1������ʱ¼�룻2����������ʱ¼��
					ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm         ,clmc         ,cllb         ,cldlbm         ,clxlbm         ,scsmc         ,ppmc         ,gysmc         ,cllbbm         ,xh         ,nbbm         ,gg         ,clysbm         ,djzl         ,jldwbm         ,bzgg         ,bzjldwbm         ,glfzclbm         ,glfzclmc         ,sfbhpj         ,pjts         ,cpjb         ,fgsx         ,cpsm         ,cd         ,zp         ,cgzq         ,bzq         ,bztxq         ,bz         ,zljb,clzk,rkph         ,rkxh         ,rksj,dbph,scph         ,scrq         ,hwbh         ,hjbh        ,ckbh,dqbm,rkj        ,jqpjcbj      ,lsj,xsj,dfgsjg,dgzjg) ";
					ls_sql+=" select                  ?   ,?  ,?   ,?   ,?         ,?  ,jxc_rkmx.clbm,jxc_rkmx.clmc,jxc_clbm.cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,jxc_clbm.scsmc,jxc_rkmx.ppmc,jxc_rkmx.gysmc,jxc_clbm.cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,jxc_clbm.clysbm,jxc_clbm.djzl,jxc_rkmx.jldwbm,jxc_clbm.bzgg,jxc_clbm.bzjldwbm,jxc_clbm.glfzclbm,jxc_clbm.glfzclmc,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cgzq,jxc_clbm.bzq,jxc_clbm.bztxq,jxc_clbm.bz,?   ,?   ,jxc_rkmx.rkph,jxc_rkmx.rkxh,?   ,''  ,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?  ,?   ,jxc_rkmx.rkj,jxc_rkmx.rkj,0  ,0  ,0     ,0";
					ls_sql+=" from jxc_rkmx,jxc_clbm ";
					ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.rkph='"+rkph+"' and  jxc_rkmx.rkxh='"+rkxh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,cksl);
					ps2.setDouble(4,ckje);
					ps2.setString(5,fkcckbz);
					ps2.setString(6,rkph+cf.addZero(rkxh,2));

					ps2.setString(7,zljb);
					ps2.setDouble(8,clzk);
					ps2.setDate(9,rksj);
					ps2.setString(10,ckbh);
					ps2.setString(11,dqbm);
					
					ps2.executeUpdate();
					ps2.close();
					
					//�޸�:�����
					ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+cksl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();

					
					zcpsl=zcpsl-cksl;
					if (zcpsl==0)//����ѭ��
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				//�޸�:����Ʒ����������
				ls_sql=" update jxc_rkmx set zcpfkcsl="+zcpfkcsl;
				ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			//������棽��������������������������������

			if (zcpsl>0)//����ʣ�࣬���������
			{
				maxlsh++;

				//���¿��
				lsh=maxlsh+"";
				lsh=cf.addZero(lsh,13);

				rkje=zcpsl*rkj;

				//����Ʒ:д�����
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
				ls_sql+=" select '"+lsh+"',jxc_rkmx.clmc,cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,scsmc,jxc_rkmx.ppmc,'"+gysmc+"',cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,clysbm,djzl,jxc_rkmx.jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,jxc_rkmx.clbm,?,?,rkph,rkxh,?,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?,?,jxc_rkmx.rkj,?,?,0  ,0,0,0,0,'N'";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm ";
				ls_sql+=" and jxc_rkmx.rkph='"+rkph+"' and jxc_rkmx.rkxh='"+rkxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setString(1,zljb);
				ps1.setDouble(2,clzk);
				ps1.setDate(3,rksj);
				ps1.setString(4,ckbh);
				ps1.setString(5,dqbm);
				ps1.setDouble(6,zcpsl);
				ps1.setDouble(7,rkje);
				ps1.executeUpdate();
				ps1.close();

				//�޸�:�����
				ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+zcpsl;
				ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
		}
		//����Ʒ��⣽��������������������������


		//�д�Ʒ��⣫������������������������ʼ
		if (ccpsl!=0)
		{
			zljb="2";//1������Ʒ��2���д�Ʒ��3������Ʒ
			double clzk=ccpzkl;//�д�Ʒ�ۿ���

			double ccpfkcsl=0;//�д�Ʒ����������

			//������棫������������������������������ʼ
			if (ccpzsl<0)//�и����
			{
				//��ѯ���������¼
				String ckph=null;
				int ckxh=0;
				double fkcs=0;
				double ckdj=0;
				ls_sql="SELECT ckph,ckxh,ckdj,fkcs";
				ls_sql+=" FROM jxc_ckmx";
				ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='"+zljb+"'";//1���޸���棻2���и����
				ls_sql+=" order by ckph,ckxh";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					ckph=rs1.getString("ckph");
					ckxh=rs1.getInt("ckxh");
					fkcs=rs1.getDouble("fkcs");
					ckdj=rs1.getDouble("ckdj");

					double cksl=0;
					if (ccpsl>=fkcs)//�������������
					{
						cksl=fkcs;

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1���޸���棻2���и����
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}
					else{//�����������ָ����
						cksl=ccpsl;

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set fkcs="+(fkcs-ccpsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1���޸���棻2���и����
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}

					ccpfkcsl+=cksl;//�д�Ʒ����������

					double ckje=cksl*ckdj;//������
					String fkcckbz="2";//1������ʱ¼�룻2����������ʱ¼��
					ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm         ,clmc         ,cllb         ,cldlbm         ,clxlbm         ,scsmc         ,ppmc         ,gysmc         ,cllbbm         ,xh         ,nbbm         ,gg         ,clysbm         ,djzl         ,jldwbm         ,bzgg         ,bzjldwbm         ,glfzclbm         ,glfzclmc         ,sfbhpj         ,pjts         ,cpjb         ,fgsx         ,cpsm         ,cd         ,zp         ,cgzq         ,bzq         ,bztxq         ,bz         ,zljb,clzk,rkph         ,rkxh         ,rksj,dbph,scph         ,scrq         ,hwbh         ,hjbh        ,ckbh,dqbm,rkj        ,jqpjcbj      ,lsj,xsj,dfgsjg,dgzjg) ";
					ls_sql+=" select                  ?   ,?  ,?   ,?   ,?         ,?  ,jxc_rkmx.clbm,jxc_rkmx.clmc,jxc_clbm.cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,jxc_clbm.scsmc,jxc_rkmx.ppmc,jxc_rkmx.gysmc,jxc_clbm.cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,jxc_clbm.clysbm,jxc_clbm.djzl,jxc_rkmx.jldwbm,jxc_clbm.bzgg,jxc_clbm.bzjldwbm,jxc_clbm.glfzclbm,jxc_clbm.glfzclmc,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cgzq,jxc_clbm.bzq,jxc_clbm.bztxq,jxc_clbm.bz,?   ,?   ,jxc_rkmx.rkph,jxc_rkmx.rkxh,?   ,''  ,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?  ,?   ,jxc_rkmx.rkj,jxc_rkmx.rkj,0  ,0  ,0     ,0";
					ls_sql+=" from jxc_rkmx,jxc_clbm ";
					ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.rkph='"+rkph+"' and  jxc_rkmx.rkxh='"+rkxh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,cksl);
					ps2.setDouble(4,ckje);
					ps2.setString(5,fkcckbz);
					ps2.setString(6,rkph+cf.addZero(rkxh,2));

					ps2.setString(7,zljb);
					ps2.setDouble(8,clzk);
					ps2.setDate(9,rksj);
					ps2.setString(10,ckbh);
					ps2.setString(11,dqbm);
					
					ps2.executeUpdate();
					ps2.close();
					
					//�޸�:�����
					ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl+"+cksl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();

					
					ccpsl=ccpsl-cksl;
					if (ccpsl==0)//����ѭ��
					{
						break;
					}
				}
				rs1.close();
				ps1.close();


				//�޸�:�д�Ʒ����������
				ls_sql=" update jxc_rkmx set ccpfkcsl="+ccpfkcsl;
				ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			//������棽��������������������������������

			if (ccpsl>0)//����ʣ�࣬���������
			{
				maxlsh++;

				//���¿��
				lsh=maxlsh+"";
				lsh=cf.addZero(lsh,13);

				rkje=ccpsl*rkj;

				//����Ʒ:д�����
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
				ls_sql+=" select '"+lsh+"',jxc_rkmx.clmc,cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,scsmc,jxc_rkmx.ppmc,'"+gysmc+"',cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,clysbm,djzl,jxc_rkmx.jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,jxc_rkmx.clbm,?,?,rkph,rkxh,?,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?,?,jxc_rkmx.rkj,?,?,0  ,0,0,0,0,'N'";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm ";
				ls_sql+=" and jxc_rkmx.rkph='"+rkph+"' and jxc_rkmx.rkxh='"+rkxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setString(1,zljb);
				ps1.setDouble(2,clzk);
				ps1.setDate(3,rksj);
				ps1.setString(4,ckbh);
				ps1.setString(5,dqbm);
				ps1.setDouble(6,ccpsl);
				ps1.setDouble(7,rkje);
				ps1.executeUpdate();
				ps1.close();

				//�޸�:�����
				ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl+"+ccpsl;
				ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
		}
		//�д�Ʒ��⣽��������������������������

		//����Ʒ��⣫������������������������ʼ
		if (bfpsl!=0)
		{
			zljb="3";//1������Ʒ��2���д�Ʒ��3������Ʒ
			double clzk=ccpzkl;//�д�Ʒ�ۿ���

			double bfpfkcsl=0;//����Ʒ����������

			//������棫������������������������������ʼ
			if (bfpzsl<0)//�и����
			{
				//��ѯ���������¼
				String ckph=null;
				int ckxh=0;
				double fkcs=0;
				double ckdj=0;
				ls_sql="SELECT ckph,ckxh,ckdj,fkcs";
				ls_sql+=" FROM jxc_ckmx";
				ls_sql+=" where sfyfkc='2' and clbm='"+clbm+"' and zljb='"+zljb+"'";//1���޸���棻2���и����
				ls_sql+=" order by ckph,ckxh";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				while (rs1.next())
				{
					ckph=rs1.getString("ckph");
					ckxh=rs1.getInt("ckxh");
					fkcs=rs1.getDouble("fkcs");
					ckdj=rs1.getDouble("ckdj");

					double cksl=0;
					if (bfpsl>=fkcs)//�������������
					{
						cksl=fkcs;

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set sfyfkc='1',fkcs=0";
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1���޸���棻2���и����
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}
					else{//�����������ָ����
						cksl=bfpsl;

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set fkcs="+(fkcs-bfpsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";//1���޸���棻2���и����
						ps2= conn.prepareStatement(ls_sql);
						ps2.executeUpdate();
						ps2.close();
					}

					bfpfkcsl+=cksl;//����Ʒ����������

					double ckje=cksl*ckdj;//������
					String fkcckbz="2";//1������ʱ¼�룻2����������ʱ¼��
					ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm         ,clmc         ,cllb         ,cldlbm         ,clxlbm         ,scsmc         ,ppmc         ,gysmc         ,cllbbm         ,xh         ,nbbm         ,gg         ,clysbm         ,djzl         ,jldwbm         ,bzgg         ,bzjldwbm         ,glfzclbm         ,glfzclmc         ,sfbhpj         ,pjts         ,cpjb         ,fgsx         ,cpsm         ,cd         ,zp         ,cgzq         ,bzq         ,bztxq         ,bz         ,zljb,clzk,rkph         ,rkxh         ,rksj,dbph,scph         ,scrq         ,hwbh         ,hjbh        ,ckbh,dqbm,rkj        ,jqpjcbj      ,lsj,xsj,dfgsjg,dgzjg) ";
					ls_sql+=" select                  ?   ,?  ,?   ,?   ,?         ,?  ,jxc_rkmx.clbm,jxc_rkmx.clmc,jxc_clbm.cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,jxc_clbm.scsmc,jxc_rkmx.ppmc,jxc_rkmx.gysmc,jxc_clbm.cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,jxc_clbm.clysbm,jxc_clbm.djzl,jxc_rkmx.jldwbm,jxc_clbm.bzgg,jxc_clbm.bzjldwbm,jxc_clbm.glfzclbm,jxc_clbm.glfzclmc,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cgzq,jxc_clbm.bzq,jxc_clbm.bztxq,jxc_clbm.bz,?   ,?   ,jxc_rkmx.rkph,jxc_rkmx.rkxh,?   ,''  ,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?  ,?   ,jxc_rkmx.rkj,jxc_rkmx.rkj,0  ,0  ,0     ,0";
					ls_sql+=" from jxc_rkmx,jxc_clbm ";
					ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.rkph='"+rkph+"' and  jxc_rkmx.rkxh='"+rkxh+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,ckph);
					ps2.setDouble(2,ckdj);
					ps2.setDouble(3,cksl);
					ps2.setDouble(4,ckje);
					ps2.setString(5,fkcckbz);
					ps2.setString(6,rkph+cf.addZero(rkxh,2));

					ps2.setString(7,zljb);
					ps2.setDouble(8,clzk);
					ps2.setDate(9,rksj);
					ps2.setString(10,ckbh);
					ps2.setString(11,dqbm);
					
					ps2.executeUpdate();
					ps2.close();
					
					//�޸�:�����
					ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl+"+cksl;
					ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
					ps2= conn.prepareStatement(ls_sql);
					ps2.executeUpdate();
					ps2.close();

					
					bfpsl=bfpsl-cksl;
					if (bfpsl==0)//����ѭ��
					{
						break;
					}
				}
				rs1.close();
				ps1.close();

				//�޸�:����Ʒ����������
				ls_sql=" update jxc_rkmx set bfpfkcsl="+bfpfkcsl;
				ls_sql+=" where rkph='"+rkph+"' and rkxh='"+rkxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			//������棽��������������������������������

			if (bfpsl>0)//����ʣ�࣬���������
			{
				maxlsh++;

				//���¿��
				lsh=maxlsh+"";
				lsh=cf.addZero(lsh,13);

				rkje=bfpsl*rkj;

				//����Ʒ:д�����
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
				ls_sql+=" select '"+lsh+"',jxc_rkmx.clmc,cllb,jxc_rkmx.cldlbm,jxc_rkmx.clxlbm,scsmc,jxc_rkmx.ppmc,'"+gysmc+"',cllbbm,jxc_rkmx.xh,jxc_rkmx.nbbm,jxc_rkmx.gg,clysbm,djzl,jxc_rkmx.jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
				ls_sql+=" ,jxc_rkmx.clbm,?,?,rkph,rkxh,?,jxc_rkmx.scph,jxc_rkmx.scrq,jxc_rkmx.hwbh,jxc_rkmx.hjbh,?,?,jxc_rkmx.rkj,?,?,0  ,0,0,0,0,'N'";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm ";
				ls_sql+=" and jxc_rkmx.rkph='"+rkph+"' and jxc_rkmx.rkxh='"+rkxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setString(1,zljb);
				ps1.setDouble(2,clzk);
				ps1.setDate(3,rksj);
				ps1.setString(4,ckbh);
				ps1.setString(5,dqbm);
				ps1.setDouble(6,bfpsl);
				ps1.setDouble(7,rkje);
				ps1.executeUpdate();
				ps1.close();

				//�޸�:�����
				ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl+"+bfpsl;
				ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
		}
		//����Ʒ��⣽��������������������������

		//��Ȩƽ���ɱ���
		jxc.JsJqpjcbj(conn,dqbm,clbm);

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