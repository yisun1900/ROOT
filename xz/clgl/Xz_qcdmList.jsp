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
	String xz_qcdm_qcdm=null;
	String xz_qcdm_qcph=null;
	String xz_qcdm_sjxm=null;
	String xz_qcdm_ssfgs=null;
	xz_qcdm_qcdm=request.getParameter("xz_qcdm_qcdm");
	if (xz_qcdm_qcdm!=null)
	{
		xz_qcdm_qcdm=cf.GB2Uni(xz_qcdm_qcdm);
		if (!(xz_qcdm_qcdm.equals("")))	wheresql+=" and  (xz_qcdm.qcdm='"+xz_qcdm_qcdm+"')";
	}
	xz_qcdm_qcph=request.getParameter("xz_qcdm_qcph");
	if (xz_qcdm_qcph!=null)
	{
		xz_qcdm_qcph=cf.GB2Uni(xz_qcdm_qcph);
		if (!(xz_qcdm_qcph.equals("")))	wheresql+=" and  (xz_qcdm.qcph='"+xz_qcdm_qcph+"')";
	}
	xz_qcdm_sjxm=request.getParameter("xz_qcdm_sjxm");
	if (xz_qcdm_sjxm!=null)
	{
		xz_qcdm_sjxm=cf.GB2Uni(xz_qcdm_sjxm);
		if (!(xz_qcdm_sjxm.equals("")))	wheresql+=" and  (xz_qcdm.sjxm='"+xz_qcdm_sjxm+"')";
	}
	xz_qcdm_ssfgs=request.getParameter("xz_qcdm_ssfgs");
	if (xz_qcdm_ssfgs!=null)
	{
		xz_qcdm_ssfgs=cf.GB2Uni(xz_qcdm_ssfgs);
		if (!(xz_qcdm_ssfgs.equals("")))	wheresql+=" and  (xz_qcdm.ssfgs='"+xz_qcdm_ssfgs+"')";
	}
	ls_sql="SELECT xz_qcdm.qcdm ,xz_qcdm.qcph ,xz_qcdm.sjxm,xz_qcdm.qcxh,xz_qcdm.gcsj,xz_qcdm.yxsgls,xz_qcdm.bz,sq_dwxx.dwmc ";
	ls_sql+=" FROM xz_qcdm,sq_dwxx ";
    ls_sql+=" where xz_qcdm.ssfgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_qcdmList.jsp","SelectXz_qcdm.jsp","","EditXz_qcdm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"qcdm","xz_qcdm_qcph","xz_qcdm_sjxm","xz_qcdm_dqbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"qcdm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_qcdmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] qcdm = request.getParameterValues("qcdm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(qcdm,"qcdm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from xz_qcdm where "+chooseitem;
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
	<td  width="8%">��������</td>
	<td  width="8%">�����ƺ�</td>
	<td  width="8%">˾������</td>
	<td  width="12%">�����ͺ�</td>
	<td  width="10%">����ʱ��</td>
	<td  width="10%">����ʹ������</td>
   <td  width="22%">��ע</td>
	<td  width="8%">�ֹ�˾</td>
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