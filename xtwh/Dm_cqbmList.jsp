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
	String dm_cqbm_cqbm=null;
	String dm_cqbm_cqmc=null;
	String dm_cqbm_dqbm=null;
	dm_cqbm_cqbm=request.getParameter("dm_cqbm_cqbm");
	if (dm_cqbm_cqbm!=null)
	{
		dm_cqbm_cqbm=cf.GB2Uni(dm_cqbm_cqbm);
		if (!(dm_cqbm_cqbm.equals("")))	wheresql+=" and  (dm_cqbm.cqbm='"+dm_cqbm_cqbm+"')";
	}
	dm_cqbm_cqmc=request.getParameter("dm_cqbm_cqmc");
	if (dm_cqbm_cqmc!=null)
	{
		dm_cqbm_cqmc=cf.GB2Uni(dm_cqbm_cqmc);
		if (!(dm_cqbm_cqmc.equals("")))	wheresql+=" and  (dm_cqbm.cqmc='"+dm_cqbm_cqmc+"')";
	}
	dm_cqbm_dqbm=request.getParameter("dm_cqbm_dqbm");
	if (dm_cqbm_dqbm!=null)
	{
		dm_cqbm_dqbm=cf.GB2Uni(dm_cqbm_dqbm);
		if (!(dm_cqbm_dqbm.equals("")))	wheresql+=" and  (dm_cqbm.dqbm='"+dm_cqbm_dqbm+"')";
	}
	ls_sql="SELECT dm_cqbm.cqbm,dm_cqbm.cqmc,dm_cqbm.dqbm,dm_dqbm.dqmc  ";
	ls_sql+=" FROM dm_dqbm,dm_cqbm  ";
    ls_sql+=" where dm_cqbm.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by  dm_cqbm.dqbm,dm_cqbm.cqbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_cqbmList.jsp","SelectDm_cqbm.jsp","","EditDm_cqbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cqbm","dm_cqbm_cqmc","dm_cqbm_dqbm","dm_dqbm_dqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cqbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_cqbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] cqbm = request.getParameterValues("cqbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cqbm,"cqbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_cqbm where "+chooseitem;
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
	<td  width="12%">��������</td>
	<td  width="22%">��������</td>
	<td  width="12%">��������</td>
	<td  width="22%">��������</td>
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