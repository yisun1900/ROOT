<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

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
String ssfgs=null;

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

String sfpfkh=null;
String sfnbcf=null;
double nbcfze=0;
String jhjjsj=null;
String jjfa=null;
String sjcfar=null;
String sjcfasj=null;
String shjl="";
String shsm=null;
String shr=null;
String shsj=null;

String cljlh=null;

String khpfze=null;
String pfyy=null;
String khpfdah=null;


String pfjlh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select crm_khxx.fgsbh,crm_tsjl.khpfze,crm_tsjl.pfyy,crm_tsjl.khpfdah,crm_tsjl.slsj,crm_tsjl.slr,crm_tsjl.lrr,crm_tsjl.lrsj,crm_tsjl.tsbxsj,crm_tsjl.ldyqjjsj,crm_tsjl.ldclyj ";
	ls_sql+=" ,DECODE(crm_tsjl.zrbmclzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as zrbmclzt";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') as clzt";
	ls_sql+=" ,crm_tsjl.sfxtz,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,qtdh,sjs,sgd,sgbz,crm_khxx.dwbh,zjxm,sjkgrq,sjjgrq,crm_tsjl.sfxhf,crm_tsjl.hfsj,crm_tsjl.yqjjsj";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		khpfze=cf.fillNull(rs.getString("khpfze"));
		pfyy=cf.fillNull(rs.getString("pfyy"));
		khpfdah=cf.fillNull(rs.getString("khpfdah"));

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
	ps.close();


	int count=0;
	ls_sql="select NVL(max(TO_NUMBER(substr(pfjlh,11,2))),0)";
	ls_sql+=" from  crm_khpfd";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	pfjlh=tsjlh+cf.addZero(count+1,2);

%>

<html>
<head>
<title>赔付单录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">赔付单录入（投诉记录号：<%=tsjlh%>） </div>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">客户编号</font>    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">合同号</font>    </td>
    <td width="32%"> <%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">客户姓名</font></td>
    <td width="33%"> <%=khxm%></td>
    <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">电话</font></td>
    <td colspan="3"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
    <td colspan="3"> <%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">设计师</font>    </td>
    <td width="33%"> <%=sjs%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">质检员</font>    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">施工队</font>    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">施工班组</font>    </td>
    <td width="32%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">实开工日期</font></td>
    <td width="33%"> <%=sjkgrq%> </td>
    <td width="18%" align="right"><font color="#0000CC">实交工日期</font></td>
    <td width="32%"> <%=sjjgrq%> </td>
  </tr>
</table>

<BR>
<center>
投诉内容
<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF"> 
    <td width="83%" valign="top"><%=tsnr%>  </td>
</tr>
</table>


<BR>
<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">


<tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">严重程度</td>
    <td width="29%"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
    <td width="21%" align="right">处理状态</td>
    <td width="29%" valign="top"><%=tsclzt%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong><font color="#FF0000">客户要求解决时间</font></strong></td>
    <td><%=yqjjsj%></td>
    <td align="right"><strong><font color="#FF0000">领导要求解决时间</font></strong></td>
    <td valign="top"><%=ldyqjjsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">领导处理意见</td>
    <td colspan="3"><%=ldclyj%></td>
    </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">客户投诉时间</td>
    <td width="29%"><%=tsbxsj%> </td>
    <td width="21%" align="right">投诉来源</td>
    <td width="29%" valign="top"><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm where slfsbm='"+slfsbm+"'",slfsbm,true);
%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">录入人</td>
    <td width="29%"><%=lrr%></td>
    <td width="21%" align="right">录入时间</td>
    <td width="29%" valign="top"><%=lrsj%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">备注</td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>涉及部门</strong></td>
	<td width="19%"><strong>原因</strong></td>
	<td width="8%"><strong>状态</strong></td>
	<td width="48%"><strong>接收说明</strong></td>
	<td width="8%"><strong>接收时间</strong></td>
	<td width="6%"><strong>接收人</strong></td>
  </tr>
