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
	String cdbh=null;
	String cdxh=null;
	String cdxsmc=null;
	String fcdbh=null;
	String sfmjcd=null;
	cdbh=request.getParameter("cdbh");
	if (cdbh!=null)
	{
		cdbh=cf.GB2Uni(cdbh);
		if (!(cdbh.equals("")))	wheresql+=" and  (cdbh='"+cdbh+"')";
	}
	cdxh=request.getParameter("cdxh");
	if (cdxh!=null)
	{
		cdxh=cdxh.trim();
		if (!(cdxh.equals("")))	wheresql+=" and (cdxh="+cdxh+") ";
	}
	cdxsmc=request.getParameter("cdxsmc");
	if (cdxsmc!=null)
	{
		cdxsmc=cf.GB2Uni(cdxsmc);
		if (!(cdxsmc.equals("")))	wheresql+=" and  (cdxsmc='"+cdxsmc+"')";
	}
	fcdbh=request.getParameter("fcdbh");
	if (fcdbh!=null)
	{
		fcdbh=cf.GB2Uni(fcdbh);
		if (!(fcdbh.equals("")))	wheresql+=" and  (fcdbh='"+fcdbh+"')";
	}
	sfmjcd=request.getParameter("sfmjcd");
	if (sfmjcd!=null)
	{
		sfmjcd=cf.GB2Uni(sfmjcd);
		if (!(sfmjcd.equals("")))	wheresql+=" and  (sfmjcd='"+sfmjcd+"')";
	}
	ls_sql="SELECT cdbh,cdxh,cdxsmc,glurl,fcdbh, DECODE(sfmjcd,'Y','��','N','��'),cdsm  ";
	ls_sql+=" FROM sq_cd  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	ls_sql+="order by cdbh,cdxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_cdList.jsp","SelectSq_cd.jsp","ViewSq_cd.jsp","EditSq_cd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cdbh","cdxh","cdxsmc","glurl","fcdbh","sfmjcd","cdsm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cdbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Sq_cdList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] cdbh = request.getParameterValues("cdbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cdbh,"cdbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from sq_cd where "+chooseitem;
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
	<td  width="12%">�˵����</td>
	<td  width="12%">�˵����</td>
	<td  width="12%">�˵���ʾ����</td>
	<td  width="12%">�˵�����URL</td>
	<td  width="12%">���˵����</td>
	<td  width="12%">�Ƿ�ĩ���˵�</td>
	<td  width="12%">�˵�˵��</td>
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