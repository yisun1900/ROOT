<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sjbh=null;
String fklxbm=null;
double fkje=0;
String jkr=null;
String skr=null;
String sksj=null;
String skdw=null;
String lrr=null;
String lrsj=null;
String shbz=null;
String bz=null;
String zffs=null;
String zckx=null;
String lrdw=null;
String fkcs=null;
double yfkbl=0;
double yfkje=0;
String zcgysbh=null;
String zcddbh=null;
String zczjxbh=null;
String glxh=null;
String gljlbz=null;
String zzyhkh=null;





String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double sfke=0;
double zjxssk=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;
double zkl=0;
double gckk=0;
double suijin=0;
double suijinbfb=0;
double zjxsuijin=0;
double guanlif=0;
double zjxguanlif=0;
double zhwjrqyexm=0;
String wjrqyexmsm=null;

String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String sjfkzc=null;
String zjxwcbz=null;
String gcjdmc=null;
String gckkspbz=null;
String fkcsmc=null;
String ztmc=null;

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String sfyyh=null;
String yhyy=null;
double scfjk=0;
double jxglf=0;
double rzf=0;
String jzwkqs="";

double zqsuijin=0;
double zqzjxsuijin=0;
double zqguanlif=0;
double zqzjxguanlif=0;
double zqgczjf=0;
double zhgczjf=0;
double zqljzjx=0;
double zhljzjx=0;
double zqqtsf=0;
double zhqtsf=0;
double zqwjrqyexm=0;
double zqqtsfzjx=0;
double zhqtsfzjx=0;
double zqwjrzjx=0;
double zhwjrzjx=0;

double getsfke=0;

String yjjzsj=null;

String dsksjbz=null;
String sjr=null;
String shsj=null;
String shyj="";


String zcmmbz="";//�����տ���
String mmbz="";//ľ���տ���
String cgjjbz="";//�����տ���
String jjbz="";//�Ҿ��տ���

