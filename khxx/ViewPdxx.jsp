<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;
%>
<body bgcolor="#FFFFFF">
<div align="center">�ɵ���¼���ͻ���ţ�<%=khbh%>�� </div>
<table width="150%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="5%">�ɵ�ʱ��</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">����</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="3%">���ȼ�</td>
	<td  width="4%">�Ƿ�ռָ��</td>
	<td  width="5%">�����ɵ���</td>
	<td  width="3%">�ɵ���</td>
	<td  width="18%">�ɵ�˵��</td>

	<td  width="3%">�Ƿ�ܵ�</td>
	<td  width="5%">�ܵ�¼��ʱ��</td>
	<td  width="6%">�ܵ��۳��ɵ�ָ�����</td>
	<td  width="5%">�۳��ɵ���</td>
	<td  width="3%">�ܵ�¼����</td>
	<td  width="20%">�ܵ�ԭ��</td>
	<td  width="5%">�����ɵ���־</td>
	<td  width="5%">������¼��</td>
	
</tr>

<%
	ls_sql="SELECT pd_pdjl.pdsj,sgdmc,pd_pdjl.sgbz";
	ls_sql+=" ,DECODE(pd_pdjl.jlbz,'0','�˹��ɵ�','1','�ص�����','2','��˾����','3','���ʦָ���ɵ�','4','�ͻ�ָ���ɵ�','5','�󵥵�С��','6','С���ִ�','7','�������','8','�����ɵ�','9','ͬС���ɵ�') jlbz";
	ls_sql+=" ,TO_CHAR(pd_pdjl.sgdyxj) sgdyxj,DECODE(pd_pdjl.shzzb,'Y','ռָ��','N','��ռ') shzzb,pd_pdjl.jrpde";
	ls_sql+=" ,pd_pdjl.pdr,pd_pdjl.pdsm";
	ls_sql+=" ,DECODE(pd_pdjl.hfjl,'0','����','3','�ܵ�','5','����') hfjl,pd_pdjl.hfsj,DECODE(pd_pdjl.kczbbl,'0','����ָ��','1','�۳������ɵ���','2','�۳�2���ɵ���','3','�۳�3���ɵ���') kczbbl";
	ls_sql+=" ,pd_pdjl.kcpde,pd_pdjl.hfr,pd_pdjl.jjyy,DECODE(pd_pdjl.kppdbz,'1','�ǿ����ɵ�','2','�����ɵ�') kppdbz,pd_pdjl.kpjlh";
	ls_sql+=" FROM crm_khxx,sq_sgd,pd_pdjl ";
    ls_sql+=" where pd_pdjl.khbh=crm_khxx.khbh and pd_pdjl.sgd=sq_sgd.sgd(+)  ";
	ls_sql+=" and pd_pdjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_pdjl.xuhao,pd_pdjl.pdsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


<div align="center">�ɵ����ȼ� </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2"  width="5%">�����ɵ�ʩ����</td>
    <td rowspan="2"  width="5%">ֱ��</td>
    <td rowspan="2"  width="6%">ʩ����</td>
    <td rowspan="2"  width="6%">�Ƿ�ѡʩ����</td>
    <td rowspan="2"  width="4%">���ȼ�</td>
    <td rowspan="2"  width="5%">Ƿ����</td>
    <td colspan="4">���ڿɽӵ�</td>
    <td colspan="4">�ѽӵ�</td>
    <td colspan="4">ʣ�൥</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="6%">�ܶ�</td>
    <td  width="6%">�󵥶�</td>
    <td  width="6%">�е���</td>
    <td  width="5%">С����</td>
    <td  width="6%">�ܶ�</td>
    <td  width="6%">�󵥶�</td>
    <td  width="6%">�е���</td>
    <td  width="5%">С����</td>
    <td  width="6%">�ܶ�</td>
    <td  width="6%">�󵥶�</td>
    <td  width="6%">�е���</td>
    <td  width="5%">С����</td>
  </tr>
  <%

	ls_sql="SELECT a.sgdmc pdsgd,DECODE(b.sgdlx,'S0','��ֱ��','S1','ֱ��') sgdlx,b.sgdmc sgd,DECODE(sfbxsgd,'Y','<font color=\"#CC0000\">�ɵ�</font>','N','<font color=\"#0000CC\">��ѡ��</font>','M','δ��ѡ��'),hxsgdyxj,qdl,bqjdze,bqdde,bqzde,bqxde,yjdze,yjddje,yjzdje,yjxdje,sydze,syddje,syzdje,syxdje";
	ls_sql+=" FROM pd_pdyxjjl,sq_sgd a,sq_sgd b";
    ls_sql+=" where pd_pdyxjjl.pdsgd=a.sgd(+) and pd_pdyxjjl.sgd=b.sgd(+)";
    ls_sql+=" and pd_pdyxjjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_pdyxjjl.pdsgd,b.sgdlx desc,hxsgdyxj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pdsgd","1");//�в����������Hash��
	spanColHash.put("sgdlx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

<div align="center">��ʩ���Ӽ�¼ </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">��ʩ����ʱ��</td>
	<td  width="7%">ԭʩ����</td>
	<td  width="7%">ԭʩ���೤</td>
	<td  width="7%">��ʩ����</td>
	<td  width="7%">��ʩ���೤</td>
	<td  width="8%">��ԭʩ�����ɵ�ָ��ٷֱ�</td>
	<td  width="8%">����ʩ�����ɵ�ָ��ٷֱ�</td>
	<td  width="7%">������</td>
	<td  width="40%">��ʩ����ԭ��</td>
</tr>

<%

	ls_sql="SELECT pd_hsgdjl.lrsj,b.sgdmc oldsgd,pd_hsgdjl.oldsgbz,a.sgdmc newsgd,pd_hsgdjl.newsgbz";
	ls_sql+=" ,pd_hsgdjl.oldkzbbfb||'%' oldkzbbfb,pd_hsgdjl.newkzbbfb||'%' newkzbbfb,pd_hsgdjl.lrr,pd_hsgdjl.hsgdyy";
	ls_sql+=" FROM sq_sgd a,sq_sgd b,pd_hsgdjl ";
    ls_sql+=" where pd_hsgdjl.newsgd=a.sgd(+) and pd_hsgdjl.oldsgd=b.sgd(+) ";
    ls_sql+=" and pd_hsgdjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_hsgdjl.xuhao";
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
