<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));

String slfsbm=null;
String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String dwbh=null;
String zjxm=null;
String sjkgrq=null;
String sjjgrq=null;
String sfxhf=null;
String hfsj=null;
String tsclzt=null;
String yzcdbm=null;
String bz=null;
String yqjjsj=null;
String ldyqjjsj=null;
String ldclyj=null;
String slbm=null;
String tsnr=null;
String tsbxsj=null;
String zrbmclzt=null;
String sfxtz=null;
String lrr=null;
String lrsj=null;
String slr=null;
String slsj=null;

String zrbm=null;
String tslxbm=null;
String tsxlbm=null;
String clzt=null;
String jssj=null;
String jsr=null;
String jssm=null;
String jhcxcsj=null;
String jhcfasj=null;
String sjcxcsj=null;
String cxcsm=null;
String shr=null;
String shsj=null;
String shsm=null;

String cfajlh=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select crm_tsjl.slsj,crm_tsjl.slr,crm_tsjl.lrr,crm_tsjl.lrsj,crm_tsjl.tsbxsj,crm_tsjl.ldyqjjsj,crm_tsjl.ldclyj ";
	ls_sql+=" ,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as zrbmclzt";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','δ����','1','������','4','�ѽ���','5','�ѳ��ֳ�','6','�ѳ�����','7','�������ͨ��','2','�ڴ���','3','�᰸','9','������') as clzt";
	ls_sql+=" ,crm_tsjl.sfxtz,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,qtdh,sjs,sgd,sgbz,crm_khxx.dwbh,zjxm,sjkgrq,sjjgrq,crm_tsjl.sfxhf,crm_tsjl.hfsj,crm_tsjl.yqjjsj";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zrbmclzt=cf.fillNull(rs.getString("zrbmclzt"));
		tsclzt=cf.fillNull(rs.getString("clzt"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		sfxtz=cf.fillNull(rs.getString("sfxtz"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		ldyqjjsj=cf.fillHtml(rs.getDate("ldyqjjsj"));
		ldclyj=cf.fillHtml(rs.getString("ldclyj"));
	}
	rs.close();

	ls_sql="select crm_tsbm.dwbh,tslxbm,tsxlbm,clzt";
	ls_sql+=" ,crm_tsbm.jssm,crm_tsbm.jhcxcsj,crm_tsbm.jssj,crm_tsbm.jsr,crm_tsbm.jhcfasj,crm_tsbm.sjcxcsj,crm_tsbm.cxcsm";
	ls_sql+=" ,shr,shsj,shsm";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and crm_tsbm.tsyybm='"+tsyybm+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zrbm=cf.fillNull(rs.getString("dwbh"));
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
		clzt=cf.fillNull(rs.getString("clzt"));

		jssm=cf.fillNull(rs.getString("jssm"));
		jhcxcsj=cf.fillNull(rs.getDate("jhcxcsj"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jhcfasj=cf.fillNull(rs.getDate("jhcfasj"));
		sjcxcsj=cf.fillNull(rs.getDate("sjcxcsj"));
		cxcsm=cf.fillNull(rs.getString("cxcsm"));

		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shsm=cf.fillHtml(rs.getString("shsm"));
	}
	rs.close();

	int count=0;
	ls_sql="select NVL(max(substr(cfajlh,11,3)),0)";
	ls_sql+=" from  crm_tsbxfajl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	cfajlh=tsjlh+cf.addZero(count+1,3);
%>

<html>
<head>
<title>���޴���������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">���޴��������������޼�¼�ţ�<%=tsjlh%>�� </div>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">�ͻ����</font>    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">��ͬ��</font>    </td>
    <td width="32%"> <%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">�ͻ�����</font></td>
    <td width="33%"> <%=khxm%></td>
    <td width="18%" align="right"><font color="#0000CC">ǩԼ����</font></td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">�绰</font></td>
    <td colspan="3"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
    <td colspan="3"> <%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">���ʦ</font>    </td>
    <td width="33%"> <%=sjs%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">�ʼ�Ա</font>    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">ʩ����</font>    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">ʩ������</font>    </td>
    <td width="32%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">ʵ��������</font></td>
    <td width="33%"> <%=sjkgrq%> </td>
    <td width="18%" align="right"><font color="#0000CC">ʵ��������</font></td>
    <td width="32%"> <%=sjjgrq%> </td>
  </tr>
</table>

<BR>
<center>
��������
<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF"> 
    <td width="83%" valign="top"><%=tsnr%>  </td>
</tr>
</table>


<BR>
<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">


<tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">���س̶�</td>
    <td width="29%"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
    <td width="21%" align="right">����״̬</td>
    <td width="29%" valign="top"><%=tsclzt%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong><font color="#FF0000">�ͻ�Ҫ����ʱ��</font></strong></td>
    <td><%=yqjjsj%></td>
    <td align="right"><strong><font color="#FF0000">�쵼Ҫ����ʱ��</font></strong></td>
    <td valign="top"><%=ldyqjjsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�쵼�������</td>
    <td colspan="3"><%=ldclyj%></td>
    </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">�ͻ�����ʱ��</td>
    <td width="29%"><%=tsbxsj%> </td>
    <td width="21%" align="right">������Դ</td>
    <td width="29%" valign="top"><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm where slfsbm='"+slfsbm+"'",slfsbm,true);
%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">¼����</td>
    <td width="29%"><%=lrr%></td>
    <td width="21%" align="right">¼��ʱ��</td>
    <td width="29%" valign="top"><%=lrsj%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��ע</td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>�漰����</strong></td>
	<td width="19%"><strong>ԭ��</strong></td>
	<td width="8%"><strong>״̬</strong></td>
	<td width="46%"><strong>����˵��</strong></td>
	<td width="9%"><strong>����ʱ��</strong></td>
	<td width="6%"><strong>������</strong></td>
  </tr>
<%
	String getdwmc="";
	String gettsyymc="";
	String getjssm="";
	String getjhcxcsj="";
	String getjssj="";
	String getjsr="";
	String geclzt="";
	ls_sql="select dwmc,'��'||tsxlmc||'��'||tsyymc tsyymc,crm_tsbm.jssm,crm_tsbm.jhcxcsj,crm_tsbm.jssj,crm_tsbm.jsr";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as clzt";
	ls_sql+=" from  crm_tsbm,sq_dwxx,dm_tsxlbm,dm_tsyybm";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) ";
	ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)";
	ls_sql+=" and crm_tsbm.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbm.dwbh";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		getdwmc=cf.fillNull(rs.getString("dwmc"));
		gettsyymc=cf.fillNull(rs.getString("tsyymc"));
		getjssm=cf.fillHtml(rs.getString("jssm"));
		getjsr=cf.fillHtml(rs.getString("jsr"));
		getjssj=cf.fillHtml(rs.getDate("jssj"));
		getjhcxcsj=cf.fillHtml(rs.getDate("jhcxcsj"));
		geclzt=cf.fillHtml(rs.getString("clzt"));

		%>
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=getdwmc%></td>
			<td align="left"><%=gettsyymc%></td>
			<td><%=geclzt%></td>
			<td align="left"><%=getjssm%></td>
			<td><%=getjssj%></td>
			<td><%=getjsr%></td>
		  </tr>
		<%
	}
	rs.close();


%> 
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>�漰����</strong></td>
	<td width="19%"><strong>ԭ��</strong></td>
	<td width="6%"><strong>���</strong></td>
	<td width="8%"><strong>������ʱ��</strong></td>
	<td width="8%"><strong>�ƻ����ʱ��</strong></td>
	<td width="33%"><strong>�������</strong></td>
	<td width="6%"><strong>ά�޷��ܶ�</strong></td>
	<td width="6%"><strong>�ڲ������ܶ�</strong></td>
  </tr>
<%
	String fa_dwmc="";
	String fa_tsyymc="";
	String fa_cfajlh="";
	String fa_sjcfasj="";
	String fa_sjcfar="";
	String fa_jhjjsj="";
	String fa_jjfa="";
	String fa_sffswxf="";
	String fa_wxfze="";
	String fa_sfnbcf="";
	String fa_nbcfze="";
	String fa_shjl="";

	ls_sql="select dwmc,'��'||tsxlmc||'��'||tsyymc tsyymc ";
	ls_sql+=" ,DECODE(crm_tsbxfajl.shjl,'Y','ͨ��','N','δͨ��','δ���') shjl,crm_tsbxfajl.cfajlh,crm_tsbxfajl.sjcfasj,crm_tsbxfajl.sjcfar,crm_tsbxfajl.jhjjsj,crm_tsbxfajl.jjfa,DECODE(crm_tsbxfajl.sffswxf,'1','�����⸶','2','���⸶') sffswxf,crm_tsbxfajl.wxfze,DECODE(crm_tsbxfajl.sfnbcf,'1','���账��','2','�账��') sfnbcf,crm_tsbxfajl.nbcfze";
	ls_sql+=" from  sq_dwxx,dm_tsyybm,dm_tsxlbm,crm_tsbxfajl";
	ls_sql+=" where crm_tsbxfajl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsbxfajl.tsyybm=dm_tsyybm.tsyybm(+)";
	ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
	ls_sql+=" and crm_tsbxfajl.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbxfajl.tsyybm,crm_tsbxfajl.cfajlh";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		fa_dwmc=cf.fillNull(rs.getString("dwmc"));
		fa_tsyymc=cf.fillNull(rs.getString("tsyymc"));
		fa_cfajlh=cf.fillHtml(rs.getString("cfajlh"));
		fa_sjcfasj=cf.fillHtml(rs.getDate("sjcfasj"));
		fa_sjcfar=cf.fillHtml(rs.getString("sjcfar"));
		fa_jhjjsj=cf.fillHtml(rs.getDate("jhjjsj"));
		fa_jjfa=cf.fillHtml(rs.getString("jjfa"));
		fa_sffswxf=cf.fillHtml(rs.getString("sffswxf"));
		fa_wxfze=cf.fillHtml(rs.getString("wxfze"));
		fa_sfnbcf=cf.fillHtml(rs.getString("sfnbcf"));
		fa_nbcfze=cf.fillHtml(rs.getString("nbcfze"));
		fa_shjl=cf.fillHtml(rs.getString("shjl"));

		%>
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=fa_dwmc%></td>
			<td align="left"><%=fa_tsyymc%></td>
			<td><%=fa_shjl%></td>
			<td><%=fa_sjcfasj%></td>
			<td><%=fa_jhjjsj%></td>
			<td align="left"><%=fa_jjfa%></td>
			<td><%=fa_wxfze%></td>
			<td><%=fa_nbcfze%></td>
		  </tr>
		<%
	}
	rs.close();


