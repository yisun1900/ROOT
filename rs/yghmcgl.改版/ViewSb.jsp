<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String bianhao=null;
String yhmc=null;
String xb=null;
String csrq=null;
String sfzszg=null;
String mz=null;
String sg=null;
String tz=null;
String xx=null;
String hf=null;
String zzmm=null;
String sjsjb=null;
String zcmc=null;
String zyzzzs=null;
String xlbm=null;
String zy=null;
String cjgzsj=null;
String xuewei=null;
String byyx=null;
String zz=null;
String yzbm=null;
String dh=null;
String bgdh=null;
String jtdh=null;
String email=null;
String sfzh=null;
String sfzdz=null;
String gznx=null;
String jjlxr=null;
String jjlxrdz=null;
String lxrdh=null;
String zwmc=null;
String xzzwbm=null;
String sfytj=null;
String tjrq=null;
String sfqs=null;
String dhsfgb=null;
String zwpj=null;
String sftlgx=null;
String ssfgs=null;
String dwbh=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sfydbs=null;
String qgzdw=null;
String wgzsj=null;
String syjzrq=null;
String gzlb=null;
String jbgz=null;
String glgz=null;
String gwgz=null;
String jtbt=null;
String cb=null;
String dhbt=null;
String kqhm=null;
String sfcjbx=null;
String hjszd=null;
String dacfd=null;
String dazrsj=null;
String dazcsj=null;
String dazchc=null;
String dabgfjs=null;
String kfgssq=null;
String rzcs=null;
String rzsj=null;
String gqpxkssj=null;
String gqpxjssj=null;
String kdlxtbz=null;
String yhjs=null;
String ckjgbz=null;
String zdyhbz=null;
String ylbx=null;
String jylbx=null;
String sybx=null;
String gsby=null;
String syx=null;
String shbxh=null;
String jbxdd=null;
String sbblsj=null;
String sbzrjs=null;
String sbzcjs=null;
String bxtjsj=null;
String bxzcsj=null;
String yjsxe=null;
double gsjbfe=0;
double grjbfe=0;
String sfjgjj=null;
String gsjgjj=null;
String grjgjj=null;
String rzxh=null;
String zzxh=null;
String zzrq=null;
String zzpzbm=null;
String lzxh=null;
String lzrq=null;
String lzyy=null;
String buzhu=null;
String khgz=null;

String ldhtbh=null;
String ldhtlx=null;
String ldhtqx=null;
String htksrq=null;
String htdqrq=null;
String sjsbh=null;

String sqdwmc="&nbsp;";

