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
	String crm_zjsjk_jlh=null;
	String crm_zjsjk_zjlxbm=null;
	String crm_zjsjk_bt=null;
	String crm_zjsjk_nr=null;
	String crm_zjsjk_lrrq=null;
	String crm_zjsjk_yhdlm=null;
	crm_zjsjk_jlh=request.getParameter("crm_zjsjk_jlh");
	if (crm_zjsjk_jlh!=null)
	{
		crm_zjsjk_jlh=crm_zjsjk_jlh.trim();
		if (!(crm_zjsjk_jlh.equals("")))	wheresql+=" and (crm_zjsjk.jlh="+crm_zjsjk_jlh+") ";
	}
	crm_zjsjk_zjlxbm=request.getParameter("crm_zjsjk_zjlxbm");
	if (crm_zjsjk_zjlxbm!=null)
	{
		crm_zjsjk_zjlxbm=cf.GB2Uni(crm_zjsjk_zjlxbm);
		if (!(crm_zjsjk_zjlxbm.equals("")))	wheresql+=" and  (crm_zjsjk.zjlxbm='"+crm_zjsjk_zjlxbm+"')";
	}
	crm_zjsjk_bt=request.getParameter("crm_zjsjk_bt");
	if (crm_zjsjk_bt!=null)
	{
		crm_zjsjk_bt=cf.GB2Uni(crm_zjsjk_bt);
		if (!(crm_zjsjk_bt.equals("")))	wheresql+=" and  (crm_zjsjk.bt like '%"+crm_zjsjk_bt+"%')";
	}
	crm_zjsjk_nr=request.getParameter("crm_zjsjk_nr");
	if (crm_zjsjk_nr!=null)
	{
		crm_zjsjk_nr=cf.GB2Uni(crm_zjsjk_nr);
		if (!(crm_zjsjk_nr.equals("")))	wheresql+=" and  (crm_zjsjk.nr like '%"+crm_zjsjk_nr+"%')";
	}
	crm_zjsjk_lrrq=request.getParameter("crm_zjsjk_lrrq");
	if (crm_zjsjk_lrrq!=null)
	{
		crm_zjsjk_lrrq=crm_zjsjk_lrrq.trim();
		if (!(crm_zjsjk_lrrq.equals("")))	wheresql+="  and (crm_zjsjk.lrrq>=TO_DATE('"+crm_zjsjk_lrrq+"','YYYY/MM/DD'))";
	}
	crm_zjsjk_lrrq=request.getParameter("crm_zjsjk_lrrq2");
	if (crm_zjsjk_lrrq!=null)
	{
		crm_zjsjk_lrrq=crm_zjsjk_lrrq.trim();
		if (!(crm_zjsjk_lrrq.equals("")))	wheresql+="  and (crm_zjsjk.lrrq<=TO_DATE('"+crm_zjsjk_lrrq+"','YYYY/MM/DD'))";
	}
	crm_zjsjk_yhdlm=request.getParameter("crm_zjsjk_yhdlm");
	if (crm_zjsjk_yhdlm!=null)
	{
		crm_zjsjk_yhdlm=cf.GB2Uni(crm_zjsjk_yhdlm);
		if (!(crm_zjsjk_yhdlm.equals("")))	wheresql+=" and  (crm_zjsjk.yhdlm='"+crm_zjsjk_yhdlm+"')";
	}
	ls_sql="SELECT crm_zjsjk.jlh as jlh,dm_zjlxbm.zjlxmc as dm_zjlxbm_zjlxmc,crm_zjsjk.bt,nr";
	ls_sql+=" FROM dm_zjlxbm,crm_zjsjk  ";
    ls_sql+=" where crm_zjsjk.zjlxbm=dm_zjlxbm.zjlxbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zjsjkList.jsp","SelectCrm_zjsjk.jsp","","EditCrm_zjsjk.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jlh","dm_zjlxbm_zjlxmc","crm_zjsjk_bt","crm_zjsjk_lrrq","crm_zjsjk_yhdlm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_zjsjkList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_zjsjk.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] jlh = request.getParameterValues("jlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jlh,"jlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_zjsjk where "+chooseitem;
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
	<td  width="11%">&nbsp;</td>
	<td  width="8%">��¼��</td>
	<td  width="13%">ר�ҿ�����</td>
	<td  width="20%">����</td>
	<td  width="48%">����</td>
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