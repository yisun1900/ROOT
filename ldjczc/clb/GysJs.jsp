<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170805'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[��Ӧ�̽���]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[��Ӧ�̽���]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String gys=cf.GB2Uni(request.getParameter("gys"));


Connection conn  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
PreparedStatement ps4=null;
ResultSet rs4=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>��Ӧ�̽����ͳ��</B><BR>
  <b>(����ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td width="2%" ><strong>���</strong></td>
  <td width="10%" ><strong>��Ӧ��</strong></td>
  <td width="5%" ><strong>���Ĵ���</strong></td>
  <td width="5%" ><strong>Ʒ��</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>Ŀǰ�ۼ����δ����</strong></td>
  <td  width="3%" ><strong>�����·�</strong></td>
  <td  width="5%"  ><strong>��������</strong></td>
  <td width="3%" bgcolor="#CCFFFF" ><strong>����ͻ���</strong></td>
  <td width="3%" bgcolor="#CCFFFF" ><strong>���㶩����</strong></td>
  <td width="4%" bgcolor="#CCFFFF" ><strong>ƽ������</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>�ѽ�����</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>�����Ѹ�����</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>��ͬ���</strong></td>
  <td width="5%" bgcolor="#CCFFFF" ><strong>�������</strong></td>

</tr>

<%
	//��ȡ�ꡢ�·�����	
	int[] ret=cf.getMon(sjfw,sjfw2);

	
	//��ȡ�����
	String getfgsbh=null;
	String getgys=null;
	String getzcdlbm=null;
	String getppbm=null;

	

	int zjkhsl=0;
	int zjddsl=0;

	double zjcbze=0;
	double zjhkze=0;
	double zjzjxcbze=0;
	double zjzjxze=0;
	double zjjsfl=0;

	double zjhtjsfkje=0;
	double zjzjxjsfkje=0;

	double zjhtwjwjsje=0;
	double zjzjxwjwjsje=0;

	int row=0;
	int num=0;

	//��������
	String[][] trData=new String[5000][14];
	
	//ǩ��
	ls_sql =" SELECT distinct fgsbh,gys";
	ls_sql+=" FROM (";

	ls_sql+=" SELECT distinct fgsbh,gys";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
	ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_zcdd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (jc_zcdd.fgsbh='"+fgs+"')";
	}

	if (!(gys.equals("")))
	{
		ls_sql+=" and  jc_zcdd.gys='"+gys+"'";
	}


	ls_sql+=" UNION ALL ";
	
	//������
	ls_sql+=" SELECT distinct fgsbh,gys";
	ls_sql+=" FROM jc_zczjx";
	ls_sql+=" where jc_zczjx.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
	ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jc_zczjx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_zczjx.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (jc_zczjx.fgsbh='"+fgs+"')";
	}

	if (!(gys.equals("")))
	{
		ls_sql+=" and  jc_zczjx.gys='"+gys+"'";
	}


	ls_sql+=" )";

	ls_sql+=" order by fgsbh,gys";

