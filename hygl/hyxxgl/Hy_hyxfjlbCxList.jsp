<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String hy_hyxfjlb_hybh=null;
	String hy_hyxfjlb_ywxh=null;
	String hy_hyxfjlb_dwbh=null;
	String hy_hyxfjlb_gmyy=null;
	String hy_hyxfjlb_gmrq=null;
	String hy_hyxfjlb_gmzje=null;
	String hy_hyxfjlb_gmyjbm=null;
	String hy_hyxfjlb_jbr=null;
	String hy_hyxxb_hykh=null;
	String hy_hyxxb_hyjb=null;
	hy_hyxfjlb_hybh=request.getParameter("hy_hyxfjlb_hybh");
	if (hy_hyxfjlb_hybh!=null)
	{
		hy_hyxfjlb_hybh=cf.GB2Uni(hy_hyxfjlb_hybh);
		if (!(hy_hyxfjlb_hybh.equals("")))	wheresql+=" and  (hy_hyxfjlb.hybh='"+hy_hyxfjlb_hybh+"')";
	}
	hy_hyxfjlb_ywxh=request.getParameter("hy_hyxfjlb_ywxh");
	if (hy_hyxfjlb_ywxh!=null)
	{
		hy_hyxfjlb_ywxh=cf.GB2Uni(hy_hyxfjlb_ywxh);
		if (!(hy_hyxfjlb_ywxh.equals("")))	wheresql+=" and  (hy_hyxfjlb.ywxh='"+hy_hyxfjlb_ywxh+"')";
	}
	hy_hyxfjlb_dwbh=request.getParameter("hy_hyxfjlb_dwbh");
	if (hy_hyxfjlb_dwbh!=null)
	{
		hy_hyxfjlb_dwbh=cf.GB2Uni(hy_hyxfjlb_dwbh);
		if (!(hy_hyxfjlb_dwbh.equals("")))	wheresql+=" and  (hy_hyxfjlb.dwbh='"+hy_hyxfjlb_dwbh+"')";
	}
	hy_hyxfjlb_gmyy=request.getParameter("hy_hyxfjlb_gmyy");
	if (hy_hyxfjlb_gmyy!=null)
	{
		hy_hyxfjlb_gmyy=cf.GB2Uni(hy_hyxfjlb_gmyy);
		if (!(hy_hyxfjlb_gmyy.equals("")))	wheresql+=" and  (hy_hyxfjlb.gmyy='"+hy_hyxfjlb_gmyy+"')";
	}
	hy_hyxfjlb_gmrq=request.getParameter("hy_hyxfjlb_gmrq");
	if (hy_hyxfjlb_gmrq!=null)
	{
		hy_hyxfjlb_gmrq=hy_hyxfjlb_gmrq.trim();
		if (!(hy_hyxfjlb_gmrq.equals("")))	wheresql+="  and (hy_hyxfjlb.gmrq>=TO_DATE('"+hy_hyxfjlb_gmrq+"','YYYY/MM/DD'))";
	}
	hy_hyxfjlb_gmrq=request.getParameter("hy_hyxfjlb_gmrq2");
	if (hy_hyxfjlb_gmrq!=null)
	{
		hy_hyxfjlb_gmrq=hy_hyxfjlb_gmrq.trim();
		if (!(hy_hyxfjlb_gmrq.equals("")))	wheresql+="  and (hy_hyxfjlb.gmrq<=TO_DATE('"+hy_hyxfjlb_gmrq+"','YYYY/MM/DD'))";
	}
	hy_hyxfjlb_gmzje=request.getParameter("hy_hyxfjlb_gmzje");
	if (hy_hyxfjlb_gmzje!=null)
	{
		hy_hyxfjlb_gmzje=hy_hyxfjlb_gmzje.trim();
		if (!(hy_hyxfjlb_gmzje.equals("")))	wheresql+=" and  (hy_hyxfjlb.gmzje="+hy_hyxfjlb_gmzje+") ";
	}
	hy_hyxfjlb_gmyjbm=request.getParameter("hy_hyxfjlb_gmyjbm");
	if (hy_hyxfjlb_gmyjbm!=null)
	{
		hy_hyxfjlb_gmyjbm=cf.GB2Uni(hy_hyxfjlb_gmyjbm);
		if (!(hy_hyxfjlb_gmyjbm.equals("")))	wheresql+=" and  (hy_hyxfjlb.gmyjbm='"+hy_hyxfjlb_gmyjbm+"')";
	}
	hy_hyxfjlb_jbr=request.getParameter("hy_hyxfjlb_jbr");
	if (hy_hyxfjlb_jbr!=null)
	{
		hy_hyxfjlb_jbr=cf.GB2Uni(hy_hyxfjlb_jbr);
		if (!(hy_hyxfjlb_jbr.equals("")))	wheresql+=" and  (hy_hyxfjlb.jbr='"+hy_hyxfjlb_jbr+"')";
	}
	hy_hyxxb_hykh=request.getParameter("hy_hyxxb_hykh");
	if (hy_hyxxb_hykh!=null)
	{
		hy_hyxxb_hykh=cf.GB2Uni(hy_hyxxb_hykh);
		if (!(hy_hyxxb_hykh.equals("")))	wheresql+=" and  (hy_hyxxb.hykh='"+hy_hyxxb_hykh+"')";
	}
	hy_hyxxb_hyjb=request.getParameter("hy_hyxxb_hyjb");
	if (hy_hyxxb_hyjb!=null)
	{
		hy_hyxxb_hyjb=cf.GB2Uni(hy_hyxxb_hyjb);
		if (!(hy_hyxxb_hyjb.equals("")))	wheresql+=" and  (hy_hyxxb.hyjb='"+hy_hyxxb_hyjb+"')";
	}
	ls_sql="SELECT hy_hyxfjlb.hybh as hybh,hy_hyxfjlb.ywxh as ywxh,hy_hyxfjlb.dwbh as hy_hyxfjlb_dwbh,hy_hyxfjlb.gmyy as hy_hyxfjlb_gmyy,hy_hyxfjlb.gmrq as hy_hyxfjlb_gmrq,hy_hyxfjlb.gmzje as hy_hyxfjlb_gmzje,hy_hyxfjlb.gmyjbm as hy_hyxfjlb_gmyjbm,hy_hyxfjlb.jbr as hy_hyxfjlb_jbr,hy_hyxxb.hykh as hy_hyxxb_hykh,hy_hyxxb.hyjb as hy_hyxxb_hyjb  ";
	ls_sql+=" FROM hy_hyxxb,hy_hyxfjlb  ";
    ls_sql+=" where hy_hyxfjlb.hybh=hy_hyxxb.hybh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hy_hyxfjlbCxList.jsp","SelectCxHy_hyxfjlb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hybh","ywxh","hy_hyxfjlb_dwbh","hy_hyxfjlb_gmyy","hy_hyxfjlb_gmrq","hy_hyxfjlb_gmzje","hy_hyxfjlb_gmyjbm","hy_hyxfjlb_jbr","hy_hyxxb_hykh","hy_hyxxb_hyjb"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hybh","ywxh"};
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
	<td  width="10%">��Ա���</td>
	<td  width="10%">ҵ�����</td>
	<td  width="10%">����ص�</td>
	<td  width="10%">����ԭ��</td>
	<td  width="10%">��������</td>
	<td  width="10%">�����ܽ��</td>
	<td  width="10%">�������</td>
	<td  width="10%">������</td>
	<td  width="10%">ˮ�ʷ�������</td>
	<td  width="10%">��Ա����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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