%> 
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>�ط�ʱ��</strong></td>
	<td width="60%"><strong>�ͻ��ط����</strong></td>
	<td width="28%"><strong>�ط��г��ֵ�������</strong></td>
  </tr>
<%
	String khhfqk=null;
	String cxxwt=null;

	ls_sql="select hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and tsjlh='"+tsjlh+"'";
	ls_sql+=" order by hfsj";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));

		%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center" ><%=hfsj%></td>
            <td ><%=khhfqk%></td>
            <td ><%=cxxwt%></td>
          </tr>
		<%
	}
	rs.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</table>
</center>


<form method="post" action="SaveInsertcrm_tsbxfajl.jsp" name="editform"  >
        <div align="center"><b>���޴���������</b>����������¼�ţ�<%=cfajlh%>��</div>
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���ޱ��޴���</font></td>
      <td width="32%"> 
        <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tslxbm='"+tslxbm+"'",tslxbm);
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���ޱ���С��</font></td>
      <td width="33%"> 
        <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm where tsxlbm='"+tsxlbm+"'",tsxlbm);
%> 
        </select>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���β���</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	   cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zrbm+"'",zrbm);
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���ޱ���ԭ��</font></td>
      <td width="33%"> 
        <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsyybm='"+tsyybm+"'",tsyybm);
