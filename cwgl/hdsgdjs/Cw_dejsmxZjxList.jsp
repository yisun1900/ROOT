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

double bzjsblxs=0;
double bzclfbfb=0;
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

	int wclsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cw_dejsmx";
    ls_sql+=" where khbh='"+khbh+"' and xclbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wclsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (wclsl>0)
	{
		out.println("������δ����ġ��Զ�����Ŀ������"+wclsl+"��");
		return;
	}

	//ȡ���Զ�����Ŀ�ĳɱ�Ϊ���ⱨ�۵İٷֱ�
	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='cbbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzclfbfb=rs.getDouble("csz");
	}
	else{
		out.println("�����ڱ�sq_xtcsb����[�Զ�����Ŀ�ɱ��ٷֱ�]"+bzclfbfb);
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
		allcbje+=rs.getDouble("je")*bzclfbfb/100;
	}
	rs.close();
	ps.close();


	//Ĭ�Ͻ������
	ls_sql="select jsbl";
	ls_sql+=" from  cw_dejsglfl";
	ls_sql+=" where dqbm='"+dqbm+"' and  qsz<="+allcbje+" and "+allcbje+"<jzz";
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
    <td  width="5%" bgcolor="#E8E8FF">���۵���</td>
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

	ls_sql="insert into cw_dejsclmx (khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,bzdj,dj,ylclyl,slclyl,xbclk,lx) ";
	ls_sql+=" select khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,dj,sum(xhl),0,0,'1'";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='Y' ";//ֻȡ�����࣬��������Ҫ��������
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


		//ȡ���ϳ�����ϸ������ƽ�����ⵥ�ۣ�����������ע�⣺���������λ�빤�Ϸ�������Ӧһ�£�������������ʼ
		double ckdj=0;
		double ckje=0;
		double cksl=0;
		ckjldwbm="";
		ls_sql="SELECT jsjldwbm,sum(je) ckje,sum(sl*wljsbz) sl";//�������������λ��ֵ
		ls_sql+=" FROM bj_clckmx,bj_clckd ";
		ls_sql+=" where bj_clckmx.ckdh=bj_clckd.ckdh and bj_clckd.khbh='"+khbh+"' and bj_clckmx.jswlbm='"+wlbm+"'";
		ls_sql+=" group by  jsjldwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ckjldwbm=rs1.getString("jsjldwbm");
			ckje=rs1.getDouble("ckje");//������
			cksl=rs1.getDouble("sl");//��������ϼ������������������������

			if (cksl==0)
			{
				ckdj=0;
			}
			else{
				ckdj=ckje/cksl;
			}

			if (!ckjldwbm.equals(jsjldwbm))//�ж�[������λ]�Ƿ�һ�£���ֹ��ʼ�����ݴ���
			{
				out.println("<P>������ϱ���["+wlbm+"]����[������λ]��[������ϸ:"+ckjldwbm+"]��[���Ϸ���:"+jsjldwbm+"]�в�һ��");
				return;
			}
		}
		rs1.close();
		ps1.close();


		if (cksl<=0)//�޳����¼��ֱ��ȡ�������µ��ۣ����ܳ��֣������޶�Ӧ����
		{
			ls_sql="SELECT dj/wljsbz ckdj,jsjldwbm";
			ls_sql+=" FROM bj_jzcljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and jswlbm='"+wlbm+"'";
			ls_sql+=" and wljsbz is not null and wljsbz!=0";
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
			else{
				rs1.close();
				ps1.close();

				out.println("<P>������ϱ���["+wlbm+"]���󣡡�����û�ж�Ӧ���ϡ�");
				return;
			}
			rs1.close();
			ps1.close();

		}
		//ȡ���ϳ�����ϸ������ƽ�����ⵥ�ۣ�����������ע�⣺���������λ�빤�Ϸ�������Ӧһ��-----------����

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



	//���㣺���������Ŀ������ϸ��cw_dejsxmclmx����������Ϸ�+++++++++++++��ʼ

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

	
	//���£����������ϸ��cw_dejsmx�����ɱ����ۡ��ɱ���ë���ʡ�ë�����������ϵ�����ڲ����㵥�ۡ��ڲ��������˾ë���ʡ���˾ë����

	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	String xclbz="";

	ls_sql="SELECT xmbh,xmmc,bjlx,cw_dejsmx.jldwbm,jldwmc,dwbjdj,dwbjje,sl,jsblxs";
	ls_sql+=" FROM cw_dejsmx,jdm_jldwbm";
	ls_sql+=" where cw_dejsmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and cw_dejsmx.khbh='"+khbh+"'";
	ls_sql+=" order by bjlx desc,xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		bjlx=rs.getString("bjlx");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dwbjdj");//���ⵥ��
		dwbjje=rs.getDouble("dwbjje");//������
		sl=rs.getDouble("sl");//������
		jsblxs=rs.getDouble("jsblxs");//�������ϵ��

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
		A��[�˹���]��[��е��]��[���赽�������ϵĲ��Ϸ�]��ֱ�Ӵӿͻ����Ϸ�����bj_khglfxb���л�ã���[�赽�������ϵĲ��Ϸ�]��Ҫ���ݳ��ⵥ����
		����������������г��ⵥ���޳��ⵥ���ж�Ӧ���ϡ������޶�Ӧ���ϡ�
			a���г��ⵥ:     
				��ʵ��>Ӧ�죺��Ӧ�������Ϸѣ�
				��ʵ��<Ӧ�죺��û�г���ĳ���ٷֱȣ���ʵ�ʷ����������Ϸѣ�
				����ĳ���ٷֱȣ����˰�ʵ�ʷ����������Ϸ��⣬���貹�����Ͽ
			b���޳��ⵥ���ж�Ӧ���ϣ����������ϼ۸����ȡ���µ���
			c�������޶�Ӧ���ϣ����˹�¼��ͻ����Ϸ������ɿͻ����Ϸ�������㵥��

		2��Ӧ�����������ͳ�ƿͻ����Ϸ�����bj_khglfxb������ȡӦ������
		3��ʵ�����������ͳ�Ƴ�����ϸ����ȡʵ������
		*/

		//�ӡ��ͻ����Ϸ�����bj_khglfxb����ȡ��е���˹��ѡ�������������
		double jxrgf=0;
		ls_sql="SELECT sum(xhl*dj)";
		ls_sql+=" FROM bj_khglfxbh  ";
		ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and ( bj_khglfxbh.glflbm!='1' OR (bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='N')  ) ";
