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
	String jc_mmst_wjjbm=null;
	String jc_mmst_mmstbm=null;
	String jc_mmst_bm=null;
	jc_mmst_wjjbm=request.getParameter("jc_mmst_wjjbm");
	if (jc_mmst_wjjbm!=null)
	{
		jc_mmst_wjjbm=cf.GB2Uni(jc_mmst_wjjbm);
		if (!(jc_mmst_wjjbm.equals("")))	wheresql+=" and  (jc_mmst.wjjbm='"+jc_mmst_wjjbm+"')";
	}
	jc_mmst_mmstbm=request.getParameter("jc_mmst_mmstbm");
	if (jc_mmst_mmstbm!=null)
	{
		jc_mmst_mmstbm=cf.GB2Uni(jc_mmst_mmstbm);
		if (!(jc_mmst_mmstbm.equals("")))	wheresql+=" and  (jc_mmst.mmstbm='"+jc_mmst_mmstbm+"')";
	}
	jc_mmst_bm=request.getParameter("jc_mmst_bm");
	if (jc_mmst_bm!=null)
	{
		jc_mmst_bm=cf.GB2Uni(jc_mmst_bm);
		if (!(jc_mmst_bm.equals("")))	wheresql+=" and  (jc_mmst.bm='"+jc_mmst_bm+"')";
	}
	ls_sql="SELECT jc_mmst.wjjbm as wjjbm,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_mmst.mmstbm as mmstbm,jdm_mmstbm.mmstmc as jdm_mmstbm_mmstmc,jc_mmst.bm as jc_mmst_bm  ";
	ls_sql+=" FROM jdm_wjjbm,jdm_mmstbm,jc_mmst  ";
    ls_sql+=" where jc_mmst.wjjbm=jdm_wjjbm.wjjbm and jc_mmst.mmstbm=jdm_mmstbm.mmstbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmst.wjjbm,jc_mmst.mmstbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmstList.jsp","SelectJc_mmst.jsp","","EditJc_mmst.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jdm_wjjbm_wjjmc","jdm_mmstbm_mmstmc","jc_mmst_bm"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"wjjbm","mmstbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mmstList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_mmst where "+chooseitem;
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
	<td  width="27%">����</td>
	<td  width="27%">����</td>
	<td  width="17%">����</td>
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