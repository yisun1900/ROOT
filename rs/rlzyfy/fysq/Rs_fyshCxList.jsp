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
	String hzbh=null;
	String yshz=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	String spjl=null;
	String spr=null;
	String spsj=null;
	String fgs=null;
	String nian=null;
	String yue=null;
	hzbh=request.getParameter("hzbh");
	if (hzbh!=null)
	{
		hzbh=cf.GB2Uni(hzbh);
		if (!(hzbh.equals("")))	wheresql+=" and  (hzbh='"+hzbh+"')";
	}
	yshz=request.getParameter("yshz");
	if (yshz!=null)
	{
		yshz=cf.GB2Uni(yshz);
		if (!(yshz.equals("")))	wheresql+=" and  (yshz='"+yshz+"')";
	}
	shjl=request.getParameter("shjl");
	if (shjl!=null)
	{
		shjl=cf.GB2Uni(shjl);
		if (!(shjl.equals("")))	wheresql+=" and  (shjl='"+shjl+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj<=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	spjl=request.getParameter("spjl");
	if (spjl!=null)
	{
		spjl=cf.GB2Uni(spjl);
		if (!(spjl.equals("")))	wheresql+=" and  (spjl='"+spjl+"')";
	}
	spr=request.getParameter("spr");
	if (spr!=null)
	{
		spr=cf.GB2Uni(spr);
		if (!(spr.equals("")))	wheresql+=" and  (spr='"+spr+"')";
	}
	spsj=request.getParameter("spsj");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj>=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	spsj=request.getParameter("spsj2");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj<=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (fgs='"+fgs+"')";
	}
	nian=request.getParameter("nian");
	if (nian!=null)
	{
		nian=cf.GB2Uni(nian);
		if (!(nian.equals("")))	wheresql+=" and  (nian='"+nian+"')";
	}
	yue=request.getParameter("yue");
	if (yue!=null)
	{
		yue=cf.GB2Uni(yue);
		if (!(yue.equals("")))	wheresql+=" and  (yue='"+yue+"')";
	}
	ls_sql="SELECT hzbh,sq_dwxx.dwmc fgs,nian,yue, DECODE(yshz,'01','�ȴ����','02','�ȴ�����','03','�������','04','�޸�','05','ȡ������') yshz,DECODE(shjl,'0','ȡ�����','1','���ͨ��','2','�����޸�') shjl,shyj,shr,shsj,DECODE(spjl,'0','����ȡ��','1','����ͨ��','2','�������') spjl,spyj,spr,spsj  ";
	ls_sql+=" FROM rs_fysh,sq_dwxx  ";
    ls_sql+=" where rs_fysh.fgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_fyshCxList.jsp","EnterSqbb0.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hzbh","yshz","shjl","shyj","shr","shsj","spjl","spyj","spr","spsj","fgs","nian","yue"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hzbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hzbh","fgs","shr","spr","yshz"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="fyhzbb.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hzbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
/*	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ԥ����</td>
	<td  width="9%">����ֹ�˾</td>
	<td  width="6%">��</td>
	<td  width="5%">��</td>
	<td  width="7%">Ԥ��״̬</td>
	<td  width="6%">��˽���</td>
	<td  width="11%">������</td>
	<td  width="6%">�����</td>
	<td  width="11%">���ʱ��</td>
	<td  width="6%">��������</td>
	<td  width="10%">�������</td>
	<td  width="6%">������</td>
	<td  width="10%">����ʱ��</td>

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