//			out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jxrgf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//ȡ�������Ϸ�
		double clf=0;
		ls_sql="SELECT sum(clf)";
		ls_sql+=" FROM cw_dejsxmclmx  ";
		ls_sql+=" where cw_dejsxmclmx.khbh='"+khbh+"' and cw_dejsxmclmx.xmbh='"+xmbh+"'";
//			out.print(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			clf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		cbdj=clf+jxrgf;//���۵���

			
		cbdj=cf.doubleTrim(cbdj,2);//�ɱ����ۡ����۵���

		cbje=sl*cbdj;///�ɱ����=������*�ɱ�����
		cbje=cf.doubleTrim(cbje);//�ɱ������۽��

		//���㣺���۵��ۡ����۽��=======================================���


		mll=(dwbjje-cbje)/dwbjje*100;//ë����=�����ⱨ�۽��ɱ���/���۽��
		mll=cf.doubleTrim(mll);//ë����

		mle=dwbjje-cbje;//ë�����=���ⱨ�۽��ɱ����
		mle=cf.doubleTrim(mle);//ë�����



		nbjsdj=cbdj*(1+jsblxs/100);//�ڲ����㵥��=�ɱ�����*(1+�������ϵ��)
		nbjsdj=cf.doubleTrim(nbjsdj);//�ڲ����㵥��

		nbjsje=nbjsdj*sl;//�ڲ�������=�ڲ����㵥��*��������
		nbjsje=cf.doubleTrim(nbjsje);//�ڲ�������

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//��˾ë����=�����ⱨ�۽��ڲ������/���ⱨ�۽��
		gsmll=cf.doubleTrim(gsmll);//��˾ë����

		gsmlr=dwbjje-nbjsje;//��˾ë����=���ⱨ�۽��ڲ�������
		gsmlr=cf.doubleTrim(gsmlr);//��˾ë����


		//����[С��]
		xjdwbjje+=dwbjje;//������
		xjcbje+=cbje;//���۽��
		xjmle+=mle;//ë�����
		xjnbjsje+=nbjsje;//�ڲ�������
		xjgsmlr+=gsmlr;//��˾ë����


		//��������������ϸ��cw_dejsmx��
		ls_sql="update cw_dejsmx set cbdj=?,cbje=?,mll=?,mle=?,nbjsdj=?,nbjsje=?,gsmll=?,gsmlr=?";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,cbdj);
		ps1.setDouble(2,cbje);
		ps1.setDouble(3,mll);
		ps1.setDouble(4,mle);
		ps1.setDouble(5,nbjsdj);
		ps1.setDouble(6,nbjsje);
		ps1.setDouble(7,gsmll);
		ps1.setDouble(8,gsmlr);
		ps1.executeUpdate();
		ps1.close();

		if (bjlx.equals("1"))//1:��׼��Ŀ;2:�Զ�����Ŀ
		{
			bjlxmc="��׼";
		}
		else{
			bjlxmc="�Զ���";
		}

		//���ÿ������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%>
				<input type="hidden" name="bjlx" value="<%=bjlx%>" >
			</td>
			<td ><A HREF="ViewZjxXmCw_dejsxmclmx.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>&xmbh=<%=xmbh%>" target="_blank"><%=xmbh%></A>
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
			<td bgcolor="#E8E8FF">
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

