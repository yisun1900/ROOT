<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "����";
	font-weight: bold;
	font-size: 36px;
}
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 16px}

-->
</style>
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
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

double glf=0;
double suijin=0;
double zhte=0;
double ycf=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String sjhth=null;
String yjzxsj=null;
String bjsj=null;
String fwmj=null;
String dh=null;
String bjjbmc=null;
String bz=null;
Reader is=null;
BufferedReader br=null;
String jygq="";
java.text.DecimalFormat   df=new   java.text.DecimalFormat( "0.00 "); 

String zklStr="&nbsp;";
String zhjeStr="&nbsp;";

try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjbmc,crm_zxkhxx.bjjb,crm_zxkhxx.ssfgs,hth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,jygq";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.sjsgh=sq_yhxx.bianhao(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		ssfgs=rs.getString("ssfgs");
		hth=rs.getString("hth");
		yjzxsj=rs.getString("yjzxsj");
		bjsj=cf.fillHtml(rs.getDate("zjzbjsj"));
        fwmj=cf.fillHtml(rs.getString("fwmj"));
		dh=cf.fillHtml(rs.getString("dh"));
		jygq=cf.fillHtml(rs.getString("jygq"));
	}
	rs.close();
	ps.close();


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


	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//����:  lx 9�����ȫ����1����鵥�ۣ�2��������ƣ�3����鹤�ղ��ϼ�飻4����鱨�ۼ���

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


	allqye=dzbj.getZqGczjf(conn,khbh,"yz");//����ֱ�ӷѣ���ǰ
	suijin=dzbj.getZqSuijinJe(conn,khbh,"yz");
	glf=dzbj.getZqGlfJe(conn,khbh,"yz");
	zhte=dzbj.getBjje(conn,khbh,"yz");//��ȡ����ǰ�����ӱ��۽�ֱ�ӷѣ������շ�
	double zhbjze=dzbj.getZhBjje(conn,khbh,"sxyd");//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շ�

	String gcfqdzk="10";
	ls_sql="select gcfqdzk";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcfqdzk=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!gcfqdzk.equals("10"))
	{
		zklStr="�ۿ�:"+gcfqdzk+"��";
		zhjeStr="�ۺ��ܶ�:"+zhbjze;
	}
	
	int m=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where  (khbh='"+khbh+"') and sfxmbm not in ('01','02') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		m=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	if(m>1)
	{
		out.println("����Զ�̷�ֻ��ѡ��һ��");
		return;
	}
	else
	{
		ls_sql="select zqsfje";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where  (khbh='"+khbh+"') and sfxmbm not in ('01','02') ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ycf=rs.getDouble("zqsfje");
		}
		rs.close();
		ps.close();
	}
	//ycf=dzbj.getZqDxsfJe(conn,khbh,"04","yz");
%>
<body onLoad="PageSetup_Null()">

<table border="0" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<THEAD bgcolor="#FFFFFF" style="display:table-header-group;">
<tr><td>
<table width="100%" cellspacing="0" cellpadding="0" >
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="7" height="35"><image src="/images/<%if("A".equals(bjjb)||"B".equals(bjjb)||"C".equals(bjjb))out.print("tellmach");
	   if("D".equals(bjjb)||"E".equals(bjjb)||"F".equals(bjjb))out.print("logo");%>.jpg"/>	</td>
	
  </tr> 
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" height="35"><span class="STYLE1"><%if("A".equals(bjjb)||"B".equals(bjjb)||"C".equals(bjjb))out.print("�� �� ��");
	   if("D".equals(bjjb)||"E".equals(bjjb)||"F".equals(bjjb))out.print("�� �� ��");%> װ �� �� ͬ �� �� ��</span>
	  <hr style="border:display; border-top:solid 2px black;height:2; ">	</td>
	
  </tr> 
  <tr bgcolor="#FFFFFF"> 
    <td  width="15%">&nbsp;</td><td colspan="5" align="center">�˱��۵��Ա���֮����90��(��������)�ڿ�����Ч��������������ҵ���֤ע������Ϊ׼<BR><BR>&nbsp;
</td>
	  <td  align="right"width="15%">&nbsp;<%=bjjbmc%><BR><BR>&nbsp;
</td>
    
  </tr>
  </table>
</td></tr>
</THEAD>

