<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String hfbm=(String)session.getAttribute("dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String slfsbm=null;
String yqjjsj=null;
String yzcdbm=null;
String slsj=null;
String slr=null;
String slbm=null;
String tsnr=null;
String lx=null;
String lxmc=null;
String clzt=null;
String zrbmclzt=null;
String jasj=null;
String wxsgd=null;
String bz=null;
String tsbxsj=null;
String lrsj=null;
String lrr=null;

String bgcolor=null;
String bgcolor1=null;

int row=0;

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
String wheresql="";

try {
	conn=cf.getConnection();

	ls_sql="select tsbxsj,lrsj,lrr,tsjlh,khbh,slfsmc,slsj,slr,slbm,yqjjsj,yzcdbm,tsnr,lx,DECODE(lx,'1','Ͷ��','2','����') lxmc,jasj,wxsgd,bz";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','δ����','1','������','4','�ѽ���','5','�ѳ��ֳ�','6','�ѳ�����','7','�������ͨ��','2','�ڴ���','3','�᰸','9','������') as clzt";
	ls_sql+=" ,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ѽ��յȴ�������','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as zrbmclzt";
	ls_sql+=" from  crm_tsjl,dm_slfsbm";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tsjlh='"+tsjlh+"'";
	ls_sql+="  order by tsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		slfsbm=cf.fillHtml(rs.getString("slfsmc"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));
		clzt=cf.fillHtml(rs.getString("clzt"));
		zrbmclzt=cf.fillHtml(rs.getString("zrbmclzt"));
		jasj=cf.fillHtml(rs.getDate("jasj"));
		wxsgd=cf.fillHtml(rs.getString("wxsgd"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,dwbh,sgd,zjxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>Ͷ�߱���-�᰸</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b>�޸Ľ᰸���</b></div>

<table width="100%" style="FONT-SIZE:12">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right">�ͻ����</td>
            <td width="32%"><%=khbh%></td>
            <td width="20%" align="right">��ͬ��</td>
            <td width="30%"><%=hth%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%"> 
              <div align="right">�ͻ�����</div>
            </td>
            <td width="32%"> <%=khxm%>��<%=lxfs%>�� </td>
            <td width="20%"> 
              <div align="right">ǩԼ����</div>
            </td>
            <td width="30%"><%=qyrq%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%" align="right">���ݵ�ַ</td>
            <td colspan="3"><%=fwdz%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%"> 
              <div align="right">ǩԼ����</div>
            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            <td width="20%"> 
              <div align="right">���ʦ</div>
            </td>
            <td width="30%"><%=sjs%> </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="18%"> 
              <div align="right">�ʼ�</div>
            </td>
            <td width="32%"> <%=zjxm%> </td>
            <td width="20%"> 
              <div align="right">ʩ����&nbsp;</div>
            </td>
            <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="18%" align="right">�᰸״̬</td>
            <td width="32%"><%=clzt%></td>
            <td width="20%" align="right">���β��Ŵ���״̬</td>
            <td width="30%"><%=zrbmclzt%></td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="18%" align="right">�᰸ʱ��</td>
            <td width="32%"><%=jasj%></td>
            <td width="20%" align="right">����</td>
            <td width="30%"><%
	cf.selectToken(out,"1+Ͷ��&2+����",lx,true);
%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF"> 
              <div align="right">Ͷ����Դ</div>
            </td>
            <td width="32%" bgcolor="#E8E8FF"> <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm where slfsbm='"+slfsbm+"'",slfsbm,true);
%> </td>
            <td rowspan="9" bgcolor="#E8E8FF" width="20%"> 
              <div align="right"></div>
              <div align="right"></div>
              <div align="right"></div>
              <div align="right">Ͷ�߱�������</div>
            </td>
            <td rowspan="9" bgcolor="#E8E8FF" width="30%"><%=tsnr%> </td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">���س̶�</td>
            <td width="32%" bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">�ͻ�Ҫ����ʱ��</td>
            <td width="32%" bgcolor="#E8E8FF"><%=yqjjsj%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">�ͻ�Ͷ�߱���ʱ��</td>
            <td width="32%" bgcolor="#E8E8FF"><%=tsbxsj%></td>
          </tr>
          <tr> 
            <td width="18%" align="right" bgcolor="#E8E8FF">¼����</td>
            <td width="32%" bgcolor="#E8E8FF"><%=lrr%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF"> 
              <div align="right">¼��ʱ��</div>
            </td>
            <td width="32%" bgcolor="#E8E8FF"><%=lrsj%> </td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">¼�벿��</td>
            <td width="32%" bgcolor="#E8E8FF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">�ͷ�������</td>
            <td width="32%" bgcolor="#E8E8FF"><%=slr%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">�ͷ�����ʱ��</td>
            <td width="32%" bgcolor="#E8E8FF"><%=slsj%></td>
          </tr>
          <tr> 
            <td width="18%" bgcolor="#E8E8FF" align="right">��ע</td>
            <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
          </tr>
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#CCCCCC" align="center"> 
            <td width="10%"> 
              <div align="center"><font color="#006666">�ط�ʱ��</font></div>
            </td>
            <td width="55%"> 
              <div align="center"><font color="#006666">�ͻ��ط����</font></div>
            </td>
            <td width="35%"> 
              <div align="center"><font color="#006666">�ط��г��ֵ�������</font></div>
            </td>
          </tr>
          <%
	String hfjlh=null;
	String khhfqk=null;
	String cxxwt=null;
	String hfsj=null;

	ls_sql="select hfjlh,hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by hfsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center" ><a href="/tsgl/tshf/ViewCrm_tshfjl.jsp?hfjlh=<%=hfjlh%>" target="_blank"><%=hfsj%></A></td>
            <td ><%=khhfqk%></td>
            <td ><%=cxxwt%></td>
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
	<td width="19%"><strong>ԭ��</strong></td>
	<td width="8%"><strong>״̬</strong></td>
	<td width="48%"><strong>����˵��</strong></td>
	<td width="8%"><strong>����ʱ��</strong></td>
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
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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

<table width="95%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>�漰����</strong></td>
	<td width="19%"><strong>ԭ��</strong></td>
	<td width="6%"><strong>���</strong></td>
	<td width="8%"><strong>������ʱ��</strong></td>
	<td width="8%"><strong>�ƻ����ʱ��</strong></td>
	<td width="33%"><strong>�������</strong></td>
	<td width="7%"><strong>�ͻ��⸶�ܶ�</strong></td>
	<td width="7%"><strong>�ڲ������ܶ�</strong></td>
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

	ls_sql="select dwmc,'��'||tsxlmc||'��'||tsyymc tsyymc ";
	ls_sql+=" ,DECODE(crm_tsbxfajl.shjl,'Y','ͨ��','N','δͨ��','δ���') shjl,crm_tsbxfajl.cfajlh,crm_tsbxfajl.sjcfasj,crm_tsbxfajl.sjcfar,crm_tsbxfajl.jhjjsj,crm_tsbxfajl.jjfa,DECODE(crm_tsbxfajl.sfpfkh,'1','�����⸶','2','���⸶') sfpfkh,crm_tsbxfajl.khpfze,DECODE(crm_tsbxfajl.sfnbcf,'1','���账��','2','�账��') sfnbcf,crm_tsbxfajl.nbcfze";
	ls_sql+=" from  sq_dwxx,dm_tsyybm,dm_tsxlbm,crm_tsbxfajl";
	ls_sql+=" where crm_tsbxfajl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsbxfajl.tsyybm=dm_tsyybm.tsyybm(+)";
	ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
	ls_sql+=" and crm_tsbxfajl.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbxfajl.tsyybm,crm_tsbxfajl.cfajlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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

        <form method="post" action="SaveEditEnterJa.jsp" name="insertform" >

	          <table border="1" width="100%" cellspacing="0" cellpadding="1" bgcolor="#FFFFFF"  style='FONT-SIZE: 12px'>

            <tr> 
              <td  align="right" valign="top" width="75%"> <%
		String tsxlmc=null;
		String tsyybm=null;
		String tsyymc=null;
		String dwmc=null;
//		String clzt=null;
		String tzsj=null;
		String jssj=null;
		String jhcfasj=null;
		String sjcfasj=null;
		String jhjjsj=null;

		String txxx="";
		String hfjgbm="";
		String sfjslx="";
		String zzjgbm="";
		String jsxbm="";

		int row1=0;


		ls_sql="select crm_tsbm.hfjgbm,crm_tsbm.sfjslx,crm_tsbm.zzjgbm,crm_tsbm.jsxbm,tsxlmc,crm_tsbm.tsyybm,tsyymc,dwmc";
		ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') clzt";
		ls_sql+=" ,tzsj,jssj,jhcfasj,sjcfasj,jhjjsj";
		ls_sql+=" from  crm_tsbm,dm_tsxlbm,dm_tsyybm,sq_dwxx";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsbm.dwbh=sq_dwxx.dwbh";
		ls_sql+=" order by crm_tsbm.tsyybm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			hfjgbm=cf.fillNull(rs.getString("hfjgbm"));
			sfjslx=cf.fillNull(rs.getString("sfjslx"));
			zzjgbm=cf.fillNull(rs.getString("zzjgbm"));
			jsxbm=cf.fillNull(rs.getString("jsxbm"));

			tsxlmc=cf.fillHtml(rs.getString("tsxlmc"));
			tsyybm=cf.fillHtml(rs.getString("tsyybm"));
			tsyymc=cf.fillHtml(rs.getString("tsyymc"));
			dwmc=cf.fillHtml(rs.getString("dwmc"));
			clzt=cf.fillHtml(rs.getString("clzt"));
			dwmc=cf.fillHtml(rs.getString("dwmc"));
			tzsj=cf.fillHtml(rs.getDate("tzsj"));
			jssj=cf.fillHtml(rs.getDate("jssj"));
			jhcfasj=cf.fillHtml(rs.getDate("jhcfasj"));
			sjcfasj=cf.fillHtml(rs.getDate("sjcfasj"));
			jhjjsj=cf.fillHtml(rs.getDate("jhjjsj"));



			if (hfjgbm.equals(""))
			{
				txxx="<font color=\"#CC0066\">���ͷ�δ�طÿͻ���</font>";
			}

			row1++;

			if (row1%2==1)
			{
				bgcolor1="#FFFFFF";
			}
			else{
				bgcolor1="#E8E8FF";
			}
			%> 
                <table border="1" width="100%"  height="150" cellspacing="0" cellpadding="1" bgcolor="<%=bgcolor1%>" style='FONT-SIZE: 12px'>
                  <tr> 
                    <td width="57%" align="left" valign="top"> 
						
						<b>���β��ţ�</b><%=dwmc%><font color="#CC0066">�J<%=clzt%></font><BR>
						<HR>
						<b>ԭ�����</b>��<%=tsxlmc%>�J<%=tsyymc%> 
						<HR>
						<b>����ʱ��</b>��<%=jssj%>   &nbsp;&nbsp;&nbsp;&nbsp;<b>�ƻ�������ʱ��</b>��<%=jhcfasj%> 
						<BR>
						<b>�ƻ����</b>��<%=jhjjsj%>  &nbsp;&nbsp;&nbsp;&nbsp;<b>ʵ�ʳ�����ʱ��</b>��<%=sjcfasj%>    
						<HR>

						<b>�������</b>�� 
						<%
						String cl_clsj=null;
						String cl_clr=null;
						String cl_clqk=null;
						String cl_clzt=null;
						int clxh=0;
						ls_sql =" select clr,clsj,clqk,DECODE(crm_tsbxcljl.clzt,'2','δ���','3','�ѽ��') clzt";
						ls_sql+=" from  crm_tsbxcljl";
						ls_sql+=" where tsjlh='"+tsjlh+"'";
						ls_sql+=" and tsyybm='"+tsyybm+"'";
						ls_sql+=" order by cljlh";
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						while (rs2.next())
						{
							cl_clsj=cf.fillHtml(rs2.getDate("clsj"));
							cl_clr=cf.fillHtml(rs2.getString("clr"));
							cl_clqk=cf.fillHtml(rs2.getString("clqk"));
							cl_clzt=cf.fillHtml(rs2.getString("clzt"));

							clxh++;

							%> 
							<BR>
							<BR>
							<U>��<%=clxh%>�Σ�<%=cl_clzt%>����<%=cl_clr%>��<%=cl_clsj%></U> 
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;<U><font style="FONT-SIZE: 14px"><%=cl_clqk%></font></U> 
							<%
						}
						rs2.close();
						ps2.close();
						
						%> 

					</td>
                    <td colspan="4" width="43%" valign="top" align="center">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px'>
                        <tr>
                          <td align="center">
						
						<HR>
						<b>�ͷ��طý��</b>�� 
							<%
								cf.selectItem(out,"select hfjgbm,hfjgmc from dm_tshfjgbm  order by hfjgbm",hfjgbm,true);
							%> 
							(<%=txxx%>)
						<HR>

						  </td>
                        </tr>
                      </table>
							
                      <table width="100%"  bgcolor="#FFFFCC" border="0" cellpadding="0" cellspacing="0"  style='FONT-SIZE: 12px'>
                        <tr>
                          <td align="center">
						<BR><B>�᰸ʱ��д</B><IMG SRC="/images/168.gif"> 
						<HR>
						<%
						if (lx.equals("2"))//1��Ͷ�ߣ�2������
						{
							%> 
							<b><font color="#FF0000">*</font>�Ƿ�ʱ��ϵ�ͻ�</b>�� 
							<select name="sfjslx<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
								<option value=""></option>
								<%
									cf.selectToken(out,"Y+��ʱ��ϵ&N+δ��ʱ��ϵ&W+���δ֪",sfjslx);
								%> 
							</select>
							<BR>
							<%
						}
						%> 


						<b><font color="#FF0000">*</font>�᰸�ͻ��Ƿ�����</b>�� 
						<select name="zzjgbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm",zzjgbm);
							%> 
						</select>

						<BR>
						<b><font color="#FF0000">*</font>��������Ƿ�ʱ</b>�� 
						<select name="jsxbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm",jsxbm);
							%> 
						</select>

						  </td>
                        </tr>
                      </table>

                    </td>
                  </tr>
                </table>
                <%
		}
		rs.close();
		ps.close();
		%> </td>
 
              <td align="center" width="25%" valign="middle" > <b><font color="#FF0000">*</font>�᰸ʱ��</b>�� 
                <input type="text" name="jasj" value="<%=jasj%>" size="12" maxlength="10" ondblclick="JSCalendar(this)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onDblClick="JSCalendar(this)">
                <IMG SRC="/images/169.gif" > 
				<P><HR><BR>
                  <input type="hidden" name="lx" value="<%=lx%>" >
                  <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
                <input type="button"  value="����" onClick="f_do(insertform)" name="button">
                <input type="reset"  value="����" name="reset">
              </td>
		
		</tr>
          </table>
	
		
		
		
		
		

        </form>


      </div>
    </td>
  </tr>
</table>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jasj)=="") {
		alert("��ѡ��[�᰸ʱ��]��");
		FormName.jasj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jasj, "�᰸ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
