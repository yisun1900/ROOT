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

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql="select dwmc";
		ls_sql+=" from  sq_sqfgs,sq_dwxx";
		ls_sql+=" where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sqdwmc+=rs.getString("dwmc")+"��";
		}
		rs.close();
		ps.close();
	}
	if (kfgssq.equals("3") || kfgssq.equals("4") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql="select dwmc";
		ls_sql+=" from  sq_sqbm,sq_dwxx";
		ls_sql+=" where sq_sqbm.dwbh=sq_dwxx.dwbh and sq_sqbm.ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			sqdwmc+=rs.getString("dwmc")+"��";
		}
		rs.close();
		ps.close();
	}

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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> Ա���ǼǱ�Ա����ţ�<%=ygbh%>��
  <input type="button" value="�Ͷ���ͬ" onclick="window.open('ViewLdht.jsp?ygbh=<%=ygbh%>')">
  <input type="button" value="����" onclick="window.open('ViewGz.jsp?ygbh=<%=ygbh%>')">
  <input type="button" value="�籣" onclick="window.open('ViewSb.jsp?ygbh=<%=ygbh%>')">
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ���� </td>
    <td width="15%"><%=yhmc%> </td>
    <td width="10%" align="right" class="STYLE1"> �Ա� </td>
    <td width="20%"><%
	cf.selectToken(out,"M+��&W+Ů",xb,true);
