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
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbr=null;
	String fbsj=null;
	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		wtbh=wtbh.trim();
		if (!(wtbh.equals("")))	wheresql+=" and (wtbh="+wtbh+") ";
	}
	wtmc=request.getParameter("wtmc");
	if (wtmc!=null)
	{
		wtmc=cf.GB2Uni(wtmc);
		if (!(wtmc.equals("")))	wheresql+=" and  (wtmc='"+wtmc+"')";
	}
	sfkdx=request.getParameter("sfkdx");
	if (sfkdx!=null)
	{
		sfkdx=cf.GB2Uni(sfkdx);
		if (!(sfkdx.equals("")))	wheresql+=" and  (sfkdx='"+sfkdx+"')";
	}
	yxbz=request.getParameter("yxbz");
	if (yxbz!=null)
	{
		yxbz=cf.GB2Uni(yxbz);
		if (!(yxbz.equals("")))	wheresql+=" and  (yxbz='"+yxbz+"')";
	}
	fbr=request.getParameter("fbr");
	if (fbr!=null)
	{
		fbr=cf.GB2Uni(fbr);
		if (!(fbr.equals("")))	wheresql+=" and  (fbr='"+fbr+"')";
	}
	fbsj=request.getParameter("fbsj");
	if (fbsj!=null)
	{
		fbsj=fbsj.trim();
		if (!(fbsj.equals("")))	wheresql+="  and (fbsj>=TO_DATE('"+fbsj+"','YYYY/MM/DD'))";
	}
	fbsj=request.getParameter("fbsj2");
	if (fbsj!=null)
	{
		fbsj=fbsj.trim();
		if (!(fbsj.equals("")))	wheresql+="  and (fbsj<=TO_DATE('"+fbsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT wtbh,wtmc, DECODE(sfkdx,'1','��ѡ','2','��ѡ','3','д˵��'), DECODE(yxbz,'Y','��Ч','N','��Ч'), DECODE(sftxsm,'Y','����','N','������'),txsmts,fbr,fbsj  ";
	ls_sql+=" FROM hdm_hfwt  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by yxbz desc,wtbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hdm_hfwtList.jsp","","","EditHdm_hfwt.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"wtbh","wtmc","sfkdx","yxbz","fbr","fbsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"wtbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Hdm_hfwtList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] wtbh = request.getParameterValues("wtbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(wtbh,"wtbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from hdm_hfwtda where "+chooseitem;
		sql[1]="delete from hdm_hfwt where "+chooseitem;
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
  <B><font size="3">�ط����⣭ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="6%">������</td>
	<td  width="40%">��������</td>
	<td  width="5%">�ɶ�ѡ</td>
	<td  width="5%">��Ч��־</td>
	<td  width="6%">�Ƿ�������д˵��</td>
	<td  width="17%">��д˵����ʾ</td>
	<td  width="6%">������</td>
	<td  width="8%">����ʱ��</td>
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