<%
	String getdwmc="";
	String gettsyymc="";
	String getjssm="";
	String getjhcxcsj="";
	String getjssj="";
	String getjsr="";
	String geclzt="";
	ls_sql="select dwmc,'（'||tsxlmc||'）'||tsyymc tsyymc,crm_tsbm.jssm,crm_tsbm.jhcxcsj,crm_tsbm.jssj,crm_tsbm.jsr";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as clzt";
	ls_sql+=" from  crm_tsbm,sq_dwxx,dm_tsxlbm,dm_tsyybm";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) ";
	ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)";
	ls_sql+=" and crm_tsbm.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbm.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
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
	ps.close();


%> 
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>涉及部门</strong></td>
	<td width="19%"><strong>原因</strong></td>
	<td width="6%"><strong>审核</strong></td>
	<td width="8%"><strong>出方案时间</strong></td>
	<td width="8%"><strong>计划解决时间</strong></td>
	<td width="33%"><strong>解决方案</strong></td>
	<td width="7%"><strong>客户赔付总额</strong></td>
	<td width="7%"><strong>内部处罚总额</strong></td>
  </tr>
<%
	String fa_dwmc="";
	String fa_tsyymc="";
	String fa_cfajlh="";
	String fa_sjcfasj="";
	String fa_sjcfar="";
	String fa_jhjjsj="";
	String fa_jjfa="";
	String fa_sfpfkh="";
	String fa_khpfze="";
	String fa_sfnbcf="";
	String fa_nbcfze="";
	String fa_shjl="";

	ls_sql="select dwmc,'（'||tsxlmc||'）'||tsyymc tsyymc ";
	ls_sql+=" ,DECODE(crm_tsbxfajl.shjl,'Y','通过','N','未通过','未审核') shjl,crm_tsbxfajl.cfajlh,crm_tsbxfajl.sjcfasj,crm_tsbxfajl.sjcfar,crm_tsbxfajl.jhjjsj,crm_tsbxfajl.jjfa,DECODE(crm_tsbxfajl.sfpfkh,'1','不需赔付','2','需赔付') sfpfkh,crm_tsbxfajl.khpfze,DECODE(crm_tsbxfajl.sfnbcf,'1','不需处罚','2','需处罚') sfnbcf,crm_tsbxfajl.nbcfze";
	ls_sql+=" from  sq_dwxx,dm_tsyybm,dm_tsxlbm,crm_tsbxfajl";
	ls_sql+=" where crm_tsbxfajl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsbxfajl.tsyybm=dm_tsyybm.tsyybm(+)";
	ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
	ls_sql+=" and crm_tsbxfajl.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbxfajl.tsyybm,crm_tsbxfajl.cfajlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fa_dwmc=cf.fillNull(rs.getString("dwmc"));
		fa_tsyymc=cf.fillNull(rs.getString("tsyymc"));
		fa_cfajlh=cf.fillHtml(rs.getString("cfajlh"));
		fa_sjcfasj=cf.fillHtml(rs.getDate("sjcfasj"));
		fa_sjcfar=cf.fillHtml(rs.getString("sjcfar"));
		fa_jhjjsj=cf.fillHtml(rs.getDate("jhjjsj"));
		fa_jjfa=cf.fillHtml(rs.getString("jjfa"));
		fa_sfpfkh=cf.fillHtml(rs.getString("sfpfkh"));
		fa_khpfze=cf.fillHtml(rs.getString("khpfze"));
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
			<td><%=fa_khpfze%></td>
			<td><%=fa_nbcfze%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();


%> 
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#E8E8FF" align="center"> 
	<td width="12%"><strong>涉及部门</strong></td>
	<td width="19%"><strong>原因</strong></td>
	<td width="6%"><strong>处理状态</strong></td>
	<td width="50%"><strong>处理情况</strong></td>
	<td width="8%"><strong>处理时间</strong></td>
	<td width="6%"><strong>处理人</strong></td>
  </tr>