%> </td>
    <td width="10%" align="right" class="STYLE1"> �������� </td>
    <td width="15%"><%=csrq%> </td>
    <td colspan="2" rowspan="4"><img name="zhaopian" src="/rs/yghmcgl/images/<%=bianhao%>.JPG" height="91"></td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ���� </td>
    <td width="15%"><%=mz%> </td>
    <td width="10%" align="right" class="STYLE1"> ��� </td>
    <td width="20%"><%=sg%> <span class="STYLE1">(cm)</span></td>
    <td width="10%" align="right" class="STYLE1"><strong> Ա��״̬ </strong></td>
    <td width="15%"><%
	cf.selectToken(out,"M+ʵϰ��&Y+ת��&N+������&D+����&S+��ְ&T+����",sfzszg,true);
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ���� </td>
    <td width="15%"><%=tz%><span class="STYLE1">(KG)</span> </td>
    <td width="10%" align="right" class="STYLE1"> Ѫ�� </td>
    <td width="20%"><%
  if(xx=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.selectToken(out,"1+A��&2+B��&3+AB��&4+O��",xx,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> ��� </td>
    <td width="15%"><%
  if(hf=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"Y+��&N+��",hf,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ������ò </td>
    <td width="15%"><%
  if(zzmm=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"0+Ⱥ��&1+�й���Ա&2+������Ա&3+��������",zzmm,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1">����ְ��</td>
    <td width="20%"><%
  if(zcmc=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc",zcmc,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> ��Ҫ����֤�� </td>
    <td width="15%"><%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs",zyzzzs,true);
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> �Ļ��̶� </td>
    <td width="15%"><%
  if(xlbm=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm",xlbm,false);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> ��ѧרҵ </td>
    <td width="20%"><%=zy%> </td>
    <td width="10%" align="right" class="STYLE1"> ��ҵʱ�� </td>
    <td width="15%"><%=cjgzsj%> </td>
    <td width="10%" align="right" class="STYLE1"> ѧλ </td>
    <td width="15%"><%
  if(xuewei=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"0+��&1+ѧʿѧλ&2+˶ʿѧλ&3+��ʿѧλ",xuewei,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ��ҵԺУ </td>
    <td colspan="3"><%=byyx%> </td>
    <td width="10%" align="right" class="STYLE1"> �������� </td>
    <td width="15%"><%=gznx%> </td>
    <td width="10%" align="right" class="STYLE1"> �Ƿ������ϵ </td>
    <td width="15%"><%
	cf.radioToken(out, "Y+��&N+��",sftlgx,true);
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ��ϸסַ </td>
    <td colspan="3"><%=zz%> </td>
    <td width="10%" align="right" class="STYLE1"> �������� </td>
    <td width="15%"><%=yzbm%> </td>
    <td width="10%" align="right" class="STYLE1"> email </td>
    <td width="15%"><%=email%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> �ֻ�</td>
    <td width="15%"><%=dh%> </td>
    <td width="10%" align="right" class="STYLE1">�칫�绰</td>
    <td width="20%"><%=bgdh%> </td>
    <td width="10%" align="right" class="STYLE1">��ͥ�绰</td>
    <td width="15%"><%=jtdh%> </td>
    <td width="10%" align="right" class="STYLE1"> �绰�Ƿ񹫲� </td>
    <td width="15%"><%
  if(dhsfgb=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.radioToken(out, "1+����˾&2+������&9+������",dhsfgb,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE2"> ���֤�� </td>
    <td width="15%"><%=sfzh%> </td>
    <td width="10%" align="right" class="STYLE1"> ���֤��ַ </td>
    <td colspan="3"><%=sfzdz%></td>
    <td width="10%" align="right" class="STYLE1">����</td>
    <td width="15%"><%=bianhao%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1">������ϵ�� </td>
    <td width="15%"><%=jjlxr%> </td>
    <td width="10%" align="right" class="STYLE1"> ��ϵ��סַ </td>
    <td colspan="3"><%=jjlxrdz%> </td>
    <td width="10%" align="right" class="STYLE1"> ��ϵ�˵绰 </td>
    <td width="15%"><%=lxrdh%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> �Ƿ�ȹ����ϵ </td>
    <td width="15%"><%
  if(sfqs=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.radioToken(out, "Y+��&N+��",sfqs,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> ���ʦְ�� </td>
    <td width="20%"><%
  if(sjsjb=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sjsjb,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> �Ƿ������ </td>
    <td width="15%"><%
  if(sfytj=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {	cf.radioToken(out, "Y+��&N+��",sfytj,true);}
%> </td>
    <td width="10%" align="right" class="STYLE1"> ������� </td>
    <td width="15%"><%=tjrq%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ҵ��ר��<br>
      �������� </td>
    <td colspan="7"><%=zwpj%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%"> 
      <div align="right" class="STYLE1">�û���ɫ</div>    </td>
    <td width="15%"><%
  if(yhjs=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.selectToken(out,"A0+�ܲ�&A1+�ܲ�������&F0+�ֹ�˾&F1+�ֹ�˾������&F2+����&F3+����С��&G0+��Ӧ��&J0+������",yhjs,true);}
%> </td>
    <td width="10%"> 
      <div align="right" class="STYLE1">�ɵ�½��־</div>    </td>
    <td width="20%"><%
	cf.radioToken(out, "Y+�ɵ�½&N+���ɵ�½",kdlxtbz,true);
%> </td>
    <td width="10%"> 
      <div align="right" class="STYLE1">�鿴�۸���ϸ</div>    </td>
    <td width="15%"><%
  if(ckjgbz=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.radioToken(out, "Y+�ɿ�&N+���ɿ�",ckjgbz,true);}
%> </td>
    <td width="10%"> 
      <div align="right" class="STYLE1">�ص��û���־</div>    </td>
    <td width="15%"><%
  if(zdyhbz=="&nbsp;"){
	out.println("&nbsp;");}
  else
  {cf.radioToken(out, "Y+��&N+��",zdyhbz,true);}
%> </td>
  </tr>
  <tr bgcolor="#E0F5FF"> 
    <td width="10%" align="right" class="STYLE1"> ¼���� </td>
    <td width="15%"><%=lrr%> </td>
    <td width="10%" align="right" class="STYLE1"> ¼��ʱ�� </td>
    <td width="20%"><%=lrsj%> </td>
    <td width="10%" align="right" class="STYLE1"> ��ע </td>
    <td width="15%" colspan="3"><%=bz%> </td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#000099">�ͻ�������Ȩ��Χ</font></b></td>
  </tr>
  <tr > 
    <td colspan="2" align="center"> <b><%
	cf.selectToken(out,"0+����Ȩ&1+��Ȩ�����ֹ�˾&2+��Ȩ����ֹ�˾&3+��Ȩ��������&4+��Ȩĳһ�ֹ�˾�������&5+��Ȩ����ֹ�˾�������",kfgssq,true);
%> </b></td>
    <td colspan="6"><%=sqdwmc%></td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#000099">��ְ</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE2">������˾</td>
    <td width="15%"><%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);%></td>
    <td width="10%" align="right" class="STYLE2">��������</td>
    <td width="20%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%></td>
    <td width="10%" align="right" class="STYLE1">����С��</td>
    <td width="15%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%> </td>
    <td width="10%" align="right" class="STYLE2">����ְ��</td>
    <td width="15%"><%=xzzwbm%></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1">��ְ���</td>
    <td width="15%"><%=rzxh%></td>
    <td width="10%" align="right" class="STYLE1">�Ƿ��е�����</td>
    <td width="20%"><%
	cf.radioToken(out, "Y+��&N+��",sfydbs,true);
%></td>
    <td width="10%" align="right" class="STYLE1">��ǰ��ѵ ��</td>
    <td width="15%"><%=gqpxkssj%></td>
    <td width="10%" align="right" class="STYLE1">��ǰ��ѵ ��</td>
    <td width="15%"><%=gqpxjssj%></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> ��ְ���� </td>
    <td width="15%"><%=rzsj%> </td>
    <td width="10%" align="right" class="STYLE1"> ��ְ���� </td>
    <td width="20%"><%=rzcs%> </td>
    <td width="10%" align="right" class="STYLE1">���ý������� </td>
    <td width="15%"><%=syjzrq%> </td>
    <td width="10%" align="right" class="STYLE1"> ǰ������λ </td>
    <td width="15%"><%=qgzdw%> </td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> δ����ʱ�� </td>
    <td width="15%"><%=wgzsj%> <span class="STYLE1">(��)</span></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td width="15%" align="center">&nbsp;</td>
    <td align="right"><strong>����</strong></td>
    <td width="15%"><%=zwmc%></td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#0000CC">ת��</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> ת����� </td>
    <td width="15%"><%=zzxh%> </td>
    <td width="10%" align="right" class="STYLE1"> ת������ </td>
    <td width="20%"><%=zzrq%> </td>
    <td width="10%" align="right" class="STYLE1"> ת����׼���� </td>
    <td width="15%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zzpzbm+"'",zzpzbm,true);%>    </td>
    <td width="10%" align="right" class="STYLE1">&nbsp;</td>
    <td width="15%" align="center">&nbsp;</td>
  </tr>
  <tr > 
    <td colspan="8" height="25" class="STYLE1" align="center"><b><font color="#0000CC">��ְ</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1">��ְ��� </td>
    <td width="15%"><%=lzxh%></td>
    <td width="10%" align="right" class="STYLE1">��ְ���� </td>
    <td width="20%"><%=lzrq%> </td>
    <td width="10%" align="right" class="STYLE1">��ְԭ��</td>
    <td colspan="3"> <%=lzyy%> </td>
  </tr>
  <tr > 
    <td colspan="8" class="STYLE1" align="center"><b><font color="#0000CC">�����������</font></b></td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> �������ڵ� </td>
    <td colspan="3"><%=hjszd%> </td>
    <td width="10%" align="right" class="STYLE1"> ������ŵ� </td>
    <td colspan="3"><%=dacfd%> </td>
  </tr>
  <tr > 
    <td width="10%" align="right" class="STYLE1"> ����ת��ʱ�� </td>
    <td width="15%"><%=dazrsj%> </td>
    <td width="10%" align="right" class="STYLE1"> ����ת��ʱ�� </td>
    <td width="20%"><%=dazcsj%> </td>
    <td width="10%" align="right" class="STYLE1"> ����ת���δ� </td>
    <td width="15%"><%=dazchc%> </td>
    <td width="10%" align="right" class="STYLE1"> ���ܷѽ��� </td>
    <td width="15%"><%
	cf.radioToken(out, "N+δ����&Y+����",dabgfjs,true);
%> </td>
  </tr>
</table>
<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
<%
	String kssj=null;
	String jzsj=null;
	String jyjg=null;
	String jysm=null;
	int count=0;

	ls_sql="select count(*) count";
	ls_sql+=" from  rs_jyjl";
	ls_sql+=" where (1=1) and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt("count");
	}
	rs.close();
	ps.close();
%>
<tr >
<td width="10%" rowspan="<%=count+1%>" align="center">��������</td>
<td width="15%" align="center" >��ʼʱ��</td>
<td width="10%" align="center" >����ʱ��</td>
<td width="25%" align="center" >��������</td>
<td width="40%" align="center" >����˵��</td>
</tr>
<%
	ls_sql="select kssj,jzsj,jyjg,jysm";
	ls_sql+=" from  rs_jyjl";
	ls_sql+=" where ygbh="+whereygbh;
	ls_sql+=" order by kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		kssj=cf.fillHtml(rs.getDate("kssj"));
		jzsj=cf.fillHtml(rs.getDate("jzsj"));
		jyjg=cf.fillHtml(rs.getString("jyjg"));
		jysm=cf.fillHtml(rs.getString("jysm"));
%>
	<tr >
	<td align="center"><%=kssj%></td>
	<td align="center"><%=jzsj%></td>
	<td align="center"><%=jyjg%></td>
	<td align="center"><%=jysm%></td>
	</tr>
<%
	}
	rs.close();
	ps.close();

%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
<%
	String sjd=null;
	String gzdwbm=null;
	String drzw=null;
	String dwdh=null;
	String zmr=null;


	ls_sql="select count(*) count";
	ls_sql+=" from  rs_gzjl";
	ls_sql+=" where (1=1) and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt("count");
	}
	rs.close();
	ps.close();
%>
<tr >
<td width="10%" rowspan="<%=count+1%>" align="center">��������</td>
<td width="15%" align="center" >ʱ���</td>
<td width="25%" align="center" >������λ�β���</td>
<td width="10%" align="center" >����ְ��</td>
<td width="20%" align="center" >��λ�绰</td>
<td width="20%" align="center" >֤����</td>
</tr>
<%
	ls_sql="select sjd,gzdwbm,drzw,dwdh,zmr";
	ls_sql+=" from  rs_gzjl";
	ls_sql+=" where ygbh="+whereygbh;
	ls_sql+=" order by sjd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sjd=cf.fillHtml(rs.getString("sjd"));
		gzdwbm=cf.fillHtml(rs.getString("gzdwbm"));
		drzw=cf.fillHtml(rs.getString("drzw"));
		dwdh=cf.fillHtml(rs.getString("dwdh"));
		zmr=cf.fillHtml(rs.getString("zmr"));
%>
	<tr >
	<td align="center"><%=sjd%></td>
	<td align="center"><%=gzdwbm%></td>
	<td align="center"><%=drzw%></td>
	<td align="center"><%=dwdh%></td>
	<td align="center"><%=zmr%></td>
	</tr>
<%
	}
	rs.close();
	ps.close();
%>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
<%
	String xm=null;
	String gx=null;
	String csnf=null;
	String gzdw=null;
	String zw=null;
	String lxdh=null;


	ls_sql="select count(*) count";
	ls_sql+=" from  rs_jtzl";
	ls_sql+=" where (1=1) and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt("count");
	}
	rs.close();
	ps.close();
%>
<tr >
<td width="10%" rowspan="<%=count+1%>" align="center">��ͥ����</td>
<td width="15%" align="center" >��������</td>
<td width="15%" align="center" >�뱾�˹�ϵ</td>
<td width="10%" align="center" >�������</td>
<td width="25%" align="center" >������λ</td>
<td width="10%" align="center" >ְ��</td>
<td width="15%" align="center" >��ϵ�绰</td>
</tr>
<%
	ls_sql="select xm,gx,csnf,gzdw,zw,lxdh";
	ls_sql+=" from  rs_jtzl";
	ls_sql+=" where ygbh="+whereygbh;
	ls_sql+=" order by gx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xm=cf.fillHtml(rs.getString("xm"));
		gx=cf.fillHtml(rs.getString("gx"));
		csnf=cf.fillHtml(rs.getString("csnf"));
		gzdw=cf.fillHtml(rs.getString("gzdw"));
		zw=cf.fillHtml(rs.getString("zw"));
		lxdh=cf.fillHtml(rs.getString("lxdh"));
%>
	<tr >
	<td align="center"><%=xm%></td>
	<td align="center"><%=gx%></td>
	<td align="center"><%=csnf%></td>
	<td align="center"><%=gzdw%></td>
	<td align="center"><%=zw%></td>
	<td align="center"><%=lxdh%></td>
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