%> 
        </select>      </td>
    </tr>
    <tr>
      <td align="right"><font color="#0000CC">�ƻ�������ʱ��</font></td>
      <td><%=jhcfasj%></td>
      <td align="right"><font color="#0000CC">���ֳ�ʱ��</font></td>
      <td><%=sjcxcsj%></td>
    </tr>
    <tr>
      <td align="right"><strong>����˵��</strong></td>
      <td colspan="3"><%=jssm%></td>
    </tr>
    <tr>
      <td align="right"><strong>���ֳ�˵��</strong></td>
      <td colspan="3"><%=cxcsm%><strong><font color="#FF0000">
      <input type="button"  value="�鿴�ֳ���Ƭ" onClick="window.open('/tsgl/cx/CKPhoto.jsp?tsjlh=<%=tsjlh%>')"  >
      </font></strong></td>
    </tr>
    <tr>
      <td align="right"><strong>���������</strong></td>
      <td><%=shr%></td>
      <td align="right"><strong>�������ʱ��</strong></td>
      <td><%=shsj%></td>
    </tr>
    <tr>
      <td align="right"><strong>�������˵��</strong></td>
      <td colspan="3"><%=shsm%></td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>����״̬</td>
      <td colspan="3"><%
	cf.radioToken(out, "clzt","7+�ѳ������ȴ����&8+�ѳ������������","");