<%
	String cl_dwmc=null;
	String cl_tsyymc=null;
	String cl_cljlh=null;
	String cl_clr=null;
	String cl_clsj=null;
	String cl_clqk=null;
	String cl_clzt=null;

	ls_sql =" select dwmc,'（'||tsxlmc||'）'||tsyymc tsyymc ";
	ls_sql+=" ,crm_tsbxcljl.cljlh,crm_tsbxcljl.clr,crm_tsbxcljl.clsj,crm_tsbxcljl.clqk,DECODE(crm_tsbxcljl.clzt,'2','未解决','3','已解决') clzt";
	
	ls_sql+=" from  sq_dwxx,dm_tsyybm,dm_tsxlbm,crm_tsbxcljl";
	ls_sql+=" where crm_tsbxcljl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsbxcljl.tsyybm=dm_tsyybm.tsyybm(+)";
	ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
	ls_sql+=" and crm_tsbxcljl.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbxcljl.tsyybm,crm_tsbxcljl.cljlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cl_dwmc=cf.fillNull(rs.getString("dwmc"));
		cl_tsyymc=cf.fillNull(rs.getString("tsyymc"));
		cl_cljlh=cf.fillNull(rs.getString("cljlh"));
		cl_clr=cf.fillNull(rs.getString("clr"));
		cl_clsj=cf.fillNull(rs.getDate("clsj"));
		cl_clqk=cf.fillNull(rs.getString("clqk"));
		cl_clzt=cf.fillNull(rs.getString("clzt"));

		%> 
          <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=cl_dwmc%></td>
			<td align="left"><%=cl_tsyymc%></td>
            <td ><%=cl_clzt%></td>
            <td align="left"><%=cl_clqk%></td>
            <td ><%=cl_clsj%></td>
            <td ><%=cl_clr%></td>
          </tr>
		<%
	}
	rs.close();
	ps.close();
%> 
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#E8E8FF" align="center"> 
	<td width="12%"><strong>回访时间</strong></td>
	<td width="60%"><strong>客户回访情况</strong></td>
	<td width="28%"><strong>回访中出现的新问题</strong></td>
  </tr>
<%
	String khhfqk=null;
	String cxxwt=null;

	ls_sql="select hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and tsjlh='"+tsjlh+"'";
	ls_sql+=" order by hfsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
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
	ps.close();
%> 
</table>



</center>



<BR>
<BR>

<form method="post" action="SaveInsertCrm_khpfd.jsp" name="insertform"  >
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#E8E8FF" align="center"> 
	<td width="9%"><strong>赔付记录号</strong></td>
	<td width="5%">&nbsp;</td>
	<td width="5%">&nbsp;</td>
	<td width="8%"><strong>赔付方是否施工队</strong></td>
	<td width="12%"><strong>赔付方部门</strong></td>
	<td width="6%"><strong>赔付方</strong></td>
	<td width="7%"><strong>赔付施工队</strong></td>
	<td width="6%"><strong>责任比例</strong></td>
	<td width="8%"><strong>赔付金额</strong></td>
	<td width="34%"><strong>备注</strong></td>
  </tr>
<%
	String pf_pfjlh=null;
	String pf_sfsgd=null;
	String pf_dwbh=null;
	String pf_ygbh=null;
	String pf_pff=null;
	String pf_sgd=null;
	String pf_zrbl=null;
	String pf_bz=null;
	double pf_pfje=0;
	double pf_allpfje=0;
	ls_sql="select pfjlh,DECODE(sfsgd,'1','施工队','2','非施工队') sfsgd,dwmc,ygbh,pff,sgdmc,zrbl||'%' zrbl,pfje,crm_khpfd.bz";
	ls_sql+=" from crm_khpfd,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khpfd.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khpfd.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and tsjlh='"+tsjlh+"'";
	ls_sql+=" order by pfjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		pf_pfjlh=cf.fillHtml(rs.getString("pfjlh"));
		pf_sfsgd=cf.fillHtml(rs.getString("sfsgd"));
		pf_dwbh=cf.fillHtml(rs.getString("dwmc"));
		pf_ygbh=cf.fillHtml(rs.getString("ygbh"));
		pf_pff=cf.fillHtml(rs.getString("pff"));
		pf_sgd=cf.fillHtml(rs.getString("sgdmc"));
		pf_zrbl=cf.fillHtml(rs.getString("zrbl"));
		pf_pfje=rs.getDouble("pfje");
		pf_bz=cf.fillHtml(rs.getString("bz"));

		pf_allpfje+=pf_pfje;

		%> 
          <tr bgcolor="#FFFFFF" align="center"> 
            <td ><%=pf_pfjlh%></td>
            <td ><A HREF="DeleteCrm_khpfd.jsp?pfjlh=<%=pf_pfjlh%>" target="_balnk">删除</A></td>
            <td ><A HREF="EditCrm_khpfd.jsp?pfjlh=<%=pf_pfjlh%>" target="_balnk">修改</A></td>
            <td ><%=pf_sfsgd%></td>
            <td ><%=pf_dwbh%></td>
            <td ><%=pf_pff%></td>
            <td ><%=pf_sgd%></td>
            <td ><%=pf_zrbl%></td>
            <td ><%=pf_pfje%></td>
            <td align="left"><%=pf_bz%></td>
          </tr>
		<%
	}
	rs.close();
	ps.close();

	%> 
	  <tr bgcolor="#FFFFFF" align="center"> 
		<td >小计</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=pf_allpfje%></td>
		<td >&nbsp;</td>
	  </tr>
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</table>




