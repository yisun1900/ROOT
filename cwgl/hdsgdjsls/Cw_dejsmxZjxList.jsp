<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String gdjsjlh=request.getParameter("gdjsjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=1;

String dqbm=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwbm=null;
String jldwmc=null;
String gycl=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String bjlx=null;
String bjlxmc=null;

double bzclfbfb=0;//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�
double bzjsblxs=0;
double clfbfb=0;
double jsblxs=0;
String xsclfbfb="";//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�
double zjqye=0;

double allcbje=0;

double xjdwbjje=0;
double xjcbje=0;
double xjmll=0;
double xjmle=0;
double xjnbjsje=0;
double xjgsmll=0;
double xjgsmlr=0;
double xbclk=0;

double ylclbfb=0.9; //Ӧ����ϰٷֱȣ��������������ֵ���貹���Ϸ� 

try {
	conn=cf.getConnection();

	//ȡ�Զ�����Ŀ�ɱ��ٷֱ�
	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='clfbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzclfbfb=rs.getDouble("csz");
	}
	else{
		out.println("�����ڱ�sq_xtcsb����Ĭ�ϲ��ϷѰٷֱ�"+clfbfb);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,dqbm";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//��ȡ������ܼ�
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	zjqye=dzbj.getZjxHBjje(conn,khbh,zjxxh,"hd");


	//ȡ���ϳɱ�
	ls_sql="SELECT sum(bj_gclmxh.sl*bj_khglfxbh.xhl*bj_khglfxbh.dj) je";
	ls_sql+=" FROM bj_khglfxbh,bj_gclmxh  ";
	ls_sql+=" where bj_gclmxh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.khbh=bj_gclmxh.khbh and bj_khglfxbh.dqbm=bj_gclmxh.dqbm and bj_khglfxbh.xmbh=bj_gclmxh.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje=rs.getDouble("je");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj) je";
	ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh  ";
	ls_sql+=" where bj_gclmxh.khbh='"+khbh+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and bj_gclmxh.xmbh not in(select xmbh from bj_khglfxbh where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje+=rs.getDouble("je")*clfbfb/100;
	}
	rs.close();
	ps.close();


	//Ĭ�Ͻ������
	ls_sql="select jsbl";
	ls_sql+=" from  cw_dejsglfl";
	ls_sql+=" where  qsz<="+allcbje+" and "+allcbje+"<jzz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzjsblxs=rs.getDouble("jsbl");
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>ʩ���Ӷ������</b> 
  <hr>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%></td>
    <td>��ϵ��ʽ��<%=lxfs%> </td>
    <td>����ܼƣ�<%=cf.formatDouble(zjqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>

<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >
<input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
	   <input type=button value='�������' onClick="cf_submit(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='�鿴������ϸ' onClick="window.open('ViewCw_dejsclmx.jsp?khbh=<%=khbh%>')" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='�������ϳ�������嵥' onClick="window.open('ViewCw_clckmx.jsp?khbh=<%=khbh%>')" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='�鿴���۵���' onClick="window.open('ViewZjxCw_dejsxmclmx.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		���������ϵ��������Ϊ��<input type="text" name="tzjsblxs" value="<%=bzjsblxs%>" size="8" maxlength="12" >%
		<input type="button" value='��ʼ����' onClick="f_tzjsbl(listform)" >
      </td>
    </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >���</td>
    <td  width="4%" >����</td>
    <td  width="6%" >��Ŀ���</td>
    <td  width="14%" >��Ŀ����</td>
    <td  width="4%" >��λ</td>
    <td  width="5%" >������</td>
    <td  width="5%" >���ⵥ��</td>
    <td  width="6%" >������</td>
    <td  width="5%" >�Զ�����Ŀ�ɱ��ٷֱ�</td>
    <td  width="5%" >���۵���</td>
    <td  width="6%" >���۽��</td>
    <td  width="5%" >ë����</td>
    <td  width="6%" >ë�����</td>
    <td  width="5%" >�������ϵ��</td>
    <td  width="5%" >�ڲ����㵥��</td>
    <td  width="6%" >�ڲ�������</td>
    <td  width="5%" >��˾ë����</td>
    <td  width="6%" >��˾ë����</td>
  </tr>

<%
	int i=0;

	double dj=0;
	double sl=0;
	double dwbjje=0;

	//������������ϸ��cw_dejsclmx��������ͳ��ÿ�ֲ��ϵ����
	ls_sql="delete from cw_dejsclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsclmx (khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,bzdj,dj,ylclyl,slclyl,xbclk) ";
	ls_sql+=" select khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,dj,sum(xhl),0,0";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1'  ";//ֻȡ�����࣬��������Ҫ��������
	ls_sql+=" group by khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���������Ŀ������ϸ��cw_dejsclmx��������ͳ��ÿ����Ŀ�����
	ls_sql="delete from cw_dejsxmclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsxmclmx (khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,ylclyl,slclyl,clf) ";
	ls_sql+=" select khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,sum(xhl),0,0";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1'  ";//ֻȡ�����࣬��������Ҫ��������
	ls_sql+=" group by khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

/*
	1�����ۼ��㷽ʽ��
	����������������Ƿ��������ϣ�ֱ��ȡȡ���Ϸ�����ĵ��ۣ������������ϣ�����г����¼����ȡƽ�����ۣ���û�г����¼������������ϼ۸����ȡ���µ���
	2��Ӧ�����������ͳ�ƿͻ����Ϸ�����bj_khglfxb������ȡӦ������
	3��ʵ�����������ͳ�Ƴ�����ϸ����ȡʵ������
	4���������ʱ���۵��ۼ��㷽����
	�����۵��ۡ����Ĳ�����ɣ��˹��ѣ���е�ѣ����������Ϸѣ��������Ϸѣ������˹��ѡ���е�ѡ����������Ϸ����ַ��ã���ֱ�Ӵӿͻ����Ϸ�����bj_khglfxb���л�ã����������Ϸ����������������м��㡣�����������ϳ���Ӧ��ֵ����Ӧ��ֵ������Ϸѣ����������ϲ���ʱ����û�г���ĳ���ٷֱȣ���ʵ�ʷ����������Ϸѣ�����ĳ���ٷֱȣ����˰�ʵ�ʷ����������Ϸ��⣬���貹�����Ͽ
*/
	//���㣺���ϵ��ۡ�ʵ������������貹���Ͽ�
	String wlbm=null;
	String jsjldwbm="";
	String ckjldwbm="";
	String wlllbz="";
	double ylclyl=0;
	ls_sql="SELECT wlbm,jldwbm,ylclyl,wlllbz";
	ls_sql+=" FROM cw_dejsclmx ";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.glflbm='1' and cw_dejsclmx.wlllbz='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		//ȡÿ�ֲ���
		wlbm=rs.getString("wlbm");
		jsjldwbm=rs.getString("jldwbm");
		ylclyl=rs.getDouble("ylclyl");
		wlllbz=cf.fillNull(rs.getString("wlllbz"));


		//ȡ���ϳ�����ϸ������ƽ�����ⵥ�ۣ�����������ע����������λ�빤�Ϸ�����һ��
		double ckdj=0;
		double cksl=0;
		ckjldwbm="";
		ls_sql="SELECT jsjldwbm,sum(sl*dj)/sum(sl*wljsbz) dj,sum(sl*wljsbz) sl";
		ls_sql+=" FROM bj_clckmx,bj_clckd ";
		ls_sql+=" where bj_clckmx.ckdh=bj_clckd.ckdh and bj_clckd.khbh='"+khbh+"' and bj_clckmx.jswlbm='"+wlbm+"'";
		ls_sql+=" group by  bj_clckmx.wlbm,jsjldwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ckjldwbm=rs1.getString("jsjldwbm");
			ckdj=rs1.getDouble("dj");
			cksl=rs1.getDouble("sl");
		}
		rs1.close();
		ps1.close();

		if (cksl<=0)//�޳��⣬ֱ��ȡ�������µ���
		{
			ls_sql="SELECT dj/wljsbz ckdj,jsjldwbm";
			ls_sql+=" FROM bj_jzcljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and jswlbm='"+wlbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ckdj=rs1.getDouble("ckdj");
				ckjldwbm=rs1.getString("jsjldwbm");
			}
			rs1.close();
			ps1.close();
		}

		if (ckdj<=0)
		{
			out.println("������ϱ���["+wlbm+"]����[���ⵥ��]����С�ڵ���0");
			//return;
		}
	
		if (!ckjldwbm.equals(jsjldwbm))//�ж�[������λ]�Ƿ�һ��
		{
			out.println("������ϱ���["+wlbm+"]����[������λ]��[������ϸ:"+ckjldwbm+"]��[���Ϸ���:"+jsjldwbm+"]�в�һ��");
			//return;
		}

		//���¶�����������ϸ��cw_dejsclmx����ʵ���������������
		ls_sql="update cw_dejsclmx set dj="+ckdj+",slclyl="+cksl;
		ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.wlbm='"+wlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		//���¶��������Ŀ������ϸ��cw_dejsxmclmx�������ۡ�ʵ�����������������Ϸѣ�ע�⣺ʵ���������
		ls_sql="update cw_dejsxmclmx set dj="+ckdj+",slclyl=ylclyl*"+cksl/ylclyl;
		ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	
	}
	rs.close();
	ps.close();

	//���㣺�貹���Ͽ������ĳ���ٷֱȣ������Ͽ�
	ls_sql="update cw_dejsclmx set xbclk=(ylclyl-slclyl)*dj";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and wlllbz='Y' and slclyl<ylclyl*"+ylclbfb;//Ӧ����ϰٷֱ�
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���㣺���������Ŀ������ϸ��cw_dejsxmclmx����������Ϸ�+++++++++++++
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='N' ";//����Ҫ��������
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��Ҫ��������
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl>ylclyl";//���죺����*Ӧ���������
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��Ҫ��������
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl>ylclyl";//���죺����*Ӧ���������
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���㣺���������Ŀ������ϸ��cw_dejsxmclmx����������Ϸ�-----------------

	//��ȡ��Ӧ�����������ʵ�������������
	double xjylclyl=0;
	double xjslclyl=0;
	ls_sql="SELECT sum(ylclyl),sum(slclyl)";
	ls_sql+=" FROM cw_dejsclmx";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xjylclyl=rs.getDouble(1);
		xjslclyl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//��ȡ��Ŀ��ϸ
	ls_sql="SELECT bj_bjxmmxh.xmpx,bj_bjxmmxh.dqbm,bj_bjxmmxh.xmbh,bj_bjxmmxh.bjlx,bj_bjxmmxh.xmmc,bj_bjxmmxh.jldwbm,jldwmc,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je";
	ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh  ";
	ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.sl*bj_bjxmmxh.dj>0";
	ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" group by bj_bjxmmxh.xmpx,bj_bjxmmxh.dqbm,bj_bjxmmxh.xmbh,bj_bjxmmxh.bjlx,bj_bjxmmxh.xmmc,bj_bjxmmxh.jldwbm,jldwmc,bj_bjxmmxh.dj";
	ls_sql+=" order by bj_bjxmmxh.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dqbm=rs.getString("dqbm");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		bjlx=rs.getString("bjlx");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");//���ⵥ��
		sl=rs.getDouble("sl");//������
		dwbjje=rs.getDouble("je");//������

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			bjlxmc="��׼";
		}
		else{
			bjlxmc="�Զ���";
		}


		double cbdj=0;
		double cbje=0;
		double mll=0;
		double mle=0;
		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;

		//ȡ����Ԥ������Զ�����Ŀ�ɱ��ٷֱȡ��������ϵ��
		jsblxs=0;
		clfbfb=0;
		ls_sql="SELECT jsblxs,clfbfb";
		ls_sql+=" from cw_deyjsmx ";
		ls_sql+=" where cw_deyjsmx.khbh='"+khbh+"' and cw_deyjsmx.xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jsblxs=rs1.getDouble("jsblxs");
			clfbfb=rs1.getDouble("clfbfb");
		}
		else{
			//��û��ȡ��׼ֵ
			jsblxs=bzjsblxs;
			clfbfb=bzclfbfb;
		}
		rs1.close();
		ps1.close();

		//�жϹ������Ƿ�Ϊ0
		if (sl>0)
		{
			/*
			1�����ۼ��㷽ʽ��
			����������������Ƿ��������ϣ�ֱ��ȡȡ���Ϸ�����ĵ��ۣ������������ϣ�����г����¼����ȡƽ�����ۣ���û�г����¼������������ϼ۸����ȡ���µ���
			2��Ӧ�����������ͳ�ƿͻ����Ϸ�����bj_khglfxb������ȡӦ������
			3��ʵ�����������ͳ�Ƴ�����ϸ����ȡʵ������
			4���������ʱ���۵��ۼ��㷽����
			�����۵��ۡ����Ĳ�����ɣ��˹��ѣ���е�ѣ����������Ϸѣ��������Ϸѣ������˹��ѡ���е�ѡ����������Ϸ����ַ��ã���ֱ�Ӵӿͻ����Ϸ�����bj_khglfxb���л�ã����������Ϸ����������������м��㡣�����������ϳ���Ӧ��ֵ����Ӧ��ֵ������Ϸѣ����������ϲ���ʱ����û�г���ĳ���ٷֱȣ���ʵ�ʷ����������Ϸѣ�����ĳ���ٷֱȣ����˰�ʵ�ʷ����������Ϸ��⣬���貹�����Ͽ
			*/

			if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
			{
				//ȡ��е���˹���
				double jxrgf=0;
				ls_sql="SELECT sum(xhl*dj)";
				ls_sql+=" FROM bj_khglfxbh  ";
				ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_khglfxbh.glflbm!='1'  ";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jxrgf=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				//ȡ���Ϸ�
				double clf=0;
				ls_sql="SELECT sum(clf)";
				ls_sql+=" FROM cw_dejsxmclmx  ";
				ls_sql+=" where cw_dejsxmclmx.khbh='"+khbh+"' and cw_dejsxmclmx.xmbh='"+xmbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					clf=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				cbdj=clf+jxrgf;//���۵���

				xsclfbfb="";
			}
			else{
				cbdj=dj*clfbfb/100;
				xsclfbfb=clfbfb+"";
			}


			cbdj=cf.doubleTrim(cbdj,2);

			cbje=sl*cbdj;//������*�ɱ�����
			cbje=cf.doubleTrim(cbje);

			mll=(dwbjje-cbje)/dwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
			mll=cf.doubleTrim(mll);

			mle=dwbjje-cbje;//ë����*���ⱨ�۽��
			mle=cf.doubleTrim(mle);


			nbjsdj=cbdj*(1+jsblxs/100);//�ɱ�����*(1+�������ϵ��)
			nbjsdj=cf.doubleTrim(nbjsdj);

			nbjsje=nbjsdj*sl;//�ڲ����㵥��*��������
			nbjsje=cf.doubleTrim(nbjsje);

			gsmll=(dwbjje-nbjsje)/dwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
			gsmll=cf.doubleTrim(gsmll);

			gsmlr=dwbjje-nbjsje;//��˾ë����*���ⱨ�۽��
			gsmlr=cf.doubleTrim(gsmlr);
		}

		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		ls_sql="SELECT sum(xbclk)";
		ls_sql+=" FROM cw_dejsclmx  ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			xbclk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%>
				<input type="hidden" name="bjlx" value="<%=bjlx%>" >
			</td>
			<td ><%=xmbh%>
				<input type="hidden" name="xmbh" value="<%=xmbh%>" >
			</td>
			<td ><%=xmmc%>
				<input type="hidden" name="xmmc" value="<%=xmmc%>" >
			</td>
			<td ><%=jldwmc%>
				<input type="hidden" name="jldwbm" value="<%=jldwbm%>" >
			</td>
			<td ><%=sl%>
				<input type="hidden" name="sl" value="<%=sl%>" >
			</td>
			<td ><%=dj%>
				<input type="hidden" name="dj" value="<%=dj%>" >
			</td>
			<td ><%=dwbjje%>
				<input type="hidden" name="dwbjje" value="<%=dwbjje%>" >
			</td>
			<td>
