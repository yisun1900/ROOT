<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String lrr=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");


String khbh=cf.GB2Uni(request.getParameter("khbh"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String bjjb=cf.GB2Uni(request.getParameter("bjjb"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	String bjbbh=null;
	String ssfgs=null;
	int fwmj=0;
	ls_sql="SELECT zxzt,bjbbh,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();


	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("1"))
	{
		out.println("���󣡷Ǿ�װ�ͻ�");
		return;
	}

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

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);


	ls_sql="delete from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao,fjlx)";
	ls_sql+=" select                ?,jgwzmc,fjmj,0  ,0      ,0      ,jgwzmc   ,''    ,'',xuhao,fjlx";
	ls_sql+=" from bdm_hxfjdzb  ";
	ls_sql+=" where hxbm='"+hxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	long xh=0;
	ls_sql="select NVL(max(xh)+1,0)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	int xmpx=0;//��Ŀ����
	ls_sql="select NVL(max(xmpx)+1,0)";
	ls_sql+=" from  bj_bjxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmpx=rs.getInt(1);
	}
	rs.close();
	ps.close();


	//���ӱ�����Ŀ����Դ���ײͱ�׼������Ŀ��������������������������������ʼ
	ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,zqdj,zk,dj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj   ,sfxycl,sfxyyjd,tcnxmbz ) ";
	ls_sql+=" select   ?+rownum,?,bj_jzbjb.xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,bj  ,10,bj,sfyxdz,zdzk,gycl,flmcgg,bz,bj_jzbjb.dqbm,?,'1','1',?,'N'  ,glxmbh,'1' ,sfbxx,?  ,SYSDATE,sfxycl,sfxyyjd,'Y'";//1����Ҫ��2������Ҫ
	ls_sql+=" from bj_jzbjb,tc_csrjbzgcxm ";
	ls_sql+=" where bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
	ls_sql+=" and tc_csrjbzgcxm.dqbm='"+dqbm+"' and tc_csrjbzgcxm.bjbbh='"+bjbbh+"'";
	ls_sql+=" and tc_csrjbzgcxm.bjjbbm='"+bjjb+"'";
	ls_sql+=" and bj_jzbjb.xmbh=tc_csrjbzgcxm.xmbh ";
	ls_sql+=" and bj_jzbjb.xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,khbh);
	ps.setString(3,bjjb);
	ps.setInt(4,xmpx);
	ps.setString(5,yhdlm);
	ps.executeUpdate();
	ps.close();
	//���ӱ�����Ŀ����Դ���ײͱ�׼������Ŀ����������������������������������

	//�ͻ����Ϸ�����bj_khglfxb��
	ls_sql="delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
	ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
	ls_sql+=" from bj_jzglfxb ";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ls_sql+=" and xmbh in(select xmbh from bj_bjxmmx where khbh='"+khbh+"' )";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	//�ͻ��ײͼ۸��������������������������������ʼ
	ls_sql="delete from tc_csrjkhjgb "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhjgb (khbh,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj)"; 
	ls_sql+=" select                     ?,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj";
	ls_sql+=" from tc_csrjtcjgb";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//�ͻ��ײͼ۸����������������������������������

	//����:�ͻ�����۸��tc_csrjkhcgjmj����������������������������������ʼ
	ls_sql="delete from tc_csrjkhcgjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhcgjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzsl,zdsl,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzsl,bzsl,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjcgjmj,bj_fjxx";
	ls_sql+=" where tc_csrjcgjmj.dqbm='"+dqbm+"' and tc_csrjcgjmj.bjjbbm='"+bjjb+"'";
	ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
	ls_sql+=" and bj_fjxx.fjlx=1";//1��������2�������䣻3�����ң�4��������5��������6����̨
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//����:�ͻ�����۸��tc_csrjkhcgjmj������������������������������������

	//����:�ͻ�ľ�ż۸��tc_khmmjgb����������������������������������ʼ
	ls_sql="delete from tc_csrjkhmmjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhmmjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,zdsl,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,0   ,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjmmjmj";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update tc_csrjkhmmjmj set zdsl=bzsl+FLOOR(("+fwmj+"-bzmj)/mtmzjmj)"; //�������
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//����:�ͻ�ľ�ż۸��tc_khmmjgb������������������������������������

	//�ͻ���߼۸��tc_khjjjgb����������������������������������ʼ
	ls_sql="delete from tc_csrjkhjjjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhjjjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjjjjmj,bj_fjxx";
	ls_sql+=" where tc_csrjjjjmj.dqbm='"+dqbm+"' and tc_csrjjjjmj.bjjbbm='"+bjjb+"'";
	ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
	ls_sql+=" and bj_fjxx.fjlx=2";//1��������2�������䣻3�����ң�4��������5��������6����̨
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//�ͻ���߼۸��tc_khjjjgb������������������������������������

	//�ͻ���ש�۸��tc_khczjgb����������������������������������ʼ
	ls_sql="delete from tc_csrjkhczjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjczjmj,bj_fjxx";
	ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
	ls_sql+=" and tc_csrjczjmj.tccplbbm not in(25,26)";//���ש/���ש�߽���
	ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
	ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1��������2�������䣻3�����ң�4��������5��������6����̨
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                       ?,tccplbbm,'����',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjczjmj";
	ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
	ls_sql+=" and tc_csrjczjmj.tccplbbm in(25,26)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//�ͻ���ש�۸��tc_khczjgb������������������������������������

	//�ͻ����۰�۸��tc_khlkbjgb����������������������������������ʼ
	ls_sql="delete from tc_csrjkhlkbjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhlkbjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                        ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0    ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjlkbjmj,bj_fjxx";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
	ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1��������2�������䣻3�����ң�4��������5��������6����̨
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//�ͻ����۰�۸��tc_khlkbjgb������������������������������������

	//�ͻ��ذ����ۣ�tc_csrjkhdbjmj����������������������������������ʼ
	ls_sql="delete from tc_csrjkhdbjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhdbjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjdbjmj";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//�ͻ��ذ����ۣ�tc_csrjkhdbjmj������������������������������������

	//����:�ͻ��¹����ۣ�tc_csrjkhygjmj����������������������������������ʼ
	ls_sql="delete from tc_csrjkhygjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhygjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
	ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjygjmj";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update tc_csrjkhygjmj set zdpms=dyygpm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //�������
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//����:�ͻ��¹����ۣ�tc_csrjkhygjmj������������������������������������

	//�ͻ�����������ۣ�������������������������������ʼ
	ls_sql="delete from tc_csrjkhwjdqjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhwjdqjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                         ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjwjdqjmj";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//v����������������������������������

	//����:�ͻ�����ʯ����ۣ�������������������������������ʼ
	ls_sql="delete from tc_csrjkhgmsjmj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhgmsjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
	ls_sql+=" select                        ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjgmsjmj";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update tc_csrjkhgmsjmj set zdpms=dypm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //�������
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//����:�ͻ�����ʯ����ۣ���������������������������������
	
	
	//����:�ͻ������ײ�����Ŀ��tc_khcytcwxm����������������������������������ʼ
	ls_sql="delete from tc_csrjkhcytcwxm "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhcytcwxm (khbh,tccplbbm,tccpdlbm,sjsl,lrr      ,lrsj)"; 
	ls_sql+=" select                         ?,tccplbbm,tccpdlbm,0   ,'"+lrr+"',SYSDATE";
	ls_sql+=" from tc_csrjcytcwxm";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//����:�ͻ������ײ�����Ŀ��tc_khcytcwxm������������������������������������


	//�ͻ���׼��Ŀ��������������������������������ʼ
	ls_sql="delete from tc_csrjkhbzxm "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhbzxm (khbh,xmmc,ppmc,xh,jldw,bhsl,bz,lrr,lrsj)"; 
	ls_sql+=" select                      ?,xmmc,ppmc,xh,jldw,bhsl,bz,?  ,SYSDATE";
	ls_sql+=" from tc_csrjbzxm";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,lrr);
	ps.executeUpdate();
	ps.close();
	//�ͻ���׼��Ŀ����������������������������������


	//�ͻ�������ĿС�ƣ�������������������������������ʼ
	ls_sql="delete from tc_csrjkhgcxmxj "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into tc_csrjkhgcxmxj (khbh,xmbh,bzsl,sfxzsl,sjsl,xjjsl,tcnxmbz)"; 
	ls_sql+=" select                        ?,xmbh,bzsl,sfxzsl,0   ,0    ,'Y'";
	ls_sql+=" from tc_csrjbzgcxm";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();
	//�ͻ�������ĿС�ƣ���������������������������������

		
	ls_sql="delete from tc_csrjkhzcqd "; 
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (hxbm.equals("13") || hxbm.equals("14") || hxbm.equals("15"))
	{
		ls_sql="delete from tc_csrjkhmmjmj "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from tc_csrjkhczjmj "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tccplbbm in(25,26)";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from tc_csrjkhdbjmj "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from tc_csrjkhygjmj "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from tc_csrjkhwjdqjmj "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from tc_csrjkhgmsjmj "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="delete from bj_khglxmb";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khglxmb (khbh,xmbh,glxmbh) ";
	ls_sql+=" select ?,xmbh,glxmbh";
	ls_sql+=" from bj_glxmb ";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' ";
	ls_sql+=" and xmbh in ";
	ls_sql+=" ( ";
	ls_sql+=" select xmbh ";
	ls_sql+=" from bj_jzbjb ";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' and sfbxx in('1','2') ";//1���ر��2�������3����ѡ�9��������
	ls_sql+=" and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
	ls_sql+=" ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_sfxmmx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfbfb,zqsfje   ,dxzkl,sfje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,dj  ,jldw,sl,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz ) ";
	ls_sql+=" select               ?   ,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,0    ,gdje     ,10   ,gdje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,gdje,jldw,1 ,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz";
	ls_sql+=" from bdm_sfxmbm ";
	ls_sql+=" where dqbm='"+dqbm+"' and sfbxx='1' and sfxmbm not in(select sfxmbm from bj_sfxmmx where khbh='"+khbh+"')";//1����ѡ��2���Ǳ�ѡ��
	ls_sql+=" and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"')))";//1��������Ȩ��2������Ȩʹ��
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();


	dzbj.Tzk tzk=new dzbj.Tzk();

	//���±����ۿ�
	tzk.updateBjZkl(conn,khbh,"yz");

	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set dzbjze=0,bjjb=?,hxbm=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bjjb);
	ps.setString(2,hxbm);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�����ײͱ�׼������Ŀ�ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