<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

  <tr bgcolor="#FFFF66">
    <td height="29" colspan="4" align="center"><strong>客户赔付情况</strong></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>赔付原因</td> 
  <td colspan="3"><textarea name="pfyy" cols="72" rows="6"><%=pfyy%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>赔付档案号</td>
  <td width="32%"><input type="text" name="khpfdah" value="<%=khpfdah%>" size="20" maxlength="20" ></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>赔付总额</td>
  <td width="32%"><input type="text" name="khpfze" value="<%=khpfze%>" size="20" maxlength="17" ></td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFF66">
  <td height="29" colspan="4" align="center"><strong>录入赔付方承担金额（赔付单序号：<%=pfjlh%>）</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" rowspan="3" align="right"><font color="#FF0000">*</font>赔付方是否施工队</td>
  <td rowspan="3"><%
	cf.radioToken(out, "sfsgd","1+施工队&2+非施工队","");
%></td>
  <td align="right">赔付施工队</td>
  <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">赔付方部门</td>
  <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">赔付方</td>
  <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>责任比例</td>
  <td><input type="text" name="zrbl" value="" size="10" maxlength="10" onChange="pfje.value=round(khpfze.value*zrbl.value/100,2)">
    %</td>
  <td align="right"><font color="#FF0000">*</font>赔付金额</td>
  <td><input type="text" name="pfje" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="8" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">录入人部门</font></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="hidden" name="pfjlh" value="<%=pfjlh%>" >
	<input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" ></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

function changeDwbh(FormName) 
{
	FormName.ygbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql;
	sql="select ygbh,yhmc from sq_yhxx where sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.ygbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	FormName.pfje.value=round(FormName.khpfze.value*FormName.zrbl.value/100,2);

	if(	javaTrim(FormName.pfjlh)=="") {
		alert("请输入[赔付记录号]！");
		FormName.pfjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[投诉报修记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.pfyy)=="") {
		alert("请输入[赔付原因]！");
		FormName.pfyy.focus();
		return false;
	}
	if(	javaTrim(FormName.khpfdah)=="") {
		alert("请输入[赔付档案号]！");
		FormName.khpfdah.focus();
		return false;
	}
	if(	javaTrim(FormName.khpfze)=="") {
		alert("请输入[赔付总额]！");
		FormName.khpfze.focus();
		return false;
	}
	if(!(isFloat(FormName.khpfze, "赔付总额"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfsgd)) {
		alert("请选择[赔付方是否施工队]！");
		FormName.sfsgd[0].focus();
		return false;	
	}
	if (FormName.sfsgd[0].checked)
	{
		if(	javaTrim(FormName.sgd)=="") {
			alert("请选择[赔付施工队]！");
			FormName.sgd.focus();
			return false;
		}

		FormName.dwbh.value="";
		FormName.ygbh.value="";
	}
	else{
		if(	javaTrim(FormName.dwbh)=="") {
			alert("请选择[赔付方部门]！");
			FormName.dwbh.focus();
			return false;
		}
		if(	javaTrim(FormName.ygbh)=="") {
			alert("请输入[赔付方]！");
			FormName.ygbh.focus();
			return false;
		}
		FormName.sgd.value="";
	}
	if(	javaTrim(FormName.zrbl)=="") {
		alert("请输入[责任比例]！");
		FormName.zrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zrbl, "责任比例"))) {
		return false;
	}
	if(	javaTrim(FormName.pfje)=="") {
		alert("请输入[赔付金额]！");
		FormName.pfje.focus();
		return false;
	}
	if(!(isFloat(FormName.pfje, "赔付金额"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}

	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入人部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
