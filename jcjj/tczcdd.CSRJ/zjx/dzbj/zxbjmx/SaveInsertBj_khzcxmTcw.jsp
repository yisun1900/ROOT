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
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
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
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
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
		out.println("������ѡ�������");
		return;
	}

	String sfxzsl="";//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	double bzsl=0;//��׼����
	double sjjmsl=0;//ʵ�ʼ�������
	String tcsjflbm="";
	double ghzj=0;//�����ۼ�
	double khzdsl=0;//�ɻ��������
	String khbh=null;
	ls_sql="select khbh,sfxzsl,bzsl,sjjmsl,tcsjflbm,ghzj,khzdsl";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		ghzj=rs.getDouble("ghzj");
		khzdsl=rs.getDouble("khzdsl");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	if (sfxzsl.equals("2"))//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	{
		sfxzsl="1";
	}

	if (sjjmsl>0)
	{
		out.println("�ѱ����⣬������¼��");
		return;
	}


	double tczcsl=0;//�ײ���ʵ������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx in('1')";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tczcsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tczcsl>0)
	{
		out.println("������ѡ���ײ����ģ�������ѡ��������");
		return;
	}



	double tcnsjsl=0;//�ײ�������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
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
	String sfxclxs="";
	double xdb=0;
	double sh=0;
	ls_sql="select sfkgdj,dj,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tcwzck";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		dj=rs.getDouble("dj");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();

	double sjdj=0;//ʵ�ʵ���
	if (sfkgdj.equals("Y"))//�Ƿ�ɸĵ���  Y���ǣ�N����
	{
		sjdj=srdj;
	}
	else{
		sjdj=dj;
	}

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


	if (sfxzsl.equals("1"))//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	{
		if (tcnsjsl>=bzsl)//������׼�������ƣ�ȫ�����ײ����շ�
		{
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1 ,?    ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,? ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"4");//��������  1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
			ps.setDouble(9,sl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//����۲���С��0
			ls_sql=" update bj_khzcxmh set tcndj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			

			%>
			<SCRIPT language=javascript >
			<!--
				alert("���ѣ������������ƣ�������շѣ��շ�����:<%=sl%>");
			//-->
			</SCRIPT>
			<%
		}
		else if ((tcnsjsl+sl)<=bzsl)//δ������׼��������
		{
			//δ������׼�������ƣ�ȫ�����ײ��ڲ����
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4,'Y''";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"3");//��������  1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
			ps.setDouble(9,sl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//����۲���С��0
			ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		else//���ֳ�����׼��������
		{
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

			//���ֳ�����׼�������ƣ�(bzsl-tcnsjsl)���ְ��ײ��ڲ����
			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"3");//��������  1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
			ps.setDouble(9,bzsl-tcnsjsl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();


			//����۲���С��0
			ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			//���ֳ�����׼�������ƣ�(tcnsjsl+sl)-bzsl���ְ��ײ����շ�
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

			ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
			ls_sql+=" select                ?+2,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,? ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,zjxxh);
			ps.setString(3,khbh);
			ps.setString(4,jgwzbm);
			ps.setDouble(5,sjdj);
			ps.setDouble(6,sjdj);
			ps.setDouble(7,sjdj);
			ps.setString(8,"4");//��������  1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
			ps.setDouble(9,(tcnsjsl+sl)-bzsl);
			ps.setDouble(10,xdsl);
			ps.setString(11,ptcpsm);
			ps.setString(12,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//����۲���С��0
			ls_sql=" update bj_khzcxmh set tcndj=0";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+2)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
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
		//δ������׼�������ƣ�ȫ�����ײ��ڲ����
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setDouble(6,sjdj);
		ps.setDouble(7,sjdj);
		ps.setString(8,"3");//��������  1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
		ps.setDouble(9,sl);
		ps.setDouble(10,xdsl);
		ps.setString(11,ptcpsm);
		ps.setString(12,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//����۲���С��0
		ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		//δ������׼�������ƣ�ȫ�����ײ��ڲ����
		ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm,lx ,ywdhslbz) ";
		ls_sql+=" select                ?+1,?     ,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,(?-"+ghzj+") ,?     ,(?-"+ghzj+") ,jsfs,jsj,jsbl,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?     ,'4','Y'";//1��ԭ��Ŀ��2�����3�����4��������
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,zjxxh);
		ps.setString(3,khbh);
		ps.setString(4,jgwzbm);
		ps.setDouble(5,sjdj);
		ps.setDouble(6,sjdj);
		ps.setDouble(7,sjdj);
		ps.setString(8,"3");//��������  1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
		ps.setDouble(9,sl);
		ps.setDouble(10,xdsl);
		ps.setString(11,ptcpsm);
		ps.setString(12,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//����۲���С��0
		ls_sql=" update bj_khzcxmh set tcndj=0,dj=0";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
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
	double sjsl=0;//ʵ������
	double sjjshsl=0;//ʵ�ʼ��������
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//���޶���������־ Y����������N������Ϊ0
	//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
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

	if (getsfxzsl.equals("2"))//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	{
		getsfxzsl="1";
	}

	double xlsjsl=0;
	double xlsjjshsl=0;
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
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
			ls_sql+=" where zjxxh='"+zjxxh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
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
	//��飺С���������ƣ�����������������������������
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		window.location="InsertBj_khzcxmTcw.jsp?zjxxh=<%=zjxxh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
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