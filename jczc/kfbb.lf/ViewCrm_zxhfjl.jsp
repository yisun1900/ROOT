<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String khbh=request.getParameter("khbh");
	String hfsj=request.getParameter("hfsj");
	String hfsj2=request.getParameter("hfsj2");
	
	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxhfjl.hfsj,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk,sq_dwxx.dwmc hfbm, DECODE(crm_zxhfjl.lfbz,'N','δ����','Y','������'),crm_zxhfjl.lfsj, DECODE(crm_zxhfjl.ctbz,'N','δ��ͼ','Y','�ѳ�ͼ'),crm_zxhfjl.ctsj, DECODE(crm_zxhfjl.yqghdm,'N','��Ҫ��','Y','Ҫ�����'), DECODE(crm_zxhfjl.yqghsjs,'N','��Ҫ��','Y','Ҫ�����'),c.hfjgmc sjszysp,d.hfjgmc sjsfw,e.hfjgmc qtryfw,f.hfjgmc gcbj,g.hfjgmc gsztyx,h.hfjgmc xwgjfm";
	ls_sql+=" FROM crm_zxhfjl,crm_zxkhxx,sq_dwxx";
	ls_sql+=" ,dm_hfjgbm c,dm_hfjgbm d,dm_hfjgbm e,dm_hfjgbm f,dm_hfjgbm g,dm_hfjgbm h";
    ls_sql+=" where crm_zxhfjl.hfbm=sq_dwxx.dwbh and crm_zxhfjl.khbh=crm_zxkhxx.khbh ";
	ls_sql+=" and crm_zxhfjl.sjszysp=c.hfjgbm(+) and crm_zxhfjl.sjsfw=d.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.qtryfw=e.hfjgbm(+) and crm_zxhfjl.gcbj=f.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.gsztyx=g.hfjgbm(+) and crm_zxhfjl.xwgjfm=h.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_zxhfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxhfjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zxhfjl.hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
   pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��


//��������
	pageObj.alignStr[3]="align='left'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ�ͻ����ط�ͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
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
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>