String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select zzyhkh,jzwkqs,yjjzsj,sjsbh,fgsbh,zckx,lrdw,khbh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr,lrsj,bz,zffs,fkcs,yfkbl,yfkje,zcgysbh,zcddbh,zczjxbh,glxh,gljlbz ";
	ls_sql+=" ,DECODE(cw_khfkjl.dsksjbz,'N','δ���','Y','���ͨ��','M','���δͨ��') dsksjbz,sjr,shsj,shyj";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zzyhkh=cf.fillNull(rs.getString("zzyhkh"));
		dsksjbz=cf.fillNull(rs.getString("dsksjbz"));
		sjr=cf.fillNull(rs.getString("sjr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shyj=cf.fillNull(rs.getString("shyj"));

		jzwkqs=cf.fillNull(rs.getString("jzwkqs"));
		yjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		zckx=cf.fillNull(rs.getString("zckx"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fklxbm=cf.fillNull(rs.getString("fklxbm"));
		jkr=cf.fillNull(rs.getString("jkr"));
		skr=cf.fillNull(rs.getString("skr"));
		sksj=cf.fillNull(rs.getDate("sksj"));
		skdw=cf.fillNull(rs.getString("skdw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		zffs=cf.fillNull(rs.getString("zffs"));
		fkcs=cf.fillNull(rs.getString("fkcs"));
		yfkbl=rs.getDouble("yfkbl");
		yfkje=rs.getDouble("yfkje");
		fkje=rs.getDouble("fkje");
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
		glxh=cf.fillNull(rs.getString("glxh"));
		gljlbz=cf.fillNull(rs.getString("gljlbz"));
	}
	else{
		rs.close();
		ps.close();

		out.println("�����ڵ��տ��¼");
		return;
	}
	rs.close();
	ps.close();

	if (!yjjzsj.equals(""))
	{
//		out.println("�տ��¼�ѽ�ת���������޸ģ���תʱ�䣺"+yjjzsj);
//		return;
	}

	if (gljlbz.equals("Y"))//N���ǹ�����¼��Y��������¼
	{
		String glfkxh=null;
		ls_sql="select fkxh";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where glxh='"+glxh+"' and gljlbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glfkxh=cf.fillNull(rs.getString("fkxh"));
		}
		rs.close();
		ps.close();

		out.println("���󣡸�����¼�ǹ�����¼������ֱ�ӽ����޸ģ����޸�ԭʼ��¼��"+glfkxh);
		return;
	}

	ls_sql="select DECODE(zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','�Ǽ�װ�ͻ�','5','��ƿͻ�') ztmc,zjxssk,guanlif,zjxguanlif,suijin,suijinbfb,zjxsuijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy,fkcsmc,kqtk,kglf,gckkspbz,gcjdmc,zjxwcbz,gckk,zkl,sjfkzc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,zhzjxje,sgbz,jgrq";
	ls_sql+=" ,zhwjrqyexm,wjrqyexmsm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" ,zqsuijin,zqzjxsuijin,zqguanlif,zqzjxguanlif,zqgczjf,zhgczjf,zqljzjx,zhljzjx,zqqtsf,zhqtsf,zqwjrqyexm,zqqtsfzjx,zhqtsfzjx,zqwjrzjx,zhwjrzjx";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqsuijin=rs.getDouble("zqsuijin");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		zqguanlif=rs.getDouble("zqguanlif");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");
		zqqtsf=rs.getDouble("zqqtsf");
		zhqtsf=rs.getDouble("zhqtsf");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zhqtsfzjx=rs.getDouble("zhqtsfzjx");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		zhwjrzjx=rs.getDouble("zhwjrzjx");
		
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));

		ztmc=cf.fillNull(rs.getString("ztmc"));
		zjxssk=rs.getDouble("zjxssk");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxsuijin=rs.getDouble("zjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckkspbz=cf.fillNull(rs.getString("gckkspbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		gckk=rs.getDouble("gckk");
		zkl=rs.getDouble("zkl");
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
	}
	rs.close();
	ps.close();

	ls_sql=" select zcmmbz,mmbz,cgjjbz,jjbz ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfke=rs.getDouble(1);//���չ��̿�
	}
	rs.close();
	ps.close();


	if (fgsbh.equals(""))
	{
		out.println("���������ֹ�˾Ϊ��");
		return;
	}
	if (dwbh.equals(""))
	{
		out.println("������������Ϊ��");
		return;
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


	//�г������
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='91' and scbz='N'";//91���г������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scfjk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//��������
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='94' and scbz='N'";//94����������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//��֤��
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='95' and scbz='N'";//95����֤��
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rzf=rs.getDouble(1);
	}
	rs.close();
	ps.close();


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
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸Ŀͻ������¼��<font color="#0000CC">�տ���ţ�<%=fkxh%></font>��
<%
	if (getsfke!=sfke)
	{
		out.println("<B><font color='#FF0033'>���棡�����չ��̿����ϸ���������չ��̿"+sfke+"����ϸ="+getsfke+"</font></B>");
	}