//	out.println(ls_sql);
	
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("fgsbh");
		getgys=rs2.getString("gys");

		num++;

		int xjkhsl=0;
		int xjddsl=0;

		double xjcbze=0;
		double xjhkze=0;
		double xjzjxcbze=0;
		double xjzjxze=0;
		double xjjsfl=0;

		double xjhtjsfkje=0;
		double xjzjxjsfkje=0;

		double xjhtwjwjsje=0;
		double xjzjxwjwjsje=0;
	
		ls_sql =" SELECT distinct zcdlbm,ppbm";
		ls_sql+=" FROM (";

		//ǩ��
		ls_sql+=" SELECT distinct zcdlbm,ppbm";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
		ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zcdd.gys='"+getgys+"'";

		ls_sql+=" UNION ALL ";

		//������
		ls_sql+=" SELECT distinct zcdlbm,ppbm";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where jc_zczjx.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
		ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and jc_zczjx.gys='"+getgys+"'";


		ls_sql+=" )";

		ls_sql+=" order by zcdlbm,ppbm ";

	//	out.println(ls_sql);
		
		ps3= conn.prepareStatement(ls_sql);
		rs3 =ps3.executeQuery();
		while (rs3.next())
		{
			getzcdlbm=rs3.getString("zcdlbm");
			getppbm=rs3.getString("ppbm");


			//��ͬ���δ�����
			double htwjwjsje=0;
			ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt in('30')";
			ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
			ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
			ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
			ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
			ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
			ls_sql+=" and jc_zcdd.ddlx not in('9','E')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				htwjwjsje=rs1.getDouble("jsje");
			}
			rs1.close();
			ps1.close();

			ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt in('30')";
			ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
			ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
			ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
			ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
			ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
			ls_sql+=" and jc_zcdd.ddlx in('9','E')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				htwjwjsje+=rs1.getDouble("jsje");
			}
			rs1.close();
			ps1.close();

			xjhtwjwjsje+=htwjwjsje;
			zjhtwjwjsje+=htwjwjsje;

			//���������δ�����
			double zjxwjwjsje=0;
			ls_sql =" SELECT sum(zjxcbze+zjxycf+zjxqtf) jsje";
			ls_sql+=" FROM jc_zczjx";
			ls_sql+=" where jc_zczjx.clzt in('30')";
			ls_sql+=" and jc_zczjx.sfjs in('N','C')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
			ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
			ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
			ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
			ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxwjwjsje=rs1.getDouble("jsje");
			}
			rs1.close();
			ps1.close();

			xjzjxwjwjsje+=zjxwjwjsje;
			zjzjxwjwjsje+=zjxwjwjsje;


			//������ʾ
			for (int i=0;i<ret.length ;i=i+2 )
			{
				String start=cf.firstDay(ret[i],ret[i+1]);//�¿�ʼ
				String end=cf.lastDay(ret[i],ret[i+1]);//�½���
				String getddlx="";

				//��������
				//ǩ��
				ls_sql =" SELECT distinct ddlx";
				ls_sql+=" FROM (";

				ls_sql+=" SELECT distinct jc_zcdd.ddlx";
				ls_sql+=" FROM jc_zcdd";
				ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
				ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
				ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
				ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
				ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
				ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";

				ls_sql+=" UNION ALL ";

				//������
				ls_sql+=" SELECT distinct jc_zcdd.ddlx";
				ls_sql+=" FROM jc_zczjx,jc_zcdd";
				ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
				ls_sql+=" and jc_zczjx.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
				ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+start+"','YYYY-MM-DD')";
				ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
				ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
				ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
				ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
				ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";


				ls_sql+=" )";

				ls_sql+=" order by ddlx";

			//	out.println(ls_sql);
				
				ps4= conn.prepareStatement(ls_sql);
				rs4 =ps4.executeQuery();
				while (rs4.next())
				{
					getddlx=rs4.getString("ddlx");

					//ǩ������
					int khsl=0;
					int ddsl=0;
					double cbze=0;
					double hkze=0;
					double jsfl=0;

					if (getddlx.equals("9") || getddlx.equals("E"))
					{
						ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) cbze,sum(hkze) hkze";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							khsl=rs1.getInt("khsl");
							ddsl=rs1.getInt("ddsl");
							cbze=rs1.getDouble("cbze");
							hkze=rs1.getDouble("hkze");
						}
						rs1.close();
						ps1.close();
					}
					else {
						ls_sql =" SELECT count(distinct khbh) khsl,count(ddbh) ddsl,sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) cbze,sum(hkze) hkze";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							khsl=rs1.getInt("khsl");
							ddsl=rs1.getInt("ddsl");
							cbze=rs1.getDouble("cbze");
							hkze=rs1.getDouble("hkze");
						}
						rs1.close();
						ps1.close();
					}




					xjkhsl+=khsl;
					xjddsl+=ddsl;
					xjcbze+=cbze;
					xjhkze+=hkze;

					zjkhsl+=khsl;
					zjddsl+=ddsl;
					zjcbze+=cbze;
					zjhkze+=hkze;

					//���������
					double zjxcbze=0;
					double zjxze=0;
					ls_sql =" SELECT sum(jc_zczjx.zjxcbze+jc_zczjx.zjxycf+jc_zczjx.zjxqtf) zjxcbze,sum(jc_zczjx.zjxze) zjxze";
					ls_sql+=" FROM jc_zczjx,jc_zcdd";
					ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
					ls_sql+=" and jc_zczjx.sfjs in('Y','M','F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
					ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+start+"','YYYY-MM-DD')";
					ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
					ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
					ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
					ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
					ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
					ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						zjxcbze=rs1.getDouble("zjxcbze");
						zjxze=rs1.getDouble("zjxze");
					}
					rs1.close();
					ps1.close();


					xjzjxcbze+=zjxcbze;
					xjzjxze+=zjxze;
					zjzjxcbze+=zjxcbze;
					zjzjxze+=zjxze;

					jsfl=(hkze+zjxze)-(cbze+zjxcbze);
					if (getddlx.equals("5") || getddlx.equals("D") )//��׼�ײ�,D���ײ�������
					{
						jsfl=0;
					}
					xjjsfl+=jsfl;
					zjjsfl+=jsfl;

					//��ͬ���㸶���
					double htjsfkje=0;
					if (getddlx.equals("9") || getddlx.equals("E"))
					{
						ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							htjsfkje=rs1.getDouble("jsje");
						}
						rs1.close();
						ps1.close();
					}
					else{
						ls_sql =" SELECT sum(jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2)) jsje";
						ls_sql+=" FROM jc_zcdd";
						ls_sql+=" where jc_zcdd.sfjs in('F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
						ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+start+"','YYYY-MM-DD')";
						ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
						ls_sql+=" and jc_zcdd.fgsbh='"+getfgsbh+"'";
						ls_sql+=" and jc_zcdd.gys='"+getgys+"'";
						ls_sql+=" and jc_zcdd.zcdlbm='"+getzcdlbm+"'";
						ls_sql+=" and jc_zcdd.ppbm='"+getppbm+"'";
						ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
						ps1= conn.prepareStatement(ls_sql);
						rs1 =ps1.executeQuery();
						if (rs1.next())
						{
							htjsfkje=rs1.getDouble("jsje");
						}
						rs1.close();
						ps1.close();
					}

					xjhtjsfkje+=htjsfkje;
					zjhtjsfkje+=htjsfkje;

					//��������㸶���
					double zjxjsfkje=0;
					ls_sql =" SELECT sum(jc_zczjx.zjxcbze+jc_zczjx.zjxycf+jc_zczjx.zjxqtf) jsje";
					ls_sql+=" FROM jc_zczjx,jc_zcdd";
					ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
					ls_sql+=" and jc_zczjx.sfjs in('F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�P���������
					ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+start+"','YYYY-MM-DD')";
					ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
					ls_sql+=" and jc_zczjx.fgsbh='"+getfgsbh+"'";
					ls_sql+=" and jc_zczjx.gys='"+getgys+"'";
					ls_sql+=" and jc_zczjx.zcdlbm='"+getzcdlbm+"'";
					ls_sql+=" and jc_zczjx.ppbm='"+getppbm+"'";
					ls_sql+=" and jc_zcdd.ddlx='"+getddlx+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						zjxjsfkje=rs1.getDouble("jsje");
					}
					rs1.close();
					ps1.close();

					xjzjxjsfkje+=zjxjsfkje;
					zjzjxjsfkje+=zjxjsfkje;

					//1������Ʒ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�
					//8�������ײͣ�9�����ɼҾӣ�A:����������B:��������շѡ�C:ѡ�����ģ�D���ײ������ģ�E��ɢ��
					String ddlxmc="";
					if (getddlx.equals("1"))
					{
						ddlxmc="����Ʒ";
					}
					else if (getddlx.equals("3"))
					{
						ddlxmc="��¼��ͬ";
					}
					else if (getddlx.equals("4"))
					{
						ddlxmc="�п�涩��";
					}
					else if (getddlx.equals("5"))
					{
						ddlxmc="��׼�ײ�";
					}
					else if (getddlx.equals("6"))
					{
						ddlxmc="�Ҿ߽����ײ�";
					}
					else if (getddlx.equals("7"))
					{
						ddlxmc="��ů�����ײ�";
					}
					else if (getddlx.equals("8"))
					{
						ddlxmc="�����ײ�";
					}
					else if (getddlx.equals("9"))
					{
						ddlxmc="���ɼҾ�";
					}
					else if (getddlx.equals("A"))
					{
						ddlxmc="��������";
					}
					else if (getddlx.equals("B"))
					{
						ddlxmc="��������շ�";
					}
					else if (getddlx.equals("C"))
					{
						ddlxmc="ѡ������";
					}
					else if (getddlx.equals("D"))
					{
						ddlxmc="�ײ�������";
					}
					else if (getddlx.equals("E"))
					{
						ddlxmc="ɢ��";
					}


					//ƽ������
					int jspjde=0;
					if (ddsl!=0)
					{
						jspjde=(int)(cbze+zjxcbze)/ddsl;
					}
					else{
						jspjde=0;
					}

					//������ʾ����

					trData[row][0]=num+"";
					trData[row][1]=getgys;
					trData[row][2]=getzcdlbm;
					trData[row][3]=getppbm;
					trData[row][4]="<A HREF=\"ViewGysWjWjsMx.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&gys="+getgys+"&zcdlbm="+getzcdlbm+"&ppbm="+getppbm+"&fgsbh="+getfgsbh+"\" target=\"_blank\">"+cf.formatDouble((htwjwjsje+zjxwjwjsje))+"</A>";
					trData[row][5]=ret[i+1]+"��";
					trData[row][6]=ddlxmc;
					trData[row][7]=khsl+"";
					trData[row][8]=ddsl+"";
					trData[row][9]=jspjde+"";
					trData[row][10]="<A HREF=\"ViewGysJsMx.jsp?sjfw="+start+"&sjfw2="+end+"&gys="+getgys+"&zcdlbm="+getzcdlbm+"&ppbm="+getppbm+"&ddlx="+getddlx+"&fgsbh="+getfgsbh+"\" target=\"_blank\">"+cf.formatDouble((cbze+zjxcbze))+"</A>";
					trData[row][11]="<A HREF=\"ViewGysJsYfkMx.jsp?sjfw="+start+"&sjfw2="+end+"&gys="+getgys+"&zcdlbm="+getzcdlbm+"&ppbm="+getppbm+"&ddlx="+getddlx+"&fgsbh="+getfgsbh+"\" target=\"_blank\">"+cf.formatDouble((htjsfkje+zjxjsfkje))+"</A>";
					trData[row][12]=cf.formatDouble((hkze+zjxze))+"";

					trData[row][13]=cf.formatDouble(jsfl)+"";


					row++;


				}
				rs4.close();
				ps4.close();
			}

			
			
			
		}
		rs3.close();
		ps3.close();

		//�����Ӧ��С��
		int jspjde=0;
		if (xjddsl!=0)
		{
			jspjde=(int)(xjcbze+xjzjxcbze)/xjddsl;
		}
		else{
			jspjde=0;
		}
		trData[row][0]=num+"";
		trData[row][1]=getgys;
		trData[row][2]="<B>С ��</B>";
		trData[row][3]="";
		trData[row][4]="<B>"+cf.formatDouble((xjhtwjwjsje+xjzjxwjwjsje))+"</B>";
		trData[row][5]="&nbsp;";
		trData[row][6]="&nbsp;";
		trData[row][7]="<B>"+xjkhsl+"</B>";
		trData[row][8]="<B>"+xjddsl+"</B>";
		trData[row][9]="<B>"+jspjde+"</B>";
		trData[row][10]="<B>"+cf.formatDouble((xjcbze+xjzjxcbze))+"</B>";
		trData[row][11]="<B>"+cf.formatDouble((xjhtjsfkje+xjzjxjsfkje))+"</B>";
		trData[row][12]=cf.formatDouble((xjhkze+xjzjxze))+"";

		trData[row][13]=cf.formatDouble(xjjsfl)+"";

		row++;
	}
	rs2.close();
	ps2.close();


	
	//�����Ƿ�ϲ�
	int[] isHb=new int[trData[0].length];
	isHb[0]=1;
	isHb[1]=1;
	isHb[2]=1;
	isHb[3]=1;
	isHb[4]=1;
	isHb[5]=1;

	//�����ַ����飬����У���ͬ�кϲ�
	cf.outTr(out,trData,isHb);
	
	

	int jspjde=0;
	if (zjddsl!=0)
	{
		jspjde=(int)(zjcbze+zjzjxcbze)/zjddsl;
	}
	else{
		jspjde=0;
	}

%>
<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="4" bgcolor="#E8E8FF"><strong><font color="#ff0000">�ܼ�</strong></td>
	
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjhtwjwjsje+zjzjxwjwjsje))%></strong></td>
	<td bgcolor="#E8E8FF">&nbsp;</td>
	<td bgcolor="#E8E8FF">&nbsp;</td>

	<td  bgcolor="#E8E8FF"><strong><%=zjkhsl%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=zjddsl%></strong></td>
	<td  bgcolor="#E8E8FF"><strong><%=jspjde%></strong></td>

	<td  bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjcbze+zjzjxcbze))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjhtjsfkje+zjzjxjsfkje))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble((zjhkze+zjzjxze))%></strong></td>
	<td bgcolor="#E8E8FF"><strong><%=cf.formatDouble(zjjsfl)%></strong></td>
  </tr>
</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3!= null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (rs4!= null) rs4.close(); 
		if (ps4!= null) ps4.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 