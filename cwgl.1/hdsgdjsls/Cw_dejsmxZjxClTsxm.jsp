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

double ylclbfb=0; //Ӧ����ϰٷֱȣ��������������ֵ���貹���Ϸ� 

try {
	conn=cf.getConnection();

	//ȡ���Զ�����Ŀ�ɱ��ٷֱ�
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
		out.println("�����ڱ�sq_xtcsb����[Ĭ�ϲ��ϷѰٷֱ�]"+clfbfb);
		return;
	}
	rs.close();
	ps.close();

	//ȡ��Ӧ����ϰٷֱ�
	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='ylclbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ylclbfb=rs.getDouble("csz");
	}
	else{
		out.println("�����ڱ�sq_xtcsb����[Ӧ����ϰٷֱ�]"+ylclbfb);
		return;
	}
	rs.close();
	ps.close();

	//ȡ�ͻ���Ϣ
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


	//ȡ���ϳɱ������ڼ��㡾Ĭ�Ͻ�����������迼���С����Ϸ������͡��޹��Ϸ���������������������ʼ
	//�й��Ϸ���
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

	//�޹��Ϸ���
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
	ls_sql+=" from  cw_dejsglfl";//�������������
	ls_sql+=" where  qsz<="+allcbje+" and "+allcbje+"<jzz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzjsblxs=rs.getDouble("jsbl");
	}
	rs.close();
	ps.close();
	//ȡ���ϳɱ������ڼ��㡾Ĭ�Ͻ�����������迼���С����Ϸ������͡��޹��Ϸ�����==========���


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>�������-->����������Ŀ��<font color="#0000FF">������Ŀ��ָ[����]���Ҳ�����Ӧ�Ĳ���</font>��</b> 
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
<input type="hidden" name="zjxxh" value="" >
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="19" > 
		  <input type=button value='ȷ�������������ϵ��' onClick="cf_submit(listform)" >
      </td>
    </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >���</td>
    <td  width="4%" >����</td>
    <td  width="3%" >�����־</td>
    <td  width="3%" >����</td>
    <td  width="6%" >��Ŀ���</td>
    <td  width="13%" >��Ŀ����</td>
    <td  width="4%" >��λ</td>
    <td  width="5%" >������</td>
    <td  width="5%" >���ⵥ��</td>
    <td  width="6%" >������</td>
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

	//���ǣ�Ϊ�˰Ѷ�����Ŀɾ��
	ls_sql="update cw_dejsmx set mark='0'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//����������ʱ��������������ϸ��cw_dejsclmx�������������Ŀ������ϸ��cw_dejsxmclmx����Ϊ��һ����۸���׼��������������ʼ

	//������������ϸ��cw_dejsclmx��������ͳ��ÿ�ֲ��ϵ������������ʱ����
	ls_sql="delete from cw_dejsclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsclmx (khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,bzdj,dj,ylclyl,slclyl,xbclk,lx) ";
	ls_sql+=" select khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,dj,sum(xhl),0,0,'1'";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='Y' ";//ֻȡ�����࣬��������Ҫ��������
	ls_sql+=" group by khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���������Ŀ������ϸ��cw_dejsclmx��������ͳ��ÿ����Ŀ�������������ʱ����
	ls_sql="delete from cw_dejsxmclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsxmclmx (khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,ylclyl,slclyl,clf,lx) ";
	ls_sql+=" select khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,sum(xhl),0,0,'1'";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='Y' ";//ֻȡ�����࣬��������Ҫ��������
	ls_sql+=" group by khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�����赽�������ϵĲ��ϵ��ۣ����㣺���ϵ��ۡ�ʵ������������貹���Ͽ�
	String wlbm=null;
	String jsjldwbm="";
	String ckjldwbm="";
	String wlllbz="";
	double ylclyl=0;
	ls_sql="SELECT wlbm,jldwbm,ylclyl,wlllbz";
	ls_sql+=" FROM cw_dejsclmx ";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.glflbm='1' and cw_dejsclmx.wlllbz='Y' ";//Y����Ҫ��N����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		//ȡÿ�ֲ���
		wlbm=rs.getString("wlbm");
		jsjldwbm=rs.getString("jldwbm");
		ylclyl=rs.getDouble("ylclyl");//Ӧ���������
		wlllbz=cf.fillNull(rs.getString("wlllbz"));//�Ƿ���Ҫ��������


		//ȡ���ϳ�����ϸ������ƽ�����ⵥ�ۣ�����������ע�⣺���������λ�빤�Ϸ�������Ӧһ��
		double ckdj=0;
		double cksl=0;
		int jls=0;
		ckjldwbm="";
		ls_sql="SELECT jsjldwbm,sum(sl*dj)/sum(sl*wljsbz) dj,sum(sl*wljsbz) sl,count(*) jls";//�������������λ��ֵ
		ls_sql+=" FROM bj_clckmx,bj_clckd ";
		ls_sql+=" where bj_clckmx.ckdh=bj_clckd.ckdh and bj_clckd.khbh='"+khbh+"' and bj_clckmx.jswlbm='"+wlbm+"'";
		ls_sql+=" group by  jsjldwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ckjldwbm=rs1.getString("jsjldwbm");
			ckdj=rs1.getDouble("dj");//ƽ������
			cksl=rs1.getDouble("sl");//��������ϼ������������������������
			jls=rs1.getInt("jls");//��¼����Ӧ��Ϊ1���������

			if (!ckjldwbm.equals(jsjldwbm))//�ж�[������λ]�Ƿ�һ�£���ֹ��ʼ�����ݴ���
			{
				out.println("<P>������ϱ���["+wlbm+"]����[������λ]��[������ϸ:"+ckjldwbm+"]��[���Ϸ���:"+jsjldwbm+"]�в�һ��");
				return;
			}
		}
		rs1.close();
		ps1.close();

		if (jls>1)
		{
			out.println("<P>����ͬһ�֡�������ϱ��롿��Ӧ���������λ��"+wlbm);
			return;
		}

		if (cksl<=0)//�޳����¼��ֱ��ȡ�������µ��ۣ����ܳ��֣������޶�Ӧ����
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

				if (!ckjldwbm.equals(jsjldwbm))//�ж�[������λ]�Ƿ�һ�£���ֹ��ʼ�����ݴ���
				{
					out.println("<P>������ϱ���["+wlbm+"]����[������λ]��[������ϸ:"+ckjldwbm+"]��[���Ϸ���:"+jsjldwbm+"]�в�һ��");
					return;
				}
			}
			rs1.close();
			ps1.close();

			if (ckdj<=0)//��ʾ��Ȼ��Ҫ���������ˣ���������û�ж�Ӧ���ϡ��������������⴦��������˹�¼�빤�Ϸ���
			{
				//���ͣ�1�������в��ϣ�2�������޲���
				ls_sql="update cw_dejsclmx set lx='2'";
				ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				//���ͣ�1�������в��ϣ�2�������޲���
				ls_sql="update cw_dejsxmclmx set lx='2'";
				ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	

		//���¶�����������ϸ��cw_dejsclmx����ʵ���������������
		ls_sql="update cw_dejsclmx set dj="+ckdj+",slclyl="+cksl;
		ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.wlbm='"+wlbm+"'";
		
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		//���¶��������Ŀ������ϸ��cw_dejsxmclmx�������ۡ�ʵ�����������������Ϸѣ�ע�⣺��ʵ�������������ƽ��������Ŀ���ֲ��ϵ�������������������Ŀ���ֲ��ϵ�����
		ls_sql="update cw_dejsxmclmx set dj="+ckdj+",slclyl=ylclyl*"+cksl/ylclyl;
		ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";

		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	
	}
	rs.close();
	ps.close();

	//���㣺���������Ŀ������ϸ��cw_dejsxmclmx����������Ϸ�+++++++++++++��ʼ
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='N' ";//����Ҫ��������
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��Ҫ��������,����
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl>ylclyl";//���죺����*Ӧ���������
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��Ҫ��������,����
	ls_sql="update cw_dejsxmclmx set clf=slclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl<ylclyl";//���죺����*ʵ���������
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���㣺���������Ŀ������ϸ��cw_dejsxmclmx����������Ϸ�-----------------����


	//���㣺�貹���Ͽ������ĳ���ٷֱȣ������Ͽ�
	ls_sql="update cw_dejsclmx set xbclk=(ylclyl-slclyl)*dj";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and wlllbz='Y' and slclyl<ylclyl*"+ylclbfb;//Ӧ����ϰٷֱ�
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//����������ʱ��������������ϸ��cw_dejsclmx�������������Ŀ������ϸ��cw_dejsxmclmx����Ϊ��һ������۸���׼�������������������

	
	//���ɱ����������ϸ��cw_dejsmx��

	//��ȡ��Ŀ��ϸ
	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	String xclbz="";

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

		//�жϹ������Ƿ�Ϊ0���޹�������Ŀ���
		if (sl<=0)
		{
			continue;
		}

		//��ʼ��
		cbdj=0;
		cbje=0;
		mll=0;
		mle=0;
		nbjsdj=0;
		nbjsje=0;
		gsmll=0;
		gsmlr=0;

		//���㣺���۵��ۡ����۽���������������������������������������������ʼ
		/*
		1�����۵��ۼ��㷽ʽ��
		�����۵��ۡ����Ĳ�����ɣ��˹��ѣ���е�ѣ����Ϸѣ�����:���赽�������ϵĲ��Ϸѡ��赽�������ϵĲ��Ϸѣ���[��׼��Ŀ]��[�Զ�����Ŀ]���㷽ʽ��ͬ
		A����׼��Ŀ��[�˹���]��[��е��]��[���赽�������ϵĲ��Ϸ�]��ֱ�Ӵӿͻ����Ϸ�����bj_khglfxb���л�ã���[�赽�������ϵĲ��Ϸ�]��Ҫ���ݳ��ⵥ����
		����������������г��ⵥ���޳��ⵥ���ж�Ӧ���ϡ������޶�Ӧ���ϡ�
			a���г��ⵥ:     
				��ʵ��>Ӧ�죺��Ӧ�������Ϸѣ�
				��ʵ��<Ӧ�죺��û�г���ĳ���ٷֱȣ���ʵ�ʷ����������Ϸѣ�
				����ĳ���ٷֱȣ����˰�ʵ�ʷ����������Ϸ��⣬���貹�����Ͽ
			b���޳��ⵥ���ж�Ӧ���ϣ����������ϼ۸����ȡ���µ���
			c�������޶�Ӧ���ϣ����˹�¼��ͻ����Ϸ������ɿͻ����Ϸ�������㵥��
		B���Զ�����Ŀ�����˹�¼��ͻ����Ϸ������ɿͻ����Ϸ�������㵥��

		2��Ӧ�����������ͳ�ƿͻ����Ϸ�����bj_khglfxb������ȡӦ������
		3��ʵ�����������ͳ�Ƴ�����ϸ����ȡʵ������
		*/

		//�ж���Ŀ���ͣ�1:��׼��Ŀ;2:�Զ�����Ŀ;3:������Ŀ
		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM cw_dejsxmclmx  ";
			ls_sql+=" where cw_dejsxmclmx.khbh='"+khbh+"' and cw_dejsxmclmx.xmbh='"+xmbh+"' and lx='2'";//1�������в��ϣ�2�������޲���
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			if (count>0)
			{
				xclbz="N";//N��δ����Y���Ѵ���
				bjlx="3";
			}
			else{
				xclbz="";//N��δ����Y���Ѵ���
				bjlx="1";
			}
		}
		else{//�Զ�����Ŀ
			xclbz="N";//N��δ����Y���Ѵ���
			bjlx="2";
		}

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ;3:������Ŀ
		{
			//�ӡ��ͻ����Ϸ�����bj_khglfxb����ȡ��е���˹���
			double jxrgf=0;
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxbh  ";
			ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and ( bj_khglfxbh.glflbm!='1' OR (bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='N')  ) ";
			
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
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				clf=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			cbdj=clf+jxrgf;//���۵���

		}
		else if (bjlx.equals("2"))
		{
			//�ӡ��ͻ����Ϸ�����bj_khglfxb����ȡ���۵���
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxbh  ";
			ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cbdj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
		}
		else if (bjlx.equals("3"))
		{
			//�ӡ��ͻ����Ϸ�����bj_khglfxb����ȡ���۵���
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxbh  ";
			ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cbdj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
		}
			
		cbdj=cf.doubleTrim(cbdj,2);//�ɱ����ۡ����۵���

		cbje=sl*cbdj;//������*�ɱ�����
		cbje=cf.doubleTrim(cbje);//�ɱ������۽��

		//���㣺���۵��ۡ����۽��=======================================���


		mll=(dwbjje-cbje)/dwbjje*100;//�����ⱨ�۽��ɱ���/���۽��
		mll=cf.doubleTrim(mll);//ë����

		mle=dwbjje-cbje;//ë����*���ⱨ�۽��
		mle=cf.doubleTrim(mle);//ë�����


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

		//������и���Ŀ��ȡ�����������ϵ���������־
		ls_sql="SELECT jsblxs,xclbz";
		ls_sql+=" FROM cw_dejsmx  ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jsblxs=rs1.getDouble(1);
			xclbz=cf.fillNull(rs1.getString(2));

			rs1.close();
			ps1.close();

			//ɾ��
			ls_sql="delete from cw_dejsmx ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs1.close();
		ps1.close();


		nbjsdj=cbdj*(1+jsblxs/100);//�ɱ�����*(1+�������ϵ��)
		nbjsdj=cf.doubleTrim(nbjsdj);//�ڲ����㵥��

		nbjsje=nbjsdj*sl;//�ڲ����㵥��*��������
		nbjsje=cf.doubleTrim(nbjsje);//�ڲ�������

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//�����ⱨ�۽��ڲ������/���ⱨ�۽��
		gsmll=cf.doubleTrim(gsmll);//��˾ë����

		gsmlr=dwbjje-nbjsje;//��˾ë����*���ⱨ�۽��
		gsmlr=cf.doubleTrim(gsmlr);//��˾ë����

		//��������������ϸ��cw_dejsmx��
		ls_sql="insert into cw_dejsmx (khbh,xh,xmbh,xmmc,jldwbm,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,xclbz,mark)";
		ls_sql+=" values('"+khbh+"',"+row+",'"+xmbh+"','"+xmmc+"','"+jldwbm+"',"+sl+","+dj+","+dwbjje+","+cbdj+","+cbje+","+mll+","+mle+","+jsblxs+","+nbjsdj+","+nbjsje+","+gsmll+","+gsmlr+","+clfbfb+",'"+bjlx+"','"+xclbz+"','1') ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		row++;

	}
	rs.close();
	ps.close();


	//��ʾ����
	row=1;
	ls_sql="SELECT bjlx,xmbh,xmmc,cw_dejsmx.jldwbm,jldwmc,sl,dwbjdj,dwbjje,clfbfb,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,DECODE(xclbz,'N','δ����','Y','����') xclbz";
	ls_sql+=" FROM cw_dejsmx,jdm_jldwbm";
	ls_sql+=" where cw_dejsmx.jldwbm=jdm_jldwbm.jldwbm and khbh='"+khbh+"'";
	ls_sql+=" order by xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjlx=rs.getString("bjlx");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");//������
		dj=rs.getDouble("dwbjdj");//���ⵥ��
		dwbjje=rs.getDouble("dwbjje");//������
		clfbfb=rs.getDouble("clfbfb");
		cbdj=rs.getDouble("cbdj");
		cbje=rs.getDouble("cbje");
		mll=rs.getDouble("mll");
		mle=rs.getDouble("mle");
		jsblxs=rs.getDouble("jsblxs");
		nbjsdj=rs.getDouble("nbjsdj");
		nbjsje=rs.getDouble("nbjsje");
		gsmll=rs.getDouble("gsmll");
		gsmlr=rs.getDouble("gsmlr");
		xclbz=rs.getString("xclbz");

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ;3:������Ŀ
		{
			bjlxmc="��׼";
			xsclfbfb="";
		}
		else if (bjlx.equals("2"))
		{
			bjlxmc="�Զ���";

			xsclfbfb=clfbfb+"";
		}
		else if (bjlx.equals("3"))
		{
			bjlxmc="������Ŀ";
			xsclfbfb="";
		}
		else{
			bjlxmc="";
		}

		//����[С��]
		xjdwbjje+=dwbjje;//������
		xjcbje+=cbje;//���۽��
		xjmle+=mle;//ë�����
		xjnbjsje+=nbjsje;//�ڲ�������
		xjgsmlr+=gsmlr;//��˾ë����

		String clstr="";
		if (xclbz==null)
		{
			xclbz="&nbsp;";
			clstr="&nbsp;";
		}
		else{
			clstr="<A HREF='InsertZjxBj_jzglfxb.jsp?khbh="+khbh+"&zjxxh="+zjxxh+"&gdjsjlh="+gdjsjlh+"&xmbh="+xmbh+"' target='_blank'>�޸�</A>";
		}

	
		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%></td>
			<td ><%=xclbz%></td>
			<td ><%=clstr%></td>
			<td ><%=xmbh%></td>
			<td ><%=xmmc%></td>
			<td ><%=jldwmc%></td>
			<td ><%=sl%></td>
			<td ><%=dj%></td>
			<td ><%=dwbjje%></td>
			<td><%=cbdj%></td>
			<td><%=cbje%></td>
			<td><%=mll%>%</td>
			<td><%=mle%></td>
			<td><%=jsblxs%>%</td>
			<td><%=nbjsdj%></td>
			<td><%=nbjsje%></td>
			<td><%=gsmll%>%</td>
			<td><%=gsmlr%></td>
		  </tr>
		<%
		row++;

	}
	rs.close();
	ps.close();

	// ʩ�����貹���Ͽ�
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

	//����С�ơ���˾ë���ʡ���˾ë����
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
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td><%=xjcbje%></td>
	<td><%=xjmll%>%</td>
	<td><%=xjmle%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=xjnbjsje%></td>
	<td><%=xjgsmll%>%</td>
	<td><%=xjgsmlr%></td>
    </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="19" > 
		  <input type=button value='ȷ�������������ϵ��' onClick="cf_submit(listform)" name="jsblxs">
      </td>
    </tr>
</table>
</form>
</body>
</html>

<%
	//ɾ��������Ŀ
	ls_sql="delete from cw_dejsmx";
	ls_sql+=" where khbh='"+khbh+"' and mark='0'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="SELECT sum(nbjsje)";
	ls_sql+=" from cw_dejsmx ";
	ls_sql+=" where cw_dejsmx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nbjsje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update cw_gdjsjl set dejsje="+nbjsje+",xbclk="+xbclk;
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	formName.action="Cw_dejsmxList.jsp";
	formName.submit();
	return true;
} 


//-->
</script>

