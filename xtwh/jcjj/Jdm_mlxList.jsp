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
	String mlx=null;
	String mlxmc=null;
	mlx=request.getParameter("mlx");
	if (mlx!=null)
	{
		mlx=cf.GB2Uni(mlx);
		if (!(mlx.equals("")))	wheresql+=" and  (mlx='"+mlx+"')";
	}
	mlxmc=request.getParameter("mlxmc");
	if (mlxmc!=null)
	{
		mlxmc=cf.GB2Uni(mlxmc);
		if (!(mlxmc.equals("")))	wheresql+=" and  (mlxmc='"+mlxmc+"')";
	}
	ls_sql="SELECT mlx,mlxmc,gdbxy||'mm���Ŷ��߶ȡ�'||gdbdy||'mm',kdbxy||'mm���Ŷ���ȡ�'||kdbdy||'mm',tx  ";
	ls_sql+=" FROM jdm_mlx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by mlx";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_mlxList.jsp","SelectJdm_mlx.jsp","","EditJdm_mlx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"mlx","mlxmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"mlx"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_mlxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] mlx = request.getParameterValues("mlx");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(mlx,"mlx"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_mlx where "+chooseitem;
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
	<td  width="6%">�����ͱ���</td>
	<td  width="12%">����������</td>
	<td  width="20%">�Ŷ��߶Ⱥ���Χ</td>
	<td  width="20%">�Ŷ���Ⱥ���Χ</td>
	<td  width="34%">����</td>
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