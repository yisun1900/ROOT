<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
//��ʾ���ۣ��ײ�����Ŀ�����ۣ�0���ײ�������
//��ʾ�����Ӽ�

String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

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
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth="";
String sjs=null;
String kgrq="";
String jyjdrq=null;
String jgrq="";
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dh=null;
String hxbm=null;
String ysshbz="";
String ysshr="";
String bjbbh="";
String dqbm="";
String bjjbbm="";
int fwmj=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT crm_zxkhxx.bjbbh,crm_zxkhxx.bjjb,fwmj,khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,ysshr,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��')ysshbz,hth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,hxbm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.sjsgh=sq_yhxx.ygbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		fwmj=rs.getInt("fwmj");
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		dh=cf.fillHtml(rs.getString("dh"));
		hxbm=cf.fillHtml(rs.getString("hxbm"));
		hth=cf.fillNull(rs.getString("hth"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
	}
	rs.close();
	ps.close();
	
	
	//��ȡ�������ڡ���������
	
	ls_sql="select kgrq,jgrq";
	ls_sql+=" from  crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
	}
	rs.close();
	ps.close();
	
	//��ȡ����


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



	//���̳����Ӽۣ����㣺ʵ����������Ӽ�����
//	String xmbh =null;
	String sfxzsl =null;
	double bzsl=0;
	ls_sql="SELECT bj_khgcxmxjq.xmbh,bj_khgcxmxjq.bzsl,bj_khgcxmxjq.sfxzsl";
	ls_sql+=" from  bj_khgcxmxjq,bj_bjxmmxq";
	ls_sql+=" where bj_khgcxmxjq.zjxxh=bj_bjxmmxq.zjxxh and bj_khgcxmxjq.xmbh=bj_bjxmmxq.xmbh ";
    ls_sql+=" and bj_khgcxmxjq.zjxxh='"+zjxxh+"' and bj_khgcxmxjq.tcnxmbz='Y'";//�ײ�����Ŀ��־
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");

		double sjsl=0;
		ls_sql="SELECT sum(bj_gclmxq.sl)";
		ls_sql+=" FROM bj_gclmxq";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		double xjjsl=0;//�Ӽ�����

		if (sfxzsl.equals("1"))//1�������2���������3��������
		{
			if (sjsl>bzsl)
			{
				xjjsl=sjsl-bzsl;
			}
			else{
				xjjsl=0;
			}
		}
		else if (sfxzsl.equals("2"))//1�������2���������3��������
		{
			if (sjsl>bzsl)
			{
				out.println("<BR>������Ŀ��š�"+xmbh+"���������[ʵ��������"+sjsl+"]����[��׼������"+bzsl+"]");
			}
		}


		ls_sql="update bj_khgcxmxjq set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();




