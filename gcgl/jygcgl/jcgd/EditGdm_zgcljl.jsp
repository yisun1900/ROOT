<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));

String ssfgs=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String dwmc=null;
String zjxm=null;
String sjkgrq=null;
String sjjgrq=null;


String khbh=null;
String xjr=null;
String xjsj=null;
String xxlymc=null;
String jclxmc=null;
String jcjgmc=null;
String jcwtflmc=null;
String sffszg=null;
String zrbm=null;
String zrbmmc=null;
String zrr=null;
double jlje=0;
String lrr=null;
String lrsj=null;
String bz=null;

String clzt=null;
String jssj=null;
String jsr=null;
String jssm=null;
String jhcfasj=null;
String jhjjsj=null;

String shr=null;
String shsj=null;
String shsm=null;

String cfajlh=null;
String jjfa=null;
String sjcfar=null;
String sjcfasj=null;

String shjl="&nbsp;";

String cljlh=null;
String clqk=null;
String clr=null;
String clsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdm_gdjcjl.jlje,khbh,xjr,xjsj,xxlymc,jclxmc,jcjgmc,jcwtflmc,DECODE(sffszg,'Y','����','N','δ����') sffszg,gdm_gdjcjl.dwbh,dwmc,gdm_gdjcjl.zrr,lrr,lrsj,gdm_gdjcjl.bz ";
	ls_sql+=" ,gdm_gdjcjl.clzt,gdm_gdjcjl.jssm,gdm_gdjcjl.jhcfasj,gdm_gdjcjl.jhjjsj,gdm_gdjcjl.jssj,gdm_gdjcjl.jsr";
	ls_sql+=" ,shr,shsj,shsm";
	ls_sql+=" ,cfajlh,jjfa,sjcfar,sjcfasj";
	ls_sql+=" ,cljlh,clqk,clr,clsj";
	ls_sql+=" from  gdm_gdjcjl,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm,sq_dwxx";
	ls_sql+=" where gdm_gdjcjl.jcjlh='"+jcjlh+"'";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
    ls_sql+=" and gdm_gdjcjl.dwbh=sq_dwxx.dwbh(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		jssm=cf.fillNull(rs.getString("jssm"));
		jhcfasj=cf.fillNull(rs.getDate("jhcfasj"));
		jhjjsj=cf.fillHtml(rs.getDate("jhjjsj"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));

		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shsm=cf.fillHtml(rs.getString("shsm"));

		cfajlh=cf.fillHtml(rs.getString("cfajlh"));
		jjfa=cf.fillHtml(rs.getString("jjfa"));
		sjcfar=cf.fillHtml(rs.getString("sjcfar"));
		sjcfasj=cf.fillHtml(rs.getDate("sjcfasj"));

		cljlh=cf.fillNull(rs.getString("cljlh"));
		clqk=cf.fillNull(rs.getString("clqk"));
		clr=cf.fillNull(rs.getString("clr"));
		clsj=cf.fillNull(rs.getDate("clsj"));

		jlje=rs.getDouble("jlje");
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xxlymc=cf.fillNull(rs.getString("xxlymc"));
		jcjgmc=cf.fillNull(rs.getString("jcjgmc"));
		jclxmc=cf.fillNull(rs.getString("jclxmc"));
		jcwtflmc=cf.fillNull(rs.getString("jcwtflmc"));
		sffszg=cf.fillNull(rs.getString("sffszg"));
		zrbm=cf.fillNull(rs.getString("dwbh"));
		zrbmmc=cf.fillNull(rs.getString("dwmc"));
		zrr=cf.fillNull(rs.getString("zrr"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("9"))//9���������ͨ��
	{
		shjl="Y";
	}
	else if (clzt.equals("A"))//A���������δͨ��
	{
		shjl="N";
	}

	ls_sql="select clzt";
	ls_sql+=" from  gdm_zgcljl";
	ls_sql+=" where cljlh='"+cljlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	ls_sql="select hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,dwmc,zjxm,sjkgrq,sjjgrq,crm_khxx.fgsbh";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		ssfgs=cf.fillHtml(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>�����޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">�����޸ģ�����¼�ţ�<%=jcjlh%>�� </div>

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
    <td width="32%"> <%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">�绰</font></td>
    <td><%=lxfs%></td>
    <td align="right"><font color="#0000CC">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">���ʦ</font>    </td>
    <td width="33%"> <%=sjs%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">���̵���</font>    </td>
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
<BR>
<center>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr bgcolor="#FFFFFF">
      <td align="right">��Ϣ��Դ</td>
      <td><%=xxlymc%></td>
      <td align="right">������� </td>
      <td><%=jclxmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">����� </td>
      <td width="32%"><%=jcjgmc%></td>
      <td width="18%" align="right">�������</td>
      <td width="32%"><%=jcwtflmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ�������</td>
      <td><%=sffszg%></td>
      <td align="right">�������</td>
      <td><%=jlje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">���β���</td>
      <td><%=zrbmmc%></td>
      <td align="right">������</td>
      <td><%=zrr%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">����� </td>
      <td width="32%"><%=xjr%>
      </td><td width="18%" align="right">���ʱ�� </td>
      <td width="32%"><%=xjsj%>
      </td></tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">¼���� </td>
      <td width="32%"><%=lrr%>
      </td><td width="18%" align="right">¼��ʱ�� </td>
      <td width="32%"><%=lrsj%>
      </td></tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">��ע</td>
      <td colspan="3"><%=bz%>
      </td></tr>
  </table>

<BR>
<table border="1" width="95%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">��ĿС��</td>
	<td  width="5%">��Ŀ����</td>
	<td  width="15%">��Ŀ����</td>
	<td  width="5%">Υ�漶��</td>
	<td  width="7%">����Ҫ��</td>
	<td  width="7%">������Աְ��</td>
	<td  width="5%">������Ա</td>
	<td  width="5%">Ա���۷�</td>
	<td  width="5%">Ա������</td>
	<td  width="5%">ʩ���ӿ۷�</td>
	<td  width="5%">ʩ���ӷ���</td>
	<td  width="5%">Υ�´���</td>
	<td  width="85%">��ע</td>
</tr>
<%
	String mx_xmxlmc=null;
	String mx_xmbm=null;
	String mx_xmmc=null;
	String mx_wgjbmc=null;
	String mx_zgyq=null;
	String mx_xzzwbm=null;
	String mx_yhmc=null;
	String mx_ygkf=null;
	String mx_ygfkje=null;
	String mx_sgdkf=null;
	String mx_sgdfkje=null;
	String mx_wzcs=null;
	String mx_bz=null;

	ls_sql="SELECT xmxlmc,xmbm,xmmc,wgjbmc,zgyq,xzzwbm,yhmc,ygkf,ygfkje,sgdkf,sgdfkje,wzcs,bz  ";
	ls_sql+=" FROM gdm_jcjlmx  ";
    ls_sql+=" where gdm_jcjlmx.jcjlh='"+jcjlh+"'";
    ls_sql+=" order by xmdlbm,xmxlbm,xmbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		mx_xmxlmc=cf.fillNull(rs.getString("xmxlmc"));
		mx_xmbm=cf.fillNull(rs.getString("xmbm"));
		mx_xmmc=cf.fillNull(rs.getString("xmmc"));
		mx_wgjbmc=cf.fillNull(rs.getString("wgjbmc"));
		mx_zgyq=cf.fillNull(rs.getString("zgyq"));
		mx_xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		mx_yhmc=cf.fillHtml(rs.getString("yhmc"));
		mx_ygkf=cf.fillNull(rs.getString("ygkf"));

		mx_ygfkje=cf.fillHtml(rs.getString("ygfkje"));
		mx_sgdkf=cf.fillHtml(rs.getString("sgdkf"));
		mx_sgdfkje=cf.fillHtml(rs.getString("sgdfkje"));
		mx_wzcs=cf.fillHtml(rs.getString("wzcs"));
		mx_bz=cf.fillHtml(rs.getString("bz"));

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=mx_xmxlmc%></td>
			<td><%=mx_xmbm%></td>
			<td><%=mx_xmmc%></td>
			<td><%=mx_wgjbmc%></td>
			<td><%=mx_zgyq%></td>
			<td><%=mx_xzzwbm%></td>
			<td><%=mx_yhmc%></td>
			<td><%=mx_ygkf%></td>
			<td><%=mx_ygfkje%></td>
			<td><%=mx_sgdkf%></td>
			<td><%=mx_sgdfkje%></td>
			<td><%=mx_wzcs%></td>
			<td align="left"><%=mx_bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>

</table>


<BR>

<table width="95%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>�漰����</strong></td>
	<td width="6%"><strong>���</strong></td>
	<td width="8%"><strong>������ʱ��</strong></td>
	<td width="8%"><strong>�ƻ����ʱ��</strong></td>
	<td width="53%"><strong>�������</strong></td>
  </tr>
<%
	String fa_dwmc="";
	String fa_cfajlh="";
	String fa_sjcfasj="";
	String fa_sjcfar="";
	String fa_jhjjsj="";
	String fa_jjfa="";
	String fa_shjl="";

	ls_sql="select dwmc ";
	ls_sql+=" ,DECODE(gdm_zgfajl.shjl,'Y','ͨ��','N','δͨ��','δ���') shjl,gdm_zgfajl.cfajlh,gdm_zgfajl.sjcfasj,gdm_zgfajl.sjcfar,gdm_zgfajl.jhjjsj,gdm_zgfajl.jjfa";
	ls_sql+=" from  sq_dwxx,gdm_zgfajl";
	ls_sql+=" where gdm_zgfajl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and gdm_zgfajl.jcjlh='"+jcjlh+"'";
	ls_sql+=" order by gdm_zgfajl.cfajlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fa_dwmc=cf.fillNull(rs.getString("dwmc"));
		fa_cfajlh=cf.fillHtml(rs.getString("cfajlh"));
		fa_sjcfasj=cf.fillHtml(rs.getDate("sjcfasj"));
		fa_sjcfar=cf.fillHtml(rs.getString("sjcfar"));
		fa_jhjjsj=cf.fillHtml(rs.getDate("jhjjsj"));
		fa_jjfa=cf.fillHtml(rs.getString("jjfa"));
		fa_shjl=cf.fillHtml(rs.getString("shjl"));

		%>
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=fa_dwmc%></td>
			<td><%=fa_shjl%></td>
			<td><%=fa_sjcfasj%></td>
			<td><%=fa_jhjjsj%></td>
			<td align="left"><%=fa_jjfa%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();


%> 
</table>


<BR>

<table width="95%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#E8E8FF" align="center"> 
	<td width="12%"><strong>�漰����</strong></td>
	<td width="6%"><strong>����״̬</strong></td>
	<td width="69%"><strong>�������</strong></td>
	<td width="8%"><strong>����ʱ��</strong></td>
	<td width="6%"><strong>������</strong></td>
  </tr>
<%
	String cl_dwmc=null;
	String cl_cljlh=null;
	String cl_clr=null;
	String cl_clsj=null;
	String cl_clqk=null;
	String cl_clzt=null;

	ls_sql =" select dwmc";
	ls_sql+=" ,gdm_zgcljl.cljlh,gdm_zgcljl.clr,gdm_zgcljl.clsj,gdm_zgcljl.clqk,DECODE(gdm_zgcljl.clzt,'2','δ���','3','�ѽ��') clzt";
	
	ls_sql+=" from  sq_dwxx,gdm_zgcljl";
	ls_sql+=" where gdm_zgcljl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and gdm_zgcljl.jcjlh='"+jcjlh+"'";
	ls_sql+=" order by gdm_zgcljl.cljlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cl_dwmc=cf.fillNull(rs.getString("dwmc"));
		cl_cljlh=cf.fillNull(rs.getString("cljlh"));
		cl_clr=cf.fillNull(rs.getString("clr"));
		cl_clsj=cf.fillNull(rs.getDate("clsj"));
		cl_clqk=cf.fillNull(rs.getString("clqk"));
		cl_clzt=cf.fillNull(rs.getString("clzt"));

		%> 
          <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=cl_dwmc%></td>
            <td ><%=cl_clzt%></td>
            <td align="left"><%=cl_clqk%></td>
            <td ><%=cl_clsj%></td>
            <td ><%=cl_clr%></td>
          </tr>
		<%
	}
	rs.close();
	ps.close();


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
</table>

</center>


<form method="post" action="SaveEditGdm_zgcljl.jsp" name="editform"  >
        <div align="center"><b>�����޸�</b>�������¼�ţ�<%=cljlh%>��</div>
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">���β���</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	   cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zrbm+"'",zrbm);
%> 
        </select>      </td>
      <td width="17%" align="right">&nbsp;</td>
      <td width="33%"><strong><font color="#FF0000">
      <input name="button" type="button" onClick="window.open('CKPhoto.jsp?jcjlh=<%=jcjlh%>')"  value="�鿴�ֳ���Ƭ"  >
      </font></strong></td>
    </tr>
    <tr>
      <td align="right"><font color="#0000CC">�ƻ�������ʱ��</font></td>
      <td><%=jhcfasj%></td>
      <td align="right"><font color="#0000CC">�ƻ����ʱ��</font></td>
      <td><%=jhjjsj%></td>
    </tr>
    <tr>
      <td align="right">������</td>
      <td><%=jsr%></td>
      <td align="right">����ʱ��</td>
      <td><%=jssj%></td>
    </tr>
    <tr>
      <td align="right">����˵��</td>
      <td colspan="3"><%=jssm%></td>
    </tr>
    <tr>
      <td align="right">�ƻ����ʱ��</td>
      <td><%=jhjjsj%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">�������</td>
      <td colspan="3"><%=jjfa%></td>
    </tr>
    <tr>
      <td align="right">ʵ�ʳ�������</td>
      <td><%=sjcfar%> </td>
      <td align="right">ʵ�ʳ�����ʱ��</td>
      <td><%=sjcfasj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">���������</td>
      <td><%=shr%> </td>
      <td align="right">�������ʱ��</td>
      <td><%=shsj%> </td>
    </tr>
    <tr>
      <td align="right">������˽���</td>
      <td colspan="3"><%
	cf.radioToken(out,"Y+ͨ��&N+δͨ��",shjl,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">�������˵��</td>
      <td colspan="3"><%=shsm%></td>
    </tr>
    <tr>
      <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>����״̬</td>
      <td><%
	cf.radioToken(out, "clzt","2+δ���&3+�ѽ��",clzt);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�������</td>
      <td colspan="3"><textarea name="clqk" cols="71" rows="9"><%=clqk%></textarea>      </td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>������</td>
      <td><input type="text" name="clr" value="<%=clr%>" size="20" maxlength="20" >      </td>
      <td align="right"><font color="#FF0000">*</font>����ʱ��</td>
      <td><input type="text" name="clsj" value="<%=clsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
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
        <input type="hidden" name="jcjlh" value="<%=jcjlh%>" >
		<input type="hidden" name="cljlh" value="<%=cljlh%>" >
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
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("������[����¼��]��");
		FormName.jcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.cljlh)=="") {
		alert("������[�����¼��]��");
		FormName.cljlh.focus();
		return false;
	}

	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[����״̬]��");
		FormName.clzt[0].focus();
		return false;
	}

	if(	javaTrim(FormName.clr)=="") {
		alert("������[������]��");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("������[����ʱ��]��");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.clqk)=="") {
		alert("������[�������]��");
		FormName.clqk.focus();
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

	FormName.submit();
	return true;
}

 
//-->
</SCRIPT>
