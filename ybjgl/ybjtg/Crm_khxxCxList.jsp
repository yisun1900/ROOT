<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String sqbh=request.getParameter("sqbh");

	String ls_sql=null;
	String wheresql="";
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_xb=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hxbm=null;
	String crm_khxx_fgflbm=null;
	String crm_khxx_zxjwbm=null;
	String crm_khxx_hxmjbm=null;
	String crm_khxx_ysbm=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sbrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_ybjbz=null;
	String crm_khxx_ybjyxq=null;
	String crm_khxx_ybjdjsj=null;

	String cqbm=null;
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";

	
	
	
	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_xb=request.getParameter("crm_khxx_xb");
	if (crm_khxx_xb!=null)
	{
		crm_khxx_xb=cf.GB2Uni(crm_khxx_xb);
		if (!(crm_khxx_xb.equals("")))	wheresql+=" and  (crm_khxx.xb='"+crm_khxx_xb+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_hxbm=request.getParameter("crm_khxx_hxbm");
	if (crm_khxx_hxbm!=null)
	{
		crm_khxx_hxbm=cf.GB2Uni(crm_khxx_hxbm);
		if (!(crm_khxx_hxbm.equals("")))	wheresql+=" and  (crm_khxx.hxbm='"+crm_khxx_hxbm+"')";
	}
	crm_khxx_fgflbm=request.getParameter("crm_khxx_fgflbm");
	if (crm_khxx_fgflbm!=null)
	{
		crm_khxx_fgflbm=cf.GB2Uni(crm_khxx_fgflbm);
		if (!(crm_khxx_fgflbm.equals("")))	wheresql+=" and  (crm_khxx.fgflbm='"+crm_khxx_fgflbm+"')";
	}
	crm_khxx_zxjwbm=request.getParameter("crm_khxx_zxjwbm");
	if (crm_khxx_zxjwbm!=null)
	{
		crm_khxx_zxjwbm=cf.GB2Uni(crm_khxx_zxjwbm);
		if (!(crm_khxx_zxjwbm.equals("")))	wheresql+=" and  (crm_khxx.zxjwbm='"+crm_khxx_zxjwbm+"')";
	}
	crm_khxx_hxmjbm=request.getParameter("crm_khxx_hxmjbm");
	if (crm_khxx_hxmjbm!=null)
	{
		crm_khxx_hxmjbm=cf.GB2Uni(crm_khxx_hxmjbm);
		if (!(crm_khxx_hxmjbm.equals("")))	wheresql+=" and  (crm_khxx.hxmjbm='"+crm_khxx_hxmjbm+"')";
	}
	crm_khxx_ysbm=request.getParameter("crm_khxx_ysbm");
	if (crm_khxx_ysbm!=null)
	{
		crm_khxx_ysbm=cf.GB2Uni(crm_khxx_ysbm);
		if (!(crm_khxx_ysbm.equals("")))	wheresql+=" and  (crm_khxx.ysbm='"+crm_khxx_ysbm+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sbrq=request.getParameter("crm_khxx_sbrq");
	if (crm_khxx_sbrq!=null)
	{
		crm_khxx_sbrq=crm_khxx_sbrq.trim();
		if (!(crm_khxx_sbrq.equals("")))	wheresql+="  and (crm_khxx.sbrq>=TO_DATE('"+crm_khxx_sbrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sbrq=request.getParameter("crm_khxx_sbrq2");
	if (crm_khxx_sbrq!=null)
	{
		crm_khxx_sbrq=crm_khxx_sbrq.trim();
		if (!(crm_khxx_sbrq.equals("")))	wheresql+="  and (crm_khxx.sbrq<=TO_DATE('"+crm_khxx_sbrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_ybjbz=request.getParameter("crm_khxx_ybjbz");
	if (crm_khxx_ybjbz!=null)
	{
		crm_khxx_ybjbz=cf.GB2Uni(crm_khxx_ybjbz);
		if (!(crm_khxx_ybjbz.equals("")))	wheresql+=" and  (crm_khxx.ybjbz='"+crm_khxx_ybjbz+"')";
	}
	crm_khxx_ybjyxq=request.getParameter("crm_khxx_ybjyxq");
	if (crm_khxx_ybjyxq!=null)
	{
		crm_khxx_ybjyxq=crm_khxx_ybjyxq.trim();
		if (!(crm_khxx_ybjyxq.equals("")))	wheresql+="  and (crm_khxx.ybjyxq>=TO_DATE('"+crm_khxx_ybjyxq+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjyxq=request.getParameter("crm_khxx_ybjyxq2");
	if (crm_khxx_ybjyxq!=null)
	{
		crm_khxx_ybjyxq=crm_khxx_ybjyxq.trim();
		if (!(crm_khxx_ybjyxq.equals("")))	wheresql+="  and (crm_khxx.ybjyxq<=TO_DATE('"+crm_khxx_ybjyxq+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjdjsj=request.getParameter("crm_khxx_ybjdjsj");
	if (crm_khxx_ybjdjsj!=null)
	{
		crm_khxx_ybjdjsj=crm_khxx_ybjdjsj.trim();
		if (!(crm_khxx_ybjdjsj.equals("")))	wheresql+="  and (crm_khxx.ybjdjsj>=TO_DATE('"+crm_khxx_ybjdjsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjdjsj=request.getParameter("crm_khxx_ybjdjsj2");
	if (crm_khxx_ybjdjsj!=null)
	{
		crm_khxx_ybjdjsj=crm_khxx_ybjdjsj.trim();
		if (!(crm_khxx_ybjdjsj.equals("")))	wheresql+="  and (crm_khxx.ybjdjsj<=TO_DATE('"+crm_khxx_ybjdjsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT sgdmc sgd";
	ls_sql+=" ,(select count(*) from crm_khxx c where c.sgd=crm_khxx.sgd and c.zt='2' and c.gcjdbm!='5' ) zsl";
	ls_sql+=" ,crm_khxx.sgbz,khbh,ybjyxq,khxm,cqmc,fwdz,hxmc,hxmjmc,fgflmc,zxjwmc,ysmc ";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_fgflbm,dm_zxjwbm,dm_hxmjbm,dm_ysbm,dm_hxbm,dm_cqbm";
    ls_sql+=" where (crm_khxx.sgd=sq_sgd.sgd(+)) and zt='2' and ybjbz='Y'";
	ls_sql+=" and crm_khxx.fgflbm=dm_fgflbm.fgflbm(+) and crm_khxx.zxjwbm=dm_zxjwbm.zxjwbm(+)";
	ls_sql+=" and crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm(+) and crm_khxx.ysbm=dm_ysbm.ysbm(+) and crm_khxx.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and crm_khxx.cqbm=dm_cqbm.cqbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by zsl,sgdmc,crm_khxx.sgbz";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_xb","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_ybjbz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//���ð�ť����
	String[] buttonName={"���������"};//��ť����ʾ����
	String[] buttonLink={"SaveInsertYbj_fpybj.jsp?sqbh="+sqbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgd","1");//�в����������Hash��
	spanColHash.put("zsl","1");//�в����������Hash��
	spanColHash.put("zje","1");//�в����������Hash��
	spanColHash.put("sgbz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">ʩ����</td>
	<td  width="6%">��ʩ����</td>
	<td  width="5%">����</td>
	<td  width="6%">�������</td>
	<td  width="7%">��Ч��</td>
	<td  width="6%">����</td>
	<td  width="7%">����</td>
	<td  width="21%">������ַ</td>
	<td  width="6%">����</td>
	<td  width="7%">���</td>
	<td  width="6%">���</td>
	<td  width="7%">��λ</td>
	<td  width="7%">��ɫ</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>