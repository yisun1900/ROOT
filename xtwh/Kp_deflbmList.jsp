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
	String deflbm=null;
	String deflmc=null;
	String dedy=null;
	String dexy=null;
	String depjz=null;
	deflbm=request.getParameter("deflbm");
	if (deflbm!=null)
	{
		deflbm=cf.GB2Uni(deflbm);
		if (!(deflbm.equals("")))	wheresql+=" and  (deflbm='"+deflbm+"')";
	}
	deflmc=request.getParameter("deflmc");
	if (deflmc!=null)
	{
		deflmc=cf.GB2Uni(deflmc);
		if (!(deflmc.equals("")))	wheresql+=" and  (deflmc='"+deflmc+"')";
	}
	dedy=request.getParameter("dedy");
	if (dedy!=null)
	{
		dedy=dedy.trim();
		if (!(dedy.equals("")))	wheresql+=" and (dedy="+dedy+") ";
	}
	dexy=request.getParameter("dexy");
	if (dexy!=null)
	{
		dexy=dexy.trim();
		if (!(dexy.equals("")))	wheresql+=" and (dexy="+dexy+") ";
	}
	depjz=request.getParameter("depjz");
	if (depjz!=null)
	{
		depjz=depjz.trim();
		if (!(depjz.equals("")))	wheresql+=" and (depjz="+depjz+") ";
	}
	ls_sql="SELECT deflbm,deflmc,dedy,dexy,depjz  ";
	ls_sql+=" FROM kp_deflbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by deflbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_deflbmList.jsp","SelectKp_deflbm.jsp","","EditKp_deflbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"deflbm","deflmc","dedy","dexy","depjz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"deflbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Kp_deflbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] deflbm = request.getParameterValues("deflbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(deflbm,"deflbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from kp_deflbm where "+chooseitem;
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
	<td  width="10%">����������</td>
	<td  width="17%">�����������</td>
	<td  width="17%">�������</td>
	<td  width="17%">����С��</td>
	<td  width="17%">����ƽ��ֵ</td>
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