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
int fkcs=0;

String ddbh=null;
String zjxbh=null;
String zcddbh=null;
String zczjxbh=null;

double zjsl=0;
double zjse=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<fkxh.length ;i++ )
	{
		glxh=null;
		ls_sql="select khbh,scbz,zffs,zckx,czlx,glxh,fklxbm,gljlbz,fkcs,yjjzsj,ddbh,zjxbh,zcddbh,zczjxbh";
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
			fkcs=rs.getInt("fkcs");
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
			out.println("�����տ����["+fkxh[i]+"]�ѱ�ɾ��");
			return;
		}
		if (!czlx.equals("1"))//1��¼�룻2��������3������
		{
			conn.rollback();
			out.println("�����տ����["+fkxh[i]+"]ƾ֤�ѵ���");
			return;
		}

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



		if (getsfke<0)
		{
			conn.rollback();
			out.println("<P>���󣡣��������տ���Ϊ����������ϸ����Ƿ��д���");
			return;
		}

		String setjzwkqs=null;
		int wkcount=0;
		ls_sql="select count(*)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and jzwkqs='Y'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wkcount=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (wkcount>0)
		{
			setjzwkqs="Y";
		}
		else{
			setjzwkqs="N";
		}

		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?,jzwkqs=?";
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
		ps.setString(12,setjzwkqs);
		ps.executeUpdate();
		ps.close();

		//��װ�����--------------------------------------------���

		if (zffs.equals("31"))//ת�ʿ���
		{
			if (zckx.equals("52"))//52����������
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

					ls_sql="update jc_zczjx set sskje=?";
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

		//��飺ɾ�����Ƿ�Ϊ����
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