<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String bjlb=null;
String sqtxnr=null;
String sqtxts=null;
String shtxnr=null;
String shtxts=null;
String sfyxhxgq=null;
String sfyxfc=null;
String sfxys=null;
String sfwlcb=null;
String zyrwbm=null;
String rwxh=null;
String jddf=null;
String jhkssj=null;
String jhjssj=null;
String jhgzr=null;
String jdsyts=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;
String sfyq=null;
String yqts=null;
String sfybgd=null;
String sffszg=null;
String sfyfbd=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;

String sjcpxx=null;
String sjcpfl=null;
String ysxm=null;
String bjjbmc=null;
String xgytg=null;
String gytgts=null;
String csjhkssj=null;
String csjhjssj=null;
String csjhgzr=null;
String gznr=null;
String sfxrw=null;
String sfzdyrw=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String gj=null;
String dd=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sybgcrq=null;
String jjrksg="1";
String jjrksgmc="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String rwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jjrksg,DECODE(jjrksg,'1','�ڡ����ղ���ʩ��','2','���ղ���ʩ��','9','������') jjrksgmc,crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwmc,sgd,sgbz,gj,dd,zjxm,sybgcrq";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjrksg=cf.fillNull(rs.getString("jjrksg"));
		jjrksgmc=cf.fillNull(rs.getString("jjrksgmc"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select khbh,rwbm,rwmc,rwflbm,zdjkrw,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfyxhxgq,sfyxfc,sfxys,sfwlcb,zyrwbm,rwxh,jddf,jhkssj,jhjssj,jhgzr,jdsyts,sjkssj,sjjssj,sjgzr,sfyq,yqts,sfybgd,sffszg,sfyfbd,lrr,lrsj,lrbm,bz ";
	ls_sql+=" ,sjcpxx,sjcpfl,ysxm,bjjbmc,xgytg,gytgts,csjhkssj,csjhjssj,csjhgzr,gznr,sfxrw,sfzdyrw";
	ls_sql+=" from  crm_xmrwgl,dm_bjjbbm";
	ls_sql+=" where crm_xmrwgl.bjjbbm=dm_bjjbbm.bjjbbm(+) and  (khbh='"+khbh+"') and  (rwbm='"+rwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjcpxx=cf.fillNull(rs.getString("sjcpxx"));
		sjcpfl=cf.fillNull(rs.getString("sjcpfl"));
		ysxm=cf.fillNull(rs.getString("ysxm"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		xgytg=cf.fillNull(rs.getString("xgytg"));
		gytgts=cf.fillNull(rs.getString("gytgts"));
		csjhkssj=cf.fillNull(rs.getDate("csjhkssj"));
		csjhjssj=cf.fillNull(rs.getDate("csjhjssj"));
		csjhgzr=cf.fillNull(rs.getString("csjhgzr"));
		gznr=cf.fillNull(rs.getString("gznr"));
		sfxrw=cf.fillNull(rs.getString("sfxrw"));
		sfzdyrw=cf.fillNull(rs.getString("sfzdyrw"));

		khbh=cf.fillNull(rs.getString("khbh"));
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		bjlb=cf.fillNull(rs.getString("bjlb"));
		sqtxnr=cf.fillNull(rs.getString("sqtxnr"));
		sqtxts=cf.fillNull(rs.getString("sqtxts"));
		shtxnr=cf.fillNull(rs.getString("shtxnr"));
		shtxts=cf.fillNull(rs.getString("shtxts"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfyxfc=cf.fillNull(rs.getString("sfyxfc"));
		sfxys=cf.fillNull(rs.getString("sfxys"));
		sfwlcb=cf.fillNull(rs.getString("sfwlcb"));
		zyrwbm=cf.fillNull(rs.getString("zyrwbm"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		jddf=cf.fillNull(rs.getString("jddf"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhgzr=cf.fillNull(rs.getString("jhgzr"));
		jdsyts=cf.fillNull(rs.getString("jdsyts"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjgzr=cf.fillNull(rs.getString("sjgzr"));
		sfyq=cf.fillNull(rs.getString("sfyq"));
		yqts=cf.fillNull(rs.getString("yqts"));
		sfybgd=cf.fillNull(rs.getString("sfybgd"));
		sffszg=cf.fillNull(rs.getString("sffszg"));
		sfyfbd=cf.fillNull(rs.getString("sfyfbd"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (sjkssj.equals(""))
	{
		sjkssj=jhkssj;
	}
	if (sjjssj.equals(""))
	{
		sjjssj=jhjssj;
	}
	if (sjgzr.equals(""))
	{
		sjgzr=jhgzr;
	}
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
<title>��Ŀ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">��Ŀ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF"> �ͻ����� </td>
    <td bgcolor="#FFFFFF"><%=khxm%></td>
    <td align="right" bgcolor="#FFFFFF"> ��ͬ�� </td>
    <td bgcolor="#FFFFFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">���ݵ�ַ</td>
    <td bgcolor="#FFFFFF"><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF">���̵���</td>
    <td bgcolor="#FFFFFF"><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF"> ǩԼ���� </td>
    <td bgcolor="#FFFFFF"><%=dwmc%> </td>
    <td align="right" bgcolor="#FFFFFF"> ���ʦ </td>
    <td bgcolor="#FFFFFF"><%=sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF"> ǩԼ���� </td>
    <td bgcolor="#FFFFFF"><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF"> ʩ���� </td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>    </td>
    <td align="right" bgcolor="#FFFFFF"> �೤ </td>
    <td bgcolor="#FFFFFF"><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">�ܼ�</td>
    <td bgcolor="#FFFFFF"><%=gj%></td>
    <td align="right" bgcolor="#FFFFFF">����</td>
    <td bgcolor="#FFFFFF"><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">��ͬ��������</td>
    <td bgcolor="#FFFFFF"><font color="#000000"><%=kgrq%></font></td>
    <td align="right" bgcolor="#FFFFFF">��ͬ��������</td>
    <td bgcolor="#FFFFFF"><font color="#000000"><%=jgrq%></font></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFFF">ʵ�ʿ�������</td>
    <td bgcolor="#FFFFFF"><font color="#000000"><%=sjkgrq%></font></td>
    <td align="right" bgcolor="#FFFFFF">ʵ�ʿ�������</td>
    <td bgcolor="#FFFFFF"><font color="#000000"><%=sjjgrq%></font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">��������</span></td> 
  <td width="33%"><%=rwmc%></td>
  <td align="right" width="17%">�������</td> 
  <td width="33%"> 
<%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm",rwflbm,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�ص�������</td> 
  <td width="33%"> 
<%
	cf.radioToken(out,"1+�ص���&2+���ص���",zdjkrw,true);
%>  </td>
  <td align="right" width="17%">�������</td> 
  <td width="33%"> 
<%
	cf.radioToken(out,"1+��ǰ����&2+�º�����&3+��ǰ�º�����&9+һ���¼",bjlb,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ǰ��������</td> 
  <td width="33%"><%=sqtxnr%></td>
  <td align="right" width="17%">��ǰ��������</td> 
  <td width="33%"><%=sqtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�º���������</td> 
  <td width="33%"><%=shtxnr%></td>
  <td align="right" width="17%">�º���������</td> 
  <td width="33%"><%=shtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�Ƿ�Ӱ���������</td> 
  <td width="33%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfyxhxgq,true);
%>  </td>
  <td align="right" width="17%">�Ƿ�Ӱ�츴��</td> 
  <td width="33%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfyxfc,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�Ƿ�������</td> 
  <td width="33%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfxys,true);
%>  </td>
  <td align="right" width="17%">�Ƿ�Ϊ��̱�</td> 
  <td width="33%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfwlcb,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="17%" align="right" bgcolor="#FFFFFF">ժҪ����</td> 
  <td width="33%"> 
<%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm",zyrwbm,true);
%>  </td>
  <td align="right" width="17%">�������</td> 
  <td width="33%"><%=rwxh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" class="STYLE2">��ע����</td>
  <td colspan="3"><%=gznr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" class="STYLE2">������Ŀ</td>
  <td colspan="3"><%=ysxm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" class="STYLE2">�漰��Ʒ</td>
  <td colspan="3"><%=sjcpfl%></td>
</tr>
</table>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
if (sjcpxx.equals("Y"))//�Ƿ��漰��Ʒ��Ϣ  Y���ǣ�N����
{
	%>
	<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="4%">&nbsp;</td>
		<td  width="10%">��Ʒ����</td>
		<td  width="4%">��Ʒ״̬</td>
		<td  width="3%">����</td>
		<td  width="3%">��װ��</td>
		<td  width="3%">������</td>
		<td  width="5%">����Ӧ������</td>
		<td  width="5%">�ƻ����ʱ��</td>
		<td  width="5%">�ƻ��ͻ�ʱ��</td>
		<td  width="5%">�ƻ���װʱ��</td>
		<td  width="3%">�践��</td>
		<td  width="3%">��ά��</td>
		<td  width="3%">���쳣</td>
		<td  width="21%">��������</td>
		<td  width="10%">�׹�Ʒ��</td>
		<td  width="3%">�¶���</td>
		<td  width="3%">�����</td>
		<td  width="3%">ѡ��</td>
		<td  width="4%">���ʦ</td>
	</tr>
	<%

		ls_sql="SELECT crm_cpgzjl.cpflbm,cpflmc,cpztmc, DECODE(crm_cpgzjl.cplx,'1','����Ʒ','2','��Ʒ') cplx ";
		ls_sql+=" ,DECODE(crm_cpgzjl.cpazlx,'1','ʩ����','2','��װ��') cpazlx,crm_cpgzjl.ghf,crm_cpgzjl.jgpp,crm_cpgzjl.ghfhzsj";
		ls_sql+=" ,DECODE(crm_cpgzjl.sfxdd,'Y','��','N','��') sfxdd, DECODE(crm_cpgzjl.sfxhxgl,'Y','��','N','��') sfxhxgl";
		ls_sql+=" ,DECODE(crm_cpgzjl.zxsfwz,'Y','���','N','��') zxsfwz,crm_cpgzjl.cpsjs";
		ls_sql+=" ,DECODE(crm_cpgzjl.sfxfb,'N','�޷���','Y','�ȴ�����','W','�������') sfxfb,crm_cpgzjl.fbdbh ";
		ls_sql+=" ,DECODE(crm_cpgzjl.sfyyc,'N','���쳣','Y','�ȴ�����','W','�쳣���') sfyyc ,crm_cpgzjl.ycdbh ";
		ls_sql+=" ,DECODE(crm_cpgzjl.sfxtx,'Y','������','N','��') sfxtx,crm_cpgzjl.txrq,crm_cpgzjl.txxs,crm_cpgzjl.txnr,crm_cpgzjl.zwyjcrq ";
		ls_sql+=" ,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj,crm_cpgzjl.lrr,crm_cpgzjl.lrsj,dwmc,crm_cpgzjl.bz";
		ls_sql+=" FROM crm_xmrwcpfl,crm_cpgzjl,crm_khxx,dm_cpflbm,dm_cpztbm,sq_dwxx  ";
		ls_sql+=" where crm_cpgzjl.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
		ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
		ls_sql+=" and crm_cpgzjl.lrbm=sq_dwxx.dwbh";
		ls_sql+=" and crm_xmrwcpfl.khbh='"+khbh+"'";
		ls_sql+=" and crm_xmrwcpfl.rwbm='"+rwbm+"'";
		ls_sql+=" and crm_xmrwcpfl.khbh=crm_cpgzjl.khbh";
		ls_sql+=" and crm_xmrwcpfl.cpflbm=crm_cpgzjl.cpflbm ";
		ls_sql+=" order by crm_cpgzjl.lrsj";
		pageObj.sql=ls_sql;
	//���ж����ʼ��

		pageObj.initPage("","","/gcgl/xmrwgl/cpgz/InsertCrm_cpazjl.jsp?khbh="+khbh+"&rwbm="+rwbm,"/gcgl/xmrwgl/cpgz/InsertCrm_cpztgzjl.jsp?khbh="+khbh+"&rwbm="+rwbm);
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
		pageObj.setViewStr("��װ");
		pageObj.setEditStr("״̬");
	//������ʾ��
		String[] disColName={"cpflmc","cpztmc","cplx","cpazlx","ghf","zwyjcrq","jhrksj","jhshsj","jhazsj","sfxfb","sfxwx","sfyyc","txnr","jgpp","sfxdd","sfxhxgl","zxsfwz","cpsjs"};
		pageObj.setDisColName(disColName);

		pageObj.alignStr[12]="align='left'";

		pageObj.out=out;
		pageObj.getDate(1);
		pageObj.displayDate();
	%>
	</table>
	<%
}
if (sfxys.equals("Y"))//�Ƿ��漰��Ʒ��Ϣ  Y���ǣ�N����
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">���ռ�¼��</td>
		<td  width="14%">������Ŀ</td>
		<td  width="5%">��Ƭ��</td>
		<td  width="7%">����ʱ��</td>
		<td  width="6%">������</td>
		<td  width="6%">���ս��</td>
		<td  width="6%">��������</td>
		<td  width="39%">����˵��</td>
		<td  width="5%">ǩ��</td>
		<td  width="5%">����Ȩ</td>
	</tr>
	<%
		ls_sql="SELECT crm_gcfxysjl.ysjlh,gcysxmmc,zpsl,crm_gcfxysjl.yssj,crm_gcfxysjl.ysr,DECODE(crm_gcfxysjl.ysjg,'1','�ϸ�','2','���ϸ�'),DECODE(crm_gcfxysjl.sffszg,'1','��','2','��'),crm_gcfxysjl.yssm,DECODE(crm_gcfxysjl.sfkhbrqz,'Y','����','N','��ǩ'), DECODE(crm_gcfxysjl.dqzysq,'Y','��','N','����Ȩ') ";
		ls_sql+=" FROM crm_gcfxysjl,crm_xmrwysxm";
		ls_sql+=" where crm_gcfxysjl.khbh='"+khbh+"'";
		ls_sql+=" and crm_xmrwysxm.khbh='"+khbh+"'";
		ls_sql+=" and crm_xmrwysxm.rwbm='"+rwbm+"'";
		ls_sql+=" and crm_gcfxysjl.gcysxmbm=crm_xmrwysxm.gcysxmbm";
		ls_sql+=" order by crm_gcfxysjl.ysjlh";
		pageObj.sql=ls_sql;
	//���ж����ʼ��

		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	//�����г�������
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"ysjlh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="/gcgl/gcjdgz/fxys/ViewCrm_gcfxysjl.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��

		pageObj.alignStr[7]="align='left'";

		pageObj.out=out;
		pageObj.getDate(1);
		pageObj.displayDate();
	%>
	</table>
	<%
}
%>



<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
		<input type="hidden" name="rwbm"  value="<%=rwbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="button" onClick="f_lrcp(editform)"  value="¼���Ʒ��Ϣ">
	  <input type="button" onClick="f_fbwxd(editform)"  value="����ά�޵�">
	  <input type="button" onClick="f_ycgl(editform)"  value="�쳣����">
	  <input type="button" onClick="f_txsz(editform)"  value="��������">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>ʵ�ʿ�ʼʱ��</td> 
  <td width="33%"> 
    <input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" onDblClick="JSCalendar(this)" onBlur="getDay()">  </td>
  <td align="right" width="17%"><span class="STYLE3">�ƻ���ʼʱ��</span></td> 
  <td width="33%"><%=jhkssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ʵ�ʽ���ʱ��</td>
  <td><input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" onDblClick="JSCalendar(this)" onBlur="getDay()"></td>
  <td align="right"><span class="STYLE3">�ƻ�����ʱ��</span></td>
  <td><%=jhjssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>ʵ�ʹ�����</td> 
  <td width="33%"> 
    <input type="text" name="sjgzr" size="20" maxlength="8"  value="<%=sjgzr%>" onBlur="getDay()">  </td>
  <td align="right" width="17%"><span class="STYLE3">�ƻ�������</span></td> 
  <td width="33%"><%=jhgzr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�����</td>
  <td><%
	cf.radioToken(out, "sfyq","Y+��&N+��",sfyq);
%></td>
  <td align="right">��������</td>
  <td><input type="text" name="yqts" size="20" maxlength="8"  value="<%=yqts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>�ڵ�÷�</td> 
  <td width="33%"><input type="text" name="jddf" size="20" maxlength="8"  value="<%=jddf%>" ></td>
  <td align="right" width="17%">�Ƿ��й��ڱ����</td> 
  <td width="33%"><%
	cf.radioToken(out, "sfybgd","Y+��&N+��",sfybgd);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>�Ƿ�������</td> 
  <td width="33%"><%
	cf.radioToken(out, "sffszg","Y+��&N+��",sffszg);
%></td>
  <td align="right" width="17%"><span class="STYLE1">*</span>�Ƿ��з�����</td> 
  <td width="33%"><%
	cf.radioToken(out, "sfyfbd","Y+��&N+��",sfyfbd);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td width="17%" align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE3">¼����</span></td> 
  <td width="33%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE3">¼��ʱ��</span></td> 
  <td width="33%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">¼�벿��</span></td>
  <td>
	<select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
	</select>  </td>
  <td align="right"><span class="STYLE3">�ڼ��տ�ʩ��</span></td>
  <td><%=jjrksgmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea></td>
  </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>

function getDay(xh) 
{
	var actionStr="getDay.jsp?jjrksg=<%=jjrksg%>&sjkssj="+editform.sjkssj.value+"&sjjssj="+editform.sjjssj.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	editform.sjgzr.value=ajaxRetStr;
}

function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.jddf)=="") {
		alert("������[�ڵ�÷�]��");
		FormName.jddf.focus();
		return false;
	}
	if(!(isNumber(FormName.jddf, "�ڵ�÷�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("������[ʵ�ʿ�ʼʱ��]��");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "ʵ�ʿ�ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("������[ʵ�ʽ���ʱ��]��");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "ʵ�ʽ���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjgzr)=="") {
		alert("������[ʵ�ʹ�����]��");
		FormName.sjgzr.focus();
		return false;
	}
	if(!(isNumber(FormName.sjgzr, "ʵ�ʹ�����"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyq)) {
		alert("��ѡ��[�Ƿ�����]��");
		FormName.sfyq[0].focus();
		return false;
	}
	if (FormName.sfyq[0].checked)
	{
		if(	javaTrim(FormName.yqts)=="") {
			alert("������[��������]��");
			FormName.yqts.focus();
			return false;
		}
		if(!(isNumber(FormName.yqts, "��������"))) {
			return false;
		}
		if(	!radioChecked(FormName.sfybgd)) {
			alert("��ѡ��[�Ƿ��й��ڱ����]��");
			FormName.sfybgd[0].focus();
			return false;
		}
	}
	else{
		FormName.yqts.value="";
		FormName.sfybgd[0].checked=false;
		FormName.sfybgd[1].checked=false;
	}
	if(	!radioChecked(FormName.sffszg)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sffszg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyfbd)) {
		alert("��ѡ��[�Ƿ��з�����]��");
		FormName.sfyfbd[0].focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
/*
*/
	FormName.action="SaveXmgzCrm_xmrwgl.jsp";
	FormName.submit();
	return true;
}

function f_lrcp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/gcgl/xmrwgl/cpgz/InsertCrm_cpgzjl.jsp";
	FormName.submit();
	return true;
}

function f_cpgz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("������[�������]��");
		FormName.rwbm.focus();
		return false;
	}

	FormName.action="JdCrm_cpgzjl.jsp";
	FormName.submit();
	return true;
}

function f_fbwxd(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/gcgl/xmrwgl/fbdgl/InsertCrm_fbdgl.jsp";
	FormName.submit();
	return true;
}


function f_ycgl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/gcgl/xmycgl/InsertCrm_xmycgl.jsp";
	FormName.submit();
	return true;
}

function f_txsz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/gcgl/xmrwgl/xmrw/TxSzCrm_xmrwgl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
