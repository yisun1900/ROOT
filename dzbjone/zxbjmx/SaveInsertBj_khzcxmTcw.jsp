<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String khbh=null;
String jgwzbm=null;
String cpbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
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
ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0��δ������棻1: ������棻2: �����˻ؿͻ���3����ǩԼ��4����˾ǩ��ʧ�ܣ�5�����·������
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1��δ��ɣ�2����ɣ�3��ҵ����ת
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("���󣡿ͻ���ǩ�����������޸ı���");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("���󣡿ͻ�ǩ��ʧ�ܣ��������޸ı���");
		return;
	}

	String sfxzsl="";//�Ƿ���������  1:������Ӽۣ�2�����ɳ�����3������������
	double bzsl=0;//��׼����
	double sjjmsl=0;//ʵ�ʼ�������
	String tcsjflbm="";
	double ghzj=0;//�����ۼ�
	double khzdsl=0;//�ɻ��������
	ls_sql="select sfxzsl,bzsl,sjjmsl,tcsjflbm,ghzj,khzdsl";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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

	if (sjjmsl>0)
	{
		out.println("�ѱ����⣬������¼��");
		return;
	}


	double tczcsl=0;//�ײ���ʵ������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx in('1')";//1���ײ��ڣ�2���ײ����շѣ�3�����
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
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	//1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
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
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y'";//Y���ǣ�N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyqxtpp=rs.getInt(1);
	}
	rs.close();
	ps.close();

	double dj=0;
	double jsj=0;
	double jsbl=0;
	String sfycx="";
	String cxkssj="";
	String cxjssj="";
	double cxj=0;
	double cxjsj=0;
	double cxjsbl=0;
	String sfxclxs="";
	double xdb=0;
	double sh=0;

	ls_sql=" select dj,jsj,jsbl,sfycx,cxkssj,cxjssj,cxj,cxjsj,cxjsbl,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tcwzck";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dj=rs.getDouble("dj");
		jsj=rs.getDouble("jsj");
		jsbl=rs.getDouble("jsbl");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		cxj=rs.getDouble("cxj");
		cxjsj=rs.getDouble("cxjsj");
		cxjsbl=rs.getDouble("cxjsbl");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();

	if (sfycx.equals("Y"))//Y���д�����N���޴���
	{
		if (cxkssj.compareTo(cf.today())<=0 && cxjssj.compareTo(cf.today())>=0)
		{
			dj=cxj;
			jsj=cxjsj;
			jsbl=cxjsbl;
		}
		else{
			sfycx="N";
		}
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
	ls_sql+=" from  bj_khzcxm";
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
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,? ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"4");//��������  1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
			ps.setDouble(10,sl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//����۲���С��0
			ls_sql=" update bj_khzcxm set tcndj=0";
			ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
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
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj-ghzj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"3");//��������  1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
			ps.setDouble(10,sl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//����۲���С��0
			ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
			ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
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
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj-ghzj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"3");//��������  1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
			ps.setDouble(10,bzsl-tcnsjsl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();


			//����۲���С��0
			ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
			ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

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

			//���ֳ�����׼�������ƣ�(tcnsjsl+sl)-bzsl���ְ��ײ����շ�
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+2,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,? ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"4");//��������  1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
			ps.setDouble(10,(tcnsjsl+sl)-bzsl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//����۲���С��0
			ls_sql=" update bj_khzcxm set tcndj=0";
			ls_sql+=" where sxh='"+(sxh+2)+"' and tcndj<0";
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
		//ȫ�����ײ��ڲ����
		ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
		ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,khbh);
		ps.setString(3,jgwzbm);
		ps.setDouble(4,dj-ghzj);
		ps.setDouble(5,dj);
		ps.setDouble(6,dj-ghzj);
		ps.setDouble(7,jsj);
		ps.setDouble(8,jsbl);
		ps.setString(9,"3");//��������  1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
		ps.setDouble(10,sl);
		ps.setDouble(11,xdsl);
		ps.setString(12,ptcpsm);
		ps.setString(13,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//����۲���С��0
		ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
		ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		//ȫ�����ײ��ڲ����
		ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
		ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,khbh);
		ps.setString(3,jgwzbm);
		ps.setDouble(4,dj-ghzj);
		ps.setDouble(5,dj);
		ps.setDouble(6,dj-ghzj);
		ps.setDouble(7,jsj);
		ps.setDouble(8,jsbl);
		ps.setString(9,"3");//��������  1���ײ��ڣ�2���ײ��⣻3��������ꣻ4�������
		ps.setDouble(10,sl);
		ps.setDouble(11,xdsl);
		ps.setString(12,ptcpsm);
		ps.setString(13,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//����۲���С��0
		ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
		ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}





	//��飺Ҫ����ͬƷ�ƣ�������������������������ʼ
	if (sfyqxtpp>0)//��������:Ҫ����ͬƷ��
	{
		int ppsl=0;
		ls_sql="select count(distinct ppmc)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm in (select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y')";
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
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
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
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl;
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
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
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
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
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
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
		window.location="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
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