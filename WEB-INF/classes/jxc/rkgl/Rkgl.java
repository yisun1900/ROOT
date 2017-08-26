package jxc.rkgl;

import java.io.*;
import ybl.common.CommonFunction;
import java.sql.*;

public class Rkgl
{
//�������
	public String clrk (String rkph,String dqbm,String ckbh,String hjbh) throws Exception//rkph��������ţ�dqbm���������룻ckbh���ֿ��ţ�hjbh�����ܱ�ţ�
	{
	CommonFunction cf;
	cf = new CommonFunction();
	int rksl=0;//��¼�ɹ���������
	String restr="";
	String lsh=null;
	String clbm=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	PreparedStatement ps3=null;
	ResultSet rs3=null;
	String ls_sql=null;
	String xh=null;
	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);
		//��������Ƿ��л� 
		ls_sql=" select clbm";
		ls_sql+=" from jxc_rkmx ";
		ls_sql+=" where  rkph='"+rkph+"' ";
		//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			ls_sql=" select clbm ";
			ls_sql+=" from jxc_kcb ";
			ls_sql+=" where  clbm='"+clbm+"' and hjbh='"+hjbh+"' ";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())//����л� ֱ�Ӹ�������
			{
				//���� ������� ����� �����������ⵥ���۳����������
				ls_sql="update jxc_kcb set kcsl=kcsl+(select rksl from jxc_rkmx where clbm='"+clbm+"' and rkph='"+rkph+"'),kcje=kcje+(select rksl*rkj from jxc_rkmx where clbm='"+clbm+"' and rkph='"+rkph+"') ";
				ls_sql+=" where  (clbm='"+clbm+"') and  (hjbh="+hjbh+")  ";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>����ʧ�ܣ�"+ls_sql;
					return restr;
				}
				//���³ɱ�����
				ls_sql="update jxc_kcb set cbj=round(kcje/kcsl,2) ";
				ls_sql+=" where  (clbm='"+clbm+"') and  (hjbh="+hjbh+") ";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>����ʧ�ܣ�"+ls_sql;
					return restr;
				}
				else
				{rksl++;}
			}
			else //�����û�� �����µı��
			{
				//����������ˮ��
				ls_sql=" select lpad(NVL(max(lsh),0)+1,13,0) lsh";
				ls_sql+=" from jxc_kcb ";
	//			ls_sql+=" where  clbm='"+clbm+"' and hjbh='"+hjbh+"' ";
				ps3= conn.prepareStatement(ls_sql);
				rs3=ps3.executeQuery();
				if (rs3.next())//����л� ֱ�Ӹ�������
				{
					lsh=rs3.getString("lsh");
				}
				rs3.close();
				ps3.close();
				//�������в����ڵ�����д��
				ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,cllbbm,xh,gg,clysbm,jldwbm,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,zp,cgzq,bz,clbm,hjbh,ckbh,dqbm,cbj,kcsl,kcje) ";
				ls_sql+=" select '"+lsh+"',clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,cllbbm,xh,gg,clysbm,jldwbm,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,zp,cgzq,bz,jxc_rkmx.clbm,'"+hjbh+"','"+ckbh+"','"+dqbm+"',rkj,rksl,round(rkj*rksl,2) ";
				ls_sql+=" from jxc_rkmx,jxc_clbm ";
				ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.clbm='"+clbm+"'  and jxc_rkmx.rkph='"+rkph+"'";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>����ʧ�ܣ�"+ls_sql;
					return restr;
				}
				else
				{rksl++;}
			}
			rs2.close();
			ps2.close();		
		}
		rs.close();
		ps.close();
		//������ⵥ״̬
		ls_sql="update jxc_rkd set rkdzt='3' ";
		ls_sql+=" where  (rkph='"+rkph+"')";
		ps2= conn.prepareStatement(ls_sql);
		if (ps2.executeUpdate()!=1)
		{
			restr="<BR>����ʧ�ܣ�"+ls_sql;
			return restr;
		}
		conn.commit();
		restr="���ɹ���"+rksl+"�ֲ��������Ѹ��£�";
		}
		catch (Exception e) {
		conn.rollback();
		throw e;
		}
		finally 
		{
			conn.setAutoCommit(true);
			try{
				if (rs != null) rs.close(); 
				if (ps != null) ps.close(); 
				if (rs2 != null) rs2.close(); 
				if (ps2 != null) ps2.close();
				if (rs3 != null) rs3.close(); 
				if (ps3 != null) ps3.close();
				if (conn != null) cf.close(conn); 
			}
			catch (Exception e){
				if (conn != null) cf.close(conn); 
				throw e;
			}
		}
		return restr;
	}


