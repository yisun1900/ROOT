<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
.STYLE3 {color: #FF0000}
</style>

</head>


<%
//�����İ�������ʾ����
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String dwmc=null;
String hth=null;
String khjl=null;
String clgw=null;
String khxm=null;
String qyrq=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jpmzjdjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;
String ysshr="";
String ysshbz="";

try {
	conn=cf.getConnection();

	
	ls_sql="SELECT dwmc,hth,khjl,clgw,khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,crm_zxkhxx.ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��')ysshbz";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		hth=cf.fillHtml(rs.getString("hth"));
		khjl=cf.fillHtml(rs.getString("khjl"));
		clgw=cf.fillHtml(rs.getString("clgw"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		
	}
	rs.close();
	ps.close();
	
	//��ѯǩԼ����
	ls_sql="SELECT qyrq from crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();


%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" align="center" class="STYLE2" ><p align="center"><strong>����װ��Ʒ������Ԥ����</strong></p></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="33%" >�˿�������<%=khxm%></td>
    <td width="41%" >��ϵ�绰��<%=lxfs%></td>
    <td width="26%" >��װ��ͬ���:<%=hth%></td>
  </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2" >�ͻ���ַ��<%=fwdz%></td>
      <td >ǩԼ���棺<%=dwmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td >���ʦ��<%=sjs%></td>
      <td >���Ϲ��ʣ�<%=clgw%></td>
      <td >�ͻ�����<%=khjl%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="3" ><BR>����װ��Ʒ������ѡ� 
	  <input type="checkbox" name="xz" value="1" >��ů�ƻ�
	  <input type="checkbox" name="xz" value="2" >�����ƻ�
	  <input type="checkbox" name="xz" value="3" >ɫ�ʼƻ�
	  <input type="checkbox" name="xz" value="4" >�����ƻ�
      </td>
      </tr>
</table>

<BR><center><strong>��ƷԤ������</strong></center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="12%" >�ײ�����</td>
    <td  width="8%" >�۸�</td>
    <td  width="18%" >��Ʒ����</td>
    <td  width="15%" >Ʒ��</td>
    <td  width="20%" >�ͺ�</td>
	<td  width="15%" >���</td>
    <td  width="6%" >��λ</td>
    <td  width="6%" >����</td>
  </tr>

	
<%
	int i=0;

	String tcmc=null;
	double tcjg=0;
	double bzmj=0;
	double pmzjdj=0;
	double sjmj=0;
	String mjsfkzj=null;

	double alltcjg=0;
	ls_sql="SELECT tcmc,tcjg,bzmj,pmzjdj,sjmj,mjsfkzj";
	ls_sql+=" FROM bj_khwntcmc ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by tcmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcmc=rs.getString("tcmc");
		tcjg=rs.getDouble("tcjg");
		bzmj=rs.getDouble("bzmj");
		pmzjdj=rs.getDouble("pmzjdj");
		sjmj=rs.getDouble("sjmj");
		mjsfkzj=rs.getString("mjsfkzj");

		if (sjmj>bzmj)
		{
			tcjg+=(sjmj-bzmj)*pmzjdj;
			tcjg=cf.round(tcjg,2);
		}

		alltcjg+=tcjg;

		double tcmxjg=0;
		ls_sql="SELECT sum(round(tcdj*sl,2))";
		ls_sql+=" FROM bj_khwntcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tcmxjg=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (tcmxjg!=tcjg)
		{
			out.println("<span class='STYLE3'>�����ײ�["+tcmc+"]�ܼ�["+tcjg+"]����ϸ["+tcmxjg+"]��һ��</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khwntcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcjg%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khwntcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();


	String tcbm=null;
	double yj=0;
	double tcj=0;
	String bz=null;
	ls_sql="SELECT tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmc ";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and lx='2' ";//1���Ҿ��ײͣ�2�������ƻ�
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		alltcjg+=tcj;

		double tcmxjg=0;
		ls_sql="SELECT sum(round(tcdj*sl,2))";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tcmxjg=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (tcmxjg!=tcj)
		{
			out.println("<span class=\"STYLE3\">���󣡽����ƻ��ײ�["+tcbm+"]�ܼ�["+tcj+"]����ϸ["+tcmxjg+"]��һ��</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();


	ls_sql="SELECT tcmc,tcjg";
	ls_sql+=" FROM bj_khcltcmc ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by tcmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcmc=rs.getString("tcmc");
		tcjg=rs.getDouble("tcjg");

		alltcjg+=tcjg;

		double zsl=0;
		ls_sql="SELECT sum(bzsl)";
		ls_sql+=" FROM bj_khcltcfjsl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		double mxsl=0;
		ls_sql="SELECT sum(sl)";
		ls_sql+=" FROM bj_khcltcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			mxsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (mxsl!=zsl)
		{
			out.println("<span class=\"STYLE3\">����ɫ�ʼƻ��ײ�["+tcmc+"]������["+zsl+"]����ϸ����["+mxsl+"]��һ��</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khcltcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcjg%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khcltcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>С ��</B></td>
	<td><B><%=alltcjg%></B></td>
	<td><B>�� д</B></td>
	<td colspan="5"><b><font size="2"><%=cf.NumToRMBStr(alltcjg)%>;<font></b></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td colspan="3" >˵����<BR>

        <li>���ϼ۸�Ϊ�ײͱ�׼�۸�,���ֳ�������,�г�������,�������ַ�����ơ� </li>
        <li>�˱���ΪԤ������ÿ��ƻ�����200Ԫ�������磺�˿�ѡ����ů�ƻ���ɫ�ʼƻ��������ƻ�������3����ɶ���600Ԫ�� </li>
        <li>�����󣬶����ת���ɺ�ͬ������������˵��������˻��� </li>
        <li>�����󣬹˿���ȷ�����շ�����ͼֽ����ǩ����ʽ�ġ�����װ��Ʒ������ѡ����ͬ������ȫ��������ڴ�������ڴﰲ���µ������� </li>
        <li>��Ԥ��������Ϊ��ƷԤ�����ɶ���ʹ�ã�������������װ����ʽ��ͬ��ǩ��ȷ�ϵķ���Ϊ���ݡ� </li>

    </tr>
    <tr bgcolor="#FFFFFF"> 
    <td width="50%" height="59"><strong><font size="3">�˿�ǩ�֣�<font></strong></td>
    <td width="50%"><strong><font size="3">�����ڴ���£��� <font></strong><br>
    <strong><font size="3">�����ڴ�ί�д����ˣ� <font></strong><br>
    <strong><font size="3">���ʦǩ�֣� <font></strong></td>
    </tr>
</table>

</td></tr>
</TBODY>

</table>


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






