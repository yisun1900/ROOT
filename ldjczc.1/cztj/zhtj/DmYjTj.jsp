<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030903'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[����ҵ���ۺ�ͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[����ҵ���ۺ�ͳ��]��"+xtrzyhmc+"') ";
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

String sjfwNian=cf.firstDayNian(sjfw);

String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));

String wheresql="";
String wheresql1="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}


if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}

wheresql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


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

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>����ҵ���ۺ�ͳ��</B><BR>
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="280%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  >
  <td width="1%" rowspan="2" >���</td>
  <td width="5%" rowspan="2" >����</td>
  <td width="2%" rowspan="2" >�ڼ�</td>
  <td colspan="3" >��ƺ�ͬ</td>
  <td colspan="6" >���Ի�ʩ����ͬ</td>
  <td colspan="6" >�ײ�ʩ����ͬ</td>
  <td colspan="3" >ʩ����ͬ����(���˵�)</td>
  <td colspan="5" >���Ľ��</td>
  <td colspan="2" >��ҵ��</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" >��ͬ����</td>
  <td  width="4%" >��ͬ���</td>
  <td  width="4%" >ʵ�ս��</td>

  <td  width="2%" >��ͬ����</td>
  <td  width="5%" >��ǰ��ͬ���</td>
  <td  width="5%" >�ۺ��ͬ���</td>
  <td  width="2%" >�˵�����</td>
  <td  width="4%" >��ǰ�˵����</td>
  <td  width="4%" >�ۺ��˵����</td>

  <td  width="2%" >��ͬ����</td>
  <td  width="5%" >��ǰ��ͬ���</td>
  <td  width="5%" >�ۺ��ͬ���</td>
  <td  width="2%" >�˵�����</td>
  <td  width="4%" >��ǰ�˵����</td>
  <td  width="4%" >�ۺ��˵����</td>

  <td  width="2%" >��ͬ����</td>
  <td  width="5%" >��ǰ��ͬ���</td>
  <td  width="5%" >�ۺ��ͬ���</td>
  
  <td  width="4%" >�������Ľ��</td>
  <td  width="4%" >ѡ�����Ľ��</td>
  <td  width="4%" >�������Ľ��</td>
  <td  width="5%" >���ĺϼƽ��</td>
  <td  width="3%" >���Ի��������</td>

  <td  width="2%" >��ͬ����</td>
  <td  width="5%" >�ۺ��ͬ���</td>
  </tr>
<%
	//��ȡ�����
	int row=0;

	double zjjc_qye=0;
	double zjxp_qye=0;

	int zjsjhtsl=0;
	double zjsjhtje=0;
	double zjsssjf=0;


	int zjqds_gxh=0;
	double zjzqqdje_gxh=0;
	double zjzhqdje_gxh=0;

	int zjtds_gxh=0;
	double zjzqtdje_gxh=0;
	double zjzhtdje_gxh=0;

	int zjqds_tc=0;
	double zjzqqdje_tc=0;
	double zjzhqdje_tc=0;

	int zjtds_tc=0;
	double zjzqtdje_tc=0;
	double zjzhtdje_tc=0;


//

	double zjjc_qye_nian=0;
	double zjxp_qye_nian=0;

	int zjsjhtsl_nian=0;
	double zjsjhtje_nian=0;
	double zjsssjf_nian=0;


	int zjqds_gxh_nian=0;
	double zjzqqdje_gxh_nian=0;
	double zjzhqdje_gxh_nian=0;

	int zjtds_gxh_nian=0;
	double zjzqtdje_gxh_nian=0;
	double zjzhtdje_gxh_nian=0;

	int zjqds_tc_nian=0;
	double zjzqqdje_tc_nian=0;
	double zjzhqdje_tc_nian=0;

	int zjtds_tc_nian=0;
	double zjzqtdje_tc_nian=0;
	double zjzhtdje_tc_nian=0;

	double zjqt_qye=0;
	double zjqt_qye_nian=0;
 
	String fgsmcbh=null;
	String fgsmc=null;
	String getdwbh=null;

	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	ls_sql =" SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where sq_dwxx.dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		fgsmcbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");
	

		double xjjc_qye=0;
		double xjxp_qye=0;
		
		int xjsjhtsl=0;
		double xjsjhtje=0;
		double xjsssjf=0;
		int xjqds_gxh=0;
		double xjzqqdje_gxh=0;
		double xjzhqdje_gxh=0;

		int xjtds_gxh=0;
		double xjzqtdje_gxh=0;
		double xjzhtdje_gxh=0;

		int xjqds_tc=0;
		double xjzqqdje_tc=0;
		double xjzhqdje_tc=0;
		int xjtds_tc=0;
		double xjzqtdje_tc=0;
		double xjzhtdje_tc=0;