<%
			if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
			{
				%>
				<%=xsclfbfb%>
				<input type="hidden" name="clfbfb" value="<%=xsclfbfb%>" >
				<%
			}
			else{
				%>
				<input type="text" name="clfbfb" size="6" value="<%=xsclfbfb%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_jsjg(listform,<%=(row-1)%>)">
				%
				<%
			}
%>
			</td>
			<td>
				<input type="text" name="cbdj" size="8" value="<%=cbdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="cbje" size="10" value="<%=cbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="mll" size="6" value="<%=mll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="mle" size="10" value="<%=mle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="jsblxs" size="6" value="<%=jsblxs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_tzxs(listform,<%=(row-1)%>)">
				%
			</td>
			<td>
				<input type="text" name="nbjsdj" size="8" value="<%=nbjsdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="nbjsje" size="10" value="<%=nbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="gsmll" size="6" value="<%=gsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="gsmlr" size="10" value="<%=gsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
		  </tr>
		
		
		<%
		row++;

	}
	rs.close();
	ps.close();

	if (xjdwbjje==0)
	{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=0;//�����ⱨ�۽��ɱ���/���۽��
		xjgsmll=0;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
	}
	else{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
		xjmll=cf.doubleTrim(xjmll);
		xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
		xjgsmll=cf.doubleTrim(xjgsmll);
	}
