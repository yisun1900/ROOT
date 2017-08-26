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
	String ztbm=null;
	String ztmc=null;
	String ztlx=null;
	String sqzt=null;
	ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		ztbm=cf.GB2Uni(ztbm);
		if (!(ztbm.equals("")))	wheresql+=" and  (ztbm='"+ztbm+"')";
	}
	ztmc=request.getParameter("ztmc");
	if (ztmc!=null)
	{
		ztmc=cf.GB2Uni(ztmc);
		if (!(ztmc.equals("")))	wheresql+=" and  (ztmc='"+ztmc+"')";
	}
	ztlx=request.getParameter("ztlx");
	if (ztlx!=null)
	{
		ztlx=cf.GB2Uni(ztlx);
		if (!(ztlx.equals("")))	wheresql+=" and  (ztlx='"+ztlx+"')";
	}
	sqzt=request.getParameter("sqzt");
	if (sqzt!=null)
	{
		sqzt=cf.GB2Uni(sqzt);
		if (!(sqzt.equals("")))	wheresql+=" and  (sqzt='"+sqzt+"')";
	}
	ls_sql="SELECT ztbm,ztmc,DECODE(sqzt,'02','��������','03','����ͨ��','04','����ȡ��') sqzt, DECODE(ztlx,'01','��Ƹ','02','��ѵ','03','�䶯','04','��������','06','������ְ','07','��������','08','�Ӱ�����','09','���ڿ�������','10','��ٵ�','11','��������','12','�����λ����','13','��ְ����','14','�˻���Ա����') ztlxmc  ";
	ls_sql+=" FROM rs_ztbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by ztlx,ztbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ztbmList.jsp","SelectRs_ztbm.jsp","","EditRs_ztbm.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ztbm","ztmc","ztlx","sqzt"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ztbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_ztbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sqzt","1");//�в����������Hash��
	spanColHash.put("ztlxmc","2");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] ztbm = request.getParameterValues("ztbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ztbm,"ztbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_ztbm where "+chooseitem;
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
	<td  width="15%">״̬����</td>
	<td  width="30%">״̬����</td>
	<td  width="20%">���޸�����״̬</td>
	<td  width="25%">״̬����</td>
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