<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double xdsl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  xdsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}

double ysl=0;
ls=request.getParameter("ysl");
try{
	if (!(ls.equals("")))  ysl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ysl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ����]����ת����������:"+e);
	return;
}

double srdj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  srdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[dj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ʵ���]����ת����������:"+e);
	return;
}

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String oldsxh=cf.GB2Uni(request.getParameter("sxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String khbh="";
	ls_sql="select sfwc,khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

	String khbjjbbm=null;
	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbjjbbm=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	String sfxzsl="";
	double bzsl=0;
	String tcsjflbm="";
	String getbjjbbm="";
	ls_sql="select sfxzsl,bzsl,tcsjflbm,bjjbbm";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	if (!getbjjbbm.equals(bjjbbm))
	{
		out.println("�����ײͱ��ۼ��������Ĳ���ȷ���ײͱ��ۼ���["+getbjjbbm+"]����ѡ�����ļ���["+bjjbbm+"]����ص�¼�봰�ڣ����´�");
		return;
	}

	String getcpbm="";
	String zclx="";
	String sfkgdj=null;
	String ppmc=null;
	ls_sql="select cpbm,zclx,sfkgdj,ppmc";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString("cpbm");
		zclx=cf.fillNull(rs.getString("zclx"));
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
	}
	rs.close();
	ps.close();

	String lx=null;//1��ԭ��Ŀ��2�����3�����4��������
	if (xdsl>0)
	{
		lx="2";
	}
	else{
		lx="3";
	}

	long sxh=0;
	ls_sql="select NVL(max(sxh),0)";
	ls_sql+=" from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	sxh++;

	conn.setAutoCommit(false);

	//��ԭ��[oldsxh]��������ɾ�������²��룬���update
	ls_sql=" delete from bj_khzcxmh ";
	ls_sql+=" where zjxxh='"+zjxxh+"' and oldsxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (xdsl!=0)
	{
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,oldsxh,lx,ywdhslbz) ";
		ls_sql+=" select                 ?  ,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,? ,?   ,ptcpsm,bjjbbm,sxh   ,? ,'Y'";
		ls_sql+=" from bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setDouble(2,0);
		ps.setDouble(3,xdsl);
		ps.setString(4,lx);//1��ԭ��Ŀ��2�����3�����4��������
		ps.executeUpdate();
		ps.close();
	}



	//�������޸ģ��ײ����ⷢ���仯���ײ����Ϊ�ײ��ڣ����ײ��ڸ�Ϊ�ײ��⣫��������������������ʼ
	String getsxh="";
	double tcndj=0;
	double tccldj=0;
	double getsl=0;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select sxh,sl,tcndj,tccldj,sfxclxs,xdb,sh";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsxh=rs.getString("sxh");
		getsl=rs.getDouble("sl");
		tcndj=rs.getDouble("tcndj");
		tccldj=rs.getDouble("tccldj");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");

		//��ȡ��С�಻�շ���������
		double sjsl=0;//�ײ�������
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where sxh!='"+getsxh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (sfxzsl.equals("1"))//1:������Ӽ�;2:���ɳ���;3:����������
		{
			if ((sjsl+getsl)<=bzsl)//�ײ�����������������<��׼������תΪ�ײ���
			{
				ls_sql="update bj_khzcxmh set zclx='1',dj=tcndj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl>=bzsl)//ȫ��תΪ�ײ���
			{
				ls_sql="update bj_khzcxmh set zclx='2',dj=tccldj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl<bzsl)//���շ�����<��׼������(bzsl-sjsl)����תΪ�ײ��ڲ��շ�
			{
				double getxdsl=0;
				if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((sjsl+getsl-bzsl)<0)
					{
						getxdsl=java.lang.Math.floor((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.ceil((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("2"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((sjsl+getsl-bzsl)<0)
					{
						getxdsl=java.lang.Math.ceil((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.floor((sjsl+getsl-bzsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("3"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((sjsl+getsl-bzsl)*xdb*(100+sh)/100,0);
				}
				else if (sfxclxs.equals("4"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((sjsl+getsl-bzsl)*xdb*(100+sh)/100,2);
				}

				ls_sql="update bj_khzcxmh set zclx='2',dj=tccldj,sl="+(sjsl+getsl-bzsl)+",xdsl="+getxdsl;
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				long newsxh=0;
				ls_sql="select NVL(max(sxh),0)";
				ls_sql+=" from  bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					newsxh=rs1.getLong(1);
				}
				rs1.close();
				ps1.close();

				newsxh++;

				if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((bzsl-sjsl)<0)
					{
						getxdsl=java.lang.Math.floor((bzsl-sjsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.ceil((bzsl-sjsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					if ((bzsl-sjsl)<0)
					{
						getxdsl=java.lang.Math.ceil((bzsl-sjsl)*xdb*(100+sh)/100);
					}
					else{
						getxdsl=java.lang.Math.floor((bzsl-sjsl)*xdb*(100+sh)/100);
					}
				}
				else if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((bzsl-sjsl)*xdb*(100+sh)/100,0);
				}
				else if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
				{
					getxdsl=cf.round((bzsl-sjsl)*xdb*(100+sh)/100,2);
				}

				ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj   ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,fjddbh,oldsxh,lx,ywdhslbz) ";
				ls_sql+=" select                 ?+1,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,tcndj,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,ptcpsm,bjjbbm,fjddbh,oldsxh,lx,'Y'";
				ls_sql+=" from bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setLong(1,newsxh);
				ps1.setString(2,"1");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
				ps1.setDouble(3,bzsl-sjsl);
				ps1.setDouble(4,getxdsl);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	}
	rs.close();
	ps.close();
	//�������޸ģ��ײ����ⷢ�����ײ����Ϊ�ײ��ڣ����ײ��ڸ�Ϊ�ײ��⣽����������������������



	//�ͻ�����С�ƻ��ܣ���������������������������ʼ
	double sjsfsl=0;//�����շ�����
	double ppsjsfsl=0;//Ʒ�������շ�����
	if (!khbjjbbm.equals(bjjbbm))//����
	{
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
		ls_sql+=" and ppmc not in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
		ls_sql+=" ) ";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
		ls_sql+=" and ppmc='"+ppmc+"'";
		ls_sql+=" and ppmc in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
		ls_sql+=" ) ";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppsjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	}

	//�ͻ�Ʒ��������۱�bj_khppsjcjb��
	ls_sql=" update bj_khppsjcjbh set sjsfsl=?,sjsfje=sjcj*?"; 
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,ppsjsfsl);
	ps.setDouble(2,ppsjsfsl);
	ps.executeUpdate();
	ps.close();


	double sjsl=0;//ʵ������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (sfxzsl.equals("2"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		if (sjsl>bzsl)
		{
			conn.rollback();
			out.println("���󣡲��ɳ�����ʵ������["+sjsl+"]���ܳ�����׼����["+bzsl+"]");
			return;
		}
	}


	double sjjshsl=0;//ʵ�ʼ��������
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khzcxmxjh set sjsl="+sjsl+",sjjshsl="+sjjshsl;
	ls_sql+=" ,sjsfsl="+sjsfsl+",sjsfje=sjcj*"+sjsfsl;
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//�ͻ�����С�ƻ��ܣ�����������������������������

	
	//��飺С���������ƣ���������������������������ʼ
	double tcslxz=0;//�ײ���������
	String clxlmc="";
	String getsfxzsl="";//�Ƿ���������  1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
	ls_sql="select tcslxz,clxlmc,sfxzsl";
	ls_sql+=" FROM bj_khclxlxz";
	ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcslxz=rs.getDouble("tcslxz");
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		getsfxzsl=cf.fillNull(rs.getString("sfxzsl"));
	}
	rs.close();
	ps.close();

	double xlsjsl=0;
	double xlsjjshsl=0;
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xlsjsl=rs.getDouble(1);
		xlsjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (getsfxzsl.equals("2"))//1�������ƣ�2�����ܳ�����3���ɳ�����Ӽ�
	{
		if (xlsjsl>tcslxz)
		{
			out.println("<P>���"+clxlmc+"����Ʒѡ�����£�");
			String getjgwzbm=null;
			String getcpmc=null;
			String getxh=null;
			getsl=0;
			ls_sql="select jgwzbm,cpmc,xh,sl";
			ls_sql+=" FROM bj_khzcxmh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
			ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				getjgwzbm=rs.getString("jgwzbm");
				getcpmc=rs.getString("cpmc");
				getxh=rs.getString("xh");
				getsl=rs.getDouble("sl");

				out.println("<BR>λ��:"+getjgwzbm+"����Ʒ����:"+getcpmc+"���ͺ�:"+getxh+"������:"+getsl);
			}
			rs.close();
			ps.close();

			conn.rollback();
			out.println("<P>�������"+clxlmc+"��������������������["+xlsjsl+"]���ܳ�����������["+tcslxz+"]");
			return;
		}
	}
	
	

	//97:ǽ��ʻ�
	//1:��ֽ
	//94:������ֽ
	double bizhisl=0;//��ֽ����
	ls_sql="select sum(xdsl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm in('1','94') and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bizhisl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double qtchsl=0;//ǽ��ʻ�
	ls_sql="select sum(xdsl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm in(97) and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtchsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (bizhisl>0 && qtchsl>0)
	{
		conn.rollback();
		out.println("<P>���󣡱�ֽ��ǽ��ʻ�ֻ�ܶ�ѡһ");
		return;
	}

	//D ����E ���� F ����
	if (khbjjbbm.equals("F") && qtchsl>8)
	{
		conn.rollback();
		out.println("<P>��������ǽ��ʻ����8ƽ��");
		return;
	}
	else if (khbjjbbm.equals("E") && qtchsl>6)
	{
		conn.rollback();
		out.println("<P>��������ǽ��ʻ����6ƽ��");
		return;
	}
	else if (khbjjbbm.equals("D") && qtchsl>6)
	{
		conn.rollback();
		out.println("<P>���󣡱���ǽ��ʻ����6ƽ��");
		return;
	}
	
	//��飺С���������ƣ�����������������������������
	
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