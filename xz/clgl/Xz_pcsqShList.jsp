<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_pcsq_sqxh=null;
	String xz_pcsq_dwbh=null;
	String xz_pcsq_sqrq=null;
	String xz_pcsq_ycsj=null;
	String xz_pcsq_mdd=null;
	String xz_pcsq_sqr=null;
	String xz_pcsq_qcdm=null;
	String xz_pcsq_pzr=null;
	String sfysh=null;
	xz_pcsq_sqxh=request.getParameter("xz_pcsq_sqxh");
	if (xz_pcsq_sqxh!=null)
	{
		xz_pcsq_sqxh=cf.GB2Uni(xz_pcsq_sqxh);
		if (!(xz_pcsq_sqxh.equals("")))	wheresql+=" and  (xz_pcsq.sqxh='"+xz_pcsq_sqxh+"')";
	}
	xz_pcsq_dwbh=request.getParameter("xz_pcsq_dwbh");
	if (xz_pcsq_dwbh!=null)
	{
		xz_pcsq_dwbh=cf.GB2Uni(xz_pcsq_dwbh);
		if (!(xz_pcsq_dwbh.equals("")))	wheresql+=" and  (xz_pcsq.dwbh='"+xz_pcsq_dwbh+"')";
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
	xz_pcsq_mdd=request.getParameter("xz_pcsq_mdd");
	if (xz_pcsq_mdd!=null)
	{
		xz_pcsq_mdd=cf.GB2Uni(xz_pcsq_mdd);
		if (!(xz_pcsq_mdd.equals("")))	wheresql+=" and  (xz_pcsq.mdd='"+xz_pcsq_mdd+"')";
	}
	xz_pcsq_sqr=request.getParameter("xz_pcsq_sqr");
	if (xz_pcsq_sqr!=null)
	{
		xz_pcsq_sqr=cf.GB2Uni(xz_pcsq_sqr);
		if (!(xz_pcsq_sqr.equals("")))	wheresql+=" and  (xz_pcsq.sqr='"+xz_pcsq_sqr+"')";
	}
	xz_pcsq_qcdm=request.getParameter("xz_pcsq_qcdm");
	if (xz_pcsq_qcdm!=null)
	{
		xz_pcsq_qcdm=cf.GB2Uni(xz_pcsq_qcdm);
		if (!(xz_pcsq_qcdm.equals("")))	wheresql+=" and  (xz_pcsq.qcdm='"+xz_pcsq_qcdm+"')";
	}
	xz_pcsq_pzr=request.getParameter("xz_pcsq_pzr");
	if (xz_pcsq_pzr!=null)
	{
		xz_pcsq_pzr=cf.GB2Uni(xz_pcsq_pzr);
		if (!(xz_pcsq_pzr.equals("")))	wheresql+=" and  (xz_pcsq.pzr='"+xz_pcsq_pzr+"')";
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
sfysh=request.getParameter("SFYSH");
	if(sfysh.equals("N"))
	{
	wheresql+="and (trim(xz_pcsq.qcdm) is  null)";//δ���
	}
	else
	{
	wheresql+="and (trim(xz_pcsq.qcdm) is not null)";//�����	
	}
	ls_sql="SELECT xz_pcsq.sqxh as sqxh,sq_dwxx.dwmc as xz_pcsq_dwbh,xz_pcsq.sqrq as xz_pcsq_sqrq,xz_pcsq.ycsj as xz_pcsq_ycsj,xz_pcsq.mdd as xz_pcsq_mdd,xz_pcsq.ycsy as xz_pcsq_ycsy,xz_pcsq.sqr as xz_pcsq_sqr,xz_qcdm.qcph as xz_pcsq_qcdm,xz_pcsq.pzr as xz_pcsq_pzr ";
	ls_sql+=" FROM xz_qcdm,xz_pcsq,sq_dwxx  ";
    ls_sql+=" where xz_pcsq.qcdm=xz_qcdm.qcdm(+) and xz_pcsq.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	//pageObj.initPage("Xz_pcsqCxList.jsp","SelectCxXz_pcsq.jsp","","");
	pageObj.initPage("","","","ShXz_pcsq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","xz_pcsq_dwbh","xz_pcsq_sqrq","xz_pcsq_ycsj","xz_pcsq_mdd","xz_pcsq_ycsy","xz_pcsq_sqr","xz_pcsq_qcdm","xz_pcsq_pzr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");

//�����г�������
/*
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXz_pcsq.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��*/
}
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
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
     <td  width="5%">���</td>
	<td  width="9%">�������</td>
	<td  width="8%">���벿��</td>
	<td  width="11%">��������</td>
	<td  width="11%">�ó�ʱ��</td>
	<td  width="8%">Ŀ�ĵ�</td>
	<td  width="11%">�ó�����</td>
	<td  width="8%">������</td>
	<td  width="9%">���ƺ�</td>
	<td  width="8%">��׼��</td>

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