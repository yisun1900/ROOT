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
	String dnsbgzbm=null;
	String dnsbgzmc=null;
	dnsbgzbm=request.getParameter("dnsbgzbm");
	if (dnsbgzbm!=null)
	{
		dnsbgzbm=cf.GB2Uni(dnsbgzbm);
		if (!(dnsbgzbm.equals("")))	wheresql+=" and  (dnsbgzbm='"+dnsbgzbm+"')";
	}
	dnsbgzmc=request.getParameter("dnsbgzmc");
	if (dnsbgzmc!=null)
	{
		dnsbgzmc=cf.GB2Uni(dnsbgzmc);
		if (!(dnsbgzmc.equals("")))	wheresql+=" and  (dnsbgzmc='"+dnsbgzmc+"')";
	}
	ls_sql="SELECT dnsbgzbm,dnsbgzmc  ";
	ls_sql+=" FROM xz_dnsbgzbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by dnsbgzbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_dnsbgzbmList.jsp","SelectXz_dnsbgzbm.jsp","","EditXz_dnsbgzbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dnsbgzbm","dnsbgzmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dnsbgzbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_dnsbgzbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] dnsbgzbm = request.getParameterValues("dnsbgzbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dnsbgzbm,"dnsbgzbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from xz_dnsbgzbm where "+chooseitem;
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
	<td  width="24%">���Լ��豸���ϱ���</td>
	<td  width="64%">���Լ��豸��������</td>
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