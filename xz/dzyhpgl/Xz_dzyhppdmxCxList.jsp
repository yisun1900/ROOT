<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
%>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_dzyhppdmx_mc=null;
	String xz_dzyhppdmx_grsj=null;
	String xz_dzyhppdmx_dwbh=null;
	String xz_dzyhppdmx_pdsj=null;
	xz_dzyhppdmx_mc=request.getParameter("xz_dzyhppdmx_mc");
	if (xz_dzyhppdmx_mc!=null)
	{
		xz_dzyhppdmx_mc=cf.GB2Uni(xz_dzyhppdmx_mc);
		if (!(xz_dzyhppdmx_mc.equals("")))	wheresql+=" and  (xz_dzyhppdmx.mc='"+xz_dzyhppdmx_mc+"')";
	}
	xz_dzyhppdmx_grsj=request.getParameter("xz_dzyhppdmx_grsj");
	if (xz_dzyhppdmx_grsj!=null)
	{
		xz_dzyhppdmx_grsj=xz_dzyhppdmx_grsj.trim();
		if (!(xz_dzyhppdmx_grsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.grsj>=TO_DATE('"+xz_dzyhppdmx_grsj+"','YYYY/MM/DD'))";
	}
	xz_dzyhppdmx_grsj=request.getParameter("xz_dzyhppdmx_grsj2");
	if (xz_dzyhppdmx_grsj!=null)
	{
		xz_dzyhppdmx_grsj=xz_dzyhppdmx_grsj.trim();
		if (!(xz_dzyhppdmx_grsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.grsj<=TO_DATE('"+xz_dzyhppdmx_grsj+"','YYYY/MM/DD'))";
	}
	xz_dzyhppdmx_dwbh=request.getParameter("xz_dzyhppdmx_dwbh");
	if (xz_dzyhppdmx_dwbh!=null)
	{
		xz_dzyhppdmx_dwbh=cf.GB2Uni(xz_dzyhppdmx_dwbh);
		if (!(xz_dzyhppdmx_dwbh.equals("")))	wheresql+=" and  (xz_dzyhppdmx.dwbh='"+xz_dzyhppdmx_dwbh+"')";
	}
	xz_dzyhppdmx_pdsj=request.getParameter("xz_dzyhppdmx_pdsj");
	if (xz_dzyhppdmx_pdsj!=null)
	{
		xz_dzyhppdmx_pdsj=xz_dzyhppdmx_pdsj.trim();
		if (!(xz_dzyhppdmx_pdsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.pdsj>=TO_DATE('"+xz_dzyhppdmx_pdsj+"','YYYY/MM/DD'))";
	}
	xz_dzyhppdmx_pdsj=request.getParameter("xz_dzyhppdmx_pdsj2");
	if (xz_dzyhppdmx_pdsj!=null)
	{
		xz_dzyhppdmx_pdsj=xz_dzyhppdmx_pdsj.trim();
		if (!(xz_dzyhppdmx_pdsj.equals("")))	wheresql+="  and (xz_dzyhppdmx.pdsj<=TO_DATE('"+xz_dzyhppdmx_pdsj+"','YYYY/MM/DD'))";
	}
	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{

		wheresql+="and (1=1) ";
	}
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+="and  ssdw='"+ssfgs+"' ";
	}
	else
	{
		wheresql+="and (sq_dwxx.dwbh='"+dwbh+"') ";
	}
	ls_sql="SELECT xz_dzyhppdmx.pdxh as pdxh,xz_dzyhppdmx.bh as xz_dzyhppdmx_bh,xz_dzyhppdmx.mc as xz_dzyhppdmx_mc,xz_dzyhppdmx.dw as xz_dzyhppdmx_dw,xz_dzyhppdmx.sl as xz_dzyhppdmx_sl,xz_dzyhppdmx.xhjgg as xz_dzyhppdmx_xhjgg,xz_dzyhppdmx.grsj as xz_dzyhppdmx_grsj,xz_dzyhppdmx.gryz as xz_dzyhppdmx_gryz,xz_dzyhppdmx.zrr as xz_dzyhppdmx_zrr,xz_dzyhppdmx.pdr as xz_dzyhppdmx_pdr,xz_dzyhppdmx.pdsj as xz_dzyhppdmx_pdsj,xz_dzyhppdmx.bz as xz_dzyhppdmx_bz,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM sq_dwxx,xz_dzyhppdmx  ";
    ls_sql+=" where xz_dzyhppdmx.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_dzyhppdmxCxList.jsp","SelectCxXz_dzyhppdmx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pdxh","xz_dzyhppdmx_bh","xz_dzyhppdmx_mc","xz_dzyhppdmx_dw","xz_dzyhppdmx_sl","xz_dzyhppdmx_xhjgg","xz_dzyhppdmx_grsj","xz_dzyhppdmx_gryz","xz_dzyhppdmx_zrr","xz_dzyhppdmx_pdr","xz_dzyhppdmx_pdsj","xz_dzyhppdmx_bz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pdxh"};
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
	<td  width="6%">�̵����</td>
	<td  width="4%">���</td>
	<td  width="7%">����</td>
	<td  width="3%">��λ</td>
	<td  width="3%">����</td>
	<td  width="7%">�ͺż����</td>
	<td  width="7%">����ʱ��</td>
	<td  width="7%">����ԭֵ</td>
	<td  width="4%">������</td>
	<td  width="4%">�̵���</td>
	<td  width="7%">�̵�ʱ��</td>
	<td  width="9%">��ע</td>
	<td  width="7%">��λ����</td>
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