<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ


	String wheresql="";

	String lxfs=null;
	String khbh=null;
	String hth=null;

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_zxkhxx.hth='"+hth+"')";
	}

	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs+"%')";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}


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

<table border="1" width="<%=(40+18*80+250+200+140+400)%>" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="40px">���</td>
	<td  width="80px">��ͬ��</td>
	<td  width="80px">�ͻ�����</td>
	<td  width="200px">�绰</td>
	<td  width="250px">���ݵ�ַ</td>

	<td  width="80px">�������</td>

	<td  width="80px">���ʦ</td>
	<td  width="80px">��ͬ��</td>
	<td  width="80px">ǩԼ����</td>
	<td  width="80px">ί�н�</td>
	<td  width="80px">ί�н�����</td>

	<td  width="80px">��Ʒ�</td>
	<td  width="80px">��Ʒ�����</td>

	<td  width="80px">���</td>
	<td  width="80px">����</td>
	<td  width="80px">Ԥ���</td>
	<td  width="80px">����</td>

	<td  width="80px">Ч��ͼ</td>
	<td  width="80px">�Ƿ�ǩ��</td>
	<td  width="80px">�Ƿ�ת���̿�</td>
	<td  width="80px">��Ʊ���</td>
	<td  width="140px">�ͻ���Դ</td>
	<td  width="300px">��ע</td>
</tr>

<%


	String getkhbh=null;
	String getkhxm=null;
	String getfwdz=null;
	String getlxfs=null;
	String sjs=null;
	String fwmj=null;
	String zxzt=null;

	String bz=null;

	double allwdzgce=0;
	double allqye=0;

	double sjhtje=0;
	String qsjhtsj="&nbsp;";
	double sjf=0;
	String jsjfsj="&nbsp;";

	int row=0;
	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.lxfs,crm_zxkhxx.sjs,crm_zxkhxx.fwmj";
	ls_sql+=" ,qsjhtsj,sjhtje,sjf,jsjfsj,zxzt  ";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx  ";
	ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" order by crm_zxkhxx.lrsj ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getkhbh=cf.fillNull(rs.getString("khbh"));
		getkhxm=cf.fillNull(rs.getString("khxm"));
		getfwdz=cf.fillNull(rs.getString("fwdz"));
		getlxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		qsjhtsj=cf.fillHtml(rs.getDate("qsjhtsj"));
		sjhtje=rs.getDouble("sjhtje");
		jsjfsj=cf.fillHtml(rs.getDate("jsjfsj"));
		sjf=rs.getDouble("sjf");
		zxzt=cf.fillNull(rs.getString("zxzt"));

		row++;


		String gethth="&nbsp;";
		String qyrq="&nbsp;";
		double qye=0;
		ls_sql="select hth,qye,qyrq";
		ls_sql+=" from crm_khxx ";
		ls_sql+=" where  khbh='"+getkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gethth=cf.fillHtml(rs1.getString("hth"));
			qye=rs1.getDouble("qye");
			qyrq=cf.fillHtml(rs1.getDate("qyrq"));
		}
		rs1.close();
		ps1.close();

		if (zxzt.equals("2") || zxzt.equals("4"))//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		{
			zxzt="�˵�";
		}
		else if (zxzt.equals("3"))//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
		{
			zxzt="ǩ��";
		}
		else {
			zxzt="δǩ";
		}

		String xxlymc="&nbsp;";
		ls_sql="select xxlymc";
		ls_sql+=" from crm_khxxly,dm_xxlybm ";
		ls_sql+=" where  crm_khxxly.xxlybm=dm_xxlybm.xxlybm and crm_khxxly.khbh='"+getkhbh+"' and khlx='2'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xxlymc+=cf.fillNull(rs1.getString("xxlymc"))+"��";
		}
		rs1.close();
		ps1.close();


		String tcrq="&nbsp;";
		double tcje=0;
		String wtjzgck="&nbsp;";
		String kpqk="&nbsp;";
		String xgtsj="&nbsp;";


		ls_sql="select tcrq,tcje,xgtsj,DECODE(wtjzgck,'1','��','2','��') wtjzgck,DECODE(kpqk,'1','��Ʊ','2','δ��Ʊ') kpqk";
		ls_sql+=" from cw_gdsgjsd ";
		ls_sql+=" where khbh='"+getkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tcrq=cf.fillNull(rs1.getDate("tcrq"));
			tcje=rs1.getDouble("tcje");
			xgtsj=cf.fillNull(rs1.getDate("xgtsj"));
			wtjzgck=cf.fillNull(rs1.getString("wtjzgck"));
			kpqk=cf.fillNull(rs1.getString("kpqk"));
		}
		rs1.close();
		ps1.close();
		
		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=row%></td>
			<td><%=gethth%></td>
			<td><A HREF="/khxx/ViewCrm_zxkhxx.jsp?khbh=<%=getkhbh%>" target="_blank"><%=getkhxm%></A></td>
			<td><%=getlxfs%></td>
			<td><%=getfwdz%></td>
			<td><%=fwmj%></td>
			<td><%=sjs%></td>
			<td><%=qye%></td>
			<td><%=qyrq%></td>
			<td><%=sjhtje%></td>
			<td><%=qsjhtsj%></td>
			<td><%=sjf%></td>
			<td><%=jsjfsj%></td>

			<td><%=tcje%></td>
			<td><%=tcrq%></td>
			<td>&nbsp;</td>


			<td>&nbsp;</td>
			<td><%=xgtsj%></td>
			<td><%=zxzt%></td>
			<td><%=wtjzgck%></td>
			<td><%=kpqk%></td>
			<td><%=xxlymc%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	
	
	}
	rs.close();
	ps.close();



}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

</table>