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
	String dwflbm=null;
	String dwflmc=null;
	String dwdl=null;
	dwflbm=request.getParameter("dwflbm");
	if (dwflbm!=null)
	{
		dwflbm=cf.GB2Uni(dwflbm);
		if (!(dwflbm.equals("")))	wheresql+=" and  (dwflbm='"+dwflbm+"')";
	}
	dwflmc=request.getParameter("dwflmc");
	if (dwflmc!=null)
	{
		dwflmc=cf.GB2Uni(dwflmc);
		if (!(dwflmc.equals("")))	wheresql+=" and  (dwflmc='"+dwflmc+"')";
	}
	dwdl=request.getParameter("dwdl");
	if (dwdl!=null)
	{
		dwdl=cf.GB2Uni(dwdl);
		if (!(dwdl.equals("")))	wheresql+=" and  (dwdl='"+dwdl+"')";
	}
	ls_sql="SELECT dwflbm,dwflmc,dwtjflmc, DECODE(dwdl,'1','ҵ������','2','��ҵ������'),zzfw  ";
	ls_sql+=" FROM dm_dwflbm,dm_dwtjflbm  ";
    ls_sql+=" where dm_dwflbm.dwtjflbm=dm_dwtjflbm.dwtjflbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dwflbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_dwflbmList.jsp","SelectDm_dwflbm.jsp","","EditDm_dwflbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dwflbm","dwflmc","dwdl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwflbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_dwflbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] dwflbm = request.getParameterValues("dwflbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dwflbm,"dwflbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_dwflbm where "+chooseitem;
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
	<td  width="12%">��λ�������</td>
	<td  width="14%">��λ��������</td>
	<td  width="11%">ͳ�Ʒ���</td>
	<td  width="10%">��λ����</td>
	<td  width="45%">ְ��Χ</td>
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