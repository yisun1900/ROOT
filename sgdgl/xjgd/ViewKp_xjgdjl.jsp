<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgmc=null;
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
double kcjdebl=0;
double jlje=0;
String lrdw=null;
String wtclbz=null;

String xjjlh=null;
xjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select dm_xjjgbm.xjjgmc as xjjgmc,jlje,lrdw,fkze,kfzs,kcjdebl,jsbz,jsjlh,kp_xjgdjl.spsj,kp_xjgdjl.spr,kp_xjgdjl.spyj,kp_xjgdjl.kpjlh,kp_xjgdjl.cfspbz,kp_xjgdjl.kpbz,kp_xjgdjl.xjjlh as xjjlh,kp_xjgdjl.khbh as khbh,kp_xjgdjl.xjr as xjr,kp_xjgdjl.xjsj as xjsj,kp_xjgdjl.xjlxbm as xjlxbm,kp_xjgdjl.lrr as lrr,kp_xjgdjl.lrsj as lrsj,kp_xjgdjl.bz as bz,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.lxfs as lxfs,crm_khxx.hth as hth,crm_khxx.sjs as sjs,crm_khxx.qyrq as qyrq,crm_khxx.dwbh as dwbh,kp_xjgdjl.sgd,crm_khxx.zjxm as zjxm ";
	ls_sql+=" ,wtclbz";
	ls_sql+=" from  crm_khxx,kp_xjgdjl,dm_xjjgbm";
	ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and  (kp_xjgdjl.xjjlh='"+xjjlh+"')  ";
	ls_sql+=" and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wtclbz=cf.fillNull(rs.getString("wtclbz"));

		jlje=rs.getDouble("jlje");
		xjjgmc=cf.fillNull(rs.getString("xjjgmc"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		kcjdebl=rs.getDouble("kcjdebl");
		jsbz=cf.fillNull(rs.getString("jsbz"));
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spr=cf.fillNull(rs.getString("spr"));
		spyj=cf.fillNull(rs.getString("spyj"));
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		cfspbz=cf.fillNull(rs.getString("cfspbz"));
		kpbz=cf.fillNull(rs.getString("kpbz"));
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��鹤�ؼ�¼������¼�ţ�<%=xjjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">�ͻ�����</td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right">��ͬ��</td>
    <td width="32%"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ��ϵ��ʽ    </td>
    <td width="32%"><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="�鿴�绰" >
    <input name="button" type="button" onClick="window.open('viewAllPhoto.jsp?xjjlh=<%=xjjlh%>')" value="�鿴��Ƭ" ></td>
    <td width="18%" align="right"> 
      ���ʦ    </td>
    <td width="32%"> <%=sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ʩ����    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      ���    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ǩԼ����    </td>
    <td width="32%"> <%=qyrq%> </td>
    <td width="18%" align="right"> 
      ǩԼ�ֹ�˾    </td>
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
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm,true);
%> </td>
    <td width="18%" align="right"> 
      �����    </td>
    <td width="32%"><%=xjjgmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�����ܶ�</td>
    <td><%=fkze%></td>
    <td align="right">�۷�����</td>
    <td><%=kfzs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">�۳��ӵ���ٷֱ�</td>
    <td width="32%"><%=kcjdebl%>%</td>
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
    <td width="18%" align="right">����������־</td>
    <td width="32%"><%
	cf.selectToken(out,"1+��������&2+δ����&3+����ͨ��&4+����δͨ��",cfspbz,true);
%></td>
    <td width="18%" align="right">���Ĵ����־</td>
    <td width="32%"><%
	cf.selectToken(out,"B+������&N+����δ����&C+�ڴ���&Y+�ѽ��",wtclbz,true);
%></td>
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
    <td align="right"> ¼���� </td>
    <td><%=lrr%> </td>
    <td align="right"> ¼��ʱ�� </td>
    <td><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">¼�벿��</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<BR>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">��Ŀ����</td>
	<td  width="15%">�����Ŀ</td>
	<td  width="8%">Υ��ּ�</td>
	<td  width="7%">���ο۷�</td>
	<td  width="8%">���η���</td>
	<td  width="7%">�۳��ӵ���ٷֱ�</td>
	<td  width="14%">��������</td>
	<td  width="7%">Υ�´���</td>
	<td  width="21%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmmc,ydcdmc,kp_xjgdmx.kf,kp_xjgdmx.sgdfk,kp_xjgdmx.kcjdebl||'%',kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc,wzcs,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_xjgdmx.kpjg=kp_sgdyzcdbm.yzcdbm(+) and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

<BR>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���ļ�¼��</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">Ҫ����</td>
	<td  width="4%">��������</td>
	<td  width="2%">������</td>
	<td  width="10%">������Ŀ</td>
	<td  width="16%">����˵��</td>
	<td  width="4%">���Ĵ����¼��</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="12%">����˵��</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="16%">����˵��</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="12%">����˵��</td>
</tr>
<%
	ls_sql="SELECT kp_zggdmx.zgjlh, DECODE(kp_zggdmx.clzt,'1','δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') as clzt,kp_zggdmx.yqjjsj,dwmc,kp_zggdmx.fkbmjsr,kp_zggdmx.zgxm,kp_zggdmx.zgsm,kp_zggdmx.zgcljlh,kp_zggdmx.jsr,kp_zggdmx.jssj,kp_zggdmx.jssm,kp_zggdmx.clr,kp_zggdmx.clsj,kp_zggdmx.clsm,kp_zggdmx.ysr,kp_zggdmx.yssj,kp_zggdmx.yssm";
	ls_sql+=" FROM kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_zggdmx.zgjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>



</body>
</html>
