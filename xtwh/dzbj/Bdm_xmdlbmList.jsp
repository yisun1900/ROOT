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
	String xmdlbm=null;
	String xmdlmc=null;
	String sftsxm=null;
	xmdlbm=request.getParameter("xmdlbm");
	if (xmdlbm!=null)
	{
		xmdlbm=cf.GB2Uni(xmdlbm);
		if (!(xmdlbm.equals("")))	wheresql+=" and  (xmdlbm='"+xmdlbm+"')";
	}
	xmdlmc=request.getParameter("xmdlmc");
	if (xmdlmc!=null)
	{
		xmdlmc=cf.GB2Uni(xmdlmc);
		if (!(xmdlmc.equals("")))	wheresql+=" and  (xmdlmc='"+xmdlmc+"')";
	}
	sftsxm=request.getParameter("sftsxm");
	if (sftsxm!=null)
	{
		sftsxm=cf.GB2Uni(sftsxm);
		if (!(sftsxm.equals("")))	wheresql+=" and  (sftsxm='"+sftsxm+"')";
	}
	ls_sql="SELECT xmdlbm,xmdlmc, DECODE(sftsxm,'1','�����ࣨ��ٷֱ��շ���Ŀ��أ�','2','�����ࣨ�������շ���Ŀ�޹أ�','3','������')  ";
	ls_sql+=" FROM bdm_xmdlbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by xmdlbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bdm_xmdlbmList.jsp","SelectBdm_xmdlbm.jsp","","EditBdm_xmdlbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xmdlbm","xmdlmc","sftsxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xmdlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bdm_xmdlbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xmdlbm = request.getParameterValues("xmdlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmdlbm,"xmdlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bdm_xmdlbm where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="20%">��Ŀ�������</td>
	<td  width="40%">��Ŀ��������</td>
	<td  width="30%">��Ŀ����</td>
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