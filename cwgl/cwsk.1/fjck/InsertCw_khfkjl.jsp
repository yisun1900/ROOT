<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
String yhmc=(String)session.getAttribute("yhmc");
String skdw=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
int count=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String qye=null;
String hth=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String zjxm=null;
String qyrq=null;
String jgrq=null;
String zt=null;

String sjsbh=null;
String fgsbh=null;
String gcjdmc=null;
String ztmc=null;

String cxhdbm="";
String sffj="";
double fjje=0;
double gsfje=0;
String sfyrz="";
String rzsc="";
String sfyyh="";
String yhyy="";

double kglf=0;
double kqtk=0;
double gckk=0;
double glf=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
String fkxh="";

String zcmmbz="";//�����տ���


String fklxbm="23";
String gysstr="";

try {
	conn=cf.getConnection();

	ls_sql="select DECODE(zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','�Ǽ�װ�ͻ�','5','��ƿͻ�') ztmc,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy ,kqtk,kglf,gckk ,glf,gcjdmc,khxm,fwdz,lxfs,sjs,qye,hth,dwbh,sgd,sgbz,qyrq,jgrq,zjxm,zt,fgsbh,sjsbh";
	ls_sql+=" from  crm_khxx,dm_gcjdbm";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckk=rs.getDouble("gckk");

		glf=rs.getDouble("glf");

		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		hth=cf.fillNull(rs.getString("hth"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zt=cf.fillNull(rs.getString("zt"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
	}
	rs.close();
	ps.close();

	if (zt.equals("2"))//2����װ�ͻ���3����װ���˵� ��4���Ǽ�װ�ͻ�
	{
		if (fgsbh.equals(""))
		{
			out.println("<font color=\"#FF0000\">���������ֹ�˾Ϊ��</font>");
			return;
		}
		if (dwbh.equals(""))
		{
			out.println("<font color=\"#FF0000\">������������Ϊ��</font>");
			return;
		}

	}




	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�ʼ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select zcmmbz ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
	}
	rs.close();
	ps.close();


	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int fkjsq=count;
	while (true)
	{
		fkjsq++;
		fkxh=khbh+cf.addZero(fkjsq,3);

		ls_sql="select count(*) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where fkxh='"+fkxh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			break;
		}
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
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
		%>
		<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="7%">�տ����</td>
			<td  width="14%" colspan="2">�տ�����</td>
			<td  width="9%" bgcolor="#CCCCCC">�տ�Ʒ��</td>
			<td  width="7%" bgcolor="#CCCCCC">�տ�����</td>
			<td  width="7%" bgcolor="#CCCCCC">�տ���������</td>
			<td  width="8%">ʵ�տ���</td>
			<td  width="5%">���</td>
			<td  width="6%">֧��</td>
			<td  width="7%">ת�ʿ���</td>
			<td  width="9%">ת��Ʒ��</td>
			<td  width="7%">ת�ʶ������</td>
			<td  width="7%">ת����������</td>
			<td  width="7%">�տ�ʱ��</td>
		</tr>
		<%
		String getfkxh=null;
		String fklxmc=null;
		String getfkcsmc=null;
		String getgysbh=null;
		String getddbh=null;
		String getzjxbh=null;
		double getfkje=0;
		double xjfkje=0;
		double zjfkje=0;
		String skdd=null;
		String zffsmc=null;
		String getzckx=null;
		String getzcgysbh=null;
		String getzcddbh=null;
		String getzczjxbh=null;
		String getsksj=null;

		String getddlxmc="";

		String oldfklxmc="";

		ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,cw_khfkjl.fkje,DECODE(skdd,'1','����','2','�����') skdd";
		ls_sql+=" ,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,cw_khfkjl.sksj";
		ls_sql+=" ,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������') ddlxmc";
		ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs,jc_zcdd  ";
		ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
		ls_sql+=" and cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
		ls_sql+=" order by cw_khfkjl.fklxbm,jc_zcdd.ddlx,gysbh,fkxh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getddlxmc=cf.fillHtml(rs.getString("ddlxmc"));
			getfkxh=rs.getString("fkxh");
			fklxmc=cf.fillHtml(rs.getString("fklxmc"));
			getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
			getgysbh=cf.fillHtml(rs.getString("gysbh"));
			getddbh=cf.fillHtml(rs.getString("ddbh"));
			getzjxbh=cf.fillHtml(rs.getString("zjxbh"));
			getfkje=rs.getDouble("fkje");
			skdd=cf.fillHtml(rs.getString("skdd"));
			zffsmc=cf.fillHtml(rs.getString("zffsmc"));
			getzckx=cf.fillHtml(rs.getString("zckx"));
			getzcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
			getzcddbh=cf.fillHtml(rs.getString("zcddbh"));
			getzczjxbh=cf.fillHtml(rs.getString("zczjxbh"));
			getsksj=cf.fillHtml(rs.getDate("sksj"));

			if (getfkcsmc.equals("&nbsp;"))
			{
				getfkcsmc=getddlxmc;
			}

			if (!oldfklxmc.equals(fklxmc))
			{
				if (!oldfklxmc.equals(""))
				{
					%>
					<tr bgcolor="#FFFFFF"  align="center">
						<td colspan='2'><B><<%=oldfklxmc%>>С��</B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<%
				}

				oldfklxmc=fklxmc;
				xjfkje=0;
			}

			xjfkje+=getfkje;
			zjfkje+=getfkje;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=getfkxh%>"><%=getfkxh%></A></td>
				<td><%=fklxmc%></td>
				<td><%=getfkcsmc%></td>
				<td><%=getgysbh%></td>
				<td><%=getddbh%></td>
				<td><%=getzjxbh%></td>
				<td align="right"><%=cf.formatDouble(getfkje)%></td>
				<td><%=skdd%></td>
				<td><%=zffsmc%></td>
				<td><%=getzckx%></td>
				<td><%=getzcgysbh%></td>
				<td><%=getzcddbh%></td>
				<td><%=getzczjxbh%></td>
				<td><%=getsksj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='2'><B><<%=fklxmc%>>С��</B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='5'><B>�� ��</B></td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		</table>
		<%
	}


	if (zcmmbz.equals("Y"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
	{
		String ddbh=null;
		String gysmc=null;
		double ddje=0;
		double zcfk=0;
		String ls="";
		String ddlx=null;
		String ddlxmc=null;
		ls_sql=" SELECT ddbh,ppbm,jc_zcdd.ddlx,hkze,sskje";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.hkze!=0";
		ls_sql+=" and jc_zcdd.clzt not in('98','99')";
		ls_sql+=" and (jc_zcdd.sfjrht is null OR jc_zcdd.sfjrht='N')";//�Ƿ�����װ��ͬ  Y�����룻N��������
		ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.zctclx,ppbm,ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=rs.getString("ddbh");
			gysmc=rs.getString("ppbm");
			ddlx=cf.fillNull(rs.getString("ddlx"));
			ddje=rs.getDouble("hkze");
			zcfk=rs.getDouble("sskje");

			//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�
			//9���������ģ�A:����������B:��������շѡ�C:ѡ������
			if (ddlx.equals("1"))
			{
				ddlxmc="����Ʒ";
			}
			else if (ddlx.equals("3"))
			{
				ddlxmc="��¼��ͬ";
			}
			else if (ddlx.equals("4"))
			{
				ddlxmc="�п�涩��";
			}
			else if (ddlx.equals("5"))
			{
				ddlxmc="��׼�ײ�";
			}
			else if (ddlx.equals("9"))
			{
				ddlxmc="��������";
			}
			else if (ddlx.equals("A"))
			{
				ddlxmc="��������";
			}
			else if (ddlx.equals("B"))
			{
				ddlxmc="��������շ�";
			}
			else if (ddlx.equals("C"))
			{
				ddlxmc="ѡ������";
			}
			else if (ddlx.equals("D"))
			{
				ddlxmc="�ײ�������";
			}
			else if (ddlx.equals("E"))
			{
				ddlxmc="ɢ��";
			}
			else
			{
				ddlxmc="�����ײ�";
			}


			gysstr+="<option value='"+gysmc+"*"+ddbh+"'>"+ddlxmc+"��"+gysmc+"������:"+ddbh+"����Ӧ����"+cf.round(ddje-zcfk,2)+"����������"+ddje+"���Ѹ���"+zcfk+"��"+"</option>";
		}
		rs.close();
		ps.close();

		String zjxbh=null;
		ls_sql=" SELECT jc_zczjx.zjxbh,jc_zczjx.ddbh,jc_zczjx.ppbm,jc_zcdd.ddlx,jc_zczjx.zjxze,jc_zczjx.sskje";
		ls_sql+=" FROM jc_zczjx,jc_zcdd";
		ls_sql+=" where jc_zczjx.ddbh=jc_zcdd.ddbh";
		ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";
		ls_sql+=" and jc_zczjx.zjxze!=0";
		ls_sql+=" and jc_zczjx.clzt not in('00','99')";
		ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.zctclx,ppbm,ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			zjxbh=rs.getString("zjxbh");
			ddbh=rs.getString("ddbh");
			gysmc=rs.getString("ppbm");
			ddlx=cf.fillNull(rs.getString("ddlx"));
			ddje=rs.getDouble("zjxze");
			zcfk=rs.getDouble("sskje");

			//1������Ʒ��3����¼��ͬ��4���п�涩����5����׼�ײͣ�6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�
			//9���������ģ�A:����������B:��������շѡ�C:ѡ������
			if (ddlx.equals("1"))
			{
				ddlxmc="����Ʒ";
			}
			else if (ddlx.equals("3"))
			{
				ddlxmc="��¼��ͬ";
			}
			else if (ddlx.equals("4"))
			{
				ddlxmc="�п�涩��";
			}
			else if (ddlx.equals("5"))
			{
				ddlxmc="��׼�ײ�";
			}
			else if (ddlx.equals("9"))
			{
				ddlxmc="��������";
			}
			else if (ddlx.equals("A"))
			{
				ddlxmc="��������";
			}
			else if (ddlx.equals("B"))
			{
				ddlxmc="��������շ�";
			}
			else if (ddlx.equals("C"))
			{
				ddlxmc="ѡ������";
			}
			else if (ddlx.equals("D"))
			{
				ddlxmc="�ײ�������";
			}
			else if (ddlx.equals("E"))
			{
				ddlxmc="ɢ��";
			}
			else
			{
				ddlxmc="�����ײ�";
			}


			gysstr+="<option value='"+gysmc+"*"+ddbh+"*"+zjxbh+"'>"+ddlxmc+"��"+gysmc+"������:"+zjxbh+"����Ӧ����"+cf.round(ddje-zcfk,2)+"����������"+ddje+"���Ѹ���"+zcfk+"��"+"</option>";
		}
		rs.close();
		ps.close();

	}
	else if (zcmmbz.equals("N"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
	{
		String gysmc=null;
		String ls="";

		ls="";

		ls_sql="select distinct jxc_ppgysdzb.ppmc ";
		ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
		ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+fgsbh+"' ";
		ls_sql+=" order  by jxc_ppgysdzb.ppmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			gysmc=rs.getString("ppmc");

			gysstr+="<option value='"+gysmc+"'>"+gysmc+"</option>";

		}
		rs.close();
		ps.close();

	}
	//�տ�Ʒ��----------------------------

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
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

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">������</td>
	<td  width="11%">����״̬</td>
	<td  width="11%">����</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="6%">�Ҿӹ���</td>
	<td  width="12%">Ʒ��</td>
	<td  width="9%">��ͬ���</td>
	<td  width="9%">ʵ�տ���</td>
	<td  width="9%">Ƿ��</td>
	<td  width="9%">¼��ʱ��</td>
	</tr>
<%
//������Ϣ

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql=" SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������','E','ɢ��'),jc_zcdd.xmzy,jc_zcdd.clgw,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.sskje,jc_zcdd.hkze-jc_zcdd.sskje,jc_zcdd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,jdm_zcdlbm,jdm_zcddzt ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh";
	ls_sql+=" and jc_zcdd.zcdlbm=jdm_zcdlbm.zcdlbm(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" and jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt not in('98','99')";
	ls_sql+=" and (jc_zcdd.hkze!=0 OR jc_zcdd.zjhze!=0)";
	ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.ppbm,jc_zcdd.ddbh";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


	ls_sql="SELECT jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','¼��δ���','01','¼�������','02','��ȷ��','03','���ͻ�','99','�˵�'),DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������','E','ɢ��'),jc_zczjx.xmzy,jc_zczjx.clgw,jc_zczjx.ppbm,jc_zczjx.zjxze,jc_zczjx.sskje,jc_zczjx.zjxze-jc_zczjx.sskje,jc_zczjx.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zczjx,jc_zcdd";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh";
	ls_sql+=" and jc_zczjx.ddbh=jc_zcdd.ddbh";
	ls_sql+=" and jc_zczjx.khbh='"+khbh+"'";
	ls_sql+=" and jc_zczjx.clzt not in('00','99')";
	ls_sql+=" order by jc_zczjx.lrsj desc,jc_zczjx.zjxbh";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">�ռ��ɿ�տ���ţ�<%=fkxh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">�ͻ����</td>
              <td width="33%"><%=khbh%>��<%=ztmc%>��</td>
              <td width="18%" align="right">��ͬ��</td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"> 
                ���ݵ�ַ              </td>
              <td width="33%"> <%=fwdz%></td>
              <td width="18%" align="right"> 
                �ͻ�����              </td>
              <td width="32%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"> 
                ǩԼ����              </td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td bgcolor="#E8E8FF" align="right" width="18%">���ʦ</td>
              <td width="32%"> <%=sjs%>��<%=sjsdh%>�� </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">ʩ���ӣ��೤��</td>
              <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>��<%=sgbz%><%=bzdh%>��</td>
              <td width="32%">�ʼ죺<%=zjxm%>��<%=zjdh%>�� </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"> 
                ǩԼ������ͬ����              </td>
              <td width="33%">[<%=qyrq%>]����[<%=jgrq%>]</td>
              <td width="18%" align="right"> 
                ���̽���              </td>
              <td width="32%"><%=gcjdmc%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">�μӴ����</td>
              <td colspan="3"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>�տ��</td>
              <td colspan="3"><select name="gysbh" style="FONT-SIZE:12PX;WIDTH:528PX" onChange="changeGysbh(insertform)">
                  <option value=""></option>
				  <%=gysstr%>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>ʵ�տ���</td>
              <td><input type="text" name="fkje" value="" size="20" maxlength="17" onChange="checkZkje(insertform)"></td>
              <td align="right"><font color="#FF0000">*</font>֧����ʽ</td>
              <td><select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">ת�ʿ���</td>
              <td width="33%"><select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZckx(insertform)">
                <option value=""></option>
                <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%>
              </select></td>
              <td width="18%" align="right">����ת���ʺ�</td>
              <td width="32%"><input name="zzyhkh" type="text" value="" size="20" maxlength="40"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">ת�ʶ���</td>
              <td colspan="3"><select name="zcgysbh" style="FONT-SIZE:12PX;WIDTH:528PX" onChange="checkZkje(insertform)">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>�տ���              </td>
              <td width="33%"> 
                <input type="text" name="skr" value="<%=yhmc%>" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�տ�ʱ��</td>
              <td width="32%"> 
                <input type="text" name="sksj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">�տλ</font>              </td>
              <td width="33%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+skdw+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right">�վݱ��</td>
              <td width="32%"><input type="text" name="sjbh" value="" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="2"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="fkxh" value="<%=fkxh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" >
                <input type="hidden" name="fkkhxm" value="<%=khxm%>" >
                <input type="hidden" name="fkfwdz" value="<%=fwdz%>" >
                <input type="hidden" name="sjs" value="<%=sjs%>" >
                <input type="hidden" name="sjsbh" value="<%=sjsbh%>" >
                <input type="hidden" name="dwbh" value="<%=dwbh%>" >
                <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
                <input type="hidden" name="lrr" value="<%=yhmc%>">
                <input type="hidden" name="lrsj" value="<%=cf.today()%>">
                <input type="hidden" name="lrdw" value="<%=skdw%>">
                <input type="hidden" name="fklxbm" value="<%=fklxbm%>">
                <input type="button" name="bc" value="����" onClick="f_do(insertform)">
                <input name="ks" type="button" onClick="f_new(insertform)"  value="¼����һ��" disabled>
                <input type="reset"  value="����" name="reset">
                <input type="button" value="�鿴�տ���Ϣ" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button" >
                <input name="pr" type="button" value="��ӡ�վ�" onClick="window.open('/cwgl/qyecx/PrintJcSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')" disabled>
                <input name="pr2" type="button" value="ѡ���ӡ" onClick="window.open('/cwgl/qyecx/PrintChooseJcSj.jsp?fkxh=<%=fkxh%>')" disabled>              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>


var lx;
var fklx;

function changeGysbh(FormName) 
{
	FormName.zcgysbh.length=1;
	FormName.zckx.value="";
}

function checkZkje(FormName) 
{
	if(FormName.fkje.value=="") 
	{
		alert("������[�տ���]��");
		FormName.fkje.focus();
		return false;
	}


	if(FormName.zckx.value=="") 
	{
		return;
	}

	if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
	{
		if(FormName.zcgysbh.value=="") 
		{
			return;
		}
	}


	lx=2;


	var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeZckx(FormName) 
{
	if(FormName.fklxbm.value=="") {

		FormName.zcgysbh.length=1;
		FormName.zckx.value="";

		alert("��ѡ��[�տ�����]��");
		FormName.fklxbm.focus();
		return false;
	}


	if(FormName.fkje.value=="") 
	{

		FormName.zcgysbh.length=1;
		FormName.zckx.value="";

		alert("������[�տ���]��");
		FormName.fkje.focus();
		return false;
	}

	if(FormName.zckx.value=="") 
	{
		return;
	}

	FormName.zcgysbh.length=1;

	if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh="+FormName.gysbh.value+"&fklxbm="+FormName.fklxbm.value;
		}
	}
	else{
		lx=2;
		var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
	}

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	ajaxRetStr=ajaxRetStr.substring(14);

	if (lx==1)
	{
		strToSelect(insertform.gysbh,ajaxRetStr);
	}
	else if (lx==2)
	{
		if (ajaxRetStr!="")
		{
			alert(ajaxRetStr);
		}
	}
	else if (lx==3)
	{
		strToSelect(insertform.zcgysbh,ajaxRetStr);
	}
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fkxh)=="") 
	{
		alert("������[�տ����]��");
		FormName.fkxh.focus();
		return false;
	}

	if(	javaTrim(FormName.fklxbm)=="") 
	{
		alert("��ѡ��[�տ�����]��");
		FormName.fklxbm.focus();
		return false;
	}

	if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
	{
		if(	javaTrim(FormName.gysbh)=="") {
			alert("��ѡ��[�տ�Ʒ��]��");
			FormName.gysbh.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.zffs)=="") {
		alert("��ѡ��[֧����ʽ]��");
		FormName.zffs.focus();
		return false;
	}


	if (FormName.zffs.value=="15")//15:����ת��
	{
		if(	javaTrim(FormName.zzyhkh)=="") {
			alert("��ѡ��[����ת���ʺ�]��");
			FormName.zzyhkh.focus();
			return false;
		}
	}
	else if (FormName.zffs.value=="31")//31��ת��
	{
		if(	javaTrim(FormName.zckx)=="") {
			alert("��ѡ��[ת�ʿ���]��");
			FormName.zckx.focus();
			return false;
		}
		if ( FormName.zckx.value=="23" )//23:���ģ�
		{
			if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת�����Ŀ����ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}

				if(FormName.gysbh.value==FormName.zcgysbh.value) {
					alert("����[�տ�Ʒ��]��[ת��Ʒ��]������ͬ��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else{
			
			if(	javaTrim(FormName.zcgysbh)!="") {
				alert("δѡ��ת�����ɿ������ѡ��[ת��Ʒ��]��");
				FormName.zcgysbh.focus();
				return false;
			}
		}
	}
	else{
		FormName.zckx.value="";
		FormName.zcgysbh.value="";
	}


	if(	javaTrim(FormName.fkje)=="") {
		alert("������[ʵ�տ���]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "ʵ�տ���"))) {
		return false;
	}

	if (parseFloat(FormName.fkje.value)==0)
	{
		alert("����[�տ���]����Ϊ0");
		FormName.fkje.select();
		return false;
	}

	if(	javaTrim(FormName.skr)=="") {
		alert("������[�տ���]��");
		FormName.skr.focus();
		return false;
	}
	if(	javaTrim(FormName.sksj)=="") {
		alert("������[�տ�ʱ��]��");
		FormName.sksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sksj, "�տ�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.skdw)=="") {
		alert("��ѡ��[�տλ]��");
		FormName.skdw.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrdw)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.lrdw.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveInsertCw_khfkjl.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	FormName.ks.disabled=false;
	FormName.pr.disabled=false;
	FormName.pr2.disabled=false;
	return true;
}
function f_new(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCw_khfkjl.jsp";
	FormName.target="";
	FormName.submit();

	FormName.bc.disabled=false;
	FormName.ks.disabled=true;
	return true;
}
//-->
</SCRIPT>
