<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xz_pcsq_sqxh=null;
	String xz_pcsq_sqrq=null;
	String xz_pcsq_dwbh=null;
	String xz_pcsq_mdd=null;
	String xz_pcsq_ycsj=null;
	String xz_pcsq_sqr=null;
	String xz_pcsq_pzr=null;
	String xz_pcsq_qcdm=null;
	xz_pcsq_sqxh=request.getParameter("xz_pcsq_sqxh");
	if (xz_pcsq_sqxh!=null)
	{
		xz_pcsq_sqxh=cf.GB2Uni(xz_pcsq_sqxh);
		if (!(xz_pcsq_sqxh.equals("")))	wheresql+=" and  (xz_pcsq.sqxh='"+xz_pcsq_sqxh+"')";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq>=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq2");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq<=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_dwbh=request.getParameter("xz_pcsq_dwbh");
	if (xz_pcsq_dwbh!=null)
	{
		xz_pcsq_dwbh=cf.GB2Uni(xz_pcsq_dwbh);
		if (!(xz_pcsq_dwbh.equals("")))	wheresql+=" and  (xz_pcsq.dwbh='"+xz_pcsq_dwbh+"')";
	}
	xz_pcsq_mdd=request.getParameter("xz_pcsq_mdd");
	if (xz_pcsq_mdd!=null)
	{
		xz_pcsq_mdd=cf.GB2Uni(xz_pcsq_mdd);
		if (!(xz_pcsq_mdd.equals("")))	wheresql+=" and  (xz_pcsq.mdd='"+xz_pcsq_mdd+"')";
	}
	xz_pcsq_ycsj=request.getParameter("xz_pcsq_ycsj");
	if (xz_pcsq_ycsj!=null)
	{
		xz_pcsq_ycsj=cf.GB2Uni(xz_pcsq_ycsj);
		if (!(xz_pcsq_ycsj.equals("")))	wheresql+=" and  (xz_pcsq.ycsj>'"+xz_pcsq_ycsj+"')";
	}
		xz_pcsq_ycsj=request.getParameter("xz_pcsq_ycsj2");
	if (xz_pcsq_ycsj!=null)
	{
		xz_pcsq_ycsj=cf.GB2Uni(xz_pcsq_ycsj);
		if (!(xz_pcsq_ycsj.equals("")))	wheresql+=" and  (xz_pcsq.ycsj<'"+xz_pcsq_ycsj+"')";
	}
	xz_pcsq_sqr=request.getParameter("xz_pcsq_sqr");
	if (xz_pcsq_sqr!=null)
	{
		xz_pcsq_sqr=cf.GB2Uni(xz_pcsq_sqr);
		if (!(xz_pcsq_sqr.equals("")))	wheresql+=" and  (xz_pcsq.sqr='"+xz_pcsq_sqr+"')";
	}
	xz_pcsq_pzr=request.getParameter("xz_pcsq_pzr");
	if (xz_pcsq_pzr!=null)
	{
		xz_pcsq_pzr=cf.GB2Uni(xz_pcsq_pzr);
		if (!(xz_pcsq_pzr.equals("")))	wheresql+=" and  (xz_pcsq.pzr='"+xz_pcsq_pzr+"')";
	}
	xz_pcsq_qcdm=request.getParameter("xz_pcsq_qcdm");
	if (xz_pcsq_qcdm!=null)
	{
		xz_pcsq_qcdm=cf.GB2Uni(xz_pcsq_qcdm);
		if (!(xz_pcsq_qcdm.equals("")))	wheresql+=" and  (xz_pcsq.qcdm='"+xz_pcsq_qcdm+"')";
	}
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+="and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and  sq_dwxx.ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"') ";
	}	

	ls_sql="SELECT xz_pcsq.sqxh as sqxh,xz_pcsq.sqrq as xz_pcsq_sqrq,sq_dwxx.dwmc as xz_pcsq_dwbh,xz_pcsq.ycsy as xz_pcsq_ycsy,xz_pcsq.mdd as xz_pcsq_mdd,xz_pcsq.ycsj as xz_pcsq_ycsj,xz_pcsq.fhsj as xz_pcsq_fhsj,xz_pcsq.gls as xz_pcsq_gls,xz_pcsq.sqr as xz_pcsq_sqr,xz_pcsq.pzr as xz_pcsq_pzr,xz_qcdm.qcph as xz_pcsq_qcdm  ";
	ls_sql+=" FROM xz_pcsq,sq_dwxx,xz_qcdm ";
    ls_sql+=" where xz_pcsq.qcdm=xz_qcdm.qcdm(+) and xz_pcsq.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(20);
/*
//������ʾ��
	String[] disColName={"sqxh","xz_pcsq_sqrq","xz_pcsq_dwbh","xz_pcsq_ycsy","xz_pcsq_mdd","xz_pcsq_ycsj","xz_pcsq_fhsj","xz_pcsq_gls","xz_pcsq_sqr","xz_pcsq_pzr","xz_pcsq_qcdm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="7%">��������</td>
	<td  width="6%">���벿��</td>
	<td  width="9%">�ó�����</td>
	<td  width="5%">Ŀ�ĵ�</td>
	<td  width="9%">�ó�ʱ��</td>
	<td  width="9%">����ʱ��</td>
	<td  width="4%">������</td>
	<td  width="4%">������</td>
	<td  width="4%">��׼��</td>
	<td  width="8%">����</td>
</tr>
<%
	pageObj.displayDateSum();
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