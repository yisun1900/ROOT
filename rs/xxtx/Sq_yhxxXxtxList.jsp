<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}



	String ls_sql=null;
	String wheresql="";
	String ygbh=null;
	String yhmc=null;
	String bianhao=null;
	String sfzh=null;
	String xzzwbm=null;
	String dwbh=null;
	String ssfgs=null;

	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (sq_yhxx.ygbh="+ygbh+") ";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+yhmc+"%')";
	}
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+bianhao+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (sq_yhxx.sfzh='"+sfzh+"')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");
%>

<CENTER >
  <B><font size="3">�������ѣ�ʱ�䷶Χ��<%=yue%>�£�</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ա�����</td>
	<td  width="11%">Ա������</td>
	<td  width="10%">��������</td>
	<td  width="11%">����</td>
	<td  width="19%">���֤��</td>
	<td  width="14%">����ְ��</td>
	<td  width="16%">��������</td>
	<td  width="13%">������˾</td>
</tr>
<%

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.csrq,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh and sq_yhxx.sfzszg in('N','Y')";
    ls_sql+=wheresql;
	ls_sql+=" and TO_CHAR(sq_yhxx.csrq,'MM')='"+yue+"'";
    ls_sql+=" order by sq_yhxx.ssfgs,TO_CHAR(sq_yhxx.csrq,'DD')";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ygbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


<CENTER >
  <B><font size="3">�Ͷ���ͬ�������ѣ�ʱ�䷶Χ��<%=nian%>��<%=yue%>�£�</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ա�����</td>
	<td  width="9%">Ա������</td>
	<td  width="10%">��ͬ��ʼ</td>
	<td  width="10%">��ͬ����</td>
	<td  width="9%">����</td>
	<td  width="17%">���֤��</td>
	<td  width="12%">����ְ��</td>
	<td  width="14%">��������</td>
	<td  width="12%">������˾</td>
</tr>
<%

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.htksrq,sq_yhxx.htdqrq,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh and sq_yhxx.sfzszg in('N','Y')";
    ls_sql+=wheresql;
	ls_sql+=" and TO_CHAR(sq_yhxx.htdqrq,'YYYY')='"+nian+"'";
	ls_sql+=" and TO_CHAR(sq_yhxx.htdqrq,'MM')='"+yue+"'";
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.htdqrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName1={"ygbh"};
	pageObj.setKey(keyName1);


//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ygbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


<CENTER >
  <B><font size="3">һ������ת����Ա��<%=cf.today()%>����<%=cf.addDay(7)%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ա�����</td>
	<td  width="9%">Ա������</td>
	<td  width="10%">��ְ����</td>
	<td  width="10%">���ý�������</td>
	<td  width="9%">����</td>
	<td  width="17%">���֤��</td>
	<td  width="12%">����ְ��</td>
	<td  width="14%">��������</td>
	<td  width="12%">������˾</td>
</tr>
<%

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.yhmc,sq_yhxx.rzsj,sq_yhxx.syjzrq,sq_yhxx.bianhao,sq_yhxx.sfzh,sq_yhxx.xzzwbm,a.dwmc dwbh,b.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh and sq_yhxx.ssfgs=b.dwbh and sq_yhxx.sfzszg in('N')";
    ls_sql+=wheresql;
	ls_sql+=" and sq_yhxx.syjzrq>=TO_DATE('"+cf.today()+"','YYYY-MM-DD')";
	ls_sql+=" and sq_yhxx.syjzrq<=TO_DATE('"+cf.addDay(7)+"','YYYY-MM-DD')";
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.syjzrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName2={"ygbh"};
	pageObj.setKey(keyName2);


//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ygbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


</body>

</html>