<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
//ybl.common.PageObject  pageObj=new ybl.common.PageObject();
//pageObj.setType("EXCEL",response);
//���ӱ��۲�����ӡ


String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

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
String bjjbbm=null;
String bjjb=null;
String ssfgs=null;
String dqbm=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs";
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
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		bjjb=cf.fillHtml(rs.getString("bjjbmc"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//����:  lx 9�����ȫ����1����鵥�ۣ�2��������ƣ�3����鹤�ղ��ϼ�飻4����鱨�ۼ���
	String retStr=dzbj.checkBjjb(conn,khbh,9);
	if (!retStr.equals("0"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
//			alert("���ӱ��ۼ�����\r\n<%=retStr%>");
		//-->
		</SCRIPT>
		<%
	}
/*
	int bxx=dzbj.getBxxm(conn,khbh,"yz");
	if (bxx!=9999)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���ѣ�˰��ȱ�ѡ��Ŀû��ѡ��<%=bxx%>");
		//-->
		</SCRIPT>
		<%
	}
*/
%>
<body >

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025"></span></td>
    <td align="center">&nbsp;</td>
    <td align="right">http://www.yzf.com.cn</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" height="35"><b><font size="5">Ԥ����</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >�ͻ�������<%=khxm%></td>
    <td colspan="3" >��ϵ��ʽ��<%=lxfs%></td>
    <td >�� �� ʦ��<%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >���̵ص㣺<%=fwdz%></td>
    <td align="left" >���̵ȼ���<%=bjjb%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">���</td>
    <td  width="8%" align="center">��Ŀ���</td>
    <td  width="15%" align="center">��Ŀ����</td>
    <td  width="12%" align="center">��������</td>
    <td  width="6%" align="center">���Ϸ�</td>
    <td  width="6%" align="center">�˹���</td>
    <td  width="6%" align="center">��е�Ѽ�����</td>
    <td  width="6%" align="center">����</td>
    <td  width="8%" align="center">��Ԫ��</td>
    <td  width="29%" align="center">��������������˵��</td>
  </tr>
  <%
	int i=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjsl=rs.getDouble("sl");
			xjqye=rs.getDouble("je");
		}
		ps.close();
		rs.close();

		allsl+=xjsl;
		allqye+=xjqye;
		
		//�������
		%> 
  <tr bgcolor="#E8E8FF"> 
    <td colspan="10"> 
      <div align="right"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ</font></i></b></div>
    </td>
  </tr>
  <%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmx.xh xh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm ";
			ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm and fxmbh='"+xmbh+"'";
			ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				count=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			if (count>1)//������
			{
				double clbj=0;
				double rgbj=0;
				double jxbj=0;
				String zxmmc="";
				ls_sql="SELECT xmbh,xmmc,jldwmc,bj,clbj,rgbj,jxbj";
				ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm ";
				ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm and fxmbh='"+xmbh+"'";
				ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					xmbh=cf.fillHtml(rs2.getString("xmbh"));
					zxmmc=cf.fillHtml(rs2.getString("xmmc"));
					jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
					dj=rs2.getDouble("bj");
					clbj=rs2.getDouble("clbj");
					rgbj=rs2.getDouble("rgbj");
					jxbj=rs2.getDouble("jxbj");

					qye=cf.round(dj*sl,2);

					row++;
					//���ÿ������
					%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=row%></td>
					<td align="center"><%=xmbh%></td>
					<td align="center"><%=zxmmc%></td>
					<td align="center" rowspan="<%=count%>"><%=xmmc%></td>
					<td align="center"><%=clbj%></td>
					<td align="center"><%=rgbj%></td>
					<td align="center"><%=jxbj%></td>
					<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
					<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
					<td align="left" rowspan="<%=count%>"><%=gycl%></td>
				  </tr>
				  <%
				}

				while (rs2.next())
				{
					xmbh=cf.fillHtml(rs2.getString("xmbh"));
					zxmmc=cf.fillHtml(rs2.getString("xmmc"));
					jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
					dj=rs2.getDouble("bj");
					clbj=rs2.getDouble("clbj");
					rgbj=rs2.getDouble("rgbj");
					jxbj=rs2.getDouble("jxbj");

					qye=cf.round(dj*sl,2);

					row++;
					//���ÿ������
					%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=row%></td>
					<td align="center"><%=xmbh%></td>
					<td align="center"><%=zxmmc%></td>
					<td align="center"><%=clbj%></td>
					<td align="center"><%=rgbj%></td>
					<td align="center"><%=jxbj%></td>
					<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
					<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				  </tr>
				  <%
				}
				rs2.close();
				ps2.close();
			}
			else if (count==1)//������
			{
				double clbj=0;
				double rgbj=0;
				double jxbj=0;
				String zxmmc="";
				ls_sql="SELECT xmbh,xmmc,jldwmc,bj,clbj,rgbj,jxbj";
				ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm ";
				ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm and fxmbh='"+xmbh+"'";
				ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					xmbh=cf.fillHtml(rs2.getString("xmbh"));
					zxmmc=cf.fillHtml(rs2.getString("xmmc"));
					jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
					dj=rs2.getDouble("bj");
					clbj=rs2.getDouble("clbj");
					rgbj=rs2.getDouble("rgbj");
					jxbj=rs2.getDouble("jxbj");

					qye=cf.round(dj*sl,2);

					row++;
					//���ÿ������
					%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=row%></td>
					<td align="center"><%=xmbh%></td>
					<td align="center"><%=zxmmc%></td>
					<td align="center" ><%=xmmc%></td>
					<td align="center" colspan="3"><%=dj%></td>
					<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
					<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
					<td align="left"  ><%=gycl%></td>
				  </tr>
				  <%
				}
				rs2.close();
				ps2.close();
			}
			else{
				row++;
				//���ÿ������
				%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center"><%=row%></td>
				<td align="center"><%=xmbh%></td>
				<td align="center"><%=xmmc%></td>
				<td align="center"><%=xmmc%></td>
				<td align="center" colspan="3"><%=dj%></td>
				<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
				<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left"><%=gycl%></td>
			  </tr>
			  <%
			}

		}
		ps.close();
		rs.close();
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#E8E8FF"> 
    <td align="right" colspan="10"><i><b><font size="3">ֱ�ӷѺϼƣ�<%=cf.formatDouble(allqye,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="10" align="center"><b><i><font size="3">�ۺ�ȡ��</font></i></b></td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;
	int temp=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;
		temp++;

		%> 
  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
    <td><%=temp%></td>
    <td colspan="2"><%=sfxmmc%></td>
    <td colspan="5">&nbsp;</td>
    <td><%=cf.formatDouble(sfje,"#########.##")%></td>
    <td align="left" ><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 
  <tr bgcolor="#E8E8FF"> 
    <td align="right" colspan="10"><i><b><font size="3">�ۺ�ȡ�Ѻϼƣ�<%=cf.formatDouble(allsfje,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" colspan="10"><i><b><font size="3">�� �ƣ�<%=cf.formatDouble(allzj,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 15px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="10">
<%
	if (ssfgs.equals("FTJ00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");
		out.println("��ҵѺ�����ҵ����������κ����ɶ��ɼ׷��е�");
	}
	else if (ssfgs.equals("FQD00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");
		out.println("1����ҵѺ�����ҵ����ѣ������κ����ɶ��ɼ׷��е���<br>");
		out.println("2���˱���ΪԤ�㣬���й�������ʵ�ʷ��������㡣<br>");
		out.println("3���Ͻ�������ݳ��ؽṹ�������������ҷ����е����Ρ�<br>");
		out.println("4���Ͻ����ʦ˽���Ƽ����ģ����������������ҷ����е��κ����Ρ�");
     }
	 else if (ssfgs.equals("FJN00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");
		out.println("1����ҵѺ�����ҵ����ѣ������κ����ɶ��ɼ׷��е���<br>");
		out.println("2���˱���ΪԤ�㣬���й�������ʵ�ʷ��������㡣<br>");
		out.println("3���Ͻ�������ݳ��ؽṹ�������������ҷ����е����Ρ�<br>");
		out.println("4���Ͻ����ʦ˽���Ƽ����ģ����������������ҷ����е��κ����Ρ�");
     }
	else if (ssfgs.equals("FWS00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");
		out.println(" 1����ҵѺ�����ҵ����ѣ������κ����ɶ��ɼ׷��е���<br>");
		out.println("2��ˮ·Ԥ�ա����߹�60Ԫ/�ף�ǽש���߹�70Ԫ/�ס�<br>");
		out.println("3����·Ԥ�ա�����ÿ��22Ԫ������ÿ��24Ԫ��שǽÿ��30Ԫ,������ǽÿ��39Ԫ������ÿ��33Ԫ���绰������ÿ��33Ԫ��<br>");
		out.println("4��ǽ����ɫ�������ף�ÿ����ɫ����150Ԫ��<br>");
		out.println("5��ǽ�������Ŀ���漰�š��������һ�ʼ�����㡣<br>");
		
     }
	else if (ssfgs.equals("FSJ00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");
		out.println("1����ҵѺ�����ҵ����ѣ������κ����ɶ��ɼ׷��е���<br>");
		out.println("2���˱���ΪԤ�㣬���й�������ʵ�ʷ��������㡣<br>");
		out.println("3���Ͻ�������ݳ��ؽṹ�������������ҷ����е����Ρ�<br>");
		out.println("4���Ͻ����ʦ˽���Ƽ����ģ����������������ҷ����е��κ����Ρ�");
     }
	else if (ssfgs.equals("fnj00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");
		out.println("1��Ϊά���������棬�벻Ҫ�����κο�ͷ��ŵ��<br>");
		out.println("2����ʵ�ʷ�����Ŀ�뱨�۵�������һ����ʵ�ʷ���Ϊ׼��<br>");
		out.println("3���˱���Ϊ�������۲������.���.�ƾ�.�ذ�.��ש����.�������ı��ۡ����ҵ����ı�����������Ҿ����ı��۵���<br>");
		out.println("4���ҹ�˾��Ȩ���ԭ��������ǽ���Լ���������ؽṹ.�����ṹ��<br>");
		out.println("5���ҹ�˾��Ȩ���ԭ����ȼ��.ů���Լ�����䡣");
     }
	else if (ssfgs.equals("fwh00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");
		out.println("1���˱��۲�����ҵ���������κη��ã��������շ����ɼ׷��е���<br>");
		out.println("2��ʩ������Ŀ�������������ӻ���٣���ʵ��ʩ����Ŀ���㹤�̿(���ڿͻ�ԭ����ɵļ���,��Ծ�������ȡ5%�ļ������ѡ��� <br>");
		out.println("3��ˮ�繤������Ϊ���㣬���ֳ�ʵ��ʩ��������Ϊ׼���㡣<br>");
		out.println("4����Ԥ�㲻�����ģ����İ������֡����֡���������������������С��𡢹��ղ�������ߡ��ƾߡ���Ƭ��ʯ�ġ��ذ塢���ء��������տ���©�籣�����صȡ�<br>");
		out.println("5����Ԥ���Ϊ����ͬ�ĸ���,�Ǻ�ͬ���ɷָ��һ����.<br>");
		out.println("6����Ԥ�����ͬ����ͬ�ȵķ���Ч������Ҫ�Կ�ͷ��ʽ��ŵҵ������˾���е����ŵ�����Ρ�<br>");
		out.println("7����Ʒ��������Ʒ�Э�顷��<br>");
     }
    else if (ssfgs.equals("FLZ00"))
	{
		out.println("<BR>");
		out.println("��ע��");
		out.println("<BR>");		
		out.println("1���˱��۲�����ҵ���������κη��ã��������շ����ɼ׷��е���<br>");
		out.println("2���˱���ΪԤ�㣬���й�������ʵ�ʷ��������㡣<br>");
		out.println("3����Ԥ�㲻�����ģ����İ������֡����֡���������������������С��𡢹��ղ�������ߡ��ƾߡ���Ƭ��ʯ�ġ��ذ塢���ء��������տ���©�籣�����صȡ�<br>");
		out.println("4���ҹ�˾��Ȩ���ԭ����ȼ��.ů���Լ�����䡣");
		out.println("5�����ϰ��˷�����С���޵��ݻ���ݲ�����ʹ�õģ���¥���ϣ�����¥��ÿ����һ����ԭ���ۻ����ϼ���100Ԫ�����ӷ��������ڱ䵥�з�ӳ����¥���°�800Ԫ�ա�");
     } 
%>
	
	</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="42" width="50%">�׷�ǩ�֣�</td>
    <td colspan="3" height="42" width="50%">�ҷ�ǩ�֣�</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="22">���ڣ�</td>
    <td colspan="3" height="22">���ڣ�</td>
  </tr>
</table>
<br>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>







