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
	String cpztbm=null;
	String cpztmc=null;
	String cplx=null;
	String ghf=null;
	cpztbm=request.getParameter("cpztbm");
	if (cpztbm!=null)
	{
		cpztbm=cf.GB2Uni(cpztbm);
		if (!(cpztbm.equals("")))	wheresql+=" and  (cpztbm='"+cpztbm+"')";
	}
	cpztmc=request.getParameter("cpztmc");
	if (cpztmc!=null)
	{
		cpztmc=cf.GB2Uni(cpztmc);
		if (!(cpztmc.equals("")))	wheresql+=" and  (cpztmc='"+cpztmc+"')";
	}
	cplx=request.getParameter("cplx");
	if (cplx!=null)
	{
		cplx=cf.GB2Uni(cplx);
		if (!(cplx.equals("")))	wheresql+=" and  (cplx='"+cplx+"')";
	}
	ghf=request.getParameter("ghf");
	if (ghf!=null)
	{
		ghf=cf.GB2Uni(ghf);
		if (!(ghf.equals("")))	wheresql+=" and  (ghf='"+ghf+"')";
	}
	ls_sql="SELECT ztxh,cpztbm,cpztmc, DECODE(cplx,'0','ȫ��','1','����Ʒ','2','��Ʒ') cplx,ghf  ";
	ls_sql+=" FROM dm_cpztbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by ghf,cplx,cpztbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_cpztbmList.jsp","","","EditDm_cpztbm.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cpztbm","cpztmc","cplx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cpztbm"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cplx","1");//�в����������Hash��
	spanColHash.put("ghf","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_cpztbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] cpztbm = request.getParameterValues("cpztbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpztbm,"cpztbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_cpztbm where "+chooseitem;
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
	<td  width="9%">״̬���</td>
	<td  width="12%">��Ʒ״̬����</td>
	<td  width="47%">��Ʒ״̬����</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="12%">������</td>
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