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
	String xh=null;
	String ssfgs=null;
	String gzfw=null;
	String gzxx=null;
	String gzsx=null;
	String gsbl=null;
	String gdsj=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ssfgs='"+ssfgs+"')";
	}
	gzfw=request.getParameter("gzfw");
	if (gzfw!=null)
	{
		gzfw=cf.GB2Uni(gzfw);
		if (!(gzfw.equals("")))	wheresql+=" and  (gzfw='"+gzfw+"')";
	}
	gzxx=request.getParameter("gzxx");
	if (gzxx!=null)
	{
		gzxx=gzxx.trim();
		if (!(gzxx.equals("")))	wheresql+=" and  (gzxx="+gzxx+") ";
	}
	gzsx=request.getParameter("gzsx");
	if (gzsx!=null)
	{
		gzsx=gzsx.trim();
		if (!(gzsx.equals("")))	wheresql+=" and  (gzsx="+gzsx+") ";
	}
	gsbl=request.getParameter("gsbl");
	if (gsbl!=null)
	{
		gsbl=gsbl.trim();
		if (!(gsbl.equals("")))	wheresql+=" and  (gsbl="+gsbl+") ";
	}
	gdsj=request.getParameter("gdsj");
	if (gdsj!=null)
	{
		gdsj=gdsj.trim();
		if (!(gdsj.equals("")))	wheresql+=" and  (gdsj="+gdsj+") ";
	}
	ls_sql="SELECT xh,ssfgs,gzfw,gzxx,gzsx,gsbl,gdsj  ";
	ls_sql+=" FROM rs_ksbl  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ksblCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ssfgs","gzfw","gzxx","gzsx","gsbl","gdsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%">���</td>
	<td  width="14%">�ֹ�˾</td>
	<td  width="14%">���ʷ�Χ</td>
	<td  width="14%">��������</td>
	<td  width="14%">��������</td>
	<td  width="14%">��˰����</td>
	<td  width="14%">�̶�˰��</td>
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