%>
<body >

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
    <td width="17%" align="center">&nbsp;</td>
   <!--  <td align="right">http://www.jrchina.com</td> -->
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="5">�����ڴ�װ�ι��̣����������޹�˾</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="3">סլ����װ��װ�޹���Ԥ�㱨���飨����λ��LWTC-01</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >�ͻ�������<%=khxm%></td>
	<td colspan="3" >�ͻ��绰��<%=lxfs%></td>
    <td align="left">��ͬ�ţ�<%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" >���̵�ַ��<%=fwdz%></td>
    <td align="left" >�������ڣ�<%=kgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >����˵����<%cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);%></td>
	<td colspan="3">
	<input type="checkbox" name="checkbox" value="checkbox">
	ƽ��ṹ
	<input type="checkbox" name="checkbox2" value="checkbox">
	��ʽ�ṹ
	<input type="checkbox" name="checkbox3" value="checkbox">
	���ű���
	<input type="checkbox" name="checkbox4" value="checkbox">
	��������
	<input type="checkbox" name="checkbox5" value="checkbox">
	�ɷ�����	</td>
    <td align="left" >�������ڣ�<%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >���ʦ��<%=sjs%></td>
	<td width="17%" >���ʦ�绰��<%=dh%></td>
    <td width="18%" align="center">����ˣ�<%=ysshr%></td>
    <td width="12%" align="center">&nbsp;</td>
    <td align="left" >Ԥ����ˣ�<%=ysshbz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="3%" align="center">���</td>
    <td  width="8%" align="center">��Ŀ���</td>
    <td  width="18%" align="center">��Ŀ����</td>
	<td  width="5%" align="center">��λ</td>
    <td  width="5%" align="center">����:Ԫ</td>
    <td  width="3%" align="center">����</td>
    <td  width="9%" align="center">��Ԫ��</td>
    <td  width="30%" align="center">��������������˵��</td>
	<td  width="19%" align="center">�������ƹ��</td>
  </tr>
  <%
	int i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="9"> 
			  <div align="cenetr"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></i></b></div>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		String tcnxmbz=null;
		double zqdj=0;
		ls_sql="SELECT bj_bjxmmxq.tcnxmbz,bj_bjxmmxq.xh xh,bj_bjxmmxq.xmbh,xmmc,bj_bjxmmxq.zqdj,jldwmc,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.zqdj as je,gycl,bj_bjxmmxq.flmcgg,bj_bjxmmxq.bz";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxq.zjxxh=bj_gclmxq.zjxxh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" order by bj_gclmxq.fjnxh,bj_bjxmmxq.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			tcnxmbz=cf.fillNull(rs.getString("tcnxmbz"));
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			if (tcnxmbz.equals("Y"))
			{
				sl=0;
				qye=0;

			}

			xjsl+=sl;
			xjqye+=qye;

			allsl+=sl;
			allqye+=qye;

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center"><%=row%></td>
				<td align="center"><%=xmbh%></td>
				<td align="center"><%=xmmc%></td>
				<td align="center"><%=jldwmc%></td>
				<td align="center"><%=zqdj%></td>
				<td align="center"><%=cf.formatDouble(sl)%></td>
				<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left"><%=gycl%></td>
				<td align="left"><%=flmcgg%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="9"> 
			  <div align="right"><b><i><font size="3"><%=jgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ</font></i></b></div>
			</td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();

	%> 
	  <tr bgcolor="#FFFFFF"> 
		<td colspan="9"> 
		  <div align="right"><b><i><font size="3">�ײ���ʩ����С�ƣ�<%=cf.formatDouble(allqye,"#########.##")%>Ԫ</font></i></b></div>
		</td>
	  </tr>

	  <tr bgcolor="#FFFFFF"> 
		<td colspan="9"> 
		  <div align="cenetr"><b><i><font size="3">�����������Ӽ۲���</i></b></div>
		</td>
	  </tr>
	<%

	bzsl=0;
	double sjsl=0;
	double xjjsl=0;
	xjsl=0;
	xjqye=0;

	double zqdj=0;
	ls_sql="select bj_bjxmmxq.xmbh,bj_bjxmmxq.xmmc,bj_bjxmmxq.xmmc,jldwmc,bj_bjxmmxq.zqdj,bj_khgcxmxjq.bzsl,bj_khgcxmxjq.sjsl,bj_khgcxmxjq.xjjsl";
	ls_sql+=" from  bj_khgcxmxjq,bj_bjxmmxq,jdm_jldwbm";
	ls_sql+=" where bj_khgcxmxjq.zjxxh=bj_bjxmmxq.zjxxh and bj_khgcxmxjq.xmbh=bj_bjxmmxq.xmbh ";
	ls_sql+=" and bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_khgcxmxjq.xjjsl>0 and bj_khgcxmxjq.tcnxmbz='Y'";
	ls_sql+=" and bj_khgcxmxjq.zjxxh='"+zjxxh+"' and bj_khgcxmxjq.sfxzsl='1'";//1�������2���������3��������
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		xmbh=cf.fillHtml(rs2.getString("xmbh"));
		xmmc=cf.fillHtml(rs2.getString("xmmc"));
		jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
		zqdj=rs2.getDouble("zqdj");
		bzsl=rs2.getDouble("bzsl");
		sjsl=rs2.getDouble("sjsl");
		xjjsl=rs2.getDouble("xjjsl");

		gycl="��׼����:"+bzsl+"��ʵ������:"+sjsl+"����Ӽ�����:"+xjjsl;

		sl=xjjsl;

		qye=zqdj*sl;

		xjsl+=sl;
		xjqye+=qye;

		allsl+=sl;
		allqye+=qye;
		
		row++;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center"><%=row%></td>
			<td align="center"><%=xmbh%></td>
			<td align="center"><%=xmmc%></td>
			<td align="center"><%=jldwmc%></td>
			<td align="center"><%=zqdj%></td>
			<td align="center"><%=cf.formatDouble(sl)%></td>
			<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
			<td align="left"><%=gycl%></td>
			<td align="left">&nbsp;</td>
		  </tr>
		<%
	}
	rs2.close();
	ps2.close();

	%> 
	  <tr bgcolor="#FFFFFF"> 
		<td colspan="9"> 
		  <div align="right"><b><i><font size="3"><%=jgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ</font></i></b></div>
		</td>
	  </tr>
	<%

			


%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="9"><i><b><font size="3">�� �ƣ�<%=cf.formatDouble(allqye,"#########.##")%>Ԫ</font></b></i></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" height="42">�׷�ǩ�֣�</td>
    <td colspan="6" height="42">�ҷ�ǩ�֣�</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >���ڣ���</td>
    <td colspan="6" >���ڣ�</td>
  </tr>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






