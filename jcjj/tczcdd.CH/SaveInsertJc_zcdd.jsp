<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String ssfgs=null;
	String dwbh=null;
	String sjs=null;
	String fjtcbz="";
	String sfyckh="";
	ls_sql="select fgsbh,dwbh,sjs,fjtcbz,sfyckh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
		dwbh=rs.getString("dwbh");
		sjs=rs.getString("sjs");
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
		sfyckh=cf.fillNull(rs.getString("sfyckh"));//�Ƿ�Զ�̿ͻ� 
	}
	rs.close();
	ps.close();


	String clgw="";
	ls_sql="select clgw";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clgw=cf.fillNull(rs.getString("clgw"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))
	{
		out.println("�����ѷֽⶩ��");
		return;
	}

	//��ȡ����С������������������������������ʼ
	int jcddblxs=-100;//���ɶ�������С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	int jcddmxblxs=-100;//���ɶ�����ϸ����С��  2��2λС����1��1λС����0��������λ��-1������ʮλ��-2��������λ��-3������ǧλ
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�������С��λ����������ϵ����Ա");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>����û�����á����ɶ�����ϸ����С����������ϵ����Ա");
		return;
	}
	//��ȡ����С������������������������������������


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set fjtcbz='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//�ײͶ����ֽ⣫����������������������ʼ
	String xmdlbm=null;
	String xmdlmc=null;
	String xmxlbm=null;
	String xmxlmc=null;

	ls_sql="SELECT distinct bj_bjxmmx.xmdlbm,bdm_xmdlbm.xmdlmc,bj_bjxmmx.xmxlbm,bdm_xmxlbm.xmxlmc";
	ls_sql+=" FROM bj_bjxmmx,bdm_xmdlbm,bdm_xmxlbm ";
    ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmflbm='07'";//������
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm(+)  ";
	ls_sql+=" and bj_bjxmmx.xmxlbm=bdm_xmxlbm.xmxlbm(+)  ";
	ls_sql+=" order by bj_bjxmmx.xmdlbm,bj_bjxmmx.xmxlbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmdlbm=rs1.getString("xmdlbm");
		xmdlmc=rs1.getString("xmdlmc");
		xmxlbm=rs1.getString("xmxlbm");
		xmxlmc=rs1.getString("xmxlmc");

		String ddlx=null;
		ddlx="5";//5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9���������ģ�A:����������B:��������շѡ�C:ѡ������

		String ppbm=xmxlmc;
		String ppmc=xmxlmc;
		String gysmc="��װ";

		double tcycf=0;//�ײ�Զ�̷�
		String sfxcl="N";//�Ƿ������
		String sfkgtcsl="N";//�Ƿ�ɸ�����

		double qtycf=0;

		String sfkgsl=sfkgtcsl;//�Ƿ�ɸ�����
		String xclbz="1";//��Ʒ���� 1���Ƕ���ʽ��Ʒ��2������ʽ��Ʒ


		String cldlmc=xmdlmc;


		String ddbh=null;
		int count=0;
		ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ddbh=khbh+cf.addZero(count+1,2);

		ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
		ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
		ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
		ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,sfkgsl,qtycf ";
		ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
		ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfjrht,jmje,ZSJE,ZJXZSJE,sfck )";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
		ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
		ls_sql+=" ,0,0,0,0   ,0,0,0,0   ,0,0,0,'N','07',?,'N',0,0,0,'1') ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,khbh);
		ps.setString(3,clgw);
		ps.setString(4,"");
		ps.setString(5,"");
		ps.setString(6,"");
		ps.setString(7,"");
		ps.setString(8,"");
		ps.setDate(9,null);
		ps.setDate(10,null);

		ps.setDate(11,cf.getDate());
		ps.setDate(12,null);
		ps.setString(13,cldlmc);
		ps.setString(14,"a");
		ps.setString(15,ppbm);
		ps.setString(16,gysmc);
		ps.setString(17,ppmc);
		ps.setDouble(18,10);
		ps.setString(19,"");
		ps.setString(20,xclbz);

		ps.setDouble(21,0);
		ps.setDouble(22,0);
		ps.setDouble(23,0);
		ps.setDouble(24,0);
		ps.setDouble(25,0);
		ps.setString(26,"N");
		ps.setDate(27,null);
		ps.setDate(28,null);
		ps.setString(29,"");
		ps.setString(30,ssfgs);

		ps.setString(31,dwbh);
		ps.setString(32,sjs);
		ps.setString(33,lrbm);
		ps.setString(34,yhmc);
		ps.setString(35,"");
		ps.setString(36,sfkgsl);
		ps.setDouble(37,qtycf);
		ps.setString(38,ddlx);

		ps.executeUpdate();
		ps.close();

		long xh=0;
		ls_sql="select NVL(max(xh),0)";
		ls_sql+=" from  jc_zcddmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();
		xh++;


		ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm           ,zcxlbm           ,dwbh,gys,ppmc,zclbbm,xinghao            ,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj,cbj,sl              ,je,ycf,qtfy,qtfyje,zjhsl            ,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm         ,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz             ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje,zqzjhje,bjjbbm)"; 
		ls_sql+=" select           ?+rownum,?   ,?   ,xmbh,xmmc,xmdlmc,xmxlmc,?   ,?  ,?   ,''    ,gycl     ,''  ,''    ,jldwmc,'N'    ,0   ,0 ,0    ,0    ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,0 ,0  ,sum(sl),0 ,0  ,0   ,0     ,sum(sl) ,0    ,0     ,0        ,jgwzbm  ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,bz   ,0     ,0     ,'1' ,0   ,'1' ,''      ,0  ,0        ,'N'   ,0   ,10  ,0   ,0      ,''";//xzjg 1:�����޼ۣ�2:������
		ls_sql+=" FROM (";
		
		
		ls_sql+=" select                              bj_bjxmmx.xmbh,xmmc,bdm_xmdlbm.xmdlmc,bdm_xmxlbm.xmxlmc,                     bj_bjxmmx.gycl                 ,jldwmc                                                                                          ,sum(bj_gclmx.sl) sl,bj_gclmx.jgwzbm,bj_bjxmmx.bz ";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm,bdm_xmxlbm,jdm_jldwbm ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm='"+xmdlbm+"'";
		ls_sql+=" and bj_bjxmmx.xmxlbm='"+xmxlbm+"'";
		ls_sql+=" and bj_bjxmmx.xmflbm='07'";//������
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm(+)  ";
		ls_sql+=" and bj_bjxmmx.xmxlbm=bdm_xmxlbm.xmxlbm(+)  ";
		ls_sql+=" and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+) ";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" group by bj_bjxmmx.xmbh,xmmc,bdm_xmdlbm.xmdlmc,bdm_xmxlbm.xmxlmc,jldwmc,bj_gclmx.jgwzbm,bj_bjxmmx.gycl,bj_bjxmmx.bz";
		
		ls_sql+=" )";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,ddbh);
		ps.setString(3,khbh);

		ps.setString(4,ppbm);
		ps.setString(5,gysmc);
		ps.setString(6,ppmc);

		ps.setString(7,yhmc);
		ps.setString(8,ssfgs);
		ps.setString(9,dwbh);
		ps.setString(10,sjs);
		ps.executeUpdate();
		ps.close();




		//��С��λ��������������������������������������ʼ
		ls_sql="update jc_zcddmx set je=ROUND(je,"+jcddmxblxs+"),ycf=ROUND(ycf,"+jcddmxblxs+"),qtfyje=ROUND(qtfyje,"+jcddmxblxs+")";
		ls_sql+=" ,zjhje=ROUND(zjhje,"+jcddmxblxs+"),zjhycf=ROUND(zjhycf,"+jcddmxblxs+"),zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
		ls_sql+=" ,cxhdje=ROUND( cxhdje,"+jcddmxblxs+"),zjhcxhdje=ROUND( zjhcxhdje,"+jcddmxblxs+"),sxbz='1'";//1������д��2����д
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//��С��λ������������������������������������

		double wdzje=0;
		double hkze=0;
		double cxhdje=0;
		double cbze=0;
		double zqclf=0;
		double zhclf=0;
		double ycf=0;
		double qtf=0;
		ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wdzje=rs.getDouble(1);
			hkze=rs.getDouble(2);
			cxhdje=rs.getDouble(3);
			cbze=rs.getDouble(4);
			zqclf=rs.getDouble(5);
			zhclf=rs.getDouble(6);
			ycf=rs.getDouble(7);
			qtf=rs.getDouble(8);
		}
		rs.close();
		ps.close();

		double zczkl=10;

		ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
		ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//���ɶ���
		ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,zqje,zhje,cbje,fssj)";
		ls_sql+=" select ddbh,'4','1',ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,wdzje,hkze,cbze,qhtsj";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();
	//�ײͶ����ֽ⣽������������������������



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
	out.print("����ʧ��,��������: " + e);
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>