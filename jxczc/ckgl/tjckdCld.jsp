<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));

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
	String khbh=null;
	String dqbm=null;
	String ckdzt="";
	String ckbh="";
	String lydh="";
	String ckfs="";//1���Զ����⣨�������ȳ��⣩��2���Զ����⣨������ȳ��⣩��3���ֹ�����
	String ckjxz="";//���ⵥ��ѡ��,1��ȡ�۸��jxc_cljgb.dgzjg����2��ȡ���ʱ���ۼۣ�jxc_kcb.dgzjg����3��ȡ���ϵ��۸�(jxc_clpsmx.dj)
	String cklx="";//D���������⣻B�����ϳ��⣻T���˻����⣻ S���깺���⣻P�����ϵ����⣻J�����Ĵ���ȯ���⣻X�����۳��⣻R:��������
	ls_sql=" select ckdzt,dqbm,lydh,ckfs,ckjxz,cklx,khbh,ckbh ";
	ls_sql+=" from jxc_ckd ";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckdzt=rs.getString("ckdzt");
		dqbm=rs.getString("dqbm");
		lydh=cf.fillNull(rs.getString("lydh"));
		ckfs=cf.fillNull(rs.getString("ckfs"));
		ckjxz=cf.fillNull(rs.getString("ckjxz"));
		cklx=cf.fillNull(rs.getString("cklx"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
	}
	rs.close();
	ps.close();

	if (!ckdzt.equals("0"))//0:δ�ύ�� 1���ȴ�������ˣ�2���ȴ��˻���ˣ�3���ȴ�������⣻4���ѽ��㣻5���˻����ͨ��6���������δͨ����7���˻����δͨ����8:���ͨ����9���ύ
	{
		out.print("���󣡳��ⵥ���ύ");
		return;
	}


	jxc.JxcClass jxc=new jxc.JxcClass();
	String jz=jxc.isJz(conn,ckbh);
	if (jz.equals("N"))//Nδ��ת��Y���ѽ�ת
	{
		out.print("�ϸ���û�н�ת�����ܽ��п�������"+jz);
		return;
	}

	String gcjdbm=null;
	ls_sql="select gcjdbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
	}
	rs.close();
	ps.close();

	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
