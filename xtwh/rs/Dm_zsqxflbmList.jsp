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
	String zsqxflbm=null;
	String zsqxflmc=null;
	String qsz=null;
	String zzz=null;
	zsqxflbm=request.getParameter("zsqxflbm");
	if (zsqxflbm!=null)
	{
		zsqxflbm=cf.GB2Uni(zsqxflbm);
		if (!(zsqxflbm.equals("")))	wheresql+=" and  (zsqxflbm='"+zsqxflbm+"')";
	}
	zsqxflmc=request.getParameter("zsqxflmc");
	if (zsqxflmc!=null)
	{
		zsqxflmc=cf.GB2Uni(zsqxflmc);
		if (!(zsqxflmc.equals("")))	wheresql+=" and  (zsqxflmc='"+zsqxflmc+"')";
	}
	qsz=request.getParameter("qsz");
	if (qsz!=null)
	{
		qsz=qsz.trim();
		if (!(qsz.equals("")))	wheresql+=" and (qsz="+qsz+") ";
	}
	zzz=request.getParameter("zzz");
	if (zzz!=null)
	{
		zzz=zzz.trim();
		if (!(zzz.equals("")))	wheresql+=" and (zzz="+zzz+") ";
	}
	ls_sql="SELECT zsqxflbm,zsqxflmc,qsz,zzz  ";
	ls_sql+=" FROM dm_zsqxflbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by zsqxflbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_zsqxflbmList.jsp","SelectDm_zsqxflbm.jsp","","EditDm_zsqxflbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zsqxflbm","zsqxflmc","qsz","zzz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zsqxflbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_zsqxflbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String[] zsqxflbm = request.getParameterValues("zsqxflbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zsqxflbm,"zsqxflbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_zsqxflbm where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	<td  width="12%">&nbsp;</td>
	<td  width="15%">��˾���޷������</td>
	<td  width="35%">��˾���޷�������</td>
	<td  width="15%">��ʼֵ���£�>=</td>
	<td  width="15%">��ֵֹ���£�<</td>
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