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
	String dm_jdxmbm_jdxmbm=null;
	String dm_jdxmbm_jdxmmc=null;
	String dm_jdxmbm_jdlxbm=null;
	String dm_jdxmbm_jdqrlx=null;
	dm_jdxmbm_jdxmbm=request.getParameter("dm_jdxmbm_jdxmbm");
	if (dm_jdxmbm_jdxmbm!=null)
	{
		dm_jdxmbm_jdxmbm=cf.GB2Uni(dm_jdxmbm_jdxmbm);
		if (!(dm_jdxmbm_jdxmbm.equals("")))	wheresql+=" and  (dm_jdxmbm.jdxmbm='"+dm_jdxmbm_jdxmbm+"')";
	}
	dm_jdxmbm_jdxmmc=request.getParameter("dm_jdxmbm_jdxmmc");
	if (dm_jdxmbm_jdxmmc!=null)
	{
		dm_jdxmbm_jdxmmc=cf.GB2Uni(dm_jdxmbm_jdxmmc);
		if (!(dm_jdxmbm_jdxmmc.equals("")))	wheresql+=" and  (dm_jdxmbm.jdxmmc='"+dm_jdxmbm_jdxmmc+"')";
	}
	dm_jdxmbm_jdlxbm=request.getParameter("dm_jdxmbm_jdlxbm");
	if (dm_jdxmbm_jdlxbm!=null)
	{
		dm_jdxmbm_jdlxbm=cf.GB2Uni(dm_jdxmbm_jdlxbm);
		if (!(dm_jdxmbm_jdlxbm.equals("")))	wheresql+=" and  (dm_jdxmbm.jdlxbm='"+dm_jdxmbm_jdlxbm+"')";
	}
	dm_jdxmbm_jdqrlx=request.getParameter("dm_jdxmbm_jdqrlx");
	if (dm_jdxmbm_jdqrlx!=null)
	{
		dm_jdxmbm_jdqrlx=cf.GB2Uni(dm_jdxmbm_jdqrlx);
		if (!(dm_jdxmbm_jdqrlx.equals("")))	wheresql+=" and  (dm_jdxmbm.jdqrlx='"+dm_jdxmbm_jdqrlx+"')";
	}
	ls_sql="SELECT dm_jdxmbm.jdxmbm,dm_jdxmbm.jdxmmc,dm_jdlxbm.jdlxmc,dm_jdqrlx.jdqrlxmc  ";
	ls_sql+=" FROM dm_jdlxbm,dm_jdqrlx,dm_jdxmbm  ";
    ls_sql+=" where dm_jdxmbm.jdlxbm=dm_jdlxbm.jdlxbm(+) and dm_jdxmbm.jdqrlx=dm_jdqrlx.jdqrlx(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_jdxmbm.jdxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_jdxmbmList.jsp","","","EditDm_jdxmbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jdxmbm","dm_jdxmbm_jdxmmc","dm_jdlxbm_jdlxmc","dm_jdqrlx_jdqrlxmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jdxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_jdxmbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] jdxmbm = request.getParameterValues("jdxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jdxmbm,"jdxmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_jdxmbm where "+chooseitem;
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
	<td  width="22%">������Ŀ����</td>
	<td  width="22%">������Ŀ����</td>
	<td  width="22%">������������</td>
	<td  width="22%">����ȷ����������</td>
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