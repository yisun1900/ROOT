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
	String yy_cx_zqs=null;
	String yy_cx_yy_cx_fgs=null;
	String yy_cx_yy_cxzjzk_qnpj=null;
	String yy_cx_yy_cxzjzk_bzzs=null;
	String yy_cx_yy_cxzpzq_qnpj=null;
	String yy_cx_yy_cxzpzq_bzzs=null;
	String yy_cx_yy_cxgcfx_qnpj=null;
	String yy_cx_yy_cxgcfx_bzzs=null;
	String yy_cx_yy_cxrlhj_qnpj=null;
	String yy_cx_yy_cxrlhj_bzzs=null;
	String yy_cx_yy_cx_lrsj=null;
	String yy_cx_lrr=null;
	yy_cx_zqs=request.getParameter("yy_cx_zqs");
	if (yy_cx_zqs!=null)
	{
		yy_cx_zqs=yy_cx_zqs.trim();
		if (!(yy_cx_zqs.equals("")))	wheresql+=" and (yy_cx.zqs="+yy_cx_zqs+") ";
	}
	yy_cx_yy_cx_fgs=request.getParameter("yy_cx_yy_cx_fgs");
	if (yy_cx_yy_cx_fgs!=null)
	{
		yy_cx_yy_cx_fgs=cf.GB2Uni(yy_cx_yy_cx_fgs);
		if (!(yy_cx_yy_cx_fgs.equals("")))	wheresql+=" and  (yy_cx.yy_cx_fgs='"+yy_cx_yy_cx_fgs+"')";
	}
	yy_cx_yy_cxzjzk_qnpj=request.getParameter("yy_cx_yy_cxzjzk_qnpj");
	if (yy_cx_yy_cxzjzk_qnpj!=null)
	{
		yy_cx_yy_cxzjzk_qnpj=yy_cx_yy_cxzjzk_qnpj.trim();
		if (!(yy_cx_yy_cxzjzk_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxzjzk_qnpj="+yy_cx_yy_cxzjzk_qnpj+") ";
	}
	yy_cx_yy_cxzjzk_bzzs=request.getParameter("yy_cx_yy_cxzjzk_bzzs");
	if (yy_cx_yy_cxzjzk_bzzs!=null)
	{
		yy_cx_yy_cxzjzk_bzzs=yy_cx_yy_cxzjzk_bzzs.trim();
		if (!(yy_cx_yy_cxzjzk_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxzjzk_bzzs="+yy_cx_yy_cxzjzk_bzzs+") ";
	}
	yy_cx_yy_cxzpzq_qnpj=request.getParameter("yy_cx_yy_cxzpzq_qnpj");
	if (yy_cx_yy_cxzpzq_qnpj!=null)
	{
		yy_cx_yy_cxzpzq_qnpj=yy_cx_yy_cxzpzq_qnpj.trim();
		if (!(yy_cx_yy_cxzpzq_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxzpzq_qnpj="+yy_cx_yy_cxzpzq_qnpj+") ";
	}
	yy_cx_yy_cxzpzq_bzzs=request.getParameter("yy_cx_yy_cxzpzq_bzzs");
	if (yy_cx_yy_cxzpzq_bzzs!=null)
	{
		yy_cx_yy_cxzpzq_bzzs=yy_cx_yy_cxzpzq_bzzs.trim();
		if (!(yy_cx_yy_cxzpzq_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxzpzq_bzzs="+yy_cx_yy_cxzpzq_bzzs+") ";
	}
	yy_cx_yy_cxgcfx_qnpj=request.getParameter("yy_cx_yy_cxgcfx_qnpj");
	if (yy_cx_yy_cxgcfx_qnpj!=null)
	{
		yy_cx_yy_cxgcfx_qnpj=yy_cx_yy_cxgcfx_qnpj.trim();
		if (!(yy_cx_yy_cxgcfx_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxgcfx_qnpj="+yy_cx_yy_cxgcfx_qnpj+") ";
	}
	yy_cx_yy_cxgcfx_bzzs=request.getParameter("yy_cx_yy_cxgcfx_bzzs");
	if (yy_cx_yy_cxgcfx_bzzs!=null)
	{
		yy_cx_yy_cxgcfx_bzzs=yy_cx_yy_cxgcfx_bzzs.trim();
		if (!(yy_cx_yy_cxgcfx_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxgcfx_bzzs="+yy_cx_yy_cxgcfx_bzzs+") ";
	}
	yy_cx_yy_cxrlhj_qnpj=request.getParameter("yy_cx_yy_cxrlhj_qnpj");
	if (yy_cx_yy_cxrlhj_qnpj!=null)
	{
		yy_cx_yy_cxrlhj_qnpj=yy_cx_yy_cxrlhj_qnpj.trim();
		if (!(yy_cx_yy_cxrlhj_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxrlhj_qnpj="+yy_cx_yy_cxrlhj_qnpj+") ";
	}
	yy_cx_yy_cxrlhj_bzzs=request.getParameter("yy_cx_yy_cxrlhj_bzzs");
	if (yy_cx_yy_cxrlhj_bzzs!=null)
	{
		yy_cx_yy_cxrlhj_bzzs=yy_cx_yy_cxrlhj_bzzs.trim();
		if (!(yy_cx_yy_cxrlhj_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxrlhj_bzzs="+yy_cx_yy_cxrlhj_bzzs+") ";
	}
	yy_cx_yy_cx_lrsj=request.getParameter("yy_cx_yy_cx_lrsj");
	if (yy_cx_yy_cx_lrsj!=null)
	{
		yy_cx_yy_cx_lrsj=yy_cx_yy_cx_lrsj.trim();
		if (!(yy_cx_yy_cx_lrsj.equals("")))	wheresql+="  and (yy_cx.yy_cx_lrsj>=TO_DATE('"+yy_cx_yy_cx_lrsj+"','YYYY/MM/DD'))";
	}
	yy_cx_yy_cx_lrsj=request.getParameter("yy_cx_yy_cx_lrsj2");
	if (yy_cx_yy_cx_lrsj!=null)
	{
		yy_cx_yy_cx_lrsj=yy_cx_yy_cx_lrsj.trim();
		if (!(yy_cx_yy_cx_lrsj.equals("")))	wheresql+="  and (yy_cx.yy_cx_lrsj<=TO_DATE('"+yy_cx_yy_cx_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_cx_lrr=request.getParameter("yy_cx_lrr");
	if (yy_cx_lrr!=null)
	{
		yy_cx_lrr=cf.GB2Uni(yy_cx_lrr);
		if (!(yy_cx_lrr.equals("")))	wheresql+=" and  (yy_cx.lrr='"+yy_cx_lrr+"')";
	}
	ls_sql="SELECT yy_cx.zqs,yy_cx.yy_cx_fgs,sq_dwxx.dwmc,yy_cx.yy_cxzjzk_qnpj||'%',yy_cx.yy_cxzjzk_bzzs||'%',yy_cx.yy_cxzpzq_qnpj||'%',yy_cx.yy_cxzpzq_bzzs||'%',yy_cx.yy_cxgcfx_qnpj||'%',yy_cx.yy_cxgcfx_bzzs||'%',yy_cx.yy_cxrlhj_qnpj||'%',yy_cx.yy_cxrlhj_bzzs||'%',yy_cx.yy_cx_lrsj,yy_cx.lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_cx  ";
    ls_sql+=" where yy_cx.yy_cx_fgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_cx.zqs,yy_cx.yy_cx_fgs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_cxList.jsp","","","EditYy_cx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zqs","yy_cx_fgs","sq_dwxx_dwmc","yy_cx_yy_cxzjzk_qnpj","yy_cx_yy_cxzjzk_bzzs","yy_cx_yy_cxzpzq_qnpj","yy_cx_yy_cxzpzq_bzzs","yy_cx_yy_cxgcfx_qnpj","yy_cx_yy_cxgcfx_bzzs","yy_cx_yy_cxrlhj_qnpj","yy_cx_yy_cxrlhj_bzzs","yy_cx_yy_cx_lrsj","yy_cx_lrr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs","yy_cx_fgs"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yy_cxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from yy_cx where "+chooseitem;
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="6%">������</td>
	<td  width="6%">�����ֹ�˾</td>
	<td  width="10%">�����ֹ�˾</td>
	<td  width="7%">ֱ���ۿ�ȥ��ƽ��(%)</td>
	<td  width="7%">ֱ���ۿ۱���ָ��(%)</td>
	<td  width="7%">��Ʒ��ȯȥ��ƽ��(%)</td>
	<td  width="7%">��Ʒ��ȯ����ָ��(%)</td>
	<td  width="7%">���̷���ȥ��ƽ��(%)</td>
	<td  width="7%">���̷��ֱ���ָ��(%)</td>
	<td  width="7%">�����ϼ�ȥ��ƽ��(%)</td>
	<td  width="7%">�����ϼƱ���ָ��(%)</td>
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