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
	String yy_lr_zqs=null;
	String yy_lr_yy_lr_fgs=null;
	String yy_lr_yy_lrglf_ysbl=null;
	String yy_lr_yy_lrglf_sjsq=null;
	String yy_lr_yy_lrsj_ysbl=null;
	String yy_lr_yy_lrsj_sjsq=null;
	String yy_lr_yy_lrgc_qnpj=null;
	String yy_lr_yy_lrgc_bzzs=null;
	String yy_lr_yy_lrzc_qnpj=null;
	String yy_lr_yy_lrzc_bzzs=null;
	String yy_lr_yy_lr_lrsj=null;
	String yy_lr_lrr=null;
	yy_lr_zqs=request.getParameter("yy_lr_zqs");
	if (yy_lr_zqs!=null)
	{
		yy_lr_zqs=yy_lr_zqs.trim();
		if (!(yy_lr_zqs.equals("")))	wheresql+=" and (yy_lr.zqs="+yy_lr_zqs+") ";
	}
	yy_lr_yy_lr_fgs=request.getParameter("yy_lr_yy_lr_fgs");
	if (yy_lr_yy_lr_fgs!=null)
	{
		yy_lr_yy_lr_fgs=cf.GB2Uni(yy_lr_yy_lr_fgs);
		if (!(yy_lr_yy_lr_fgs.equals("")))	wheresql+=" and  (yy_lr.yy_lr_fgs='"+yy_lr_yy_lr_fgs+"')";
	}
	yy_lr_yy_lrglf_ysbl=request.getParameter("yy_lr_yy_lrglf_ysbl");
	if (yy_lr_yy_lrglf_ysbl!=null)
	{
		yy_lr_yy_lrglf_ysbl=yy_lr_yy_lrglf_ysbl.trim();
		if (!(yy_lr_yy_lrglf_ysbl.equals("")))	wheresql+=" and  (yy_lr.yy_lrglf_ysbl="+yy_lr_yy_lrglf_ysbl+") ";
	}
	yy_lr_yy_lrglf_sjsq=request.getParameter("yy_lr_yy_lrglf_sjsq");
	if (yy_lr_yy_lrglf_sjsq!=null)
	{
		yy_lr_yy_lrglf_sjsq=yy_lr_yy_lrglf_sjsq.trim();
		if (!(yy_lr_yy_lrglf_sjsq.equals("")))	wheresql+=" and  (yy_lr.yy_lrglf_sjsq="+yy_lr_yy_lrglf_sjsq+") ";
	}
	yy_lr_yy_lrsj_ysbl=request.getParameter("yy_lr_yy_lrsj_ysbl");
	if (yy_lr_yy_lrsj_ysbl!=null)
	{
		yy_lr_yy_lrsj_ysbl=yy_lr_yy_lrsj_ysbl.trim();
		if (!(yy_lr_yy_lrsj_ysbl.equals("")))	wheresql+=" and  (yy_lr.yy_lrsj_ysbl="+yy_lr_yy_lrsj_ysbl+") ";
	}
	yy_lr_yy_lrsj_sjsq=request.getParameter("yy_lr_yy_lrsj_sjsq");
	if (yy_lr_yy_lrsj_sjsq!=null)
	{
		yy_lr_yy_lrsj_sjsq=yy_lr_yy_lrsj_sjsq.trim();
		if (!(yy_lr_yy_lrsj_sjsq.equals("")))	wheresql+=" and  (yy_lr.yy_lrsj_sjsq="+yy_lr_yy_lrsj_sjsq+") ";
	}
	yy_lr_yy_lrgc_qnpj=request.getParameter("yy_lr_yy_lrgc_qnpj");
	if (yy_lr_yy_lrgc_qnpj!=null)
	{
		yy_lr_yy_lrgc_qnpj=yy_lr_yy_lrgc_qnpj.trim();
		if (!(yy_lr_yy_lrgc_qnpj.equals("")))	wheresql+=" and  (yy_lr.yy_lrgc_qnpj="+yy_lr_yy_lrgc_qnpj+") ";
	}
	yy_lr_yy_lrgc_bzzs=request.getParameter("yy_lr_yy_lrgc_bzzs");
	if (yy_lr_yy_lrgc_bzzs!=null)
	{
		yy_lr_yy_lrgc_bzzs=yy_lr_yy_lrgc_bzzs.trim();
		if (!(yy_lr_yy_lrgc_bzzs.equals("")))	wheresql+=" and  (yy_lr.yy_lrgc_bzzs="+yy_lr_yy_lrgc_bzzs+") ";
	}
	yy_lr_yy_lrzc_qnpj=request.getParameter("yy_lr_yy_lrzc_qnpj");
	if (yy_lr_yy_lrzc_qnpj!=null)
	{
		yy_lr_yy_lrzc_qnpj=yy_lr_yy_lrzc_qnpj.trim();
		if (!(yy_lr_yy_lrzc_qnpj.equals("")))	wheresql+=" and  (yy_lr.yy_lrzc_qnpj="+yy_lr_yy_lrzc_qnpj+") ";
	}
	yy_lr_yy_lrzc_bzzs=request.getParameter("yy_lr_yy_lrzc_bzzs");
	if (yy_lr_yy_lrzc_bzzs!=null)
	{
		yy_lr_yy_lrzc_bzzs=yy_lr_yy_lrzc_bzzs.trim();
		if (!(yy_lr_yy_lrzc_bzzs.equals("")))	wheresql+=" and  (yy_lr.yy_lrzc_bzzs="+yy_lr_yy_lrzc_bzzs+") ";
	}
	yy_lr_yy_lr_lrsj=request.getParameter("yy_lr_yy_lr_lrsj");
	if (yy_lr_yy_lr_lrsj!=null)
	{
		yy_lr_yy_lr_lrsj=yy_lr_yy_lr_lrsj.trim();
		if (!(yy_lr_yy_lr_lrsj.equals("")))	wheresql+="  and (yy_lr.yy_lr_lrsj>=TO_DATE('"+yy_lr_yy_lr_lrsj+"','YYYY/MM/DD'))";
	}
	yy_lr_yy_lr_lrsj=request.getParameter("yy_lr_yy_lr_lrsj2");
	if (yy_lr_yy_lr_lrsj!=null)
	{
		yy_lr_yy_lr_lrsj=yy_lr_yy_lr_lrsj.trim();
		if (!(yy_lr_yy_lr_lrsj.equals("")))	wheresql+="  and (yy_lr.yy_lr_lrsj<=TO_DATE('"+yy_lr_yy_lr_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_lr_lrr=request.getParameter("yy_lr_lrr");
	if (yy_lr_lrr!=null)
	{
		yy_lr_lrr=cf.GB2Uni(yy_lr_lrr);
		if (!(yy_lr_lrr.equals("")))	wheresql+=" and  (yy_lr.lrr='"+yy_lr_lrr+"')";
	}
	ls_sql="SELECT yy_lr.zqs,yy_lr.yy_lr_fgs,sq_dwxx.dwmc,yy_lr.yy_lrglf_ysbl||'%',yy_lr.yy_lrglf_sjsq||'%',yy_lr.yy_lrsj_ysbl||'%',yy_lr.yy_lrsj_sjsq||'%',yy_lr.yy_lrgc_qnpj||'%',yy_lr.yy_lrgc_bzzs||'%',yy_lr.yy_lrzc_qnpj||'%',yy_lr.yy_lrzc_bzzs||'%',yy_lr.yy_lr_lrsj,yy_lr.lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_lr  ";
    ls_sql+=" where yy_lr.yy_lr_fgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_lr.zqs,yy_lr.yy_lr_fgs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_lrList.jsp","","","EditYy_lr.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zqs","yy_lr_fgs","sq_dwxx_dwmc","yy_lr_yy_lrglf_ysbl","yy_lr_yy_lrglf_sjsq","yy_lr_yy_lrsj_ysbl","yy_lr_yy_lrsj_sjsq","yy_lr_yy_lrgc_qnpj","yy_lr_yy_lrgc_bzzs","yy_lr_yy_lrzc_qnpj","yy_lr_yy_lrzc_bzzs","yy_lr_yy_lr_lrsj","yy_lr_lrr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs","yy_lr_fgs"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yy_lrList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from yy_lr where "+chooseitem;
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
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="6%">������</td>
	<td  width="6%">�ֹ�˾</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="6%">�ͻ�����ѱ���Ӧ�ձ���(%)</td>
	<td  width="6%">�ͻ�����ѱ���ʵ����ȡ(%)</td>
	<td  width="6%">˰����������Ӧ�ձ���(%)</td>
	<td  width="6%">˰����������ʵ����ȡ(%)</td>
	<td  width="6%">����ë����ȥ��ƽ��(%)</td>
	<td  width="6%">����ë���ʱ���ָ��(%)</td>
	<td  width="6%">����ë����ȥ��ƽ��(%)</td>
	<td  width="6%">����ë���ʱ���ָ��(%)</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="6%">¼����</td>
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