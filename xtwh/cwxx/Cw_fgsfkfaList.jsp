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
	String cw_fgsfkfa_fgsbh=null;
	String cw_fgsfkfa_fkfabm=null;
	cw_fgsfkfa_fgsbh=request.getParameter("cw_fgsfkfa_fgsbh");
	if (cw_fgsfkfa_fgsbh!=null)
	{
		cw_fgsfkfa_fgsbh=cf.GB2Uni(cw_fgsfkfa_fgsbh);
		if (!(cw_fgsfkfa_fgsbh.equals("")))	wheresql+=" and  (cw_fgsfkfa.fgsbh='"+cw_fgsfkfa_fgsbh+"')";
	}
	cw_fgsfkfa_fkfabm=request.getParameter("cw_fgsfkfa_fkfabm");
	if (cw_fgsfkfa_fkfabm!=null)
	{
		cw_fgsfkfa_fkfabm=cf.GB2Uni(cw_fgsfkfa_fkfabm);
		if (!(cw_fgsfkfa_fkfabm.equals("")))	wheresql+=" and  (cw_fgsfkfa.fkfabm='"+cw_fgsfkfa_fkfabm+"')";
	}
	ls_sql="SELECT cw_fgsfkfa.fgsbh,dwmc,cw_fgsfkfa.fkfabm,fkfamc  ";
	ls_sql+=" FROM cw_fgsfkfa,cw_fkfabm,sq_dwxx  ";
    ls_sql+=" where cw_fgsfkfa.fgsbh=sq_dwxx.dwbh(+) and cw_fgsfkfa.fkfabm=cw_fkfabm.fkfabm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_fgsfkfa.fgsbh,cw_fgsfkfa.fkfabm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_fgsfkfaList.jsp","","","EditCw_fgsfkfa.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fgsbh","fkfabm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fgsbh","fkfabm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_fgsfkfaList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"fkfabm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_fkfamx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fkfabm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_fgsfkfa where "+chooseitem;
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
	<td  width="12%">�ֹ�˾���</td>
	<td  width="30%">�ֹ�˾</td>
	<td  width="12%">���������</td>
	<td  width="34%">�����</td>
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