<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�����ͳ�Ʊ�<BR>
  (ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="8%">���������</td>
  <td  width="6%">������</td>
  <td  width="8%">�������������</td>
  <td  width="7%">ǩԼ��</td>
  <td  width="14%">����ǩԼҵ��</td>
  <td  width="8%">����ϵ��</td>
  <td  width="9%">��ע</td>
</tr>
<%
	
	String cxhdmc2=null;
	String cxhdbm=null;
	String qdhdzk=null;
	String bz=null;
	String bgcolor="#FFFFFF";
	ls_sql="SELECT distinct jc_cxhd.cxhdmc cxhdmc,jc_cxhd.cxhdbm cxhdbm,jc_cxhd.qdhdzk qdhdzk,jc_cxhd.bz bz";
	ls_sql+=" FROM jc_cxhd,crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and (crm_zxkhxx.cxhdbm=jc_cxhd.cxhdmc or crm_zxkhxx.cxhdbmxq=jc_cxhd.cxhdmc or crm_zxkhxx.cxhdbmzh=jc_cxhd.cxhdmc)";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	
		{
			ls_sql+=" and  (crm_zxkhxx.fgsbh='"+fgs+"')";
			//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
			//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
	}
	//ls_sql+=" group by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cxhdmc2=rs.getString("cxhdmc");
		cxhdbm=rs.getString("cxhdbm");
		qdhdzk=rs.getString("qdhdzk");
		bz=rs.getString("bz");
		//������
			ls_sql=" select count(*) kll";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where (crm_zxkhxx.cxhdbm='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmxq='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmzh='"+cxhdmc2+"')";
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	
				{
					ls_sql+=" and  (crm_zxkhxx.fgsbh='"+fgs+"')";
					//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
				}
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))
				{
					ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
					//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
				}
			}
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			int kll=0;
			if(rs2.next())
			{
			kll=rs2.getInt("kll");
			}
			rs2.close();
			ps2.close();

			//������
			ls_sql=" select count(*) djs";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where (crm_zxkhxx.cxhdbm='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmxq='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmzh='"+cxhdmc2+"')";
			ls_sql+=" and crm_zxkhxx.hddjbz='Y'";
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	
				{
					ls_sql+=" and  (crm_zxkhxx.fgsbh='"+fgs+"')";
					//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
				}
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))
				{
					ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
					//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
				}
			}
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			int djs=0;
			if(rs2.next())
			{
			djs=rs2.getInt("djs");
			}
			rs2.close();
			ps2.close();
			//ǩԼ��
			ls_sql=" select count(*) qys";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where (crm_zxkhxx.cxhdbm='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmxq='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmzh='"+cxhdmc2+"')";
			ls_sql+=" and crm_zxkhxx.zxzt='3'";
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	
				{
					ls_sql+=" and  (crm_zxkhxx.fgsbh='"+fgs+"')";
					//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
				}
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))
				{
					ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
					//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
				}
			}
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			int qys=0;
			if(rs2.next())
			{
			qys=rs2.getInt("qys");
			}
			rs2.close();
			ps2.close();
		//----------------------------
			//�����ʱ��
			ls_sql=" delete from cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
			ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
			//sz1:ǩԼ��
			//sz2:ǩԼ���ǰ
			//sz3:ǩԼ��ۺ�
			//sz4:��ͬ�����
			//sz5:��ͬ˰��
			ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//��ͬ
			//sz6:������
			//sz7:��������Ŀ�����
			//sz8:������˰��
			//sz9:����ΥԼ��
			ls_sql+=" ,sz6,sz7,sz8,sz9 ";//������
			//sz10:��Ʒ�
			//sz11:ʵ�տ�
			//sz12:�����ܶ�
			//sz13:��˾�е�����
			ls_sql+=" ,sz10,sz11,sz12,sz13 ";//����

			//sz19:ƽ��ǩ������
			//sz20:�������
			ls_sql+=" ,sz19,sz20,ywy ";//����
			ls_sql+=" FROM (";

			ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
			ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//��ͬ
			ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//������
			ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//����
			ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//����
			ls_sql+=" FROM crm_khxx,crm_zxkhxx";
			ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in ('2','5') ";
			ls_sql+=" and (crm_zxkhxx.cxhdbm='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmxq='"+cxhdmc2+"' or crm_zxkhxx.cxhdbmzh='"+cxhdmc2+"')";
			ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			if (fgs!=null)
			{
				if (!(fgs.equals("")))	
				{
					ls_sql+=" and  (crm_zxkhxx.fgsbh='"+fgs+"')";
					//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
				}
			}
			if (dwbh!=null)
			{
				if (!(dwbh.equals("")))
				{
					ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
					//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
				}
			}
			
			ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

			ls_sql+=" )";
			//out.print(ls_sql);
			//System.out.println(ls_sql);
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();


			String xh=null;
			String fgsbh=null;
			String cxhdmc=null;
			String cxhdbmxq=null;
			String cxhdbmzh=null;
			ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				xh=cf.fillNull(rs2.getString("xh"));
				fgsbh=cf.fillNull(rs2.getString("fgsbh"));
				cxhdmc=cf.fillNull(rs2.getString("cxhdmc"));
				cxhdbmxq=cf.fillNull(rs2.getString("cxhdbmxq"));
				cxhdbmzh=cf.fillNull(rs2.getString("cxhdbmzh"));

				double yjxs11=10;//02������ǩԼҵ��ϵ��
				double yjxs12=10;//04����װ���ʦҵ��ϵ��
				double yjxs13=10;//06��ҵ��Աϵ��
				double yjxs14=10;//07���г�������ϵ��

				if (!cxhdmc.equals(""))//��˾�
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs11=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs12=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs13=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs14=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs21=10;
				double yjxs22=10;
				double yjxs23=10;
				double yjxs24=10;
				if (!cxhdbmxq.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs21=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs22=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs23=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs24=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs31=10;
				double yjxs32=10;
				double yjxs33=10;
				double yjxs34=10;
				if (!cxhdbmzh.equals(""))
				{
					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs31=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs32=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs33=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();

					ls_sql=" select yjxs";
					ls_sql+=" from jc_cxhdyjxs";
					ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						yjxs34=rs1.getDouble("yjxs");
					}
					else{
						//out.println("�����Ҳ����������"+ls_sql);
						//return;
					}
					rs1.close();
					ps1.close();
				}

				double yjxs1=10;//02������ǩԼҵ��ϵ��
				double yjxs2=10;//04����װ���ʦҵ��ϵ��
				double yjxs3=10;//06��ҵ��Աϵ��
				double yjxs4=10;//07���г�������ϵ��

				yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
				yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
				yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
				yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

				//yjxs11 02������ǩԼҵ��ϵ��
				//yjxs12 04����װ���ʦҵ��ϵ��
				//yjxs13 06��ҵ��Աϵ��
				//yjxs14 07���г�������ϵ��
				ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
				ls_sql+=" where xh='"+xh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,yjxs1);
				ps1.setDouble(2,yjxs2);
				ps1.setDouble(3,yjxs3);
				ps1.setDouble(4,yjxs4);
				ps1.executeUpdate();
				ps1.close();
			}
			rs2.close();
			ps2.close();

			//ҵ��

			//sz14:����ǩԼҵ����ǩԼ���ۺ�*����ǩԼҵ��ϵ��+��ͬ�����
			//sz15:��װ���ʦҵ����
			//sz16:ҵ��Աҵ����
			//sz17:�г�������ҵ����
			//sz18:�г�������ǩԼ����

			//sz1:ǩԼ��
			//sz2:ǩԼ���ǰ
			//sz3:ǩԼ��ۺ�
			//sz4:��ͬ�����
			//sz5:��ͬ˰��

			ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
			ls_sql+=" ,sz15=sz3+sz4";
			ls_sql+=" ,sz16=sz3+sz4";
			ls_sql+=" ,sz17=sz3+sz4";
			ls_sql+=" ,sz18=1";
			ls_sql+=" where yhdlm='"+yhdlm+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			
			ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
			ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
			ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
			ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
			

			ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
			ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			double dmyj=0;
			ls_sql=" select sum(sz14) dmjlyj";
			ls_sql+=" FROM cw_tjlsb41";
			ls_sql+=" where yhdlm='"+yhdlm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dmyj=rs2.getDouble("dmjlyj");
			
			}
			
			rs2.close();
			ps2.close();

		//--------------------------------
		
		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><%=cxhdmc2%></td>
			<td >
			<a href='viewZxkhxx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgs%>&dwbh=<%=dwbh%>&cxhdbm=<%=cxhdbm%>' target="_blank" ><%=kll%></a></td>
			<td ><%=djs%></td>
			<td ><%=qys%></td>
			<td ><a href='viewQd.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgs%>&dwbh=<%=dwbh%>&cxhdbm=<%=cxhdbm%>' target="_blank" ><%=dmyj%></a></td>
			<td ><%=qdhdzk%></td>
			<td ><%=bz%></td>
			
		</tr>
	<%
	}
	rs.close();
	ps.close();

	
	
%>


		


	
</table>



</body>
</html>

<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
