<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double zk=0;
double zqdj=0;
double sl=0;
double qye=0;
double zqqye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double xjzqqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allzqqye=0;
double allsl=0;
double allzj=0;
double allzqzj=0;


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
String dzbjbz=null;
String dh=null;
String hxbm=null;
String ysshbz="";
String ysshr="";
String cxhdbm="";

Reader is=null;
BufferedReader br=null;

double djfxje=0;
double zjjmje=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT cxhdbm,khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,ysshr,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��')ysshbz,hth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,hxbm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and crm_zxkhxx.sjsgh=sq_yhxx.bianhao(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
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

	ls_sql="select zjjmje";
	ls_sql+=" from crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjjmje=rs.getDouble("zjjmje");
	}
	rs.close();
	ps.close();
	
	
	//��ȡ�������ڡ���������
	
	ls_sql="select kgrq,jgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
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

	oracle.sql.CLOB  clob=null;

	ls_sql="select dzbjbz";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
	}
	rs.close();
	ps.close();

	dzbjbz="";

	if(clob!=null){
		is=clob.getCharacterStream();
		br=new BufferedReader(is);
		String s=br.readLine();
		while(s!=null)
		{
			dzbjbz+=s+",";
			s=br.readLine();
		}

		br.close();
		is.close();
	}

	if (dzbjbz==null)
	{
		dzbjbz="";
	}
	if (dzbjbz.length()>1)
	{
		dzbjbz=dzbjbz.substring(0,dzbjbz.length()-1);
	}
	else{
		dzbjbz="";
	}

	//��ȡ���ӱ��۽��
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	try {
		djfxje=dzbjje.getDjfxje(conn,khbh,"sxyd");
	}
	catch (Exception e) {
		out.print("<BR>����:" + e);
	}

	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	//����:  lx 9�����ȫ����1����鵥�ۣ�2��������ƣ�3����鹤�ղ��ϼ�飻4����鱨�ۼ���5������ѡ��Ŀ��6����鲻������Ŀ��7����������Ŀ
	String retStr=dzbj.checkBjjb(conn,khbh,9);
	if (!retStr.equals("0"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
			alert("���ӱ��ۼ�����\r\n<%=retStr%>");
		//-->
		</SCRIPT>
		<%
	}

%>
<body >

<div align="center"> </div>



<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
    <td width="17%" align="center">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="5">�������η���װ�ι������޹�˾</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="3">סլ����װ��װ�޹���Ԥ�㱨���飨����λ��</font></b></td>
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
    <td  width="13%" align="center">��Ŀ����</td>
	<td  width="5%" align="center">��λ</td>
    <td  width="5%" align="center">����:Ԫ</td>
    <td  width="3%" align="center">����</td>
    <td  width="9%" align="center">��ǰ��Ԫ��</td>
	<td  width="9%" align="center">�ۺ��Ԫ��</td>
    <td  width="30%" align="center">��������������˵��</td>
	<td  width="15%" align="center">�������ƹ��</td>
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
		xjzqqye=0;

		
		ls_sql="SELECT sum(bj_gclmx.sl) sl,ROUND(sum(bj_gclmx.sl*bj_bjxmmx.dj),2) as je,ROUND(sum(bj_gclmx.sl*bj_bjxmmx.zqdj),2) as zqje";
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
			xjzqqye=rs.getDouble("zqje");
		}
		rs.close();
		ps.close();

		allsl+=xjsl;
		allqye+=xjqye;
		allzqqye+=xjzqqye;

		allsl=cf.round(allsl,2);
		allqye=cf.round(allqye,2);
		allzqqye=cf.round(allzqqye,2);
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="10"> 
			  <div align="right"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    ��ǰС�ƣ�<%=cf.formatDouble(xjzqqye,"#########")%>Ԫ
				�ۺ�С�ƣ�<%=cf.formatDouble(xjqye,"#########")%>Ԫ</font></i></b></div>
			</td>
		  </tr>
		<%

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmx.xh xh,bj_bjxmmx.xmbh,xmmc,jldwmc,bj_bjxmmx.zqdj,bj_bjxmmx.zk,bj_bjxmmx.dj,bj_gclmx.sl,ROUND(bj_gclmx.sl*bj_bjxmmx.dj,2) as je,ROUND(bj_gclmx.sl*bj_bjxmmx.zqdj,2) as zqje,gycl,bj_bjxmmx.flmcgg,bj_bjxmmx.bz,bj_bjxmmx.zcf,bj_bjxmmx.cldj,bj_bjxmmx.shf,bj_bjxmmx.qtf,bj_bjxmmx.ysf,bj_bjxmmx.rgdj,bj_bjxmmx.jxdj";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xmpx,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			zqdj=rs.getDouble("zqdj");
			zk=rs.getDouble("zk");
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			zqqye=rs.getDouble("zqje");
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

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
				<td align="center"><%=cf.formatDouble(zqqye,"#########")%></td>
				<td align="center"><%=cf.formatDouble(qye,"#########")%></td>
				<td align="left"><%=gycl%></td>
				<td align="left"><%=flmcgg%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="10"><i><b><font size="3">��ǰֱ�ӷѺϼƣ�<%=cf.formatDouble(allzqqye,"#########")%>Ԫ �ۺ�ֱ�ӷѺϼƣ�<%=cf.formatDouble(allqye,"#########")%>Ԫ</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="10" align="center"><b><i><font size="3">�ۺ�ȡ��</font></i></b></td>
  </tr>
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="5%">���</td>
    <td width="20%">����</td>
    <td width="12%">��ǰ�շѽ��</td>
    <td width="12%">�ۺ��շѽ��</td>
	<td width="51%">��ע</td>

  </tr>
  <%  
	int temp=0;

	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	double sfbfb=0;
	double sfje=0;
	String bz=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	double zqsfje=0;
	double dxzkl=0;
	String sfkdz=null;
	double zdzk=0;

	double allzqsfje=0;
	double allsfje=0;

	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰��(�ٷֱ�)','4','�̶����(���ɸ�)','5','�����(�ٷֱ�)') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','��ѡ','2','�Ǳ�ѡ') sfbxx,DECODE(sfjrqye,'1','����','2','������') sfjrqye,DECODE(jrsjbz,'1','����','2','������') jrsjbz,DECODE(jrglfbz,'1','����','2','������') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" and sfxmlx not in('4','7','8')";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sflx=cf.fillHtml(rs.getString("sflx"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		bz=cf.fillHtml(rs.getString("bz"));
		sfbxx=cf.fillHtml(rs.getString("sfbxx"));
		sfjrqye=cf.fillHtml(rs.getString("sfjrqye"));
		jrsjbz=cf.fillHtml(rs.getString("jrsjbz"));
		jrglfbz=cf.fillHtml(rs.getString("jrglfbz"));
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		sfkdz=cf.fillHtml(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");

		allzqsfje+=zqsfje;
		allsfje+=sfje;
		temp++;

		%> 
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td><%=temp%></td>
			<td><%=sfxmmc%></td>
			<td><%=zqsfje%></td>
			<td><%=sfje%></td>
            <td align="left" colspan="5"><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;
	allzqzj=allzqsfje+allzqqye;

%> 
  <tr bgcolor="#FFFFFF" align="center"> 
	<td  colspan="2">�ۺ�ȡ�Ѻϼ�</td>
	<td><%=cf.formatDouble(allzqsfje,"#########")%></td>
	<td><%=cf.formatDouble(allsfje,"#########")%></td>
	<td>&nbsp;</td>
  </tr>
<%
if  (djfxje!=0)
{
	allzj-=djfxje;
	%>
	  <tr bgcolor="#FFFFFF" align="center"> 
		<td  colspan="2">����ּ�װ���Ż�</td>
		<td>&nbsp;</td>
		<td>-<%=cf.formatDouble(djfxje,"#########")%></td>
		<td align="left"><%=cxhdbm%></td>
	  </tr>
	<%
}

if  (zjjmje!=0)
{
	allzj-=zjjmje;
	%>
	  <tr bgcolor="#FFFFFF" align="center"> 
		<td  colspan="2">����������</td>
		<td>&nbsp;</td>
		<td>-<%=cf.formatDouble(zjjmje,"#########")%></td>
		<td align="left">&nbsp;</td>
	  </tr>
	<%
}

%>
  <tr bgcolor="#FFFFFF" align="right"> 
    <td align="right" colspan="10"><i><b><font size="3">
	��ǰ�ܼƣ�<%=cf.formatDouble(allzqzj,"#########")%>Ԫ
	&nbsp;&nbsp;&nbsp;
	�ۺ��ܼƣ�<%=cf.formatDouble(allzj,"#########")%>Ԫ</font></b></i></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" height="42">�׷�ǩ�֣�</td>
    <td colspan="6" height="42">�ҷ�ǩ�֣�</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="12" ><%=dzbjbz%></td>
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
		br.close();
		is.close();

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