%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">�ϼ�</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjcbje" size="10" value="<%=xjcbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjmll" size="6" value="<%=xjmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjmle" size="10" value="<%=xjmle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjnbjsje" size="10" value="<%=xjnbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjgsmll" size="6" value="<%=xjgsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjgsmlr" size="10" value="<%=xjgsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
    </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
		  <input type=button value='�������' onClick="cf_submit(listform)" name="jsblxs">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<B>ʩ�����貹���Ͽ<%=xbclk%></B>
		<input type="hidden" name="xbclk" value="<%=xbclk%>">
      </td>
    </tr>
</table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function cf_submit(formName)
{
	formName.action="SaveCw_dejsmx.jsp";
	formName.submit();
	return true;
} 


//�޸ģ��Զ�����Ŀ�ɱ��ٷֱ�
function f_jsjg(FormName,xh)
{
	var cbdj=0;//���۵���=���ⵥ��*�Զ�����Ŀ�ɱ��ٷֱ�
	cbdj=FormName.dj[xh].value*FormName.clfbfb[xh].value/100.0;
	cbdj=round(cbdj,2);
	FormName.cbdj[xh].value=cbdj;

	var cbje=0;//���۽��=���۵���*����
	cbje=FormName.sl[xh].value*FormName.cbdj[xh].value;
	cbje=round(cbje,2);
	FormName.cbje[xh].value=cbje;

	var mll=0;//ë����=�����ⱨ�۽����۽�*100/���ⱨ�۽��
	mll=(FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	mll=round(mll,2);
	FormName.mll[xh].value=mll;

	var mle=0;//ë�����=ë����*���ⱨ�۽��
	mle=FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0;
	mle=round(mle,2);
	FormName.mle[xh].value=mle;

	var nbjsdj=0;//�ڲ����㵥��=���۵���*(1+�������ϵ��)
	nbjsdj=FormName.cbdj[xh].value*(1+FormName.jsblxs[xh].value/100.0);
	nbjsdj=round(nbjsdj,2);
	FormName.nbjsdj[xh].value=nbjsdj;

	var nbjsje=0;//�ڲ�������=�ڲ����㵥��*��������
	nbjsje=FormName.nbjsdj[xh].value*FormName.sl[xh].value;
	nbjsje=round(nbjsje,2);
	FormName.nbjsje[xh].value=nbjsje;

	var gsmll=0;//��˾ë����=�����ⱨ�۽��ڲ������*100/���ⱨ�۽��
	gsmll=(FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	gsmll=round(gsmll,2);
	FormName.gsmll[xh].value=gsmll;

	var gsmlr=0;//��˾ë����=��˾ë����*���ⱨ�۽��
	gsmlr=FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0;
	gsmlr=round(gsmlr,2);
	FormName.gsmlr[xh].value=gsmlr;

	f_jsxj(FormName);

} 


//�޸ģ��������ϵ��
function f_tzxs(FormName,xh)
{
	var nbjsdj=0;//�ڲ����㵥��=���۵���*(1+�������ϵ��)
	nbjsdj=FormName.cbdj[xh].value*(1+FormName.jsblxs[xh].value/100.0);
	nbjsdj=round(nbjsdj,2);
	FormName.nbjsdj[xh].value=nbjsdj;

	var nbjsje=0;//�ڲ�������=�ڲ����㵥��*��������
	nbjsje=FormName.nbjsdj[xh].value*FormName.sl[xh].value;
	nbjsje=round(nbjsje,2);
	FormName.nbjsje[xh].value=nbjsje;

	var gsmll=0;//��˾ë����=�����ⱨ�۽��ڲ������*100/���ⱨ�۽��
	gsmll=(FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	gsmll=round(gsmll,2);
	FormName.gsmll[xh].value=gsmll;

	var gsmlr=0;//��˾ë����=��˾ë����*���ⱨ�۽��
	gsmlr=FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0;
	gsmlr=round(gsmlr,2);
	FormName.gsmlr[xh].value=gsmlr;

	f_jsxj(FormName);

} 

//���¼���С��
function f_jsxj(FormName)
{
	var xjdwbjje=<%=xjdwbjje%>;
	var xjcbje=0;
	var xjmle=0;
	var xjnbjsje=0;
	var xjgsmlr=0;
	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		xjcbje=xjcbje+FormName.cbje[i].value*1.0
		xjmle=xjmle+FormName.mle[i].value*1.0
		xjnbjsje=xjnbjsje+FormName.nbjsje[i].value*1.0
		xjgsmlr=xjgsmlr+FormName.gsmlr[i].value*1.0
	}

	xjcbje=round(xjcbje,2);
	FormName.xjcbje.value=xjcbje;
	xjmle=round(xjmle,2);
	FormName.xjmle.value=xjmle;
	xjnbjsje=round(xjnbjsje,2);
	FormName.xjnbjsje.value=xjnbjsje;
	xjgsmlr=round(xjgsmlr,2);
	FormName.xjgsmlr.value=xjgsmlr;

	var xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
	xjmll=round(xjmll,2);
	FormName.xjmll.value=xjmll;
	var xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
	xjgsmll=round(xjgsmll,2);
	FormName.xjgsmll.value=xjgsmll;

} 



function f_tzjsbl(FormName)
{
	if(	javaTrim(FormName.tzjsblxs)=="") {
		alert("������[�����������ϵ��]��");
		FormName.tzjsblxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tzjsblxs, "�����������ϵ��"))) {
		return false;
	}

	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		FormName.jsblxs[i].value=FormName.tzjsblxs.value;
		f_tzxs(FormName,i);
	}
} 

//-->
</script>

