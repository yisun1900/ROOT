<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sjbh=null;
String fklxbm=null;
int fkcs=0;
double yfkbl=0;
double yfkje=0;
double fkje=0;
double sfkbl=0;
String jkr=null;
String skr=null;
java.sql.Date sksj=null;
String skdw=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sjbh=cf.GB2Uni(request.getParameter("sjbh"));
fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
ls=request.getParameter("fkcs");
try{
	if (!(ls.equals("")))  fkcs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkcs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�տ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfkbl");
try{
	if (!(ls.equals("")))  yfkbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yfkbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ�տ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yfkje");
try{
	if (!(ls.equals("")))  yfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yfkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ӧ�տ���]����ת����������:"+e);
	return;
}
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
String zcgysbh=cf.GB2Uni(request.getParameter("zcgysbh"));
String jzwkqs=cf.GB2Uni(request.getParameter("jzwkqs"));
String zzyhkh=cf.GB2Uni(request.getParameter("zzyhkh"));

String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double bqyfkze=0;
double bqljyfkze=0;
double bqyfkbl=0;
String fkbz=null;

if (yfkje!=0)
{
	sfkbl=fkje*100.0/yfkje;
}
else{
	sfkbl=0;
}

String skdd="2";//�Ƿ������  1��������ˣ�2�������
String dsksjbz="N";//��˱�־  N: δ��ˣ�Y: �����

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

	String fkkhxm=null;
	String fkfwdz=null;
	String scbz=null;
	String czlx=null;
	String glxh=null;
	String sjs=null;
	String sjsbh=null;
	String dwbh=null;
	String fgsbh=null;
	String fkyjjzsj=null;
	String oldzcgysbh=null;
	String oldzcddbh=null;
	String oldzczjxbh=null;
	ls_sql="select fkkhxm,fkfwdz,scbz,czlx,glxh,sjs,sjsbh,dwbh,fgsbh,yjjzsj,zcgysbh,zcddbh,zczjxbh";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fkkhxm=rs.getString("fkkhxm");
		fkfwdz=rs.getString("fkfwdz");
		scbz=rs.getString("scbz");
		czlx=rs.getString("czlx");
		glxh=rs.getString("glxh");
		sjs=rs.getString("sjs");
		sjsbh=rs.getString("sjsbh");
		dwbh=rs.getString("dwbh");
		fgsbh=rs.getString("fgsbh");
		fkyjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		oldzcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		oldzcddbh=cf.fillNull(rs.getString("zcddbh"));
		oldzczjxbh=cf.fillNull(rs.getString("zczjxbh"));
	}
	else{
		rs.close();
		ps.close();

		out.println("���󣡲����ڵ��տ���ţ�"+fkxh);
		return;
	}
	rs.close();
	ps.close();

	if (!fkyjjzsj.equals(""))
	{
//		out.println("�տ��¼�ѽ�ת���������޸ģ���תʱ�䣺"+yjjzsj);
//		return;
	}

	if (scbz.equals("Y"))
	{
		out.println("�����տ����["+fkxh+"]�ѱ�ɾ��");
		return;
	}
	if (!czlx.equals("1"))//1��¼�룻2��������3������
	{
		out.println("�����տ����["+fkxh+"]ƾ֤�ѵ����������޸�");
		return;
	}

	//�ж�ת�����Ƿ����
	if (zffs.equals("31"))//31��ת��
	{
		//ת���ɿ�
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
					ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
					ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
				ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
				ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
			ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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

	ls_sql="update cw_khfkjl set sjbh=?,fklxbm=?,fkje=?,jkr=?,skr=?,sksj=?,skdw=?,bz=?,zffs=?,zckx=?,lrr=?,lrsj=?,fkcs=?,yfkbl=?,yfkje=?,sfkbl=?,zcgysbh=?,zcddbh=?,zczjxbh=?,jzwkqs=?,dsksjbz=?,sjr=null,shsj=null,shyj=null,zzyhkh=? ";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjbh);
	ps.setString(2,fklxbm);
	ps.setDouble(3,fkje);
	ps.setString(4,jkr);
	ps.setString(5,skr);
	ps.setDate(6,sksj);
	ps.setString(7,skdw);
	ps.setString(8,bz);
	ps.setString(9,zffs);
	ps.setString(10,zckx);
	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setInt(13,fkcs);
	ps.setDouble(14,yfkbl);
	ps.setDouble(15,yfkje);
	ps.setDouble(16,sfkbl);
	ps.setString(17,zcgysbh);
	ps.setString(18,zcddbh);
	ps.setString(19,zczjxbh);
	ps.setString(20,jzwkqs);
	ps.setString(21,dsksjbz);
	ps.setString(22,zzyhkh);
	ps.executeUpdate();
	ps.close();

	//�޸Ĺ�����¼��ԭ����֧����ʽ��31��ת�����������й�����¼
	if (glxh!=null)
	{
		if (zffs.equals("31") )//ת�ʿ�����ɹ�����¼����֧����ʽ��δ�����仯
		{
			//fkxh=newfkxh
			//����glxh
			//����gljlbz
			//����gysbh=zcgysbh
			//fklxbm=zckx
			//fkje=-1*fkje
			//zckx=fklxbm
			//zcgysbh=""
			//fkcs=""
			//yfkbl=""
			//yfkje=""
			//sfkbl=""

			ls_sql="update cw_khfkjl set sjbh=?,fklxbm=?,gysbh=?,ddbh=?,zjxbh=?,fkje=?,jkr=?,skr=?,sksj=?,skdw=?,bz=?    ,zffs=?,zckx=?,lrr=?,lrsj=?,fkcs=?,yfkbl=?,yfkje=?,sfkbl=?,dsksjbz=?,sjr=null,shsj=null,shyj=null,zzyhkh=? ";
			ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjbh);
			ps.setString(2,zckx);
			ps.setString(3,zcgysbh);
			ps.setString(4,zcddbh);
			ps.setString(5,zczjxbh);
			ps.setDouble(6,-1*fkje);
			ps.setString(7,jkr);
			ps.setString(8,skr);
			ps.setDate(9,sksj);
			ps.setString(10,skdw);
			ps.setString(11,bz);

			ps.setString(12,zffs);
			ps.setString(13,fklxbm);
			ps.setString(14,lrr);
			ps.setDate(15,lrsj);
			ps.setString(16,"");
			ps.setString(17,"");
			ps.setString(18,"");
			ps.setString(19,"");
			ps.setString(20,dsksjbz);
			ps.setString(21,zzyhkh);
			ps.executeUpdate();
			ps.close();
		}
		else{//��֧����ʽ�������仯����ת��-->��ת��
			ls_sql="update cw_khfkjl set glxh=null";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		
			ls_sql="delete from cw_khfkjl ";
			ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		
			ls_sql="delete from cw_glfkjl ";
			ls_sql+=" where glxh="+glxh;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
	}
	else{//ԭ����֧����ʽ����ת�����������޹�����¼
		//ת�����ʽ�����ɹ�����¼
		int newglxh=0;//�������
		int count=0;
		
		//��֧����ʽ�������仯���ɷ�ת��-->ת��
		if (zffs.equals("31") )//ת�ʿ�����ɹ�����¼
		{
			//��ȡ�������
			ls_sql="select NVL(max(glxh),0)";
			ls_sql+=" from  cw_glfkjl";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				newglxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newglxh++;

			//���������¼ 
			ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			ls_sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,newglxh);
			ps.setString(2,fkxh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update cw_khfkjl set glxh=?";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,newglxh);
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

			//fkxh=newfkxh
			//����glxh
			//����gljlbz
			//����gysbh=zcgysbh
			//fklxbm=zckx
			//fkje=-1*fkje
			//zckx=fklxbm
			//zcgysbh=""
			//fkcs=""
			//yfkbl=""
			//yfkje=""
			//sfkbl=""

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,scbz,fkcs,yfkbl,yfkje   ,sfkbl,sjs,sjsbh,dwbh,fgsbh,czlx,zrkdcpz,zckdcpz   ,sjr,sjsj,glxh,gysbh,ddbh,zjxbh    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ) ";
			ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?,'N',?,?,?                            ,?,?,?,?,?,'1','0','0'                             ,?,?,?,?,?,?                       ,'Y',?,?,?,?,? ) ";//1�������տ2���ǲ�����տ�
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,newfkxh);
			ps.setString(3,sjbh);
			ps.setString(4,zckx);
			ps.setDouble(5,-1*fkje);
			ps.setString(6,jkr);
			ps.setString(7,skr);
			ps.setDate(8,sksj);
			ps.setString(9,skdw);
			ps.setString(10,lrr);

			ps.setDate(11,lrsj);
			ps.setString(12,bz);
			ps.setString(13,zffs);
			ps.setString(14,fklxbm);
			ps.setString(15,lrdw);
			ps.setString(16,"");
			ps.setString(17,"");
			ps.setString(18,"");

			ps.setString(19,"");
			ps.setString(20,sjs);
			ps.setString(21,sjsbh);
			ps.setString(22,dwbh);
			ps.setString(23,fgsbh);

			ps.setString(24,null);
			ps.setDate(25,null);
			ps.setInt(26,newglxh);
			ps.setString(27,zcgysbh);
			ps.setString(28,zcddbh);
			ps.setString(29,zczjxbh);

			ps.setString(30,skdd);
			ps.setString(31,dsksjbz);
			ps.setString(32,fkkhxm);
			ps.setString(33,fkfwdz);
			ps.setString(34,zzyhkh);
			ps.executeUpdate();
			ps.close();

			//���������¼ 
			ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			ls_sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,newglxh);
			ps.setString(2,newfkxh);
			ps.executeUpdate();
			ps.close();
		}

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


	//����ԭ���������������������������������������������ʼ
	if (!oldzczjxbh.equals(""))
	{
		double sskje=0;//ʵ�տ���
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and zjxbh='"+oldzczjxbh+"'";
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
		ls_sql+=" where zjxbh='"+oldzczjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}
	else if (!oldzcddbh.equals(""))
	{
		double sskje=0;//ʵ�տ���
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and ddbh='"+oldzcddbh+"'";
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
		ls_sql+=" where ddbh='"+oldzcddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}
	//����ԭ�����������������������������������������������

	
	//���ʽ�����ڷ�ת���ת��֮��ı䣬���������Ҫ���¼���
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