//
		double xjjc_qye_nian=0;
		double xjxp_qye_nian=0;
		
		int xjsjhtsl_nian=0;
		double xjsjhtje_nian=0;
		double xjsssjf_nian=0;
		int xjqds_gxh_nian=0;
		double xjzqqdje_gxh_nian=0;
		double xjzhqdje_gxh_nian=0;

		int xjtds_gxh_nian=0;
		double xjzqtdje_gxh_nian=0;
		double xjzhtdje_gxh_nian=0;

		int xjqds_tc_nian=0;
		double xjzqqdje_tc_nian=0;
		double xjzhqdje_tc_nian=0;
		int xjtds_tc_nian=0;
		double xjzqtdje_tc_nian=0;
		double xjzhtdje_tc_nian=0;

		double xjqt_qye=0;
		double xjqt_qye_nian=0;

		ls_sql =" SELECT dwbh,dwmc,kdsj,gdsj,cxbz ";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where sq_dwxx.dwlx='F2'";
		ls_sql+=" and sq_dwxx.ssfgs='"+fgsmcbh+"'";

		if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}

		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" order by sq_dwxx.dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getdwbh=rs.getString("dwbh");
			dmmc=rs.getString("dwmc");
			cxbz=rs.getString("cxbz");
			kdsj=cf.fillNull(rs.getDate("kdsj"));
			gdsj=cf.fillNull(rs.getDate("gdsj"));

			row++;

			if (cxbz.equals("Y"))//Y���ѳ�����N��δ����
			{
				dmmc="<font color=\"#FF0033\">"+dmmc+"<BR>("+kdsj+"��"+gdsj+")</font>";
			}
			else{
				if (!kdsj.equals(""))
				{
					dmmc=dmmc+"<BR>(����:"+kdsj+")";
				}
			}



			//����ͳ�ƣ�����������������������������������ʼ

			//��ƺ�ͬ-��ͬ���
			//��ƺ�ͬ-ʵ�ս��
			int sjhtsl=0;
			double sjhtje=0;
			ls_sql=" SELECT count(*),sum(sjhtje) ";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdm='"+getdwbh+"'";
			ls_sql+=" and qsjhtbz='Y'";
			ls_sql+=" and qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sjhtsl=rs1.getInt(1);
				sjhtje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			double sssjf=0;
			ls_sql=" SELECT sum(fkje) ";
			ls_sql+=" FROM cw_khfkjl";
			ls_sql+=" where dwbh='"+getdwbh+"'";
			ls_sql+=" and scbz='N' and fklxbm='53'";//53����Ʒ�
			ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
			ls_sql+=" and sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sssjf=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			xjsjhtsl+=sjhtsl;
			xjsjhtje+=sjhtje;

			zjsjhtsl+=sjhtsl;
			zjsjhtje+=sjhtje;

			xjsssjf+=sssjf;
			zjsssjf+=sssjf;

			//���Ի�ʩ����ͬ
			int qds_gxh=0;
			double zqqdje_gxh=0;
			double zhqdje_gxh=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='1'";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qds_gxh=rs1.getInt(1);
				zqqdje_gxh=rs1.getDouble(2);
				zhqdje_gxh=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();


			xjqds_gxh+=qds_gxh;
			xjzqqdje_gxh+=zqqdje_gxh;
			xjzhqdje_gxh+=zhqdje_gxh;

			zjqds_gxh+=qds_gxh;
			zjzqqdje_gxh+=zqqdje_gxh;
			zjzhqdje_gxh+=zhqdje_gxh;


			//�˵�
			int tds_gxh=0;
			double zqtdje_gxh=0;
			double zhtdje_gxh=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='1'";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tds_gxh=rs1.getInt(1);
				zqtdje_gxh=rs1.getDouble(2);
				zhtdje_gxh=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			xjtds_gxh+=tds_gxh;
			xjzqtdje_gxh+=zqtdje_gxh;
			xjzhtdje_gxh+=zhtdje_gxh;

			zjtds_gxh+=tds_gxh;
			zjzqtdje_gxh+=zqtdje_gxh;
			zjzhtdje_gxh+=zhtdje_gxh;


			//�ײ�ʩ����ͬ
			int qds_tc=0;
			double zqqdje_tc=0;
			double zhqdje_tc=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='2'";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qds_tc=rs1.getInt(1);
				zqqdje_tc=rs1.getDouble(2);
				zhqdje_tc=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			xjqds_tc+=qds_tc;
			xjzqqdje_tc+=zqqdje_tc;
			xjzhqdje_tc+=zhqdje_tc;

			zjqds_tc+=qds_tc;
			zjzqqdje_tc+=zqqdje_tc;
			zjzhqdje_tc+=zhqdje_tc;

			//�˵�
			int tds_tc=0;
			double zqtdje_tc=0;
			double zhtdje_tc=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='2'";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tds_tc=rs1.getInt(1);
				zqtdje_tc=rs1.getDouble(2);
				zhtdje_tc=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			xjtds_tc+=tds_tc;
			xjzqtdje_tc+=zqtdje_tc;
			xjzhtdje_tc+=zhtdje_tc;

			zjtds_tc+=tds_tc;
			zjzqtdje_tc+=zqtdje_tc;
			zjzhtdje_tc+=zhtdje_tc;

			//���ɡ�ɢ��
			double jc_qye=0;

			ls_sql =" SELECT sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt not in('98','99')";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx in('9','E')";//1������Ʒ��4���п�涩����5����׼�ײͣ�9���������ġ�C:ѡ�����ģ�D���ײ������ģ�E��ɢ��
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jc_qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjjc_qye+=jc_qye;
			zjjc_qye+=jc_qye;

			//ѡ��
			double xp_qye=0;

			ls_sql =" SELECT sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt not in('98','99')";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx in('C')";//1������Ʒ��4���п�涩����5����׼�ײͣ�9���������ġ�C:ѡ�����ģ�D���ײ������ģ�E��ɢ��
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xp_qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjxp_qye+=xp_qye;
			zjxp_qye+=xp_qye;


			//����
			double qt_qye=0;

			ls_sql =" SELECT sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt not in('98','99')";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx not in('9','E','C')";//1������Ʒ��4���п�涩����5����׼�ײͣ�9���������ġ�C:ѡ�����ģ�D���ײ������ģ�E��ɢ��
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qt_qye=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjqt_qye+=qt_qye;
			zjqt_qye+=qt_qye;

			//����ͳ�ƣ�������������������������������������


			//����ͳ�ƣ�����������������������������������ʼ

			//��ƺ�ͬ-��ͬ���
			//��ƺ�ͬ-ʵ�ս��
			int sjhtsl_nian=0;
			double sjhtje_nian=0;
			ls_sql=" SELECT count(*),sum(sjhtje) ";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdm='"+getdwbh+"'";
			ls_sql+=" and qsjhtbz='Y'";
			ls_sql+=" and qsjhtsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sjhtsl_nian=rs1.getInt(1);
				sjhtje_nian=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			double sssjf_nian=0;
			ls_sql=" SELECT sum(fkje) ";
			ls_sql+=" FROM cw_khfkjl";
			ls_sql+=" where dwbh='"+getdwbh+"'";
			ls_sql+=" and scbz='N' and fklxbm='53'";//53����Ʒ�
			ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1�������տ2���ǲ�����տ�
			ls_sql+=" and sjsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sssjf_nian=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			xjsjhtsl_nian+=sjhtsl_nian;
			xjsjhtje_nian+=sjhtje_nian;

			zjsjhtsl_nian+=sjhtsl_nian;
			zjsjhtje_nian+=sjhtje_nian;

			xjsssjf_nian+=sssjf_nian;
			zjsssjf_nian+=sssjf_nian;

			//���Ի�ʩ����ͬ
			int qds_gxh_nian=0;
			double zqqdje_gxh_nian=0;
			double zhqdje_gxh_nian=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='1'";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qds_gxh_nian=rs1.getInt(1);
				zqqdje_gxh_nian=rs1.getDouble(2);
				zhqdje_gxh_nian=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();


			xjqds_gxh_nian+=qds_gxh_nian;
			xjzqqdje_gxh_nian+=zqqdje_gxh_nian;
			xjzhqdje_gxh_nian+=zhqdje_gxh_nian;

			zjqds_gxh_nian+=qds_gxh_nian;
			zjzqqdje_gxh_nian+=zqqdje_gxh_nian;
			zjzhqdje_gxh_nian+=zhqdje_gxh_nian;



			int tds_gxh_nian=0;
			double zqtdje_gxh_nian=0;
			double zhtdje_gxh_nian=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='1'";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tds_gxh_nian=rs1.getInt(1);
				zqtdje_gxh_nian=rs1.getDouble(2);
				zhtdje_gxh_nian=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			xjtds_gxh_nian+=tds_gxh_nian;
			xjzqtdje_gxh_nian+=zqtdje_gxh_nian;
			xjzhtdje_gxh_nian+=zhtdje_gxh_nian;

			zjtds_gxh_nian+=tds_gxh_nian;
			zjzqtdje_gxh_nian+=zqtdje_gxh_nian;
			zjzhtdje_gxh_nian+=zhtdje_gxh_nian;


			//�ײ�ʩ����ͬ
			int qds_tc_nian=0;
			double zqqdje_tc_nian=0;
			double zhqdje_tc_nian=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='2'";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qds_tc_nian=rs1.getInt(1);
				zqqdje_tc_nian=rs1.getDouble(2);
				zhqdje_tc_nian=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			xjqds_tc_nian+=qds_tc_nian;
			xjzqqdje_tc_nian+=zqqdje_tc_nian;
			xjzhqdje_tc_nian+=zhqdje_tc_nian;

			zjqds_tc_nian+=qds_tc_nian;
			zjzqqdje_tc_nian+=zqqdje_tc_nian;
			zjzhqdje_tc_nian+=zhqdje_tc_nian;


			int tds_tc_nian=0;
			double zqtdje_tc_nian=0;
			double zhtdje_tc_nian=0;
			ls_sql=" SELECT count(*),sum(wdzgce),sum(qye)";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
			ls_sql+=" and bdm_bjjbbm.lx='2'";
			ls_sql+=" and crm_khxx.zt='3'";//3���˵��ͻ�
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and yjjzsj is not null ";
			ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tds_tc_nian=rs1.getInt(1);
				zqtdje_tc_nian=rs1.getDouble(2);
				zhtdje_tc_nian=rs1.getDouble(3);
			}
			rs1.close();
			ps1.close();

			xjtds_tc_nian+=tds_tc_nian;
			xjzqtdje_tc_nian+=zqtdje_tc_nian;
			xjzhtdje_tc_nian+=zhtdje_tc_nian;

			zjtds_tc_nian+=tds_tc_nian;
			zjzqtdje_tc_nian+=zqtdje_tc_nian;
			zjzhtdje_tc_nian+=zhtdje_tc_nian;

			//���ɡ�ɢ��
			double jc_qye_nian=0;

			ls_sql =" SELECT sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt not in('98','99')";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx in('9','E')";//1������Ʒ��4���п�涩����5����׼�ײͣ�9���������ġ�C:ѡ�����ģ�D���ײ������ģ�E��ɢ��
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jc_qye_nian=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjjc_qye_nian+=jc_qye_nian;
			zjjc_qye_nian+=jc_qye_nian;

			//ѡ��
			double xp_qye_nian=0;

			ls_sql =" SELECT sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt not in('98','99')";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx in('C')";//1������Ʒ��4���п�涩����5����׼�ײͣ�9���������ġ�C:ѡ�����ģ�D���ײ������ģ�E��ɢ��
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				xp_qye_nian=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjxp_qye_nian+=xp_qye_nian;
			zjxp_qye_nian+=xp_qye_nian;

			//����
			double qt_qye_nian=0;

			ls_sql =" SELECT sum(hkze) hkze";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where jc_zcdd.clzt>='11' and jc_zcdd.clzt not in('98','99')";
			ls_sql+=" and jc_zcdd.ddqrsj>=TO_DATE('"+sjfwNian+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.ddqrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.qddm='"+getdwbh+"'";
			ls_sql+=" and jc_zcdd.ddlx not in('9','E','C')";//1������Ʒ��4���п�涩����5����׼�ײͣ�9���������ġ�C:ѡ�����ģ�D���ײ������ģ�E��ɢ��
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				qt_qye_nian=rs1.getDouble("hkze");
			}
			rs1.close();
			ps1.close();

			xjqt_qye_nian+=qt_qye_nian;
			zjqt_qye_nian+=qt_qye_nian;

			//����ͳ�ƣ�������������������������������������

			double yuezcpb=0;
			if ((zhqdje_gxh-zhtdje_gxh)==0)
			{
				yuezcpb=0;
			}
			else{
				yuezcpb=cf.round(jc_qye*100/(zhqdje_gxh-zhtdje_gxh),2);
			}
			double nianzcpb=0;
			if ((zhqdje_gxh_nian-zhtdje_gxh_nian)==0)
			{
				nianzcpb=0;
			}
			else{
				nianzcpb=cf.round(jc_qye_nian*100/(zhqdje_gxh_nian-zhtdje_gxh_nian),2);
			}

			
			%>
			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td rowspan="2"><%=row%></td>
				<td rowspan="2"><%=dmmc%></td>

				<td>����</td>

				<td>
				<A HREF="ViewDmSjfMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
				<%=sjhtsl%></A></td>
				<td><%=cf.formatDouble(sjhtje)%></td>
				<td><%=cf.formatDouble(sssjf)%></td>

				<td bgcolor="#CCFFFF">
				<A HREF="ViewDmGxhYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=qds_gxh%></A></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zqqdje_gxh)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zhqdje_gxh)%></td>
				
				<td bgcolor="#CCFFFF">
				<A HREF="ViewDmGxhYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=-1*tds_gxh%></A></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zqtdje_gxh)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zhtdje_gxh)%></td>

				
				<td>
				<A HREF="ViewDmTcYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=qds_tc%></A></td>
				<td><%=cf.formatDouble(zqqdje_tc)%></td>
				<td><%=cf.formatDouble(zhqdje_tc)%></td>

				<td>
				<A HREF="ViewDmTcYjMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=-1*tds_tc%></A></td>
				<td><%=cf.formatDouble(-1*zqtdje_tc)%></td>
				<td><%=cf.formatDouble(-1*zhtdje_tc)%></td>


				<td bgcolor="#CCFFFF"><%=(qds_gxh-tds_gxh+qds_tc-tds_tc)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zqqdje_gxh-zqtdje_gxh+zqqdje_tc-zqtdje_tc)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zhqdje_gxh-zhtdje_gxh+zhqdje_tc-zhtdje_tc)%></td>


				<td>
				<A HREF="ViewDmJcMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(jc_qye)%></A></td>
				<td>
				<A HREF="ViewDmXpMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(xp_qye)%></A></td>
				<td><%=qt_qye%></td>
				<td><%=cf.formatDouble(jc_qye+xp_qye+qt_qye)%></td>
				<td><%=yuezcpb%>%</td>
				
				<td bgcolor="#CCFFFF"><%=(qds_gxh-tds_gxh+qds_tc-tds_tc)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zhqdje_gxh-zhtdje_gxh+zhqdje_tc-zhtdje_tc+(jc_qye+xp_qye+qt_qye)+sssjf)%></td>
			</tr>

			<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td>����</td>
				<td>
				<A HREF="ViewDmSjfMx.jsp?sjfw=<%=sjfwNian%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
				<%=sjhtsl_nian%></A></td>
				<td><%=cf.formatDouble(sjhtje_nian)%></td>
				<td><%=cf.formatDouble(sssjf_nian)%></td>

				<td bgcolor="#CCFFFF">
				<A HREF="ViewDmGxhYjMx.jsp?sjfw=<%=sjfwNian%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=qds_gxh_nian%></A></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zqqdje_gxh_nian)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zhqdje_gxh_nian)%></td>
				<td bgcolor="#CCFFFF">
				<A HREF="ViewDmGxhYjMx.jsp?sjfw=<%=sjfwNian%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=-1*tds_gxh_nian%></A></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zqtdje_gxh_nian)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zhtdje_gxh_nian)%></td>

				
				<td>
				<A HREF="ViewDmTcYjMx.jsp?sjfw=<%=sjfwNian%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=qds_tc%></A></td>
				<td><%=cf.formatDouble(zqqdje_tc_nian)%></td>
				<td><%=cf.formatDouble(zhqdje_tc_nian)%></td>
				<td>
				<A HREF="ViewDmTcYjMx.jsp?sjfw=<%=sjfwNian%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=-1*tds_tc_nian%></A></td>
				<td><%=cf.formatDouble(-1*zqtdje_tc_nian)%></td>
				<td><%=cf.formatDouble(-1*zhtdje_tc_nian)%></td>


				<td bgcolor="#CCFFFF"><%=(qds_gxh_nian-tds_gxh_nian+qds_tc_nian-tds_tc_nian)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zqqdje_gxh_nian-zqtdje_gxh_nian+zqqdje_tc_nian-zqtdje_tc_nian)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zhqdje_gxh_nian-zhtdje_gxh_nian+zhqdje_tc_nian-zhtdje_tc_nian)%></td>


				<td>
				<A HREF="ViewDmJcMx.jsp?sjfw=<%=sjfwNian%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(jc_qye_nian)%></A></td>
				<td>
				<A HREF="ViewDmXpMx.jsp?sjfw=<%=sjfwNian%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=cf.formatDouble(xp_qye_nian)%></A></td>
				<td><%=qt_qye_nian%></td>
				<td><%=cf.formatDouble(jc_qye_nian+xp_qye_nian+qt_qye_nian)%></td>
				<td><%=nianzcpb%>%</td>
				
				<td bgcolor="#CCFFFF"><%=(qds_gxh_nian-tds_gxh_nian+qds_tc_nian-tds_tc_nian)%></td>
				<td bgcolor="#CCFFFF"><%=cf.formatDouble(zhqdje_gxh_nian-zhtdje_gxh_nian+zhqdje_tc_nian-zhtdje_tc_nian+(jc_qye_nian+xp_qye_nian+qt_qye_nian)+sssjf_nian)%></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();


		double yuezcpb=0;
		if ((xjzhqdje_gxh-xjzhtdje_gxh)==0)
		{
			yuezcpb=0;
		}
		else{
			yuezcpb=cf.round(xjjc_qye*100/(xjzhqdje_gxh-xjzhtdje_gxh),2);
		}
		double nianzcpb=0;
		if ((xjzhqdje_gxh_nian-xjzhtdje_gxh_nian)==0)
		{
			nianzcpb=0;
		}
		else{
			nianzcpb=cf.round(xjjc_qye_nian*100/(xjzhqdje_gxh_nian-xjzhtdje_gxh_nian),2);
		}

		%>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td rowspan="2" colspan="2"><strong><font color="#ff0000">[<%=fgsmc%>]С��</strong></td>

			<td>����</td>

			<td><%=xjsjhtsl%></td>
			<td><%=cf.formatDouble(xjsjhtje)%></td>
			<td><%=cf.formatDouble(xjsssjf)%></td>

			<td bgcolor="#CCFFFF"><%=xjqds_gxh%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzqqdje_gxh)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzhqdje_gxh)%></td>
			<td bgcolor="#CCFFFF"><%=-1*xjtds_gxh%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*xjzqtdje_gxh)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*xjzhtdje_gxh)%></td>

			
			<td><%=xjqds_tc%></td>
			<td><%=cf.formatDouble(xjzqqdje_tc)%></td>
			<td><%=cf.formatDouble(xjzhqdje_tc)%></td>
			<td><%=(-1*xjtds_tc)%></td>
			<td><%=cf.formatDouble(-1*xjzqtdje_tc)%></td>
			<td><%=cf.formatDouble(-1*xjzhtdje_tc)%></td>


			<td bgcolor="#CCFFFF"><%=(xjqds_gxh-xjtds_gxh+xjqds_tc-xjtds_tc)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzqqdje_gxh-xjzqtdje_gxh+xjzqqdje_tc-xjzqtdje_tc)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzhqdje_gxh-xjzhtdje_gxh+xjzhqdje_tc-xjzhtdje_tc)%></td>


			<td><%=cf.formatDouble(xjjc_qye)%></td>
			<td><%=cf.formatDouble(xjxp_qye)%></td>
			<td><%=cf.formatDouble(xjqt_qye)%></td>
			<td><%=cf.formatDouble(xjjc_qye+xjxp_qye+xjqt_qye)%></td>
			<td><%=yuezcpb%>%</td>
			
			<td bgcolor="#CCFFFF"><%=(xjqds_gxh-xjtds_gxh+xjqds_tc-xjtds_tc)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzhqdje_gxh-xjzhtdje_gxh+xjzhqdje_tc-xjzhtdje_tc+(xjjc_qye+xjxp_qye+xjqt_qye)+xjsssjf)%></td>
		</tr>
		<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">

			<td>����</td>

			<td><%=xjsjhtsl_nian%></td>
			<td><%=cf.formatDouble(xjsjhtje_nian)%></td>
			<td><%=cf.formatDouble(xjsssjf_nian)%></td>

			<td bgcolor="#CCFFFF"><%=xjqds_gxh%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzqqdje_gxh_nian)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzhqdje_gxh_nian)%></td>
			<td bgcolor="#CCFFFF"><%=-1*xjtds_gxh_nian%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*xjzqtdje_gxh_nian)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*xjzhtdje_gxh_nian)%></td>

			
			<td><%=xjqds_tc%></td>
			<td><%=cf.formatDouble(xjzqqdje_tc_nian)%></td>
			<td><%=cf.formatDouble(xjzhqdje_tc_nian)%></td>
			<td><%=-1*xjtds_tc_nian%></td>
			<td><%=cf.formatDouble(-1*xjzqtdje_tc_nian)%></td>
			<td><%=cf.formatDouble(-1*xjzhtdje_tc_nian)%></td>


			<td bgcolor="#CCFFFF"><%=(xjqds_gxh_nian-xjtds_gxh_nian+xjqds_tc_nian-xjtds_tc_nian)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzqqdje_gxh_nian-xjzqtdje_gxh_nian+xjzqqdje_tc_nian-xjzqtdje_tc_nian)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzhqdje_gxh_nian-xjzhtdje_gxh_nian+xjzhqdje_tc_nian-xjzhtdje_tc_nian)%></td>


			<td><%=cf.formatDouble(xjjc_qye_nian)%></td>
			<td><%=cf.formatDouble(xjxp_qye_nian)%></td>
			<td><%=cf.formatDouble(xjqt_qye_nian)%></td>
			<td><%=cf.formatDouble(xjjc_qye_nian+xjxp_qye_nian+xjqt_qye_nian)%></td>
			<td><%=nianzcpb%>%</td>
			
			<td bgcolor="#CCFFFF"><%=(xjqds_gxh_nian-xjtds_gxh_nian+xjqds_tc_nian-xjtds_tc_nian)%></td>
			<td bgcolor="#CCFFFF"><%=cf.formatDouble(xjzhqdje_gxh_nian-xjzhtdje_gxh_nian+xjzhqdje_tc_nian-xjzhtdje_tc_nian+(xjjc_qye_nian+xjxp_qye_nian+xjqt_qye_nian)+xjsssjf_nian)%></td>
		</tr>
		<%
	}
	rs2.close();
	ps2.close();

		
		

	double yuezcpb=0;
	if ((zjzhqdje_gxh-zjzhtdje_gxh)==0)
	{
		yuezcpb=0;
	}
	else{
		yuezcpb=cf.round(zjjc_qye*100/(zjzhqdje_gxh-zjzhtdje_gxh),2);
	}
	double nianzcpb=0;
	if ((zjzhqdje_gxh_nian-zjzhtdje_gxh_nian)==0)
	{
		nianzcpb=0;
	}
	else{
		nianzcpb=cf.round(zjjc_qye_nian*100/(zjzhqdje_gxh_nian-zjzhtdje_gxh_nian),2);
	}
		

