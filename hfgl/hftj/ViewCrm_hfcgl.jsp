<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");
	String hfr=cf.GB2Uni(cf.getParameter(request,"hfr"));
	
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ǩ�����ط���ϸ��<%=hfr%>��</font></B>
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ͻ�����</td>
	<td  width="10%">�ط�����</td>
	<td  width="9%">�طý��</td>
	<td  width="32%">�ط�����</td>
	<td  width="8%">�ط�ʱ��</td>
	<td  width="10%">����ʽ</td>
	<td  width="7%">�ط���</td>
	<td  width="10%">�طò���</td>
	<td  width="7%">�طü�¼��</td>
</tr>
<%
	ls_sql="SELECT khxm,hflxmc,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[��]��'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[��]��'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[��]��'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'<BR>[����]��'||jchfnr) as hfnr,hfsj,DECODE(clfs,'0','���账��','1','������ز���'),hfr,a.dwmc hfbm,crm_hfjl.hfjlh";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,crm_khxx,sq_dwxx a,dm_jglxbm  ";
    ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.hfbm=a.dwbh";
	ls_sql+=" and crm_hfjl.hflxbm=dm_hflxbm.hflxbm(+) and crm_hfjl.jglxbm=dm_jglxbm.jglxbm(+)";
	ls_sql+=" and crm_khxx.dwbh='"+dwbh+"' and crm_hfjl.hfr='"+hfr+"'";
	ls_sql+=" order by crm_hfjl.hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
   pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��


//��������
	pageObj.alignStr[3]="align='left'";

	pageObj.out=out;
	pageObj.getDate(1);
	
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

<CENTER >
  <B><font size="3">��ѯ�ͻ����ط���ϸ��<%=hfr%>��</font></B>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">�ط�ʱ��</td>
	<td  width="3%">�ط���</td>
	<td  width="27%">�ͻ��ط����</td>
	<td  width="5%">�طò���</td>
	<td  width="4%">������־</td>
	<td  width="4%">����ʱ��</td>
	<td  width="4%">��ƽ��ͼ��־</td>
	<td  width="4%">��ƽ��ͼʱ��</td>
	<td  width="4%">Ҫ���������</td>
	<td  width="4%">Ҫ��������ʦ</td>
	<td  width="4%">���ʦרҵˮƽ</td>
	<td  width="4%">���ʦ����</td>
	<td  width="4%">������Ա����</td>
	<td  width="4%">���̱���</td>
	<td  width="4%">��˾����ӡ��</td>
	<td  width="5%">ϣ���Ľ�����</td>
</tr>
<%
	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxhfjl.hfsj,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk,sq_dwxx.dwmc hfbm, DECODE(crm_zxhfjl.lfbz,'N','δ����','Y','������'),crm_zxhfjl.lfsj, DECODE(crm_zxhfjl.ctbz,'N','δ��ͼ','Y','�ѳ�ͼ'),crm_zxhfjl.ctsj, DECODE(crm_zxhfjl.yqghdm,'N','��Ҫ��','Y','Ҫ�����'), DECODE(crm_zxhfjl.yqghsjs,'N','��Ҫ��','Y','Ҫ�����'),c.hfjgmc sjszysp,d.hfjgmc sjsfw,e.hfjgmc qtryfw,f.hfjgmc gcbj,g.hfjgmc gsztyx,h.hfjgmc xwgjfm";
	ls_sql+=" FROM crm_zxhfjl,crm_zxkhxx,sq_dwxx";
	ls_sql+=" ,dm_hfjgbm c,dm_hfjgbm d,dm_hfjgbm e,dm_hfjgbm f,dm_hfjgbm g,dm_hfjgbm h";
    ls_sql+=" where crm_zxhfjl.hfbm=sq_dwxx.dwbh and crm_zxhfjl.khbh=crm_zxkhxx.khbh ";
	ls_sql+=" and crm_zxhfjl.sjszysp=c.hfjgbm(+) and crm_zxhfjl.sjsfw=d.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.qtryfw=e.hfjgbm(+) and crm_zxhfjl.gcbj=f.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.gsztyx=g.hfjgbm(+) and crm_zxhfjl.xwgjfm=h.hfjgbm(+)";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxhfjl.hfr='"+hfr+"'";
    ls_sql+=" order by crm_zxhfjl.hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
   pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��


//��������
	pageObj.alignStr[3]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%>
</body>
</html>
