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
	String fysqbh=null;
	String fgs=null;
	String sqsj=null;
	String xqlx=null;
	String ytxs=null;
	String fy=null;
	String hzbh=null;
	String sfkg=null;
	String lrr=null;
	String lrsj=null;
	fysqbh=request.getParameter("fysqbh");
	if (fysqbh!=null)
	{
		fysqbh=cf.GB2Uni(fysqbh);
		if (!(fysqbh.equals("")))	wheresql+=" and  (fysqbh='"+fysqbh+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (fgs='"+fgs+"')";
	}
	sqsj=request.getParameter("sqsj");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj>=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	sqsj=request.getParameter("sqsj2");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj<=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	xqlx=request.getParameter("xqlx");
	if (xqlx!=null)
	{
		xqlx=cf.GB2Uni(xqlx);
		if (!(xqlx.equals("")))	wheresql+=" and  (xqlx='"+xqlx+"')";
	}
	ytxs=request.getParameter("ytxs");
	if (ytxs!=null)
	{
		ytxs=cf.GB2Uni(ytxs);
		if (!(ytxs.equals("")))	wheresql+=" and  (ytxs='"+ytxs+"')";
	}
	fy=request.getParameter("fy");
	if (fy!=null)
	{
		fy=fy.trim();
		if (!(fy.equals("")))	wheresql+=" and  (fy="+fy+") ";
	}
	hzbh=request.getParameter("hzbh");
	if (hzbh!=null)
	{
		hzbh=cf.GB2Uni(hzbh);
		if (!(hzbh.equals("")))	wheresql+=" and  (hzbh='"+hzbh+"')";
	}
	sfkg=request.getParameter("sfkg");
	if (sfkg!=null)
	{
		sfkg=cf.GB2Uni(sfkg);
		if (!(sfkg.equals("")))	wheresql+=" and  (sfkg='"+sfkg+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT fysqbh,sq_dwxx.dwmc fgs,sqsj, DECODE(xqlx,'01','��Ƹ��','02','��ѵ��','03','������','04','������','05','��ᱣ�շ�','06','������','07','��������') xqlx,ytxs,fy,hzbh,DECODE(sfkg,'Y','�ɸ�','N','���ɸ�'),rs_fysq.lrr,rs_fysq.lrsj,rs_fysq.bz  ";
	ls_sql+=" FROM rs_fysq,sq_dwxx  ";
    ls_sql+=" where  rs_fysq.fgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
	ls_sql+=" order by sqsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_fysqCxList.jsp","SelectCxRs_fysq.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fysqbh","fgs","sqsj","xqlx","ytxs","fy","bz","hzbh","sfkg","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fysqbh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">����������</td>
	<td  width="8%">����ֹ�˾</td>
	<td  width="8%">����ʱ��</td>
	<td  width="7%">��������</td>
	<td  width="18%">��;��ʽ</td>
	<td  width="6%">����</td>
	<td  width="8%">���ܱ��</td>
	<td  width="6%">�Ƿ�ɸ�</td>
	<td  width="6%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="17%">��ע</td>
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