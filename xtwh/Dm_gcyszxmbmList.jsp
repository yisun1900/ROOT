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
	String gcyszxmbm=null;
	String gcyszxmmc=null;
	String gcjdbm=null;
	gcyszxmbm=request.getParameter("gcyszxmbm");
	if (gcyszxmbm!=null)
	{
		gcyszxmbm=cf.GB2Uni(gcyszxmbm);
		if (!(gcyszxmbm.equals("")))	wheresql+=" and  (dm_gcyszxmbm.gcyszxmbm='"+gcyszxmbm+"')";
	}
	gcyszxmmc=request.getParameter("gcyszxmmc");
	if (gcyszxmmc!=null)
	{
		gcyszxmmc=cf.GB2Uni(gcyszxmmc);
		if (!(gcyszxmmc.equals("")))	wheresql+=" and  (dm_gcyszxmbm.gcyszxmmc='"+gcyszxmmc+"')";
	}
	gcjdbm=request.getParameter("gcjdbm");
	if (gcjdbm!=null)
	{
		gcjdbm=cf.GB2Uni(gcjdbm);
		if (!(gcjdbm.equals("")))	wheresql+=" and  (dm_gcyszxmbm.gcjdbm='"+gcjdbm+"')";
	}
	String dygcjdbm=null;
	dygcjdbm=request.getParameter("dygcjdbm");
	if (dygcjdbm!=null)
	{
		dygcjdbm=cf.GB2Uni(dygcjdbm);
		if (!(dygcjdbm.equals("")))	wheresql+=" and  (dm_gcyszxmbm.dygcjdbm='"+dygcjdbm+"')";
	}
	String sfhf=null;
	sfhf=request.getParameter("sfhf");
	if (sfhf!=null)
	{
		sfhf=cf.GB2Uni(sfhf);
		if (!(sfhf.equals("")))	wheresql+=" and  (dm_gcyszxmbm.sfhf='"+sfhf+"')";
	}
	ls_sql="SELECT gcyszxmbm,gcyszxmmc, DECODE(dm_gcyszxmbm.gcjdbm,'2','���Ͻ�������','3','���ι�������','4','��������','5','�깤����'), DECODE(sfhf,'Y','�ط�','N','��'),gcjdmc  ";
	ls_sql+=" FROM dm_gcyszxmbm,dm_gcjdbm  ";
    ls_sql+=" where dm_gcyszxmbm.dygcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_gcyszxmbm.gcjdbm,gcyszxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_gcyszxmbmList.jsp","","","EditDm_gcyszxmbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gcyszxmbm","gcyszxmmc","gcjdbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gcyszxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_gcyszxmbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] gcyszxmbm = request.getParameterValues("gcyszxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gcyszxmbm,"gcyszxmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_gcyszxmbm where "+chooseitem;
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
	<td  width="9%">&nbsp;</td>
	<td  width="12%">������������Ŀ����</td>
	<td  width="35%">������������Ŀ����</td>
	<td  width="18%">���շ���</td>
	<td  width="8%">�Ƿ�ط�</td>
	<td  width="18%">��Ӧ���̽���</td>
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