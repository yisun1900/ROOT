<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_bgfysbb_sqxh=null;
	String xz_bgfysbb_dwbh=null;
	String xz_bgfysbb_sqrq=null;
	String xz_bgfysbb_sqr=null;
	String xz_bgfysbb_fymc=null;
	xz_bgfysbb_sqxh=request.getParameter("xz_bgfysbb_sqxh");
	if (xz_bgfysbb_sqxh!=null)
	{
		xz_bgfysbb_sqxh=cf.GB2Uni(xz_bgfysbb_sqxh);
		if (!(xz_bgfysbb_sqxh.equals("")))	wheresql+=" and  (xz_bgfysbb.sqxh='"+xz_bgfysbb_sqxh+"')";
	}
	xz_bgfysbb_dwbh=request.getParameter("xz_bgfysbb_dwbh");
	if (xz_bgfysbb_dwbh!=null)
	{
		xz_bgfysbb_dwbh=cf.GB2Uni(xz_bgfysbb_dwbh);
		if (!(xz_bgfysbb_dwbh.equals("")))	wheresql+=" and  (xz_bgfysbb.dwbh='"+xz_bgfysbb_dwbh+"')";
	}
	xz_bgfysbb_sqrq=request.getParameter("xz_bgfysbb_sqrq");
	if (xz_bgfysbb_sqrq!=null)
	{
		xz_bgfysbb_sqrq=xz_bgfysbb_sqrq.trim();
		if (!(xz_bgfysbb_sqrq.equals("")))	wheresql+="  and (xz_bgfysbb.sqrq>=TO_DATE('"+xz_bgfysbb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgfysbb_sqrq=request.getParameter("xz_bgfysbb_sqrq2");
	if (xz_bgfysbb_sqrq!=null)
	{
		xz_bgfysbb_sqrq=xz_bgfysbb_sqrq.trim();
		if (!(xz_bgfysbb_sqrq.equals("")))	wheresql+="  and (xz_bgfysbb.sqrq<=TO_DATE('"+xz_bgfysbb_sqrq+"','YYYY/MM/DD'))";
	}
	xz_bgfysbb_sqr=request.getParameter("xz_bgfysbb_sqr");
	if (xz_bgfysbb_sqr!=null)
	{
		xz_bgfysbb_sqr=cf.GB2Uni(xz_bgfysbb_sqr);
		if (!(xz_bgfysbb_sqr.equals("")))	wheresql+=" and  (xz_bgfysbb.sqr='"+xz_bgfysbb_sqr+"')";
	}
	xz_bgfysbb_fymc=request.getParameter("xz_bgfysbb_fymc");
	if (xz_bgfysbb_fymc!=null)
	{
		xz_bgfysbb_fymc=cf.GB2Uni(xz_bgfysbb_fymc);
		if (!(xz_bgfysbb_fymc.equals("")))	wheresql+=" and  (xz_bgfysbb.fymc='"+xz_bgfysbb_fymc+"')";
	}
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+=" and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="  and ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	}
	ls_sql="SELECT xz_bgfysbb.sqxh as sqxh,xz_bgfysbb.sqrq as xz_bgfysbb_sqrq,xz_bgfysbb.sqr as xz_bgfysbb_sqr,xz_bgfysbb.fymc as xz_bgfysbb_fymc,xz_bgfysbb.sxje as xz_bgfysbb_sxje,xz_bgfysbb.pzje as xz_bgfysbb_pzje,xz_bgfysbb.bz as xz_bgfysbb_bz,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM sq_dwxx,xz_bgfysbb  ";
    ls_sql+=" where xz_bgfysbb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_bgfysbbCxList.jsp","SelectCxXz_bgfysbb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","xz_bgfysbb_sqrq","xz_bgfysbb_sqr","xz_bgfysbb_fymc","xz_bgfysbb_sxje","xz_bgfysbb_pzje","xz_bgfysbb_bz","sq_dwxx_dwmc"};
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
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
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
	<td  width="12%">�������</td>
	<td  width="12%">��������</td>
	<td  width="12%">������</td>
	<td  width="12%">��������</td>
	<td  width="12%">������</td>
	<td  width="12%">��׼���</td>
	<td  width="12%">��ע</td>
	<td  width="12%">��λ����</td>
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