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
	String jkbbh=null;
	String bjkgsmc=null;
	String xxlybm=null;
	String bcsj=null;
	String gggs=null;
	String dwbh=null;
	jkbbh=request.getParameter("jkbbh");
	if (jkbbh!=null)
	{
		jkbbh=cf.GB2Uni(jkbbh);
		if (!(jkbbh.equals("")))	wheresql+=" and  (jkbbh='"+jkbbh+"')";
	}
	bjkgsmc=request.getParameter("bjkgsbh");
	if (bjkgsmc!=null)
	{
		bjkgsmc=cf.GB2Uni(bjkgsmc);
		if (!(bjkgsmc.equals("")))	wheresql+=" and  (bjkgsbh='"+bjkgsmc+"')";
	}
	xxlybm=request.getParameter("xxlybm");
	if (xxlybm!=null)
	{
		xxlybm=cf.GB2Uni(xxlybm);
		if (!(xxlybm.equals("")))	wheresql+=" and  (xxlybm='"+xxlybm+"')";
	}
	bcsj=request.getParameter("bcsj");
	if (bcsj!=null)
	{
		bcsj=bcsj.trim();
		if (!(bcsj.equals("")))	wheresql+="  and (bcsj>=TO_DATE('"+bcsj+"','YYYY/MM/DD'))";
	}
	bcsj=request.getParameter("bcsj2");
	if (bcsj!=null)
	{
		bcsj=bcsj.trim();
		if (!(bcsj.equals("")))	wheresql+="  and (bcsj<=TO_DATE('"+bcsj+"','YYYY/MM/DD'))";
	}
	gggs=request.getParameter("gggs");
	if (gggs!=null)
	{
		gggs=cf.GB2Uni(gggs);
		if (!(gggs.equals("")))	wheresql+=" and  (gggs='"+gggs+"')";
	}
	dwbh=request.getParameter("dwbh");
	//out.println(dwbh);
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+dwbh+"')";
	}
	ls_sql="SELECT qh_mtjk.jkbbh,qh_bjkgsdm.bjkgsmc,dm_xxlybm.xxlymc,qh_mtjk.bcsj,qh_mtjk.gggs,qh_mtjk.yjjg,qh_mtjk.bz,sq_dwxx.dwmc  ";
	ls_sql+=" FROM qh_mtjk,sq_dwxx,dm_xxlybm,qh_bjkgsdm ";
    ls_sql+=" where (qh_bjkgsdm.bjkgsbh =qh_mtjk.bjkgsbh) and (qh_mtjk.dwbh=sq_dwxx.dwbh(+)) and (qh_mtjk.xxlybm=dm_xxlybm.xxlybm(+)) ";
    ls_sql+=wheresql;
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Qh_mtjkList.jsp","SelectQh_mtjk.jsp","ViewQh_mtjk.jsp","EditQh_mtjk.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jkbbh","bjkgsmc","xxlymc","bcsj","gggs","yjjg","bz","dwbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jkbbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Qh_mtjkList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] jkbbh = request.getParameterValues("jkbbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jkbbh,"jkbbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from qh_mtjk where "+chooseitem;
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
	<td  width="11%">��ر���</td>
	<td  width="11%">����ع�˾����</td>
	<td  width="11%">�����ʽ</td>
	<td  width="11%">����ʱ��</td>
	<td  width="11%">��湫˾</td>
	<td  width="11%">Ԥ�Ƽ۸�</td>
	<td  width="11%">��ע</td>
	<td  width="11%">���λ����</td>
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