%>
<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td rowspan="2" colspan="2"><strong><font color="#ff0000">�� ��</strong></td>

	<td>����</td>

	<td><%=zjsjhtsl%></td>
	<td><%=cf.formatDouble(zjsjhtje)%></td>
	<td><%=cf.formatDouble(zjsssjf)%></td>

	<td bgcolor="#CCFFFF"><%=zjqds_gxh%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzqqdje_gxh)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzhqdje_gxh)%></td>
	<td bgcolor="#CCFFFF"><%=-1*zjtds_gxh%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zjzqtdje_gxh)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zjzhtdje_gxh)%></td>

	
	<td><%=zjqds_tc%></td>
	<td><%=cf.formatDouble(zjzqqdje_tc)%></td>
	<td><%=cf.formatDouble(zjzhqdje_tc)%></td>
	<td><%=-1*zjtds_tc%></td>
	<td><%=cf.formatDouble(-1*zjzqtdje_tc)%></td>
	<td><%=cf.formatDouble(-1*zjzhtdje_tc)%></td>


	<td bgcolor="#CCFFFF"><%=(zjqds_gxh-zjtds_gxh+zjqds_tc-zjtds_tc)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzqqdje_gxh-zjzqtdje_gxh+zjzqqdje_tc-zjzqtdje_tc)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzhqdje_gxh-zjzhtdje_gxh+zjzhqdje_tc-zjzhtdje_tc)%></td>


	<td><%=cf.formatDouble(zjjc_qye)%></td>
	<td><%=cf.formatDouble(zjxp_qye)%></td>
	<td><%=cf.formatDouble(zjqt_qye)%></td>
	<td><%=cf.formatDouble(zjjc_qye+zjxp_qye+zjqt_qye)%></td>
	<td><%=yuezcpb%>%</td>
	
	<td bgcolor="#CCFFFF"><%=(zjqds_gxh-zjtds_gxh+zjqds_tc-zjtds_tc)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzhqdje_gxh-zjzhtdje_gxh+zjzhqdje_tc-zjzhtdje_tc+(zjjc_qye+zjxp_qye+zjqt_qye)+zjsssjf)%></td>