<TBODY>
  <tr><td>
  <table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 16px'>
  <tr bgcolor="#FFFFFF"> 
    <td  align="left" width="27%">&nbsp;�ͻ�����:<%=khxm%></td>
	 <td  align="left" colspan="2">&nbsp;���̱��:<%=hth%></td>
	  <td  align="left">&nbsp;��������:<%=bjsj%></td>
	 </tr>

  <tr bgcolor="#FFFFFF"> 
    <td  align="left" colspan="3">&nbsp;�ͻ���ַ:<%=fwdz%></td>
	 
	 <td width="22%"  align="left">&nbsp;���̹���:&nbsp<%=jygq%>&nbsp��Ч������</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td  align="left">&nbsp;���ʦ:<%=sjs%></td>
	<td  align="left" colspan="2">&nbsp;��Ƶ绰:<%=dh%></td>
    <td  align="left">&nbsp;ʩ�����:<%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td  align="left">&nbsp;װ�޽��:<%=df.format(allqye)%></td>
	<td width="25%"  align="left">&nbsp;�����:<%=df.format(glf)%></td>
    <td  align="left" width="26%">&nbsp;˰��:<%=df.format(suijin)%></td>
	<td  align="left">&nbsp;��(��ͬ)���:<%=cf.formatDouble(zhte,"##########")%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td  align="left" colspan="2">&nbsp;Զ�̷�:<%=df.format(ycf)%></td>
    <td  align="left" >&nbsp;<%=zklStr%></td>
    <td  align="left" >&nbsp;<%=zhjeStr%></td>
  </tr>
</table>

<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="5%" align="center" height="28">��Ŀλ��</td>
    <td  width="10%" align="center">��Ŀ���</td>
    <td  width="44%" align="center">��Ŀ����</td>
    <td  width="4%" align="center">��λ</td>
	<td  width="6%" align="center">����</td>
    <td  width="4%" align="center">����</td>
    <td  width="8%" align="center">��Ԫ��</td>
	 <td  width="19%" align="center">��ע</td>
    
  </tr>
  <%
	int i=0;
	int j=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");
		j++;
		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.zqdj) as je";
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
		rs.close();
		ps.close();

		allsl+=xjsl;
		
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8"> 
			  <div align="left"><b><font size="3">&nbsp;&nbsp;<%=cf.addZero(j,2)+jgwzmc%> 
				</font></b></div>
			</td>
		  </tr>
		<%

		row=0;

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmx.xh xh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','��') xmbh,xmmc,jldwmc,bj_bjxmmx.zqdj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.zqdj as je,gycl,bj_gclmx.bz";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by substr(xmbh,2,2),substr(xmbh,6,2)";
		//ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xh";
		//ls_sql+=" order by bj_gclmx.xmmc,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("zqdj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));
			bz=cf.fillHtml(rs.getString("bz"));

			String slStr="";
			if (sl==0)
			{
				slStr="0";
			}
			else if (sl<1)
			{
				slStr="0"+df.format(sl);
			}
			else{
				slStr=df.format(sl);
			}

			String qyeStr="";
			if (qye==0)
			{
				qyeStr="0";
			}
			else if (qye<1)
			{
				qyeStr="0"+df.format(qye);
			}
			else{
				qyeStr=df.format(qye);
			}
			row++; 
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" height="28"><%=row%></td>
				<td align="center"><%=xmbh%></td>
				<td align="left"><%=xmmc%></td>
				<td align="center"><%=jldwmc%></td>
				<td align="center"><%=df.format(dj)%></td>
				<td align="center"><%=slStr%></td>
				<td align="center"><%=qyeStr%></td>
				<td align="center"><%=bz%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();
		%>
		<tr bgcolor="#FFFFFF"> 
				<td colspan="4"align="right" height="30"><b>С  �ƣ�</b></td>
				<td colspan="4" align="right"><b><%=df.format(xjqye)%><b></td>
  </tr>
		 <%

	}
	rs1.close();
	ps1.close();
%>
	 <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="8"><b><font size="3">װ�޽�<%=df.format(allqye)%>Ԫ</font></b></td>
  </tr>

</table>


</td></tr>
</TBODY>
<TFOOT style="display:table-footer-group;">
<tr>
<td>
<table border="0" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF"> 
    <td colspan="2" >&nbsp;</td>
    <td width="29%" colspan="2" >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="38%" >&nbsp;</td>
    <td width="33%" ><span class="STYLE2">�ͻ�ȷ��ǩ�֣�</span></td>
    <td colspan="2" ><span class="STYLE2">���ڣ�</span></td>
  </tr>
</table>
</td></tr>
</TFOOT>
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
<script language="JavaScript"> 
var HKEY_Root,HKEY_Path,HKEY_Key;
HKEY_Root="HKEY_CURRENT_USER";
HKEY_Path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
//������ҳ��ӡ��ҳüҳ��Ϊ��
function PageSetup_Null()
{
try
{
   var Wsh=new ActiveXObject("WScript.Shell");
HKEY_Key="header";
Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"");
HKEY_Key="footer";
Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&w&bҳ��,&p/&P");
}
catch(e){}
}

</script>








