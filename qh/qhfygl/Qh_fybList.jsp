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
	String qh_fyb_sbxh=null;
	String qh_fyb_dwbh=null;
	String qh_fyb_sbrq=null;
	String qh_fyb_xxlybm=null;
	String qh_fyb_zl=null;
	String qh_fyb_sfjhn=null;
	String qh_fyb_htsfsp=null;
	qh_fyb_sbxh=request.getParameter("qh_fyb_sbxh");
	if (qh_fyb_sbxh!=null)
	{
		qh_fyb_sbxh=cf.GB2Uni(qh_fyb_sbxh);
		if (!(qh_fyb_sbxh.equals("")))	wheresql+=" and  (qh_fyb.sbxh='"+qh_fyb_sbxh+"')";
	}
	qh_fyb_dwbh=request.getParameter("qh_fyb_dwbh");
	if (qh_fyb_dwbh!=null)
	{
		qh_fyb_dwbh=cf.GB2Uni(qh_fyb_dwbh);
		if (!(qh_fyb_dwbh.equals("")))	wheresql+=" and  (qh_fyb.dwbh='"+qh_fyb_dwbh+"')";
	}
	qh_fyb_sbrq=request.getParameter("qh_fyb_sbrq");
	if (qh_fyb_sbrq!=null)
	{
		qh_fyb_sbrq=qh_fyb_sbrq.trim();
		if (!(qh_fyb_sbrq.equals("")))	wheresql+="  and (qh_fyb.sbrq>=TO_DATE('"+qh_fyb_sbrq+"','YYYY/MM/DD'))";
	}
	qh_fyb_sbrq=request.getParameter("qh_fyb_sbrq2");
	if (qh_fyb_sbrq!=null)
	{
		qh_fyb_sbrq=qh_fyb_sbrq.trim();
		if (!(qh_fyb_sbrq.equals("")))	wheresql+="  and (qh_fyb.sbrq<=TO_DATE('"+qh_fyb_sbrq+"','YYYY/MM/DD'))";
	}
	qh_fyb_xxlybm=request.getParameter("qh_fyb_xxlybm");
	if (qh_fyb_xxlybm!=null)
	{
		qh_fyb_xxlybm=cf.GB2Uni(qh_fyb_xxlybm);
		if (!(qh_fyb_xxlybm.equals("")))	wheresql+=" and  (qh_fyb.xxlybm='"+qh_fyb_xxlybm+"')";
	}
	qh_fyb_zl=request.getParameter("qh_fyb_zl");
	if (qh_fyb_zl!=null)
	{
		qh_fyb_zl=cf.GB2Uni(qh_fyb_zl);
		if (!(qh_fyb_zl.equals("")))	wheresql+=" and  (qh_fyb.zl='"+qh_fyb_zl+"')";
	}
	qh_fyb_sfjhn=request.getParameter("qh_fyb_sfjhn");
	if (qh_fyb_sfjhn!=null)
	{
		qh_fyb_sfjhn=cf.GB2Uni(qh_fyb_sfjhn);
		if (!(qh_fyb_sfjhn.equals("")))	wheresql+=" and  (qh_fyb.sfjhn='"+qh_fyb_sfjhn+"')";
	}
	qh_fyb_htsfsp=request.getParameter("qh_fyb_htsfsp");
	if (qh_fyb_htsfsp!=null)
	{
		qh_fyb_htsfsp=cf.GB2Uni(qh_fyb_htsfsp);
		if (!(qh_fyb_htsfsp.equals("")))	wheresql+=" and  (qh_fyb.htsfsp='"+qh_fyb_htsfsp+"')";
	}
	ls_sql="SELECT qh_fyb.sbxh as sbxh,qh_fyb.sbrq as qh_fyb_sbrq,sq_dwxx.dwmc as sq_dwxx_dwmc,dm_xxlybm.xxlymc as dm_xxlybm_xxlymc, qh_qhfyzlb.fyzlmc as qh_fyb_zl, DECODE(qh_fyb.sfjhn,'Y','��','N','��') as qh_fyb_sfjhn,qh_fyb.tfsj as qh_fyb_tfsj,qh_fyb.htfy as qh_fyb_htfy,qh_fyb.sjfy as qh_fyb_sjfy, DECODE(qh_fyb.htsfsp,'Y','��','N','��') as qh_fyb_htsfsp,qh_fyb.bz as qh_fyb_bz  ";
	ls_sql+=" FROM qh_fyb,sq_dwxx,dm_xxlybm,qh_qhfyzlb  ";
    ls_sql+=" where qh_fyb.dwbh=sq_dwxx.dwbh and qh_fyb.xxlybm=dm_xxlybm.xxlybm and qh_qhfyzlb.fyzldm=qh_fyb.zl";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Qh_fybList.jsp","SelectQh_fyb.jsp","ViewQh_fyb.jsp","EditQh_fyb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sbxh","qh_fyb_sbrq","qh_fyb_zl","qh_fyb_sfjhn","qh_fyb_tfsj","qh_fyb_htfy","qh_fyb_sjfy","qh_fyb_htsfsp","qh_fyb_bz","sq_dwxx_dwmc","dm_xxlybm_xxlymc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sbxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Qh_fybList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] sbxh = request.getParameterValues("sbxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sbxh,"sbxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from qh_fyb where "+chooseitem;
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
	<td  width="8%">�ϱ����</td>
	<td  width="8%">�걨����</td>
	<td  width="8%">��λ����</td>
	<td  width="8%">����ý��	</td>
	<td  width="8%">����</td>
	<td  width="8%">�Ƿ�ƻ���</td>
	<td  width="8%">Ͷ��ʱ��</td>
	<td  width="8%">��ͬ����</td>
	<td  width="8%">ʵ�ʷ���</td>
	<td  width="8%">��ͬ�Ƿ�����</td>
	<td  width="8%">��ע</td>
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