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
	String qh_xcpzzsh_shbbh=null;
	String qh_xcpzzsh_sqsj=null;
	String qh_xcpzzsh_zznr=null;
	String qh_xcpzzsh_sl=null;
	String qh_xcpzzsh_gg=null;
	String qh_xcpzzsh_xs=null;
	String qh_xcpzzsh_wznr=null;
	String qh_xcpzzsh_ysyq=null;
	String qh_xcpzzsh_qtyq=null;
	String qh_xcpzzsh_wcsj=null;
	String qh_xcpzzsh_bz=null;
	String sq_dwxx_dwmc=null;
	String qh_xcpzzsh_zgbmjlyj=null;
	qh_xcpzzsh_shbbh=request.getParameter("qh_xcpzzsh_shbbh");
	if (qh_xcpzzsh_shbbh!=null)
	{
		qh_xcpzzsh_shbbh=cf.GB2Uni(qh_xcpzzsh_shbbh);
		if (!(qh_xcpzzsh_shbbh.equals("")))	wheresql+=" and  (qh_xcpzzsh.shbbh='"+qh_xcpzzsh_shbbh+"')";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj>=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj2");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj<=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	
	qh_xcpzzsh_zznr=request.getParameter("qh_xcpzzsh_zznr");
	if (qh_xcpzzsh_zznr!=null)
	{
		qh_xcpzzsh_zznr=cf.GB2Uni(qh_xcpzzsh_zznr);
		if (!(qh_xcpzzsh_zznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.zznr='"+qh_xcpzzsh_zznr+"')";
	}
	qh_xcpzzsh_sl=request.getParameter("qh_xcpzzsh_sl");
	if (qh_xcpzzsh_sl!=null)
	{
		qh_xcpzzsh_sl=qh_xcpzzsh_sl.trim();
		if (!(qh_xcpzzsh_sl.equals("")))	wheresql+=" and (qh_xcpzzsh.sl="+qh_xcpzzsh_sl+") ";
	}
	qh_xcpzzsh_gg=request.getParameter("qh_xcpzzsh_gg");
	if (qh_xcpzzsh_gg!=null)
	{
		qh_xcpzzsh_gg=cf.GB2Uni(qh_xcpzzsh_gg);
		if (!(qh_xcpzzsh_gg.equals("")))	wheresql+=" and  (qh_xcpzzsh.gg='"+qh_xcpzzsh_gg+"')";
	}
	qh_xcpzzsh_xs=request.getParameter("qh_xcpzzsh_xs");
	if (qh_xcpzzsh_xs!=null)
	{
		qh_xcpzzsh_xs=cf.GB2Uni(qh_xcpzzsh_xs);
		if (!(qh_xcpzzsh_xs.equals("")))	wheresql+=" and  (qh_xcpzzsh.xs='"+qh_xcpzzsh_xs+"')";
	}
	qh_xcpzzsh_wznr=request.getParameter("qh_xcpzzsh_wznr");
	if (qh_xcpzzsh_wznr!=null)
	{
		qh_xcpzzsh_wznr=cf.GB2Uni(qh_xcpzzsh_wznr);
		if (!(qh_xcpzzsh_wznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.wznr='"+qh_xcpzzsh_wznr+"')";
	}
	qh_xcpzzsh_ysyq=request.getParameter("qh_xcpzzsh_ysyq");
	if (qh_xcpzzsh_ysyq!=null)
	{
		qh_xcpzzsh_ysyq=cf.GB2Uni(qh_xcpzzsh_ysyq);
		if (!(qh_xcpzzsh_ysyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.ysyq='"+qh_xcpzzsh_ysyq+"')";
	}
	qh_xcpzzsh_qtyq=request.getParameter("qh_xcpzzsh_qtyq");
	if (qh_xcpzzsh_qtyq!=null)
	{
		qh_xcpzzsh_qtyq=cf.GB2Uni(qh_xcpzzsh_qtyq);
		if (!(qh_xcpzzsh_qtyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.qtyq='"+qh_xcpzzsh_qtyq+"')";
	}
	qh_xcpzzsh_wcsj=request.getParameter("qh_xcpzzsh_wcsj");
	if (qh_xcpzzsh_wcsj!=null)
	{
		qh_xcpzzsh_wcsj=qh_xcpzzsh_wcsj.trim();
		if (!(qh_xcpzzsh_wcsj.equals("")))	wheresql+="  and (qh_xcpzzsh.wcsj=TO_DATE('"+qh_xcpzzsh_wcsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_bz=request.getParameter("qh_xcpzzsh_bz");
	if (qh_xcpzzsh_bz!=null)
	{
		qh_xcpzzsh_bz=cf.GB2Uni(qh_xcpzzsh_bz);
		if (!(qh_xcpzzsh_bz.equals("")))	wheresql+=" and  (qh_xcpzzsh.bz='"+qh_xcpzzsh_bz+"')";
	}
	sq_dwxx_dwmc=request.getParameter("dwbh");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+sq_dwxx_dwmc+"')";
	}
	qh_xcpzzsh_zgbmjlyj=request.getParameter("qh_xcpzzsh_zgbmjlyj");
	if (qh_xcpzzsh_zgbmjlyj!=null)
	{
		qh_xcpzzsh_zgbmjlyj=cf.GB2Uni(qh_xcpzzsh_zgbmjlyj);
		if (!(qh_xcpzzsh_zgbmjlyj.equals("")))	wheresql+=" and  (qh_xcpzzsh.zgbmjlyj='"+qh_xcpzzsh_zgbmjlyj+"')";
	}
	ls_sql="SELECT qh_xcpzzsh.shbbh as shbbh,qh_xcpzzsh.sqsj as qh_xcpzzsh_sqsj,qh_xcpzzsh.zznr as qh_xcpzzsh_zznr,qh_xcpzzsh.sl as qh_xcpzzsh_sl,qh_xcpzzsh.gg as qh_xcpzzsh_gg,qh_xcpzzsh.xs as qh_xcpzzsh_xs,qh_xcpzzsh.wznr as qh_xcpzzsh_wznr,qh_xcpzzsh.ysyq as qh_xcpzzsh_ysyq,qh_xcpzzsh.qtyq as qh_xcpzzsh_qtyq,qh_xcpzzsh.wcsj as qh_xcpzzsh_wcsj,qh_xcpzzsh.scwjm,qh_xcpzzsh.bz as qh_xcpzzsh_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,qh_xcpzzsh.zgbmjlyj as qh_xcpzzsh_zgbmjlyj  ";
	ls_sql+=" FROM qh_xcpzzsh,sq_dwxx  ";
    ls_sql+=" where qh_xcpzzsh.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Qh_xcpzzshList.jsp","SelectQh_xcpzzsh.jsp","ViewQh_xcpzzsh.jsp","EditQh_xcpzzsh.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shbbh","qh_xcpzzsh_sqsj","qh_xcpzzsh_zznr","qh_xcpzzsh_sl","qh_xcpzzsh_gg","qh_xcpzzsh_xs","qh_xcpzzsh_wznr","qh_xcpzzsh_ysyq","qh_xcpzzsh_qtyq","qh_xcpzzsh_wcsj","qh_xcpzzsh_bz","sq_dwxx_dwmc","qh_xcpzzsh_zgbmjlyj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"shbbh"};
	pageObj.setKey(keyName);
	//��������
	//String[] keyName1={"khbh","sgd"};
	//pageObj.setKey(keyName1);
	//pageObj.setEditStr("����");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Qh_xcpzzshList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] shbbh = request.getParameterValues("shbbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shbbh,"shbbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from qh_xcpzzsh where "+chooseitem;
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
	<td  width="6%">��˱���</td>
	<td  width="6%">����ʱ��</td>
	<td  width="6%">��������</td>
	<td  width="6%">����</td>
	<td  width="6%">���</td>
	<td  width="6%">��ʽ</td>
	<td  width="6%">��������</td>
	<td  width="6%">��ɫҪ��</td>
	<td  width="6%">����Ҫ��</td>
	<td  width="6%">���ʱ��</td>
	<td  width="6%">���ļ���</td>
	<td  width="6%">��ע</td>
	<td  width="6%">�걨����</td>
	<td  width="6%">���ܲ��ž������</td>
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