String whereygbh=null;
whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,sjsbh,ygbh,bianhao,yhmc,xb,csrq,sfzszg,mz,sg,tz,xx,hf,zzmm,sjsjb,zcmc,zyzzzs,xlbm,zy,cjgzsj,xuewei,byyx,zz,yzbm,dh,bgdh,jtdh,email,sfzh,sfzdz,gznx,jjlxr,jjlxrdz,lxrdh,zwmc,xzzwbm,sfytj,tjrq,sfqs,dhsfgb,zwpj,sftlgx,ssfgs,dwbh,lrr,lrsj,bz,sfydbs,qgzdw,wgzsj,syjzrq,gzlb,jbgz,glgz,gwgz,jtbt,cb,dhbt,kqhm,sfcjbx,hjszd,dacfd,dazrsj,dazcsj,dazchc,dabgfjs,kfgssq,rzcs,rzsj,gqpxkssj,gqpxjssj,yhjs,kdlxtbz,ckjgbz,zdyhbz,ylbx,jylbx,sybx,gsby,syx,shbxh,jbxdd,sbblsj,sbzrjs,sbzcjs,bxtjsj,bxzcsj,yjsxe,gsjbfe,grjbfe,sfjgjj,gsjgjj,grjgjj,ldhtbh,ldhtlx,ldhtqx,htksrq,htdqrq,rzxh,zzxh,zzrq,zzpzbm,lzxh,lzrq,lzyy,khgz,buzhu ";
	ls_sql+=" from  sq_yhxx,dm_zwbm";
	ls_sql+=" where sq_yhxx.zwbm=dm_zwbm.zwbm(+) and ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		ygbh=cf.fillHtml(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xb=cf.fillHtml(rs.getString("xb"));
		csrq=cf.fillHtml(rs.getDate("csrq"));
		sfzszg=cf.fillHtml(rs.getString("sfzszg"));
		mz=cf.fillHtml(rs.getString("mz"));
		sg=cf.fillHtml(rs.getString("sg"));
		tz=cf.fillHtml(rs.getString("tz"));
		xx=cf.fillHtml(rs.getString("xx"));
		hf=cf.fillHtml(rs.getString("hf"));
		zzmm=cf.fillHtml(rs.getString("zzmm"));
		sjsjb=cf.fillHtml(rs.getString("sjsjb"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zyzzzs=cf.fillHtml(rs.getString("zyzzzs"));
		xlbm=cf.fillHtml(rs.getString("xlbm"));
		zy=cf.fillHtml(rs.getString("zy"));
		cjgzsj=cf.fillHtml(rs.getDate("cjgzsj"));
		xuewei=cf.fillHtml(rs.getString("xuewei"));
		byyx=cf.fillHtml(rs.getString("byyx"));
		zz=cf.fillHtml(rs.getString("zz"));
		yzbm=cf.fillHtml(rs.getString("yzbm"));
		dh=cf.fillHtml(rs.getString("dh"));
		bgdh=cf.fillHtml(rs.getString("bgdh"));
		jtdh=cf.fillHtml(rs.getString("jtdh"));
		email=cf.fillHtml(rs.getString("email"));
		sfzh=cf.fillHtml(rs.getString("sfzh"));
		sfzdz=cf.fillHtml(rs.getString("sfzdz"));
		gznx=cf.fillHtml(rs.getString("gznx"));
		jjlxr=cf.fillHtml(rs.getString("jjlxr"));
		jjlxrdz=cf.fillHtml(rs.getString("jjlxrdz"));
		lxrdh=cf.fillHtml(rs.getString("lxrdh"));
		zwmc=cf.fillHtml(rs.getString("zwmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));
		sfytj=cf.fillHtml(rs.getString("sfytj"));
		tjrq=cf.fillHtml(rs.getDate("tjrq"));
		sfqs=cf.fillHtml(rs.getString("sfqs"));
		dhsfgb=cf.fillHtml(rs.getString("dhsfgb"));
		zwpj=cf.fillHtml(rs.getString("zwpj"));
		sftlgx=cf.fillHtml(rs.getString("sftlgx"));
		ssfgs=cf.fillHtml(rs.getString("ssfgs"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfydbs=cf.fillHtml(rs.getString("sfydbs"));
		qgzdw=cf.fillHtml(rs.getString("qgzdw"));
		wgzsj=cf.fillHtml(rs.getString("wgzsj"));
		syjzrq=cf.fillHtml(rs.getDate("syjzrq"));
		gzlb=cf.fillHtml(rs.getString("gzlb"));
		jbgz=cf.fillHtml(rs.getString("jbgz"));
		glgz=cf.fillHtml(rs.getString("glgz"));
		gwgz=cf.fillHtml(rs.getString("gwgz"));
		jtbt=cf.fillHtml(rs.getString("jtbt"));
		cb=cf.fillHtml(rs.getString("cb"));
		dhbt=cf.fillHtml(rs.getString("dhbt"));
		kqhm=cf.fillHtml(rs.getString("kqhm"));
		sfcjbx=cf.fillHtml(rs.getString("sfcjbx"));
		hjszd=cf.fillHtml(rs.getString("hjszd"));
		dacfd=cf.fillHtml(rs.getString("dacfd"));
		dazrsj=cf.fillHtml(rs.getDate("dazrsj"));
		dazcsj=cf.fillHtml(rs.getDate("dazcsj"));
		dazchc=cf.fillHtml(rs.getString("dazchc"));
		dabgfjs=cf.fillHtml(rs.getString("dabgfjs"));
		kfgssq=cf.fillHtml(rs.getString("kfgssq"));
		rzcs=cf.fillHtml(rs.getString("rzcs"));
		rzsj=cf.fillHtml(rs.getDate("rzsj"));
		gqpxkssj=cf.fillHtml(rs.getDate("gqpxkssj"));
		gqpxjssj=cf.fillHtml(rs.getDate("gqpxjssj"));
		yhjs=cf.fillHtml(rs.getString("yhjs"));
		kdlxtbz=cf.fillHtml(rs.getString("kdlxtbz"));
		ckjgbz=cf.fillHtml(rs.getString("ckjgbz"));
		zdyhbz=cf.fillHtml(rs.getString("zdyhbz"));

		ylbx=cf.fillHtml(rs.getString("ylbx"));
		jylbx=cf.fillHtml(rs.getString("jylbx"));
		sybx=cf.fillHtml(rs.getString("sybx"));
		gsby=cf.fillHtml(rs.getString("gsby"));
		syx=cf.fillHtml(rs.getString("syx"));
		shbxh=cf.fillHtml(rs.getString("shbxh"));
		jbxdd=cf.fillHtml(rs.getString("jbxdd"));
		sbblsj=cf.fillHtml(rs.getDate("sbblsj"));
		sbzrjs=cf.fillHtml(rs.getString("sbzrjs"));
		sbzcjs=cf.fillHtml(rs.getString("sbzcjs"));
		bxtjsj=cf.fillHtml(rs.getDate("bxtjsj"));
		bxzcsj=cf.fillHtml(rs.getDate("bxzcsj"));
		yjsxe=cf.fillHtml(rs.getString("yjsxe"));
		gsjbfe=rs.getDouble("gsjbfe");
		grjbfe=rs.getDouble("grjbfe");
		sfjgjj=cf.fillHtml(rs.getString("sfjgjj"));
		gsjgjj=cf.fillHtml(rs.getString("gsjgjj"));
		grjgjj=cf.fillHtml(rs.getString("grjgjj"));
		ldhtbh=cf.fillHtml(rs.getString("ldhtbh"));
		ldhtlx=cf.fillHtml(rs.getString("ldhtlx"));
		ldhtqx=cf.fillHtml(rs.getString("ldhtqx"));
		htksrq=cf.fillHtml(rs.getDate("htksrq"));
		htdqrq=cf.fillHtml(rs.getDate("htdqrq"));
		rzxh=cf.fillHtml(rs.getString("rzxh"));
		zzxh=cf.fillHtml(rs.getString("zzxh"));
		zzrq=cf.fillHtml(rs.getDate("zzrq"));
		zzpzbm=cf.fillHtml(rs.getString("zzpzbm"));
		lzxh=cf.fillHtml(rs.getString("lzxh"));
		lzrq=cf.fillHtml(rs.getDate("lzrq"));
		lzyy=cf.fillHtml(rs.getString("lzyy"));
		buzhu=cf.fillHtml(rs.getString("buzhu"));
		khgz=cf.fillHtml(rs.getString("khgz"));
	
	}
	rs.close();
	ps.close();


%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000;
	font-family: "����_GB2312";
}
.STYLE2 {color: #000000; font-family: "����_GB2312"; font-weight: bold; }
.STYLE3 {font-family: "����_GB2312"}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �籣��Ա����ţ�<%=ygbh%>��</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1">����</td>
    <td width="13%"><%=yhmc%></td>
    <td width="9%" align="right" class="STYLE1">���֤��</td>
    <td width="18%"><%=sfzh%></td>
    <td width="9%" align="right" class="STYLE1">����</td>
    <td width="13%"><%=bianhao%></td>
    <td width="11%" align="right" class="STYLE1">����ְ��</td>
    <td width="18%"><%=xzzwbm%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1"> �ֻ�</td>
    <td><%=dh%> </td>
    <td align="right" class="STYLE1">�칫�绰</td>
    <td><%=bgdh%> </td>
    <td align="right" class="STYLE1">email</td>
    <td><%=email%></td>
    <td align="right" class="STYLE1">����ְ��</td>
    <td><%
  if(zcmc=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc",zcmc,true);}
%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE1"><span class="STYLE3">������˾</span></td>
    <td><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);%></td>
    <td align="right" class="STYLE1">��������</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%></td>
    <td align="right" class="STYLE1">����С��</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
    <td align="right" class="STYLE1">��Ҫ����֤��</td>
    <td><%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs",zyzzzs,true);
%></td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" class="STYLE3">Ա��״̬</td>
    <td><%
	cf.selectToken(out,"M+ʵϰ��&Y+ת��&N+������&D+����&S+��ְ&T+����",sfzszg,true);
%></td>
    <td align="right" class="STYLE1">��ְ����</td>
    <td><%=rzsj%></td>
    <td align="right" class="STYLE1">��������</td>
    <td><%=gznx%></td>
    <td align="right" class="STYLE1">��������</td>
    <td><%=csrq%></td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="9%" align="right" class="STYLE3">��ע</td>
    <td colspan="7"><%=bz%></td>
  </tr>
</table>
<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr > 
    <td colspan="8" class="STYLE1" align="center"><b><font color="#0000CC">�籣�������</font></b></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">��ᱣ�պ�</td>
    <td width="15%"><%=shbxh%></td>
    <td align="right" width="10%" class="STYLE1">�ɱ��յص�</td>
    <td width="15%"><%=jbxdd%></td>
    <td align="right" width="10%" class="STYLE1">�籣����ʱ��</td>
    <td width="15%"><%=sbblsj%></td>
    <td align="right" width="10%" class="STYLE1">ת�����</td>
    <td width="15%"><%=sbzrjs%></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">���ɻ���</td>
    <td width="15%"><%=yjsxe%> </td>
    <td align="right" width="10%" class="STYLE1">Ӧ�ɱ���</td>
    <td width="15%"><%=cf.formatDouble(grjbfe+gsjbfe)%></td>
    <td align="right" width="10%" class="STYLE1">��˾�����Ѷ�</td>
    <td width="15%"><%=gsjbfe%> </td>
    <td align="right" width="10%" class="STYLE1">���˽����Ѷ�</td>
    <td width="15%"><%=grjbfe%></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">�Ƿ�μӱ���</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+�α�&N+δ����&T+ͣ��&Z+ת��",sfcjbx,true);
%></td>
    <td align="right" width="10%" class="STYLE1">����ͣ��ʱ��</td>
    <td width="15%"><%=bxtjsj%></td>
    <td align="right" width="10%" class="STYLE1">����ת��ʱ��</td>
    <td width="15%"><%=bxzcsj%></td>
    <td align="right" width="10%" class="STYLE1">ת������</td>
    <td width="15%"><%=sbzcjs%></td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">ҽ�Ʊ���</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+�ѽ�&N+δ��",ylbx,true);
%> </td>
    <td align="right" width="10%" class="STYLE1">���ϱ���</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+�ѽ�&N+δ��",jylbx,true);
%> </td>
    <td align="right" width="10%" class="STYLE1">ʧҵ����</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+�ѽ�&N+δ��",sybx,true);
%> </td>
    <td align="right" width="10%" class="STYLE1">���˱���</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+�ѽ�&N+δ��",gsby,true);
%> </td>
  </tr>
  <tr > 
    <td align="right" width="10%" class="STYLE1">������������</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+�ѽ�&N+δ��",syx,true);
%></td>
    <td align="right" width="10%" class="STYLE1">ס��������</td>
    <td width="15%"><%
	cf.radioToken(out, "Y+�ѽ�&N+δ��",sfjgjj,true);
%></td>
    <td align="right" width="10%" class="STYLE1">��˾��������</td>
    <td width="15%"><%=gsjgjj%></td>
    <td align="right" width="10%" class="STYLE1">���˽�������</td>
    <td width="15%"><%=grjgjj%></td>
  </tr>
</table>
<table border="1" width="160%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr align="center">
	<td  width="4%">�����¼��</td>
	<td  width="3%">����</td>
	<td  width="6%">��ᱣ�պ�</td>
	<td  width="5%">�籣����ʱ��</td>
	<td  width="3%">ҽ��</td>
	<td  width="3%">����</td>
	<td  width="3%">ʧҵ</td>
	<td  width="3%">����</td>
	<td  width="3%">����</td>
	<td  width="6%">�ɱ��յص�</td>
	<td  width="4%">ת�����</td>
	<td  width="5%">����ͣ��ʱ��</td>
	<td  width="5%">����ת��ʱ��</td>
	<td  width="5%">���ɻ���</td>
	<td  width="5%">��˾�����Ѷ�</td>
	<td  width="5%">���˽����Ѷ�</td>
	<td  width="3%">������</td>
	<td  width="5%">��˾��������</td>
	<td  width="5%">���˽�������</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="11%">��ע</td>
</tr>
<%
	String sbbljlh=null;
	String lx=null;

	ls_sql="SELECT rs_sbbljl.sbbljlh,DECODE(rs_sbbljl.lx,'1','����','2','���','2','ͣ��','3','ת��') lx,rs_sbbljl.shbxh,rs_sbbljl.sbblsj, DECODE(rs_sbbljl.ylbx,'Y','��','N','��') ylbx, DECODE(rs_sbbljl.jylbx,'Y','��','N','��') jylbx, DECODE(rs_sbbljl.sybx,'Y','��','N','��') sybx, DECODE(rs_sbbljl.gsby,'Y','��','N','��') gsby, DECODE(rs_sbbljl.syx,'Y','��','N','��') syx,rs_sbbljl.jbxdd,rs_sbbljl.sbzrjs,rs_sbbljl.bxtjsj,rs_sbbljl.bxzcsj,rs_sbbljl.yjsxe,rs_sbbljl.gsjbfe,rs_sbbljl.grjbfe, DECODE(rs_sbbljl.sfjgjj,'Y','��','N','��') sfjgjj,rs_sbbljl.gsjgjj,rs_sbbljl.grjgjj,rs_sbbljl.lrr,rs_sbbljl.lrsj,rs_sbbljl.bz   ";
	ls_sql+=" FROM rs_sbbljl  ";
    ls_sql+=" where rs_sbbljl.ygbh="+whereygbh;
    ls_sql+=" order by rs_sbbljl.sbbljlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sbbljlh=cf.fillNull(rs.getString("sbbljlh"));
		lx=cf.fillNull(rs.getString("lx"));
		shbxh=cf.fillNull(rs.getString("shbxh"));
		sbblsj=cf.fillNull(rs.getDate("sbblsj"));
		ylbx=cf.fillNull(rs.getString("ylbx"));
		jylbx=cf.fillNull(rs.getString("jylbx"));
		sybx=cf.fillNull(rs.getString("sybx"));
		gsby=cf.fillNull(rs.getString("gsby"));
		syx=cf.fillNull(rs.getString("syx"));
		jbxdd=cf.fillNull(rs.getString("jbxdd"));
		sbzrjs=cf.fillHtml(rs.getString("sbzrjs"));
		bxtjsj=cf.fillHtml(rs.getDate("bxtjsj"));
		bxzcsj=cf.fillHtml(rs.getDate("bxzcsj"));
		yjsxe=cf.fillNull(rs.getString("yjsxe"));
		gsjbfe=rs.getDouble("gsjbfe");
		grjbfe=rs.getDouble("grjbfe");
		sfjgjj=cf.fillNull(rs.getString("sfjgjj"));
		gsjgjj=cf.fillNull(rs.getString("gsjgjj"));
		grjgjj=cf.fillNull(rs.getString("grjgjj"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
%>
	<tr align="center">
	<td ><%=sbbljlh%></td>
	<td ><%=lx%></td>
	<td ><%=shbxh%></td>
	<td ><%=sbblsj%></td>
	<td ><%=ylbx%></td>
	<td ><%=jylbx%></td>
	<td ><%=sybx%></td>
	<td ><%=gsby%></td>
	<td ><%=syx%></td>
	<td ><%=jbxdd%></td>
	<td ><%=sbzrjs%></td>
	<td ><%=bxtjsj%></td>
	<td ><%=bxzcsj%></td>
	<td ><%=yjsxe%></td>
	<td ><%=gsjbfe%></td>
	<td ><%=grjbfe%></td>
	<td ><%=sfjgjj%></td>
	<td ><%=gsjgjj%></td>
	<td ><%=grjgjj%></td>
	<td ><%=lrr%></td>
	<td ><%=lrsj%></td>
	<td ><%=bz%></td>
	</tr>
<%
	}
	rs.close();
	ps.close();

%>
</table>
</body>
</html>

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
