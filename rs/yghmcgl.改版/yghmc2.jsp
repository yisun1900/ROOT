<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>Ա��ͨѶ¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<center>Ա��ͨѶ¼</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">��������</td>
	<td  width="10%">����</td>
	<td  width="15%">����</td>
	<td  width="15%">ְ��</td>
	<td  width="20%">�ֻ�</td>
	<td  width="20%">�칫�绰</td>
</tr>
<%
	String getygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String sq_yhxx_yhmc=null;
	String xzzwbm=null;
	String ssfgs=null;
	String sq_yhxx_dwbh=null;

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	String yhjs=(String)session.getAttribute("yhjs");
	String fgsbh=(String)session.getAttribute("ssfgs");


	ls_sql="SELECT sq_dwxx.dwmc||'��'||dwdh||'��' as sq_dwxx_dwmc,sq_yhxx.bianhao,sq_yhxx.yhmc,xzzwbm,sq_yhxx.dh,sq_yhxx.bgdh";
	ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh  and sq_yhxx.sfzszg not in('S','T')";
    ls_sql+=" and sq_yhxx.dhsfgb!='9'";
    ls_sql+=wheresql;

/*
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+getygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+getygbh+"' )";
	}
*/
	ls_sql+=" and ((sq_yhxx.yhdlm is null) OR (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')))";

	
    ls_sql+=" order  by sq_dwxx.xuhao,sq_dwxx.ssfgs,sq_dwxx.dwbh,sq_yhxx.xuhao,sq_yhxx.yhmc";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sq_dwxx_dwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>



</html>
