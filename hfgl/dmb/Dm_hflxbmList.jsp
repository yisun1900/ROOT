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
	String hflxbm=null;
	String hflxmc=null;
	String hfdl=null;
	String sjjg=null;
	String sfzdsz=null;
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (hflxbm='"+hflxbm+"')";
	}
	hflxmc=request.getParameter("hflxmc");
	if (hflxmc!=null)
	{
		hflxmc=cf.GB2Uni(hflxmc);
		if (!(hflxmc.equals("")))	wheresql+=" and  (hflxmc='"+hflxmc+"')";
	}
	hfdl=request.getParameter("hfdl");
	if (hfdl!=null)
	{
		hfdl=cf.GB2Uni(hfdl);
		if (!(hfdl.equals("")))	wheresql+=" and  (hfdl='"+hfdl+"')";
	}
	sjjg=request.getParameter("sjjg");
	if (sjjg!=null)
	{
		sjjg=sjjg.trim();
		if (!(sjjg.equals("")))	wheresql+=" and (sjjg="+sjjg+") ";
	}
	sfzdsz=request.getParameter("sfzdsz");
	if (sfzdsz!=null)
	{
		sfzdsz=sfzdsz.trim();
		if (!(sfzdsz.equals("")))	wheresql+=" and (sfzdsz="+sfzdsz+") ";
	}
	ls_sql="SELECT hflxbm,hflxmc, DECODE(hfdl,'1','��ѯ�ͻ��ط�','2','��ʩ���̻ط�','3','���޿ͻ��ط�','4','Ͷ�߱��޻ط�'),DECODE(sfzdsz,'1','�Զ�','2','�ֶ�����'),sjjg  ";
	ls_sql+=" FROM dm_hflxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by hfdl,hflxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_hflxbmList.jsp","SelectDm_hflxbm.jsp","","EditDm_hflxbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hflxbm","hflxmc","hfdl","sjjg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hflxbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_hflxbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] hflxbm = request.getParameterValues("hflxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hflxbm,"hflxbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_hflxbm where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="12%">�ط����ͱ���</td>
	<td  width="30%">�ط���������</td>
	<td  width="22%">�طô���</td>
	<td  width="12%">�Ƿ��Զ�����</td>
	<td  width="18%">�ط�ʱ����(����)</td>
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