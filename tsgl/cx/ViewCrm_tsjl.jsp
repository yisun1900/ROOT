<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String slfsbm=null;
String yzcdbm=null;
String yqjjsj=null;
String sfxhf=null;
String hfsj=null;
String hfjlh=null;
String zxhfsj=null;
String hfr=null;
String slsj=null;
String slr=null;
String slbm=null;
String clzt=null;
String sfxtz=null;
String zrbmclzt=null;
String jasj=null;
String wxsgd=null;
String lx=null;


String bz=null;
String tsnr=null;
String tsbxsj=null;
String lrsj=null;
String lrr=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;
int syts=0;

String kszy=null;
String kszypdr=null;
String kszypdsj=null;
String wxfl=null;
String khldcs=null;
String sfpz=null;

double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double cjcdfy=0;
double sgdcdfy=0;
double khcdfy=0;
double gscdfy=0;
double qtfcdfy=0;

String pzyy="";
String pzr="";
String pzsj="";
double cjzrbl=0;
double sgdzrbl=0;
double khzrbl=0;
double gszrbl=0;

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select tsbxsj,lrsj,lrr,tsjlh,khbh,slfsbm,yzcdbm,yqjjsj,sfxhf,hfsj,hfjlh,zxhfsj,hfr,slsj,slr,slbm";
	ls_sql+=" ,jasj,wxsgd,lx,bz,tsnr,sfxtz,kszy,kszypdr,kszypdsj,wxfl,khldcs,sfpz";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','δ����','1','������','4','�ѽ���','5','�ѳ��ֳ�','6','�ѳ�����','7','�������ͨ��','2','�ڴ���','3','�᰸','9','������') as clzt";
	ls_sql+=" ,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ѽ��յȴ�������','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as zrbmclzt";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kszy=cf.fillNull(rs.getString("kszy"));
		kszypdr=cf.fillNull(rs.getString("kszypdr"));
		kszypdsj=cf.fillNull(rs.getDate("kszypdsj"));
		wxfl=cf.fillNull(rs.getString("wxfl"));
		khldcs=cf.fillNull(rs.getString("khldcs"));
		sfpz=cf.fillNull(rs.getString("sfpz"));

		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));

		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		yqjjsj=cf.fillNull(rs.getDate("yqjjsj"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		zxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		clzt=cf.fillNull(rs.getString("clzt"));
		zrbmclzt=cf.fillNull(rs.getString("zrbmclzt"));
		jasj=cf.fillNull(rs.getDate("jasj"));
		wxsgd=cf.fillNull(rs.getString("wxsgd"));
		lx=cf.fillNull(rs.getString("lx"));
		bz=cf.fillNull(rs.getString("bz"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		sfxtz=cf.fillNull(rs.getString("sfxtz"));

	}
	rs.close();
	ps.close();

	ls_sql="select wxrgf,wxcf,wxclf,wxzfy,cjcdfy,sgdcdfy,khcdfy,qtfcdfy,gscdfy";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxrgf=rs.getDouble("wxrgf");
		wxcf=rs.getDouble("wxcf");
		wxclf=rs.getDouble("wxclf");
		wxzfy=rs.getDouble("wxzfy");
		cjcdfy=rs.getDouble("cjcdfy");
		sgdcdfy=rs.getDouble("sgdcdfy");
		khcdfy=rs.getDouble("khcdfy");
		qtfcdfy=rs.getDouble("qtfcdfy");
		gscdfy=rs.getDouble("gscdfy");
	}
	rs.close();
	ps.close();


	ls_sql="select pzyy,pzr,pzsj,cjzrbl,sgdzrbl,khzrbl,gszrbl";
	ls_sql+=" from  crm_tszrhf";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pzyy=cf.fillNull(rs.getString("pzyy"));
		pzr=cf.fillNull(rs.getString("pzr"));
		pzsj=cf.fillNull(rs.getDate("pzsj"));
		cjzrbl=rs.getDouble("cjzrbl");
		sgdzrbl=rs.getDouble("sgdzrbl");
		khzrbl=rs.getDouble("khzrbl");
		gszrbl=rs.getDouble("gszrbl");
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,dwbh,sgd,zjxm,kbxbz,bxkssj,bxjzsj,bybxsm,bxjzsj-SYSDATE syts";
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

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		syts=rs.getInt("syts");
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">Ͷ�߱�����Ϣ����¼�ţ�<%=tsjlh%>��</div> 
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr> 
    <td width="18%" align="right" bgcolor="#FFFFCC">�ͻ����</td>
    <td width="32%" bgcolor="#FFFFCC"><%=khbh%></td>
    <td width="19%" align="right" bgcolor="#FFFFCC">��ͬ��</td>
    <td width="31%" bgcolor="#FFFFCC"><%=hth%></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#FFFFCC"> 
      �ͻ�����    </td>
    <td width="32%" bgcolor="#FFFFCC"> <%=khxm%></td>
    <td width="19%" align="right" bgcolor="#FFFFCC"> 
      ǩԼ����    </td>
    <td width="31%" bgcolor="#FFFFCC"><%=qyrq%> </td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#FFFFCC">���ݵ�ַ</td>
    <td colspan="3" bgcolor="#FFFFCC"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#FFFFCC"> 
      ǩԼ����    </td>
    <td width="32%" bgcolor="#FFFFCC"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    <td width="19%" align="right" bgcolor="#FFFFCC"> 
      ���ʦ    </td>
    <td width="31%" bgcolor="#FFFFCC"><%=sjs%> </td>
  </tr>
  <tr> 
    <td width="18%" bgcolor="#FFFFCC" align="right">�ʼ�</td>
    <td width="32%" bgcolor="#FFFFCC"><%=zjxm%></td>
    <td width="19%" bgcolor="#FFFFCC" align="right">ʩ����</td>
    <td width="31%" bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
  </tr>
  <tr> 
    <td width="18%" bgcolor="#FFFFCC" align="right"><b><font color="#0000CC">�ɱ��ޱ�־</font></b></td>
    <td width="32%" bgcolor="#FFFFCC"><%
	cf.selectToken(out,"Y+����&M+���ֱ���&N+������&0+δ����&1+Ԥ������",kbxbz,true);
%></td>
    <td width="19%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
    <td width="31%" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr> 
    <td width="18%" bgcolor="#FFFFCC" align="right"><b><font color="#0000CC">���޿�ʼʱ��</font></b></td>
    <td width="32%" bgcolor="#FFFFCC"><%=bxkssj%></td>
    <td width="19%" bgcolor="#FFFFCC" align="right"><font color="#0000CC"><b>���޽�ֹʱ��</b></font></td>
    <td width="31%" bgcolor="#FFFFCC"><%=bxjzsj%></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#FFFFCC"> 
      <b><font color="#0000CC">����˵��</font></b>    </td>
    <td colspan="3" bgcolor="#FFFFCC"> <%=bybxsm%>&nbsp;</td>
  </tr>
  <tr> 
    <td width="18%" bgcolor="#FF99FF" align="right">����</td>
    <td width="32%" bgcolor="#FF99FF"><%
	cf.selectToken(out,"1+Ͷ��&2+����",lx,true);
%></td>
    <td width="19%" bgcolor="#FF99FF" align="right">ά�޷���</td>
    <td width="31%" bgcolor="#FF99FF"><%
	cf.selectToken(out,"1+����ά��&2+������ά��",wxfl,true);
%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FF99FF">���س̶�</td>
    <td bgcolor="#FF99FF"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
    <td align="right" bgcolor="#FF99FF">&nbsp;</td>
    <td bgcolor="#FF99FF">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FF99FF">����רԱ</td>
    <td bgcolor="#FF99FF"><%=kszy%></td>
    <td align="right" bgcolor="#FF99FF">�ͻ��������</td>
    <td bgcolor="#FF99FF"><%=khldcs%>��
    <input type="button" name="Button2" value="�鿴�����¼" onClick="window.open('ViewCrm_khldjl.jsp?tsjlh=<%=tsjlh%>')"></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FF99FF">����רԱ�ɵ���</td>
    <td bgcolor="#FF99FF"><%=kszypdr%></td>
    <td align="right" bgcolor="#FF99FF">����רԱ�ɵ�ʱ��</td>
    <td bgcolor="#FF99FF"><%=kszypdsj%></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#FF99FF"><strong> 
      �᰸״̬    </strong></td>
    <td width="32%" bgcolor="#FF99FF"> <strong>
      <%=clzt%> 
    </strong></td>
    <td width="19%" align="right" bgcolor="#FF99FF"><strong> 
      ���β��Ŵ���״̬    </strong></td>
    <td width="31%" bgcolor="#FF99FF"> <strong>
      <%=zrbmclzt%> 
    </strong></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#FF99FF"> 
      �᰸ʱ��    </td>
    <td width="32%" bgcolor="#FF99FF"> <%=jasj%> </td>
    <td width="19%" align="right" bgcolor="#FF99FF"> 
      ���˹�֪ͨ���β���    </td>
    <td width="31%" bgcolor="#FF99FF"><%
	cf.selectToken(out,"Y+��֪ͨ&N+����֪ͨ",sfxtz,true);
%> </td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF"> 
      Ͷ����Դ    </td>
    <td width="32%" bgcolor="#E8E8FF"> <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm where slfsbm='"+slfsbm+"'",slfsbm,true);
%> </td>
    <td width="19%" rowspan="8" align="right" bgcolor="#E8E8FF"> 
      
      
      
      Ͷ�߱�������    </td>
    <td rowspan="8" bgcolor="#E8E8FF" width="31%"><%=tsnr%> </td>
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
    <td width="18%" align="right" bgcolor="#E8E8FF"> 
      ¼��ʱ��    </td>
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
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right"> 
      �Ƿ���ط�    </td>
    <td width="32%"> <%
	cf.selectToken(out,"Y+��ط�&N+����ط�",sfxhf,true);
%></td>
    <td width="19%" align="right">��ط�ʱ��</td>
    <td width="31%"><%=hfsj%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right">���»ط�ʱ��</td>
    <td width="32%"><%=zxhfsj%></td>
    <td width="19%" align="right">���»ط���</td>
    <td width="31%"><%=hfr%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="18%" align="right" height="22"> 
      ���»طü�¼��    </td>
    <td width="32%" height="22"><%=hfjlh%> </td>
    <td width="19%" align="right" height="22">&nbsp;</td>
    <td width="31%" height="22">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4" align="center"><strong>ά�޷�</strong></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF"> 
      ά��ʩ����    </td>
    <td width="32%" bgcolor="#E8E8FF"><%=wxsgd%></td>
    <td width="19%" align="right" bgcolor="#E8E8FF">&nbsp; </td>
    <td width="31%" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">ά���˹���</td>
    <td width="32%" bgcolor="#E8E8FF"><%=wxrgf%></td>
    <td width="19%" align="right" bgcolor="#E8E8FF">ά�޳���</td>
    <td width="31%" bgcolor="#E8E8FF"><%=wxcf%></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">ά�޲��Ϸ�</td>
    <td width="32%" bgcolor="#E8E8FF"><%=wxclf%> 
      <input type="button" name="Button" value="�鿴���Ϸ�" onClick="window.open('Crm_wxclfmxCxList.jsp?tsjlh=<%=tsjlh%>')">    </td>
    <td width="19%" align="right" bgcolor="#E8E8FF">ά���ܷ���</td>
    <td width="31%" bgcolor="#E8E8FF"><%=wxzfy%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF">���ҳе�����</td>
    <td bgcolor="#E8E8FF"><%=cjcdfy%></td>
    <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
    <td bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">ʩ���ӳе�����</td>
    <td width="32%" bgcolor="#E8E8FF"><%=sgdcdfy%></td>
    <td width="19%" align="right" bgcolor="#E8E8FF">ҵ���е�����</td>
    <td width="31%" bgcolor="#E8E8FF"><%=khcdfy%></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">��˾�е�����</td>
    <td width="32%" bgcolor="#E8E8FF"><%=gscdfy%></td>
    <td width="19%" align="right" bgcolor="#E8E8FF">�������е�����</td>
    <td width="31%" bgcolor="#E8E8FF"><%=qtfcdfy%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td colspan="4" align="center"><strong>�����ж�</strong></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">�Ƿ�������</td>
    <td width="32%" bgcolor="#E8E8FF"><%
	cf.selectToken(out,"Y+��&N+��",sfpz,true);
%></td>
    <td width="19%" align="right" bgcolor="#E8E8FF">&nbsp; </td>
    <td width="31%" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">����ԭ��</td>
    <td colspan="3" bgcolor="#E8E8FF"><%=pzyy%></td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">������</td>
    <td width="32%" bgcolor="#E8E8FF"><%=pzr%></td>
    <td width="19%" align="right" bgcolor="#E8E8FF">����ʱ��</td>
    <td width="31%" bgcolor="#E8E8FF"><%=pzsj%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF">�������α���</td>
    <td bgcolor="#E8E8FF"><%=cjzrbl%>��</td>
    <td align="right" bgcolor="#E8E8FF">ʩ�������α���</td>
    <td bgcolor="#E8E8FF"><%=sgdzrbl%>��</td>
  </tr>
  <tr> 
    <td width="18%" align="right" bgcolor="#E8E8FF">�ͻ����α���</td>
    <td width="32%" bgcolor="#E8E8FF"><%=khzrbl%>��</td>
    <td width="19%" align="right" bgcolor="#E8E8FF">��˾���α���</td>
    <td width="31%" bgcolor="#E8E8FF"><%=gszrbl%>��</td>
  </tr>
</table>



<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">Ͷ�߱���ԭ��</td>
	<td  width="6%">���β���</td>
	<td  width="3%">������</td>
	<td  width="3%">�Ƿ���֪ͨ</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">�طý��</td>
	<td  width="5%">�Ƿ�ʱ��ϵ</td>
	<td  width="5%">�᰸�ͻ�����</td>
	<td  width="5%">�����ʱ��</td>
	<td  width="21%">�������</td>
	<td  width="4%">�˹�¼���־</td>
	<td  width="8%">�漰Ʒ�ƹ�Ӧ��</td>
	<td  width="6%">�漰Ʒ��</td>
	<td  width="8%">�漰��Ӧ��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	ls_sql="SELECT '��'||dm_tsxlbm.tsxlmc||'��'||dm_tsyybm.tsyymc tsyymc,sq_dwxx.dwmc,zrr, DECODE(crm_tsbm.sfytz,'0','δ֪ͨ','1','��֪ͨ','2','����֪ͨ') sfytz, DECODE(crm_tsbm.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') clzt,hfjgmc, DECODE(crm_tsbm.sfjslx,'Y','��ʱ��ϵ','N','δ��ʱ��ϵ','W','���δ֪') sfjslx,zzjgmc,jsxmc,NVL2(crm_tsbm.clqk,'��'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'��'||crm_tsbm.clr||'����'||crm_tsbm.clqk ,'') clqk,DECODE(crm_tsbm.rglrbz,'1','ϵͳȡ��','2','�˹�¼��'),crm_tsbm.tspp,crm_tsbm.ppmc,crm_tsbm.gys";
	ls_sql+=" FROM crm_tsbm,dm_tsxlbm,dm_tsyybm,sq_dwxx,dm_jsxbm,dm_zzjgbm,dm_hfjgbm";
    ls_sql+=" where crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm";
	ls_sql+=" and crm_tsbm.tsjlh='"+tsjlh+"' and crm_tsbm.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_tsbm.jsxbm=dm_jsxbm.jsxbm(+) and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+)";
	ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
	ls_sql+=" order by crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.alignStr[0]="align='left'";
	pageObj.alignStr[8]="align='left'";
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("tsyymc","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("sfytz","1");//�в����������Hash��
	spanColHash.put("clzt","1");//�в����������Hash��
	spanColHash.put("hfjgmc","1");//�в����������Hash��
	spanColHash.put("sfjslx","1");//�в����������Hash��
	spanColHash.put("zzjgmc","1");//�в����������Hash��
	spanColHash.put("jsxmc","1");//�в����������Hash��
	spanColHash.put("clqk","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%> 
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�����¼��</td>
	<td  width="12%">�ֳ����</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
</tr>
<%	
	ls_sql="SELECT crm_tsbxxckcjl.kcjlh,crm_tsbxxckcjl.xcqk,crm_tsbxxckcjl.cxcr,crm_tsbxxckcjl.cxcsj,crm_tsbxxckcjl.lrr,crm_tsbxxckcjl.lrsj,dwmc";
	ls_sql+=" FROM crm_khxx,crm_tsbxxckcjl,crm_tsjl,sq_dwxx  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsbxxckcjl.tsjlh=crm_tsjl.tsjlh and crm_tsbxxckcjl.lrbm=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_tsbxxckcjl.tsjlh='"+tsjlh+"'";
    ls_sql+=" order by crm_tsbxxckcjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"kcjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/tsgl/xckcjl/viewKcjlPhoto.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("kcjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%> 
</table>
		
		
		
		<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#CCCCCC" align="center"> 
            <td width="8%">�طü�¼��</td>
            <td width="8%">�ط�ʱ��</td>
            <td width="6%">�ط���</td>
            <td width="55%">�ͻ��ط����</td>
            <td width="26%">�ط��г��ֵ�������</td>
          </tr>
          <%
//	String hfjlh=null;
	String khhfqk=null;
	String cxxwt=null;
//	String hfr=null;
//	String hfsj=null;

	ls_sql="select crm_tshfjl.hfjlh,hfsj,hfr,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjlhfmx.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));

		//��ȡ���»ط���
		ls_sql=" SELECT yhmc";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where yhdlm='"+hfr+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			hfr=rs1.getString(1);
		}
		rs1.close();
		ps1.close();
%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center" ><a href="/tsgl/tshf/ViewCrm_tshfjl.jsp?hfjlh=<%=hfjlh%>" target="_blank"><%=hfjlh%></A></td>
            <td align="center" ><%=hfsj%></td>
			<td align="center"><%=cf.fillHtml(hfr)%></td>
            <td ><%=khhfqk%></td>
            <td ><%=cxxwt%></td>
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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