//ɾ��������ⵥ
	public String scrkd (String rkph,String dqbm,String ckbh,String hjbh) throws Exception//rkph��������ţ�dqbm���������룻ckbh���ֿ��ţ�hjbh�����ܱ�ţ�
	{
	CommonFunction cf;
	cf = new CommonFunction();
	int czsl=0;
	int rksl=0;
	int kcsl=0;
	double rkzje=0;
	String restr="";
	String clbm=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps2=null;
	ResultSet rs2=null;
	PreparedStatement ps3=null;
	ResultSet rs3=null;
	String ls_sql=null;
	String xh=null;
	try {
		conn=cf.getConnection();
		conn.setAutoCommit(false);

		//������в����Ƿ���ڿ�棬���С����˵���Ѿ����� ����ɾ����ⵥ
		ls_sql=" select clbm,rksl,rkzje";
		ls_sql+=" from jxc_rkmx,jxc_rkd ";
		ls_sql+=" where jxc_rkmx.rkph=jxc_rkd.rkph and jxc_rkmx.rkph='"+rkph+"' ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=rs.getString("clbm");
			rksl=rs.getInt("rksl");
			rkzje=rs.getDouble("rkzje");

			ls_sql=" select kcsl";
			ls_sql+=" from jxc_kcb ";
			ls_sql+=" where clbm='"+clbm+"' and ckbh='"+ckbh+"' and hjbh='"+hjbh+"'  ";
		//	out.println(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if (rs2.next())
			{
				kcsl=rs2.getInt("kcsl");
			}
			rs2.close();
			ps2.close();
			if (kcsl>=rksl)//��������� ����ɾ��
			{
				//�޸Ŀ������ �����
				ls_sql="update jxc_kcb set kcsl=kcsl-"+rksl+",kcje=kcje-(select rksl*rkj from jxc_rkmx where clbm='"+clbm+"' and rkph='"+rkph+"')";
				ls_sql+=" where  (clbm='"+clbm+"') and  (hjbh="+hjbh+")  ";
				ps3= conn.prepareStatement(ls_sql);
				if (ps3.executeUpdate()!=1)
				{
					restr="<BR>����ʧ�ܣ�"+ls_sql;
					return restr;
				}
				else
				{czsl++;}
			}
			else
			{
				restr="����ɾ����<br>1.���ܻ���ѡ�����<br>2.���ܲ��ֲ����Ѿ����ۻ��߳��⣬���¿���������㣡";
				return restr;
			}
		}
		rs.close();
		ps.close();
		//������ⵥ״̬
		ls_sql="update jxc_rkd set rkdzt='2' ";
		ls_sql+=" where  (rkph='"+rkph+"')";
		ps2= conn.prepareStatement(ls_sql);
		if (ps2.executeUpdate()!=1)
		{
			restr="������ⵥʧ�ܣ�";
			return restr;
		}		
		conn.commit();
		restr="ɾ���ɹ���"+czsl+"�ֲ��������Ѹ��£�";
		}
		catch (Exception e) {
		conn.rollback();
		throw e;
		}
		finally 
		{
			conn.setAutoCommit(true);
			try{
				if (rs != null) rs.close(); 
				if (ps != null) ps.close(); 
				if (rs2 != null) rs2.close(); 
				if (ps2 != null) ps2.close();
				if (rs3 != null) rs3.close(); 
				if (ps3 != null) ps3.close();
				if (conn != null) cf.close(conn); 
			}
			catch (Exception e){
				if (conn != null) cf.close(conn); 
				throw e;
			}
		}
		return restr;
	}
}