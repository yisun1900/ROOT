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
	String djbh=null;
	String khbh=null;
	String lrr=null;
	String lrsj=null;
	String sybz=null;
	String syr=null;
	String sysj=null;
	djbh=request.getParameter("djbh");
	if (djbh!=null)
	{
		djbh=cf.GB2Uni(djbh);
		if (!(djbh.equals("")))	wheresql+=" and  (djbh='"+djbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	sybz=request.getParameter("sybz");
	if (sybz!=null)
	{
		sybz=cf.GB2Uni(sybz);
		if (!(sybz.equals("")))	wheresql+=" and  (sybz='"+sybz+"')";
	}
	syr=request.getParameter("syr");
	if (syr!=null)
	{
		syr=cf.GB2Uni(syr);
		if (!(syr.equals("")))	wheresql+=" and  (syr='"+syr+"')";
	}
	sysj=request.getParameter("sysj");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj>=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	sysj=request.getParameter("sysj2");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj<=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT djbh,khbh,qksm,lrr,lrsj, DECODE(sybz,'N','δ��','Y','������'),syr,sysj  ";
	ls_sql+=" FROM crm_gdsgrz  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_gdsgrzList.jsp","SelectCrm_gdsgrz.jsp","ViewCrm_gdsgrz.jsp","EditCrm_gdsgrz.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"djbh","khbh","qksm","lrr","lrsj","sybz","syr","sysj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_gdsgrzList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] djbh = request.getParameterValues("djbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(djbh,"djbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_gdsgrz where "+chooseitem;
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
	<td  width="11%">�ǼǱ��</td>
	<td  width="11%">�ͻ����</td>
	<td  width="11%">���˵��</td>
	<td  width="11%">¼����</td>
	<td  width="11%">¼��ʱ��</td>
	<td  width="11%">���ı�־</td>
	<td  width="11%">������</td>
	<td  width="11%">����ʱ��</td>
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