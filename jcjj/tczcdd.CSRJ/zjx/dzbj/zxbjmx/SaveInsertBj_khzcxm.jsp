<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String zjxxh=null;
String jgwzbm=null;
String cpbm=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
double sl=0;
String ptcpsm=null;
String bjjbbm=null;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
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

ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
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

	int sfxz=0;//�ײ���ʵ������
	ls_sql="select count(*) ";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and cpbm='"+cpbm+"'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־  Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (sfxz>0)
	{
//		out.println("������ѡ�������");
//		return;
	}

	double tcwsjsl=0;//�ײ���ʵ������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־  Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwsjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcwsjsl>0)
	{
		out.println("������ѡ�������ģ�������ѡ���ײ�����");
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

	String sfxzsl="";//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	double bzsl=0;//��׼����
	double sjjmsl=0;//ʵ�ʼ�������
	String tcsjflbm="";
	String getbjjbbm="";
	ls_sql="select sfxzsl,bzsl,sjjmsl,tcsjflbm,bjjbbm";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		getbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	if (!getbjjbbm.equals(bjjbbm))
	{
		out.println("�����ײͱ��ۼ��������Ĳ���ȷ���ײͱ��ۼ���["+getbjjbbm+"]����ѡ�����ļ���["+bjjbbm+"]����ص�¼�봰�ڣ����´�");
		return;
	}

	if (sjjmsl>0)
	{
		out.println("�ѱ����⣬������¼��");
		return;
	}




	double tcnsjsl=0;//�ײ�������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־  Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcnsjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//�Ƿ�Ҫ����ͬƷ��
	int sfyqxtpp=0;
	ls_sql="select count(*)";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y'";//Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyqxtpp=rs.getInt(1);
	}
	rs.close();
	ps.close();


	String sfkgdj=null;
	double dj=0;
	double tccldj=0;
	String ppmc=null;
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select sfkgdj,dj,tccldj,ppmc,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tczcbj";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		dj=rs.getDouble("dj");
		tccldj=rs.getDouble("tccldj");
		ppmc=cf.fillNull(rs.getString("ppmc"));
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();
	
	double xdsl=0;
	if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("2"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("3"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,0);
	}
	else if (sfxclxs.equals("4"))//1������ȡ����2������ȡ����3��4��5�룻4��������
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,2);
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


	conn.setAutoCommit(false);

	double sjdj=0;//ʵ�ʵ���

	if (sfxzsl.equals("1"))//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	{
		if (tcnsjsl>=bzsl)
		{
			
			if (sfkgdj.equals("Y"))//�Ƿ�ɸĵ���  Y���ǣ�N����
			{
				sjdj=srdj;
			}
			else{
				sjdj=tccldj;
			}
			//������׼�������ƣ�ȫ�����ײ����շ�
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,?     ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"2");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
			ps.setDouble(7,sl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
			ps.executeUpdate();
			ps.close();

			%>
			<SCRIPT language=javascript >
			<!--
				alert("���ѣ������������ƣ����շѣ��շ�����:<%=sl%>");
			//-->
			</SCRIPT>
			<%
		}
		else if ((tcnsjsl+sl)<=bzsl)
		{
			
			if (sfkgdj.equals("Y"))//�Ƿ�ɸĵ���  Y���ǣ�N����
			{
				sjdj=srdj;
			}
			else{
				sjdj=dj;
			}
			//δ������׼�������ƣ�ȫ�����ײ����շ�
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"1");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
			ps.setDouble(7,sl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
			ps.executeUpdate();
			ps.close();

		}
		else
		{
			//���ֳ�����׼�������ƣ�(bzsl-tcnsjsl)�����ײ����շ�
			
			if (sfkgdj.equals("Y"))//�Ƿ�ɸĵ���  Y���ǣ�N����
			{
				sjdj=srdj;
			}
			else{
				sjdj=dj;
			}

			if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				if ((bzsl-tcnsjsl)<0)
				{
					xdsl=java.lang.Math.floor((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.ceil((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("2"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				if ((bzsl-tcnsjsl)<0)
				{
					xdsl=java.lang.Math.ceil((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.floor((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("3"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				xdsl=cf.round((bzsl-tcnsjsl)*xdb*(100+sh)/100,0);
			}
			else if (sfxclxs.equals("4"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				xdsl=cf.round((bzsl-tcnsjsl)*xdb*(100+sh)/100,2);
			}

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"1");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
			ps.setDouble(7,bzsl-tcnsjsl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//���ֳ�����׼�������ƣ�(tcnsjsl+sl)-bzsl�����ײ����շ�
			
			if (sfkgdj.equals("Y"))//�Ƿ�ɸĵ���  Y���ǣ�N����
			{
				sjdj=srdj;
			}
			else{
				sjdj=tccldj;
			}

			if (sfxclxs.equals("1"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				if (((tcnsjsl+sl)-bzsl)<0)
				{
					xdsl=java.lang.Math.floor(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.ceil(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("2"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				if (((tcnsjsl+sl)-bzsl)<0)
				{
					xdsl=java.lang.Math.ceil(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.floor(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("3"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				xdsl=cf.round(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100,0);
			}
			else if (sfxclxs.equals("4"))//1������ȡ����2������ȡ����3��4��5�룻4��������
			{
				xdsl=cf.round(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100,2);
			}

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj    ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+2,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,?     ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tczcbj";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setString(6,"2");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
			ps.setDouble(7,(tcnsjsl+sl)-bzsl);
			ps.setDouble(8,xdsl);
			ps.setString(9,ptcpsm);
			ps.setString(10,bjjbbm);
			ps.executeUpdate();
			ps.close();

			%>
			<SCRIPT language=javascript >
			<!--
				alert("���ѣ������������ƣ��������շѣ��շ�����:<%=((tcnsjsl+sl)-bzsl)%>");
			//-->
			</SCRIPT>
			<%
		}

	}
	else if (sfxzsl.equals("2"))//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	{
		//ȫ�����ײ����շ�
		
		if (sfkgdj.equals("Y"))//�Ƿ�ɸĵ���  Y���ǣ�N����
		{
			sjdj=srdj;
		}
		else{
			sjdj=dj;
		}
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" from bj_tczcbj";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setString(6,"1");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
		ps.setDouble(7,sl);
		ps.setDouble(8,xdsl);
		ps.setString(9,ptcpsm);
		ps.setString(10,bjjbbm);
		ps.executeUpdate();
		ps.close();

	}
	else{
		//ȫ�����ײ����շ�
		
		if (sfkgdj.equals("Y"))//�Ƿ�ɸĵ���  Y���ǣ�N����
		{
			sjdj=srdj;
		}
		else{
			sjdj=dj;
		}
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,? ,'1' ,jsj,0   ,'0'     ,sh,sfcscp,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" from bj_tczcbj";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setString(6,"1");//��������  1���ײ��ڣ�2���ײ����շѣ�3�����
		ps.setDouble(7,sl);
		ps.setDouble(8,xdsl);
		ps.setString(9,ptcpsm);
		ps.setString(10,bjjbbm);
		ps.executeUpdate();
		ps.close();
	}


	//��飺Ҫ����ͬƷ�ƣ�������������������������ʼ
	if (sfyqxtpp>0)//��������:Ҫ����ͬƷ��
	{
		int ppsl=0;
		ls_sql="select count(distinct ppmc)";
		ls_sql+=" FROM (";
		ls_sql+=" select ppmc";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm in (select tccplbbm from bj_khzcxmxjh where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y')";
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
		ls_sql+=" group by ppmc";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" having sum(xdsl)!=0";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" )";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (ppsl>1)
		{
			conn.rollback();
			out.println("����[��������]��Ҫ��ͬһƷ�ƣ�ʵ��ѡ��["+ppsl+"]��Ʒ��");
			return;
		}
	}
	//��飺Ҫ����ͬƷ�ƣ���������������������������


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
			double getsl=0;
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
		window.location="InsertBj_khzcxm.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����������ʧ�ܣ�������ѡ��");
		window.close();
	//-->
	</SCRIPT>
	<%

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