</tr>
<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">

	<td>����</td>

	<td><%=zjsjhtsl_nian%></td>
	<td><%=cf.formatDouble(zjsjhtje_nian)%></td>
	<td><%=cf.formatDouble(zjsssjf_nian)%></td>

	<td bgcolor="#CCFFFF"><%=zjqds_gxh_nian%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzqqdje_gxh_nian)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzhqdje_gxh_nian)%></td>
	<td bgcolor="#CCFFFF"><%=-1*zjtds_gxh_nian%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zjzqtdje_gxh_nian)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(-1*zjzhtdje_gxh_nian)%></td>

	
	<td><%=zjqds_tc_nian%></td>
	<td><%=cf.formatDouble(zjzqqdje_tc_nian)%></td>
	<td><%=cf.formatDouble(zjzhqdje_tc_nian)%></td>
	<td><%=-1*zjtds_tc_nian%></td>
	<td><%=cf.formatDouble(-1*zjzqtdje_tc_nian)%></td>
	<td><%=cf.formatDouble(-1*zjzhtdje_tc_nian)%></td>


	<td bgcolor="#CCFFFF"><%=(zjqds_gxh_nian-zjtds_gxh_nian+zjqds_tc_nian-zjtds_tc_nian)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzqqdje_gxh_nian-zjzqtdje_gxh_nian+zjzqqdje_tc_nian-zjzqtdje_tc_nian)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzhqdje_gxh_nian-zjzhtdje_gxh_nian+zjzhqdje_tc_nian-zjzhtdje_tc_nian)%></td>


	<td><%=cf.formatDouble(zjjc_qye_nian)%></td>
	<td><%=cf.formatDouble(zjxp_qye_nian)%></td>
	<td><%=cf.formatDouble(zjqt_qye_nian)%></td>
	<td><%=cf.formatDouble(zjjc_qye_nian+zjxp_qye_nian+zjqt_qye_nian)%></td>
	<td><%=nianzcpb%>%</td>
	
	<td bgcolor="#CCFFFF"><%=(zjqds_gxh_nian-zjtds_gxh_nian+zjqds_tc_nian-zjtds_tc_nian)%></td>
	<td bgcolor="#CCFFFF"><%=cf.formatDouble(zjzhqdje_gxh_nian-zjzhtdje_gxh_nian+zjzhqdje_tc_nian-zjzhtdje_tc_nian+(zjjc_qye_nian+zjxp_qye_nian+zjqt_qye_nian)+zjsssjf_nian)%></td>
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