%></td>
    </tr>
    
    <tr>
      <td align="right"><font color="#FF0000">*</font>�Ƿ���ά�޷�</td>
      <td><%
	cf.radioToken(out, "sffswxf","1+δ����&2+����","");
%></td>
      <td align="right"><font color="#FF0000">      *</font>�Ƿ��ڲ�����</td>
      <td><%
	cf.radioToken(out, "sfnbcf","1+���账��&2+�账��","");
%></td>
    </tr>
    <tr>
      <td align="right">ά�޷��ܶ�</td>
      <td><input type="text" name="wxfze" value="" size="20" maxlength="20" ></td>
      <td align="right">�ڲ������ܶ�</td>
      <td><input type="text" name="nbcfze" value="" size="20" maxlength="20" ></td>
    </tr>
    
    <tr>
      <td align="right"><font color="#FF0000">*</font>�ƻ����ʱ��</td>
      <td><input type="text" name="jhjjsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�������</td>
      <td colspan="3"><textarea name="jjfa" cols="71" rows="9"></textarea>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font>ʵ�ʳ�������</td>
      <td width="32%"> 
        <input type="text" name="sjcfar" value="<%=yhmc%>" size="20" maxlength="20" >      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font>ʵ�ʳ�����ʱ��</td>
      <td width="33%"> 
        <input type="text" name="sjcfasj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">¼����</font></td>
      <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0033CC">¼�벿��</font></td>
      <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
        </select>      </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
		<input type="hidden" name="cfajlh" value="<%=cfajlh%>" >
          <input type="button"  value="����" onClick="f_do(editform)" >
          <input type="reset"  value="����" name="reset"></td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("������[���ޱ��޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("������[����ԭ��]��");
		FormName.tsyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.cfajlh)=="") {
		alert("������[��������¼��]��");
		FormName.cfajlh.focus();
		return false;
	}

	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[����״̬]��");
		FormName.clzt[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sffswxf)) {
		alert("��ѡ��[�Ƿ���ά�޷�]��");
		FormName.sffswxf[0].focus();
		return false;
	}
	if (FormName.sffswxf[1].checked)
	{
		if(	javaTrim(FormName.wxfze)=="") {
			alert("������[ά�޷��ܶ�]��");
			FormName.wxfze.focus();
			return false;
		}
		if(!(isFloat(FormName.wxfze, "ά�޷��ܶ�"))) {
			return false;
		}
	}
	else{
		FormName.wxfze.value="0";
	}

	if(	!radioChecked(FormName.sfnbcf)) {
		alert("��ѡ��[�Ƿ��ڲ�����]��");
		FormName.sfnbcf[0].focus();
		return false;
	}
	if (FormName.sfnbcf[1].checked)
	{
		if(	javaTrim(FormName.nbcfze)=="") {
			alert("������[�ڲ������ܶ�]��");
			FormName.nbcfze.focus();
			return false;
		}
		if(!(isFloat(FormName.nbcfze, "�ڲ������ܶ�"))) {
			return false;
		}
	}
	else{
		FormName.nbcfze.value="0";
	}
	
	if (FormName.sffswxf[1].checked || FormName.sfnbcf[1].checked)
	{
		if (FormName.clzt[1].checked)
		{
			alert("����[��������Ҫ���]��");
			FormName.clzt[0].focus();
			return false;
		}
	}


	
	
	if(	javaTrim(FormName.jhjjsj)=="") {
		alert("������[�ƻ����ʱ��]��");
		FormName.jhjjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jjfa)=="") {
		alert("������[�������]��");
		FormName.jjfa.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcfar)=="") {
		alert("������[ʵ�ʳ�������]��");
		FormName.sjcfar.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcfasj)=="") {
		alert("������[ʵ�ʳ�����ʱ��]��");
		FormName.sjcfasj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjcfasj, "ʵ�ʳ�����ʱ��"))) {
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
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_tsbxfajl.jsp";
	FormName.submit();
	return true;
}

 
//-->
</SCRIPT>