%>
    </div>
	</td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
 
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
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0033"><strong>��˽��</strong></font></td>
              <td><%=dsksjbz%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0033"><strong>�����</strong></font></td>
              <td><%=sjr%>              </td><td align="right"><strong><font color="#CC0033">���ʱ��</font></strong></td>
                <td><%=shsj%></td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0033"><strong>������</strong></font></td>
              <td colspan="3"><%=shyj%>              </td></tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>�տ�����</td>
              <td width="33%"> 
                <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_getYfk(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cw_fkfamx.fkcs,cw_fkcs.fkcsmc||':'||cw_fkfamx.bqfkbl||'%' from cw_fkcs,cw_fkfamx,cw_khfkfa where cw_fkcs.fkcs=cw_fkfamx.fkcs and cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"' order by cw_fkfamx.fkcs",fkcs);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>�տ�����</td>
              <td width="32%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+fklxbm+"'",fklxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000FF">����Ӧ�տ���</font></td>
              <td width="33%"> 
                <input type="text" name="yfkje" value="<%=yfkje%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000FF">Ӧ�տ��ۼƱ���</font></td>
              <td width="32%"> 
                <input type="text" name="yfkbl" value="<%=yfkbl%>" size="6" maxlength="20" readonly>
                % <font color="#FF0033">���磺β��Ӧ¼��100��</font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="27" align="right" width="17%"><font color="#FF0000">*</font>ʵ�տ���</td>
              <td height="27" width="33%"> 
                <input type="text" name="fkje" size="20" maxlength="17"  value="<%=fkje%>" onChange="checkZkje(insertform)">              </td>
              <td height="27" bgcolor="#FFFFFF" align="right" width="18%"><font color="#FF0000">*</font>֧����ʽ</td>
              <td height="27" width="32%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm",zffs);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
              <td align="right">����ת���ʺ�</td>
              <td><input name="zzyhkh" type="text" value="<%=zzyhkh%>" size="20" maxlength="40"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">ת�ʿ���</td>
              <td width="33%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeZckx(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm!='11' order by fklxbm",zckx);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>��װβ��ȫ��</td>
              <td width="32%"><%
	cf.radioToken(out, "jzwkqs","Y+ȫ��&N+��",jzwkqs);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ת�ʶ���</td>
              <td colspan="3">
                <select name="zcgysbh" style="FONT-SIZE:12PX;WIDTH:528PX" onChange="checkZkje(insertform)">
                  <option value=""></option>
                  <%
	if (zckx.equals("23"))//���Ŀ�
	{
		if (zcmmbz.equals("Y"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
		{
			if (zczjxbh.equals(""))
			{
				zcgysbh=zcgysbh+"*"+zcddbh;
			}
			else {
				zcgysbh=zcgysbh+"*"+zcddbh+"*"+zczjxbh;
			}

		
			ls_sql="SELECT gysbh||'*'||ddbh  c1,gysbh||'������:'||ddbh||'������'||sum(fkje)||'��'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and zjxbh is null and scbz='N' and fklxbm='23' ";
			ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
			ls_sql+=" group by gysbh,ddbh";
			ls_sql+=" order by gysbh,ddbh ";

			
			cf.selectItem(out,ls_sql,zcgysbh);
		
			ls_sql="SELECT gysbh||'*'||ddbh||'*'||zjxbh  c1,gysbh||'������:'||zjxbh||'������'||sum(fkje)||'��'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and zjxbh is not null and scbz='N' and fklxbm='23' ";
			ls_sql+=" and (glxh is null OR glxh!=(select glxh from cw_glfkjl where fkxh='"+fkxh+"'))";
			ls_sql+=" group by gysbh,ddbh,zjxbh";
			ls_sql+=" order by gysbh,ddbh,zjxbh ";
			
			cf.selectItem(out,ls_sql,zcgysbh);
		}
		else if (zcmmbz.equals("N"))//Y��ȡ������N��ȡ�����ֵ䣻M���ɿ�
		{
			ls_sql="SELECT gysbh c1,gysbh||'����'||sum(fkje)||'��'  c2";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
			ls_sql+=" and gysbh is not null";
			ls_sql+=" group by gysbh";
			ls_sql+=" order by gysbh ";

			cf.selectItem(out,ls_sql,zcgysbh);
		}
	}
%> 
              </select>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>�տ���              </td>
              <td width="33%"> 
                <input type="text" name="skr" size="20" maxlength="20"  value="<%=skr%>" >              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>�տ�ʱ��              </td>
              <td width="32%"> 
                <input type="text" name="sksj" size="20" maxlength="10"  value="<%=sksj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">�տλ</font>              </td>
              <td width="33%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh= '"+skdw+"'",skdw);
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                �վݱ��              </td>
              <td width="32%"> 
                <input type="text" name="sjbh" size="20" maxlength="20"  value="<%=sjbh%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="73" rows="2"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="fkxh"  value="<%=fkxh%>" >
					<input type="hidden" name="lrr" value="<%=yhmc%>">
					<input type="hidden" name="lrsj" value="<%=cf.today()%>">
					<input type="hidden" name="lrdw" value="<%=lrdw%>">
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset"  value="����">
                  <input type="button" value="�鿴�տ���Ϣ" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button" >
                  <input name="pr" type="button" value="��ӡ�վ�" onClick="window.open('/cwgl/dy/PrintJzSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')" >
              <input name="pr2" type="button" value="ѡ���ӡ" onClick="window.open('/cwgl/dy/PrintChooseJzSj.jsp?fkxh=<%=fkxh%>')" >              </td>
            </tr>
        </table>



          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="14%" align="right">��ͬ�ۿ�</td>
              <td width="21%"><%=zkl%></td>
              <td width="15%" align="right">˰��ٷֱ�</td>
              <td width="17%"><%=suijinbfb%>%</td>
              <td width="17%" align="right">��װ�տ�����</td>
              <td width="16%"><%=fkcsmc%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="2" align="center"><b>��ͬ���</b></td>
              <td colspan="2" bgcolor="#FFFFCC" align="center"><b>���������</b></td>
              <td colspan="2" align="center"><b>ʵ�ʷ�����</b></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><strong>��ͬ�ܶ�-��ǰ</strong></td>
              <td ><strong><%=wdzgce%></strong></td>
              <td align="right" bgcolor="#FFFFCC"><strong>�������ܶ�-��ǰ</strong></td>
              <td bgcolor="#FFFFCC"><strong><%=zqljzjx%></strong></td>
              <td align="right"><strong>�ܼ�-��ǰ</strong></td>
              <td ><strong><%=cf.formatDouble(wdzgce+zqljzjx)%></strong></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF"><strong>��ͬ�ܶ�-�ۺ�</strong></td>
              <td ><strong><%=qye%></strong></td>
              <td align="right" bgcolor="#FFFFCC"><strong>�������ܶ�-�ۺ�</strong></td>
              <td bgcolor="#FFFFCC"><strong><%=zhljzjx%></strong></td>
              <td align="right"><strong>�ܼ�-�ۺ�</strong></td>
              <td ><strong><%=cf.formatDouble(qye+zhljzjx)%></strong></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#E8E8FF">�����ܶ�-��ǰ</td>
              <td ><%=zqgczjf%></td>
              <td align="right" bgcolor="#FFFFCC">��ǰ-������</td>
              <td bgcolor="#FFFFCC"><%=zjxje%></td>
              <td align="right">��ǰʵ�ʷ�����</td>
              <td ><%=cf.formatDouble(zqgczjf+zjxje)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�����ܶ�-�ۺ�</td>
              <td ><%=zhgczjf%></td>
              <td align="right" bgcolor="#FFFFCC">�ۺ�������</td>
              <td bgcolor="#FFFFCC"><%=zhzjxje%> </td>
              <td align="right">�ۺ�ʵ�ʷ�����</td>
              <td ><%=cf.formatDouble(zhgczjf+zhzjxje)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">˰��-��ǰ</td>
              <td ><%=zqsuijin%></td>
              <td align="right" bgcolor="#FFFFCC">��ǰ-������</td>
              <td bgcolor="#FFFFCC"><%=zqzjxsuijin%></td>
              <td align="right">��ǰ-��˰��</td>
              <td ><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">˰��-�ۺ�</td>
              <td ><%=suijin%></td>
              <td align="right" bgcolor="#FFFFCC">�ۺ�������</td>
              <td bgcolor="#FFFFCC"><%=zjxsuijin%></td>
              <td align="right">�ۺ�-��˰��</td>
              <td ><%=cf.formatDouble(suijin+zjxsuijin)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�����-��ǰ</td>
              <td ><%=zqguanlif%></td>
              <td align="right" bgcolor="#FFFFCC">��ǰ-������</td>
              <td bgcolor="#FFFFCC"><%=zqzjxguanlif%></td>
              <td align="right">��ǰ-�ܹ����</td>
              <td ><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�����-�ۺ�</td>
              <td ><%=guanlif%></td>
              <td align="right" bgcolor="#FFFFCC">�ۺ�������</td>
              <td bgcolor="#FFFFCC"><%=zjxguanlif%></td>
              <td align="right">�ۺ�-�ܹ����</td>
              <td ><%=cf.formatDouble(guanlif+zjxguanlif)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�����շ�-��ǰ</td>
              <td ><%=cf.formatDouble(zqqtsf+zqwjrqyexm)%></td>
              <td align="right" bgcolor="#FFFFCC">��ǰ-������</td>
              <td bgcolor="#FFFFCC"><%=cf.formatDouble(zqqtsfzjx+zqwjrzjx)%></td>
              <td align="right">��ǰ-�������շ�</td>
              <td ><%=cf.formatDouble(zqqtsf+zqwjrqyexm+zqqtsfzjx+zqwjrzjx)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�����շ�-�ۺ�</td>
              <td ><%=cf.formatDouble(zhqtsf+zhwjrqyexm)%></td>
              <td align="right" bgcolor="#FFFFCC">�ۺ�������</td>
              <td bgcolor="#FFFFCC"><%=cf.formatDouble(zhqtsfzjx+zhwjrzjx)%></td>
              <td align="right">�ۺ�-�������շ�</td>
              <td ><%=cf.formatDouble(zhqtsf+zhwjrqyexm+zhqtsfzjx+zhwjrzjx)%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�����շ���Ŀ</td>
              <td colspan="5" ><%=wjrqyexmsm%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"  bgcolor="#E8E8FF">��Ʒ�</td>
              <td ><%=sjf%></td>
              <td align="right" bgcolor="#FFFFCC" >��������ɱ�־</td>
              <td bgcolor="#FFFFCC"><%
	cf.radioToken(out,"1+δ���&2+�����",zjxwcbz,true);
%></td>
              <td align="right">&nbsp;</td>
              <td >&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�����</td>
              <td ><%=glf%></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#0000FF">������ʵ�տ�</font></td>
              <td bgcolor="#FFFFCC"><%=cf.formatDouble(zjxssk)%></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#0000FF"><font color="#0000FF">���չ��̿�</font></font></td>
              <td ><font color="#0000FF"><%=cf.formatDouble(sfke)%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#E8E8FF">��˾�����</td>
              <td colspan="5" bgcolor="#E8E8FF"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#E8E8FF">С�������</td>
              <td colspan="5" bgcolor="#E8E8FF"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#E8E8FF">չ������</td>
              <td colspan="5" bgcolor="#E8E8FF"><%=cxhdbmzh%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="center" colspan="6"><b><font color="#CC0000">������ �� �� 
                �� �� �ѣ���</font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">�����������</td>
              <td ><%=kqtk%></td>
              <td align="right" bgcolor="#E8E8FF">�ۼƼ�������</td>
              <td><%=kglf%></td>
              <td align="right"><b><font color="#990000">���յ���������</font></b></td>
              <td ><%=cf.formatDouble(jxglf)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">�����ܽ��</td>
              <td ><%=fjje%></td>
              <td align="right">��˾�е������</td>
              <td><%=gsfje%></td>
              <td align="right"><b><font color="#990000">���յ��г������</font></b></td>
              <td ><%=cf.formatDouble(scfjk)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">���̿ۿ�</td>
              <td ><%=gckk%></td>
              <td align="right">��֤�г�</td>
              <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%></td>
              <td align="right"><b><font color="#990000">���յ���֤��</font></b></td>
              <td ><%=cf.formatDouble(rzf)%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right">�Ż�����</td>
              <td colspan="5" ><%=yhyy%></td>
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

	if (FormName.zckx.value=='21' )
	{
		if ("<%=mmbz%>"=="Y" || "<%=mmbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='22' )
	{
		if ("<%=cgjjbz%>"=="Y" || "<%=cgjjbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}
	else if ( FormName.zckx.value=='24')
	{
		if ("<%=jjbz%>"=="Y" || "<%=jjbz%>"=="N")
		{
			if(FormName.zcgysbh.value=="") 
			{
				return;
			}
		}
	}

	lx=2;


	var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeZckx(FormName) 
{

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


	if (FormName.zckx.value=='21' )
	{
		if ("<%=mmbz%>"=="M" )
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='22' )
	{
		if ("<%=cgjjbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='23' )
	{
		if ("<%=zcmmbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
		}
	}
	else if ( FormName.zckx.value=='24')
	{
		if ("<%=jjbz%>"=="M")
		{
			lx=2;
			var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value+"&fkxh="+FormName.fkxh.value;
		}
		else{
			lx=3;
			var actionStr="/cwgl/cwsk/fgck/GetZcPpGys.jsp?fgsbh=<%=fgsbh%>&khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&gysbh=&fklxbm="+FormName.fklxbm.value;
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

	if (lx==2)
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


function f_getYfk(FormName)
{
	FormName.yfkje.value="";
	FormName.yfkbl.value="";

	var str="EditCw_khfkjCx.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>&fkcs="+FormName.fkcs.value;
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fkxh)=="") {
		alert("������[�տ����]��");
		FormName.fkxh.focus();
		return false;
	}

	if(	javaTrim(FormName.fklxbm)=="") {
		alert("��ѡ��[�տ�����]��");
		FormName.fklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkcs)=="") {
		alert("��ѡ��[�տ�����]��");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "�տ�����"))) {
		return false;
	}
	
	if(	javaTrim(FormName.yfkbl)=="") {
		alert("��ѡ��[Ӧ�տ����]��");
		FormName.yfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkbl, "Ӧ�տ����"))) {
		return false;
	}


	if(!(isFloat(FormName.yfkje, "Ӧ�տ���"))) {
		return false;
	}

	if(	javaTrim(FormName.fkje)=="") {
		alert("������[�տ���]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "�տ���"))) {
		return false;
	}

	if (parseFloat(FormName.fkje.value)==0)
	{
		alert("����[�տ���]����Ϊ0");
		FormName.fkje.select();
		return false;
	}


	if(	javaTrim(FormName.zffs)=="") {
		alert("��ѡ��[֧����ʽ]��");
		FormName.zffs.focus();
		return false;
	}
	if (FormName.zffs.value=="31")//31��ת��
	{
		if(	javaTrim(FormName.zckx)=="") {
			alert("��ѡ��[ת�ʿ���]��");
			FormName.zckx.focus();
			return false;
		}
		if (FormName.zckx.value=="21" )//21:ľ�ţ�
		{
			if ("<%=mmbz%>"=="Y" || "<%=mmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת��ľ�ſ����ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="22" )//22:����
		{
			if ("<%=cgjjbz%>"=="Y" || "<%=cgjjbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת����������ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="23" )//23:���ģ�
		{
			if ("<%=zcmmbz%>"=="Y" || "<%=zcmmbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת�����Ŀ����ѡ��[ת��Ʒ��]��");
					FormName.zcgysbh.focus();
					return false;
				}
			}
		}
		else if ( FormName.zckx.value=="24")//24���Ҿ�
		{
			if ("<%=jjbz%>"=="Y" || "<%=jjbz%>"=="N")
			{
				if(	javaTrim(FormName.zcgysbh)=="") {
					alert("ת���Ҿ߿����ѡ��[ת��Ʒ��]��");
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
	if(	!radioChecked(FormName.jzwkqs)) {
		alert("��ѡ��[��װβ��ȫ��]��");
		FormName.jzwkqs[0].focus();
		return false;
	}
	if (FormName.jzwkqs[0].checked)
	{
		if(	parseFloat(FormName.yfkbl.value)!=100) 
		{
			alert("[Ӧ�տ��ۼƱ���]����100%������ѡ��[β��ȫ��]��");
			FormName.jzwkqs[1].focus();
			return false;
		}
	}

	FormName.target="_blank";
	FormName.action="SaveEditCw_khfkjl.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
