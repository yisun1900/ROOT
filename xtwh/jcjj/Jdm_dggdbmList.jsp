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
	String dggdbm=null;
	String dggdmc=null;
	String dy=null;
	String xydy=null;
	dggdbm=request.getParameter("dggdbm");
	if (dggdbm!=null)
	{
		dggdbm=cf.GB2Uni(dggdbm);
		if (!(dggdbm.equals("")))	wheresql+=" and  (dggdbm='"+dggdbm+"')";
	}
	dggdmc=request.getParameter("dggdmc");
	if (dggdmc!=null)
	{
		dggdmc=cf.GB2Uni(dggdmc);
		if (!(dggdmc.equals("")))	wheresql+=" and  (dggdmc='"+dggdmc+"')";
	}
	dy=request.getParameter("dy");
	if (dy!=null)
	{
		dy=dy.trim();
		if (!(dy.equals("")))	wheresql+=" and (dy="+dy+") ";
	}
	xydy=request.getParameter("xydy");
	if (xydy!=null)
	{
		xydy=xydy.trim();
		if (!(xydy.equals("")))	wheresql+=" and (xydy="+xydy+") ";
	}
	ls_sql="SELECT dggdbm,dggdmc,dy,xydy  ";
	ls_sql+=" FROM jdm_dggdbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_dggdbmList.jsp","SelectJdm_dggdbm.jsp","","EditJdm_dggdbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dggdbm","dggdmc","dy","xydy"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dggdbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_dggdbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] dggdbm = request.getParameterValues("dggdbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dggdbm,"dggdbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_dggdbm where "+chooseitem;
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
	<td  width="22%">����߶��������</td>
	<td  width="22%">����߶���������</td>
	<td  width="22%">���ڣ�mm��</td>
	<td  width="22%">С�ڵ��ڣ�mm��</td>
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