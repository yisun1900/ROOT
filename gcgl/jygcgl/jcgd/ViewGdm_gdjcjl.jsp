<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String xjr=null;
String xjsj=null;
String jclxbm=null;
String jcjgmc=null;
String lrr=null;
String lrsj=null;
String bz=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
String cfspbz=null;
String spyj=null;
String spr=null;
String spsj=null;
String kpbz=null;
String kpjlh=null;
String jsbz=null;
String jsjlh=null;
double fkze=0;
double kfzs=0;
double jlje=0;
String lrdw=null;
String jcjlh=null;
jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select gdm_gdjcjl.jlje,gdm_jcjgbm.jcjgmc as jcjgmc,lrdw,fkze,kfzs,jsbz,jsjlh,gdm_gdjcjl.spsj,gdm_gdjcjl.spr,gdm_gdjcjl.spyj,gdm_gdjcjl.kpjlh,gdm_gdjcjl.cfspbz,gdm_gdjcjl.kpbz,gdm_gdjcjl.jcjlh as jcjlh,gdm_gdjcjl.khbh as khbh,gdm_gdjcjl.xjr as xjr,gdm_gdjcjl.xjsj as xjsj,gdm_gdjcjl.jclxbm as jclxbm,gdm_gdjcjl.lrr as lrr,gdm_gdjcjl.lrsj as lrsj,gdm_gdjcjl.bz as bz,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.lxfs as lxfs,crm_khxx.hth as hth,crm_khxx.sjs as sjs,crm_khxx.qyrq as qyrq,crm_khxx.dwbh as dwbh,gdm_gdjcjl.sgd,crm_khxx.zjxm as zjxm ";
	ls_sql+=" from  crm_khxx,gdm_gdjcjl,gdm_jcjgbm";
	ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh and  (gdm_gdjcjl.jcjlh='"+jcjlh+"')  ";
	ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jlje=rs.getDouble("jlje");
		jcjgmc=cf.fillNull(rs.getString("jcjgmc"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		jsbz=cf.fillNull(rs.getString("jsbz"));
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spr=cf.fillNull(rs.getString("spr"));
		spyj=cf.fillNull(rs.getString("spyj"));
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		cfspbz=cf.fillNull(rs.getString("cfspbz"));
		kpbz=cf.fillNull(rs.getString("kpbz"));
		jcjlh=cf.fillNull(rs.getString("jcjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		jclxbm=cf.fillNull(rs.getString("jclxbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��鹤�ؼ�¼������¼�ţ�<%=jcjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">�ͻ�����</td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right">��ͬ��</td>
    <td width="32%"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">���ݵ�ַ</td>
    <td><%=fwdz%></td>
    <td align="right">���ʦ </td>
    <td><%=sjs%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ʩ����    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      ���̵���    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ǩԼ����    </td>
    <td width="32%"> <%=qyrq%> </td>
    <td width="18%" align="right"> 
      ǩԼ����    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �������    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select jclxbm,jclxmc from gdm_jclxbm order by jclxbm",jclxbm,true);
%> </td>
    <td width="18%" align="right"> 
      �����    </td>
    <td width="32%"><%=jcjgmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�����ܶ�</td>
    <td><%=fkze%></td>
    <td align="right">�۷�����</td>
    <td><%=kfzs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%"></td>
    <td width="18%" align="right">�������</td>
    <td width="32%"><%=jlje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �����    </td>
    <td width="32%"> <%=xjr%> </td>
    <td width="18%" align="right"> 
      ���ʱ��    </td>
    <td width="32%"> <%=xjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ¼����    </td>
    <td width="32%"> <%=lrr%> </td>
    <td width="18%" align="right"> 
      ¼��ʱ��    </td>
    <td width="32%"> <%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">������־</td>
    <td width="32%"><%
	cf.selectToken(out,"1+��������&2+δ����&3+����ͨ��&4+����δͨ��",cfspbz,true);
%></td>
    <td width="18%" align="right">¼�벿��</td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">�������</td>
    <td colspan="3"><%=spyj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">������</td>
    <td width="32%"><%=spr%></td>
    <td width="18%" align="right">����ʱ��</td>
    <td width="32%"><%=spsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">������־</td>
    <td width="32%"><%
	cf.selectToken(out,"N+δ����&Y+�ѿ���",kpbz,true);
%></td>
    <td width="18%" align="right">������¼��</td>
    <td width="32%"><%=kpjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">�����־</td>
    <td width="32%"><%
	cf.selectToken(out,"N+δ����&Y+�ѽ���",jsbz,true);
%></td>
    <td width="18%" align="right">�����¼��</td>
    <td width="32%"><%=jsjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">��Ŀ����</td>
	<td  width="8%">��ĿС��</td>
	<td  width="5%">��Ŀ����</td>
	<td  width="15%">��Ŀ����</td>
	<td  width="5%">Υ�漶��</td>
	<td  width="7%">����Ҫ��</td>
	<td  width="7%">������Աְ��</td>
	<td  width="5%">������Ա����</td>
	<td  width="5%">Ա���۷�</td>
	<td  width="5%">Ա��������</td>
	<td  width="5%">ʩ���ӿ۷�</td>
	<td  width="5%">ʩ���ӷ�����</td>
	<td  width="5%">Υ�´���</td>
	<td  width="85%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT xmdlmc,xmxlmc,xmbm,xmmc,wgjbmc,zgyq,xzzwbm,yhmc,ygkf,ygfkje,sgdkf,sgdfkje,wzcs,bz  ";
	ls_sql+=" FROM gdm_jcjlmx  ";
    ls_sql+=" where gdm_jcjlmx.jcjlh='"+jcjlh+"'";
    ls_sql+=" order by xmdlbm,xmxlbm,xmbm ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="25%"><div align="center"><font color="#000099">�ļ�����</font></td>
    <td width="60%"><div align="center"><font color="#000099">��Ƭ</font></td>
  </tr>
  <%

	String zp_yszpmc=null;
	ls_sql="SELECT xjzpmc";
	ls_sql+=" FROM gdm_jcjlzp";
	ls_sql+=" where  jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		zp_yszpmc=rs.getString(1);

		%>
      <tr bgcolor="#FFFFFF"> 
		  <td width="25%"> 
			<div align="center"><%=zp_yszpmc%>
		  </td>
		  <td width="60%"> 
			<div align="center"><img src="/gcgl/jygcgl/images/<%=zp_yszpmc.toUpperCase() %>" width="300">
		  </td>
  </tr>
  <%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("Exception:" + e);
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</table>
</body>
</html>
