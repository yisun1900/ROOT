<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String drkhbh=request.getParameter("drkhbh");//����ͻ�
String dqbm=request.getParameter("dqbm");

String khbh=request.getParameter("khbh");//�������ͻ�

if (khbh.equals(drkhbh))
{
	out.println("����ͬһ���ͻ����ܻ��ิ��");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
int count=0;
String wybh=null;
String xmbh=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
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

	//�жϵ��������ۼ����Ƿ�һ��
	String drbjjb=null;
	String drjzbz=null;
	String drbjbbh=null;
	String ssfgs=null;
	String drhxbm=null;
	
	
	String mqbjjb=null;
	String mqdqbm=null;
	String mqjzbz=null;
	ls_sql="select bjjb,jzbz,ssfgs,bjbbh,hxbm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		drbjjb=rs.getString("bjjb");
		drjzbz=rs.getString("jzbz");
		ssfgs=rs.getString("ssfgs");
		drbjbbh=rs.getString("bjbbh");
		drhxbm=rs.getString("hxbm");
	}
	rs.close();
	ps.close();
	
	
	String drdqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		drdqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();


	//�������ͻ�
	ls_sql="select bjjb,jzbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mqbjjb=rs.getString("bjjb");
		mqjzbz=rs.getString("jzbz");
	}
	rs.close();
	ps.close();



	if (!drbjjb.equals(mqbjjb))
	{
		out.println("���󣡲��ܿ��������ߵı��ۼ���һ��");
		return;
	}

	ls_sql=" select count(distinct bjjb)";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("���󣡲��ܿ�����������ϸ��[���ۼ���]��һ��");
		return;
	}
	//���ӱ��۰汾�Ƿ���ͣ��
	int bjtyMark=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_dzbjbb";
	ls_sql+=" where bjbbh='"+drbjbbh+"' and dqbm='"+drdqbm+"' and sfzybb='4'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjtyMark=rs.getInt(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);


	//���浽��ʱ����

	ls_sql=" delete from bj_mbbjxmmx ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbglxmb ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbfjxx ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbgclmx ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbsfxmmx ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbglfxb ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbkhgcxmxj ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbkhzcxmxj ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_mbkhzcxm ";
	ls_sql+=" where mbmc='���۸���"+khbh.trim()+"' and khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbbjxmmx(mbmc,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz)";
	ls_sql+=" select '���۸���"+khbh.trim()+"',xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbglxmb (mbmc,khbh,xmbh,glxmbh)";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,xmbh,glxmbh ";
	ls_sql+=" from bj_khglxmb ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into       bj_mbfjxx (mbmc,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq ) ";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq ";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbgclmx (mbmc,khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh )";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh ";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into     bj_mbsfxmmx (mbmc,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,sfje,bz,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb )";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,sfje,bz,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb ";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbglfxb (mbmc,khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx)";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx";
	ls_sql+=" from bj_khglfxb ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbkhgcxmxj (mbmc,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
	ls_sql+=" from bj_khgcxmxj ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbkhzcxmxj (mbmc,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm)";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm";
	ls_sql+=" from bj_khzcxmxj ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbkhzcxm (mbmc,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sl,ptcpsm,bjjbbm)";
	ls_sql+=" select '���۸���"+khbh.trim()+"',khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sl,ptcpsm,bjjbbm";
	ls_sql+=" from bj_khzcxm ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�������
	ls_sql=" delete from bj_bjxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khglxmb ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_fjxx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_gclmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_sfxmmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khgcxmxj ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khzcxmxj ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from bj_khzcxm ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//������Ϣ
	ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq) ";
	ls_sql+=" select     '"+drkhbh+"',jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��������ϸ
	ls_sql="insert into bj_gclmx (khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh)";
	ls_sql+=" select      '"+drkhbh+"',dqbm,xmbh,jgwzbm,sl,bz,fjnxh";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�����շ���Ŀ��ϸ
	ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,sfje,bz,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb)";
	ls_sql+=" select       '"+drkhbh+"',sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,sfje,bz,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
 
	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_bjxmmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	//������Ŀ��ϸ
	//����Ŀ��ź͵�����������ȡ���ݣ�wybh�����ѷ����仯
	
	String getxmbh=null;
	double getzk=0;
	int getxmpx=0;
	ls_sql="select xmbh,zk,xmpx";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and bjlx='1'";//1:��׼��Ŀ;2:�Զ�����Ŀ
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getxmbh=rs1.getString("xmbh");
		getzk=rs1.getDouble("zk");
		getxmpx=rs1.getInt("xmpx");

		xh++;

		String tcnxmbz="N";//�ײ�����Ŀ��־
		ls_sql="select count(*)";
		ls_sql+=" from  bj_tcbzgcxm";
		ls_sql+=" where bjbbh='"+drbjbbh+"' and dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and hxbm='"+drhxbm+"' and xmbh='"+getxmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			tcnxmbz="Y";
		}

		String glxmbh="";

		if (bjtyMark>0)//��ͣ�ã��ӱ�[bj_jzbjb1]ȡ���ݶ��Ǳ�[bj_jzbjb]
		{
			//������Ŀ���
			ls_sql="select glxmbh";
			ls_sql+=" from  bj_jzbjb1";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb1.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				glxmbh=cf.fillNull(rs.getString("glxmbh"));
			}
			rs.close();
			ps.close();

			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select                   ?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj  ,?,bj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,?,'1','1','1',?,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1����Ҫ��2������Ҫ
			ls_sql+=" from bj_jzbjb1 ";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb1.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,drkhbh);
			ps.setDouble(3,getzk);
			ps.setString(4,drbjjb);
			ps.setInt(5,getxmpx);
			ps.executeUpdate();
			ps.close();


			//�ͻ����Ϸ�����bj_khglfxb��
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+drkhbh+"' and xmbh='"+getxmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb1 ";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjbbh='"+drbjbbh+"' and xmbh='"+getxmbh+"' and bjjbbm='"+drbjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,drkhbh);
			ps.executeUpdate();
			ps.close();

		}
		else{//δͣ�ã��ӱ�[bj_jzbjb]ȡ���ݶ��Ǳ�[bj_jzbjb1]
			//������Ŀ���
			ls_sql="select glxmbh";
			ls_sql+=" from  bj_jzbjb";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				glxmbh=cf.fillNull(rs.getString("glxmbh"));
			}
			rs.close();
			ps.close();

			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,bjlx,xmlx,jzbz,xmpx,sfzgzc,glxmbh,sfbxx,lrr,lrsj,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select                   ?,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj  ,?,bj,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz ,dqbm,?   ,'1' ,'1' ,'1' ,?   ,'N',glxmbh,sfbxx,'"+yhdlm+"',SYSDATE,sfxycl,sfxyyjd,'"+tcnxmbz+"'";//1����Ҫ��2������Ҫ
			ls_sql+=" from bj_jzbjb";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjjbbm='"+drbjjb+"' and xmbh='"+getxmbh+"' and bj_jzbjb.bjbbh='"+drbjbbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,drkhbh);
			ps.setDouble(3,getzk);
			ps.setString(4,drbjjb);
			ps.setInt(5,getxmpx);
			ps.executeUpdate();
			ps.close();


			//�ͻ����Ϸ�����bj_khglfxb��
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+drkhbh+"' and xmbh='"+getxmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+drdqbm+"' and bjbbh='"+drbjbbh+"' and xmbh='"+getxmbh+"' and bjjbbm='"+drbjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,drkhbh);
			ps.executeUpdate();
			ps.close();

		}
	}
	rs1.close();
	ps1.close();


	ls_sql="insert into         bj_bjxmmx(xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz)";
	ls_sql+=" select   "+xh+"+rownum,'"+drkhbh+"',xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and bjlx='2'";//1:��׼��Ŀ;2:�Զ�����Ŀ
	ls_sql+=" order by bj_bjxmmx.xh";
	ps= conn.prepareStatement(ls_sql);
	//out.print(ls_sql);
	
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khglxmb (khbh,xmbh,glxmbh)";
	ls_sql+=" select        '"+drkhbh+"',xmbh,glxmbh ";
	ls_sql+=" from bj_khglxmb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx)";
	ls_sql+=" select        '"+drkhbh+"',glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
	ls_sql+=" from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into      bj_khgcxmxj (khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
	ls_sql+=" select               '"+drkhbh+"',xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
	ls_sql+=" from bj_khgcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm)";
	ls_sql+=" select              '"+drkhbh+"',jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm";
	ls_sql+=" from bj_khzcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_khzcxm (khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sl,ptcpsm,bjjbbm)";
	ls_sql+=" select            '"+drkhbh+"',jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sl,ptcpsm,bjjbbm";
	ls_sql+=" from bj_khzcxm ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//��ʼ��
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//���±����ۿ�
	dzbj.updateBjZkl(conn,khbh,"yz");
	//���������շ���Ŀ�������շѰٷֱ�
	dzbj.updateSfxm(conn,drkhbh,"yz");
	//��ȡ���ӱ��۽��
	double dzbjze=dzbj.getAllBjje(conn,drkhbh,"yz");


	//�޸ģ����ӱ����ܶ�
	ls_sql="update crm_zxkhxx set sfzdzbj='Y',dzbjze=?";
	ls_sql+=" where  khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();



	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("���۸��Ƴɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%


}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>" + ls_sql);
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