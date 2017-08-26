<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String psdzt=null;
String khbh=null;
String psfs=null;
String jhshsj=null;
String fkje=null;
String lx=null;
double yf=0;
double qtsf=0;
double pszsl=0;
double pszje=0;
String ssbm=null;
String lrr=null;
String lrrq=null;
String bz=null;
String dybz=null;
String dyr=null;
String dysj=null;
String zfr=null;
String zfsj=null;
String zfsm=null;
double ycksl=0;
double yckje=0;
String fclb=null;

String dqbm=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String dwbh=null;
String fgs=null;
String shjl=null;
String shr=null;
String shsj=null;
String shsm=null;

String psph=cf.GB2Uni(request.getParameter("psph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select DECODE(jxc_clpsd.fclb,'1','��������','2','����','3','��������','4','�˵�') fclb,jxc_clpsd.yckje,jxc_clpsd.ycksl,khbh,psfs,jhshsj,pszsl,pszje,fkje,yf,qtsf,DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','1','�ȴ����','2','�ȴ�����','3','�ѳ���','5','���ֳ���','6','���������޸�','7','����') psdzt,ssbm,lrr,lrrq,bz,DECODE(jxc_clpsd.dybz,'Y','��ӡ','N','δ��ӡ') dybz,jxc_clpsd.dyr,jxc_clpsd.dysj,zfr,zfsj,zfsm";
	ls_sql+=" ,shjl,shr,shsj,shsm";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		fclb=cf.fillNull(rs.getString("fclb"));
		yckje=rs.getDouble("yckje");
		ycksl=rs.getDouble("ycksl");
		shjl=cf.fillHtml(rs.getString("shjl"));
		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shsm=cf.fillHtml(rs.getString("shsm"));

		khbh=cf.fillNull(rs.getString("khbh"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillHtml(rs.getDate("jhshsj"));
		fkje=cf.fillNull(rs.getString("fkje"));
		pszsl=rs.getDouble("pszsl");
		pszje=rs.getDouble("pszje");
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
		psdzt=cf.fillNull(rs.getString("psdzt"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		bz=cf.fillHtml(rs.getString("bz"));
		dybz=cf.fillHtml(rs.getString("dybz"));
		dyr=cf.fillHtml(rs.getString("dyr"));
		dysj=cf.fillHtml(rs.getString("dysj"));
		zfr=cf.fillHtml(rs.getString("zfr"));
		zfsj=cf.fillHtml(rs.getString("zfsj"));
		zfsm=cf.fillHtml(rs.getString("zfsm"));
	}
	rs.close();
	ps.close();


	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,sgbz,qye,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		sgbz=cf.fillHtml(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE2 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">���ϵ������ϵ��ţ�<%=psph%>��</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">�ͻ���� </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right">��ͬ�� </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ����� </td>
    <td><%=khxm%> </td>
    <td align="right">�ʼ�Ա</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ǩԼ����</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
    <td align="right">���ʦ</td>
    <td><%=sjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʩ���� </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>    </td>
    <td align="right">ʩ������ </td>
    <td><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ��������</td>
    <td bgcolor="#FFFFFF"><%=kgrq%> </td>
    <td align="right">��ͬ��������</td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">���ϵ�״̬</span></td>
    <td><%=psdzt%></td>
    <td align="right"><span class="STYLE2">��ӡ��־</span></td>
    <td><%=dybz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��˽���</td>
    <td><%
	cf.radioToken(out,"Y+ͬ��&N+����&M+���������޸�",shjl,true);
%> </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�����</td>
    <td><%=shr%></td>
    <td align="right">���ʱ��</td>
    <td><%=shsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���˵��</td>
    <td colspan="3"><%=shsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ӡ��</td>
    <td><%=dyr%></td>
    <td align="right">��ӡʱ��</td>
    <td><%=dysj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ͷ�ʽ</td>
    <td><%
	cf.radioToken(out,"1+����&2+����&9+����",psfs,true);
%>    </td>
    <td align="right">�ƻ��ͻ�ʱ��</td>
    <td><%=jhshsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">���ϵ����</span></td>
    <td><span class="STYLE2"><%=fclb%></span></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ѳ�������</td>
    <td><%=ycksl%></td>
    <td align="right">�ѳ�����</td>
    <td><%=yckje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><%=pszsl%></td>
    <td align="right">�ܽ��</td>
    <td><%=pszje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�˷�</td>
    <td><%=yf%></td>
    <td align="right">�����շ�</td>
    <td><%=qtsf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><%=fkje%></td>
    <td align="right">¼�벿��</td>
    <td>
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'",ssbm,true);
%>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">¼����</td>
    <td><%=lrr%></td>
    <td align="right">¼��ʱ��</td>
    <td><%=lrrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><%=zfr%></td>
    <td align="right">����ʱ��</td>
    <td><%=zfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����˵��</td>
    <td colspan="3"><%=zfsm%></td>
  </tr>
</table>


<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">���ϱ���</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="10%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="4%">������λ</td>
	<td  width="4%">���ϵ���</td>
	<td  width="4%">��������</td>
	<td  width="4%">�������</td>
	<td  width="5%">���</td>
	<td  width="4%">��������</td>
	<td  width="4%">���۷�ʽ</td>
	<td  width="7%">��Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
	<td  width="7%">���ϴ���</td>
	<td  width="7%">����С��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT jxc_clpsmx.psxh,jxc_clpsmx.clbm,jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.jldwbm,TO_CHAR(jxc_clpsmx.dj),jxc_clpsmx.sqpssl,jxc_clpsmx.pssl,jxc_clpsmx.psje,jxc_clpsmx.cksl";
	ls_sql+=" ,DECODE(jxc_clpsmx.xsfs,'1','����Ʒ','2','�ֻ�','3','�ڻ�����','4','�ɸ����') xsfsmc";
	ls_sql+=" ,jxc_clpsmx.ppmc,jxc_clpsmx.gysmc,jxc_clpsmx.cldlbm,jxc_clpsmx.clxlbm";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where jxc_clpsmx.psph='"+psph+"' ";
	ls_sql+=" order by jxc_clpsmx.psxh ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

</body>
</html>