//		out.println("���󣡿ͻ����깤�������ٳ���");
//		return;
	}

	String sfyfkc="1";//�Ƿ��и����,1���޸���棻2�������δ��⣻3����������

	conn.setAutoCommit(false);

	//�����������Ƿ����
	String clbm=null;
	String zljb=null;
	String hwbh=null;
	double ckdj=0;
	double cksl=0;
	
	int lrsl=0;//����¼����ϸ

	ls_sql=" select clbm,zljb,ckbh,hwbh,ckdj,sum(cksl) cksl ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"' ";
	ls_sql+=" group by clbm,zljb,ckbh,hwbh,ckdj ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		zljb=rs.getString("zljb");
		ckbh=cf.fillNull(rs.getString("ckbh"));
		hwbh=cf.fillNull(rs.getString("hwbh"));
		ckdj=rs.getDouble("ckdj");
		cksl=rs.getDouble("cksl");

		if (cksl<=0)
		{
			conn.rollback();
			out.print("���ϣ���"+clbm+"�����������������0�������ύ������");
			return;
		}

		lrsl++;

		//��ѯ���۷�ʽ
		String xsfs="";
		ls_sql=" select xsfs ";
		ls_sql+=" from jxc_cljgb ";
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			xsfs=rs1.getString("xsfs");
		}
		rs1.close();
		ps1.close();

		//����Ʒ�������
		if (xsfs.equals("1"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
		{
			continue;
		}
		
		//���£����ϼ۸������������������������������������ʼ
		double kcsl=0;
		if (xsfs.equals("2") || xsfs.equals("3") || xsfs.equals("4"))//1������Ʒ��2���ֻ����ۣ�3���ڻ����ۣ�4���������
		{
			if (zljb.equals("1"))//����Ʒ
			{
				kcsl=0;
				ls_sql=" select zcpzsl";
				ls_sql+=" from jxc_cljgb ";
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					kcsl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				if (cksl>kcsl)
				{
					if (xsfs.equals("4"))//4���������
					{
						sfyfkc="2";//�Ƿ��и����,2�������δ���

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+(cksl-kcsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
						ps1= conn.prepareStatement(ls_sql);
						ps1.executeUpdate();
						ps1.close();
					}
					else{
						conn.rollback();
						out.print("<BR>���ϡ�"+clbm+"������[��������"+cksl+"]����[�����:"+kcsl+"]");
						return;
					}
				}

				//�޸Ĳ��ϼ۸������Ʒ������
				ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl-"+cksl+",dhsl=dhsl-"+cksl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

			}
			else if (zljb.equals("2"))//�д�Ʒ
			{
				kcsl=0;
				ls_sql=" select ccpzsl";
				ls_sql+=" from jxc_cljgb ";
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
				ps1= conn.prepareStatement(ls_sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					kcsl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				if (cksl>kcsl)
				{
					if (xsfs.equals("4"))//4���������
					{
						sfyfkc="2";//�Ƿ��и����,2�������δ���

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+(cksl-kcsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
						ps1= conn.prepareStatement(ls_sql);
						ps1.executeUpdate();
						ps1.close();
					}
					else{
						conn.rollback();
						out.print("<BR>���ϡ�"+clbm+"������[��������"+cksl+"]����[�����:"+kcsl+"]");
						return;
					}
				}

				//�޸Ĳ��ϼ۸���д�Ʒ������
				ls_sql=" update jxc_cljgb set ccpzsl=ccpzsl-"+cksl+",dhsl=dhsl-"+cksl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (zljb.equals("3"))//����Ʒ
			{
				kcsl=0;
				ls_sql=" select bfpzsl";
				ls_sql+=" from jxc_cljgb ";
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1=ps1.executeQuery();
				if (rs1.next())
				{
					kcsl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				if (cksl>kcsl)
				{
					if (xsfs.equals("4"))//4���������
					{
						sfyfkc="2";//�Ƿ��и����,2�������δ���

						//�޸�:�Ƿ��и����
						ls_sql=" update jxc_ckmx set sfyfkc='2',fkcs="+(cksl-kcsl);
						ls_sql+=" where clbm='"+clbm+"' and ckph='"+ckph+"'";
						ps1= conn.prepareStatement(ls_sql);
						ps1.executeUpdate();
						ps1.close();
					}
					else{
						conn.rollback();
						out.print("<BR>���ϡ�"+clbm+"������[��������"+cksl+"]����[�����:"+kcsl+"]");
						return;
					}
				}

				//�޸Ĳ��ϼ۸������Ʒ������
				ls_sql=" update jxc_cljgb set bfpzsl=bfpzsl-"+cksl+",dhsl=dhsl-"+cksl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		else{
			conn.rollback();
			out.print("<BR>���ϡ�"+clbm+"���������۷�ʽ����ȷ��"+xsfs);
			return;
		}
		//���£����ϼ۸��������������������������������������

		
		//���£���������������������������������������ʼ
		String lsh=null;
		double dgzjg=0;
		double sycksl=0;//ʣ�������
		if(!hwbh.equals(""))
		{
			sycksl=cksl;//ʣ�������

			ls_sql = " select lsh,kcsl,dgzjg";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm+"' and zljb='"+zljb+"' and jxc_kcb.ckbh='"+ckbh+"' and jxc_kcb.hwbh='"+hwbh+"'";
			if (ckfs.equals("1"))//1���Զ����⣨�������ȳ��⣩
			{
				ls_sql +=" order by scrq,rksj ";
			}
			else if (ckfs.equals("2"))//2���Զ����⣨������ȳ��⣩
			{
				ls_sql +=" order by rksj,scrq ";
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			while(rs1.next())
			{
				lsh=cf.fillNull(rs1.getString("lsh"));
				kcsl=rs1.getDouble("kcsl");
				dgzjg=rs1.getDouble("dgzjg");

				if (ckjxz.equals("2"))//1��ȡ�۸���Ӽۣ�2��ȡ���ʱȷ���Ĺ��Ӽۣ�3��ȡ�����۸�4���˹�¼�룬�޸ĳ����
				{
					ckdj=dgzjg;
				}

				if (sycksl<=0)//���ύ���˳�
				{
					break;
				}

				double bccksl=0;//���㣺���γ�����
				if (kcsl>=sycksl)//�����>=ʣ�������
				{
					bccksl=sycksl;//���γ�������ʣ�������
				}
				else{
					bccksl=kcsl;//���γ������������
				}

				sycksl=sycksl-bccksl;//���㣺ʣ���������ʣ������������γ�����

				//��������Ϣд��:�����Ʒ��Ϣ
				String fkcckbz="1";//1������ʱ¼�룻2����������ʱ¼��
				double bcckje=bccksl*ckdj;//���γ�����
				ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,ztbz)";
				ls_sql+=" select ?,?,?,?,?   ,lsh,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,NVL(lsj,0),NVL(xsj,0),NVL(dfgsjg,0),NVL(dgzjg,0),ztbz";
				ls_sql+=" from jxc_kcb ";
				ls_sql+=" where jxc_kcb.lsh='"+lsh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,ckph);
				ps2.setDouble(2,ckdj);
				ps2.setDouble(3,bccksl);
				ps2.setDouble(4,bcckje);
				ps2.setString(5,fkcckbz);
				ps2.executeUpdate();
				ps2.close();

				//���¿������
				ls_sql=" update jxc_kcb set kcsl=kcsl-"+bccksl+",kcje=(kcsl-"+bccksl+")*rkj ";
				ls_sql+=" where  lsh='"+lsh+"' ";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			rs1.close();
			ps1.close();

		}
		else//û��¼���λ���� ���ջ��ܳ���
		{
			sycksl=cksl;//ʣ�������

			ls_sql = " select lsh,kcsl,dgzjg";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm+"' and zljb='"+zljb+"' and jxc_kcb.ckbh='"+ckbh+"'";
			if (ckfs.equals("1"))//1���Զ����⣨�������ȳ��⣩
			{
				ls_sql +=" order by scrq,rksj ";
			}
			else if (ckfs.equals("2"))//2���Զ����⣨������ȳ��⣩
			{
				ls_sql +=" order by rksj,scrq ";
			}
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			while(rs1.next())
			{
				lsh=cf.fillNull(rs1.getString("lsh"));
				kcsl=rs1.getDouble("kcsl");
				dgzjg=rs1.getDouble("dgzjg");

				if (ckjxz.equals("2"))//1��ȡ�۸���Ӽۣ�2��ȡ���ʱȷ���Ĺ��Ӽۣ�3��ȡ�����۸�4���˹�¼�룬�޸ĳ����
				{
					ckdj=dgzjg;
				}
				
				double bccksl=0;//���γ�����
				if (sycksl<=0)
				{
					break;
				}
				else if (sycksl<=kcsl)//�����>=�������
				{
					bccksl=sycksl;
				}
				else{
					bccksl=kcsl;
				}

				sycksl=sycksl-bccksl;

				//������������д��:�����Ʒ��Ϣ
				String fkcckbz="1";//1������ʱ¼�룻2����������ʱ¼��
				double bcckje=bccksl*ckdj;//���γ�����
				ls_sql =" insert into jxc_ckcpxx (ckph,ckj,cksl,ckje,fkcckbz   ,lsh,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,lsj,xsj,dfgsjg,dgzjg,ztbz)";
				ls_sql+=" select ?,?,?,?,?   ,lsh,clbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,glfzclbm,glfzclmc,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,zljb,clzk,rkph,rkxh,rksj,dbph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,jqpjcbj,NVL(lsj,0),NVL(xsj,0),NVL(dfgsjg,0),NVL(dgzjg,0),ztbz";
				ls_sql+=" from jxc_kcb ";
				ls_sql+=" where jxc_kcb.lsh='"+lsh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,ckph);
				ps2.setDouble(2,ckdj);
				ps2.setDouble(3,bccksl);
				ps2.setDouble(4,bcckje);
				ps2.setString(5,fkcckbz);
				ps2.executeUpdate();
				ps2.close();

				//���¿������
				ls_sql=" update jxc_kcb set kcsl=kcsl-"+bccksl+",kcje=(kcsl-"+bccksl+")*rkj ";
				ls_sql+=" where  lsh='"+lsh+"' ";
				ps2= conn.prepareStatement(ls_sql);
				ps2.executeUpdate();
				ps2.close();
			}
			rs1.close();
			ps1.close();
		}
		//���£�����������������������������������������


		//���³��ⵥ��ϸ������ۡ��ɱ��ۣ�����������������������ʼ
		double cbdj=0;
		ls_sql=" select sum(ckje)/sum(cksl),sum(rkj*cksl)/sum(cksl)";
		ls_sql+=" from jxc_ckcpxx ";
		ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			ckdj=rs1.getDouble(1);
			cbdj=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		if (ckjxz.equals("2"))//�����ѡ��1��ȡ�۸���Ӽۣ�2��ȡ���ʱȷ���Ĺ��Ӽۣ�3��ȡ�����۸�4���˹�¼��
		{
			//���³��ⵥ��ϸ:����ۡ��ɱ���
			ls_sql=" update jxc_ckmx set ckdj="+ckdj+",ckje=cksl*"+ckdj+",cbdj="+cbdj+",cbje=cksl*"+cbdj;
			ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else{
			//���³��ⵥ��ϸ:�ɱ���
			ls_sql=" update jxc_ckmx set cbdj="+cbdj+",cbje=cksl*"+cbdj;
			ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		//���³��ⵥ��ϸ������ۡ��ɱ��ۣ�����������������������������
	}
	rs.close();
	ps.close();

	if (lrsl==0)
	{
		conn.rollback();
		out.println("�����޳�����ϸ�������ύ");
		return;
	}

		


	//�����������Ϊ��ļ�¼�����
	ls_sql="delete from jxc_kcb ";
	ls_sql+=" where kcsl=0 ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�޸ĳ����ܽ�������������������������������������ʼ
	double ckzsl=0;
	double ckzje=0;
	double ckzcb=0;

	ls_sql=" select sum(cksl),sum(ckje),sum(cbje) ";
	ls_sql+=" from jxc_ckmx ";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckzsl=rs.getDouble(1);
		ckzje=rs.getDouble(2);
		ckzcb=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql=" update jxc_ckd set ckzsl=?,ckzje=?,ckzcb=?,sfyfkc=?,ckdzt='9' where ckph='"+ckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,ckzsl);
	ps.setDouble(2,ckzje);
	ps.setDouble(3,ckzcb);
	ps.setString(4,sfyfkc);
	ps.executeUpdate();
	ps.close();
	//�޸ĳ����ܽ���������������������������������������


	//����:���ϵ�:״̬�����ϵ���ϸ:������������������������������������ʼ
	if (cklx.equals("P"))
	{	
		int mark=0;
		int mark1=0;
		double pssl=0;
		ls_sql=" select clbm,pssl";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where psph='"+lydh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			pssl=rs.getDouble("pssl");

			cksl=0;
			ls_sql=" select sum(cksl) cksl";
			ls_sql+=" from jxc_ckd,jxc_ckmx ";
			ls_sql+=" where jxc_ckd.ckph=jxc_ckmx.ckph and jxc_ckd.cklx='"+cklx+"' and jxc_ckd.lydh='"+lydh+"' and jxc_ckd.ckdzt!='0' and jxc_ckmx.clbm='"+clbm+"'";
			ls_sql+=" group by clbm";
			ps1= conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				cksl=rs1.getDouble("cksl");
			}
			rs1.close();
			ps1.close();

			if (cksl>pssl)
			{
				conn.rollback();
				out.println("���󣡲��ϡ�"+clbm+"����������["+cksl+"]�������ϵ�����["+pssl+"]");
				return;
			}
			else if (cksl<pssl)
			{
				mark++;
			}
			if (cksl>0)
			{
				mark1++;
			}

			//���£����ϵ���ϸ(jxc_clpsmx).��������cksl
			ls_sql=" update jxc_clpsmx set cksl="+cksl;
			ls_sql+=" where clbm='"+clbm+"' and psph='"+lydh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();

		double ycksl=0;
		double yckje=0;
		ls_sql=" select sum(cksl) cksl,sum(round(cksl*dj,2)) yckje";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where psph='"+lydh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			ycksl=rs.getDouble("cksl");
			yckje=rs.getDouble("yckje");
		}
		rs.close();
		ps.close();

		//���£����ϵ���ϸ(jxc_clpsmx).��������cksl
		ls_sql=" update jxc_clpsd set ycksl="+ycksl+",yckje="+yckje;
		ls_sql+=" where psph='"+lydh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (mark1==0)//�޳���
		{
			ls_sql="update jxc_clpsd set psdzt='2' ";
			ls_sql+=" where psph='"+lydh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{//�г���
			if (mark==0)//ȫ����
			{
				ls_sql="update jxc_clpsd set psdzt='3' ";
				ls_sql+=" where psph='"+lydh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{//�в���δ����
				ls_sql="update jxc_clpsd set psdzt='5' ";
				ls_sql+=" where psph='"+lydh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}

	}
	//����:���ϵ�.״̬�����ϵ���ϸ.��������������������������������������

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>