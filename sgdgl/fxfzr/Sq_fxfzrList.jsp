<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sq_fxfzr_ssfgs=null;
	String sq_fxfzr_fzrmc=null;
	String sq_fxfzr_xb=null;
	String sq_fxfzr_dh=null;
	String sq_fxfzr_zz=null;
	String sq_fxfzr_sfzh=null;
	String sq_fxfzr_lx=null;

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (sq_fxfzr.sgd='"+sgd+"')";
	}
	sq_fxfzr_ssfgs=request.getParameter("sq_fxfzr_ssfgs");
	if (sq_fxfzr_ssfgs!=null)
	{
		sq_fxfzr_ssfgs=cf.GB2Uni(sq_fxfzr_ssfgs);
		if (!(sq_fxfzr_ssfgs.equals("")))	wheresql+=" and  (sq_fxfzr.ssfgs='"+sq_fxfzr_ssfgs+"')";
	}
	sq_fxfzr_fzrmc=request.getParameter("sq_fxfzr_fzrmc");
	if (sq_fxfzr_fzrmc!=null)
	{
		sq_fxfzr_fzrmc=cf.GB2Uni(sq_fxfzr_fzrmc);
		if (!(sq_fxfzr_fzrmc.equals("")))	wheresql+=" and  (sq_fxfzr.fzrmc='"+sq_fxfzr_fzrmc+"')";
	}
	sq_fxfzr_xb=request.getParameter("sq_fxfzr_xb");
	if (sq_fxfzr_xb!=null)
	{
		sq_fxfzr_xb=cf.GB2Uni(sq_fxfzr_xb);
		if (!(sq_fxfzr_xb.equals("")))	wheresql+=" and  (sq_fxfzr.xb='"+sq_fxfzr_xb+"')";
	}
	sq_fxfzr_dh=request.getParameter("sq_fxfzr_dh");
	if (sq_fxfzr_dh!=null)
	{
		sq_fxfzr_dh=cf.GB2Uni(sq_fxfzr_dh);
		if (!(sq_fxfzr_dh.equals("")))	wheresql+=" and  (sq_fxfzr.dh='"+sq_fxfzr_dh+"')";
	}
	sq_fxfzr_zz=request.getParameter("sq_fxfzr_zz");
	if (sq_fxfzr_zz!=null)
	{
		sq_fxfzr_zz=cf.GB2Uni(sq_fxfzr_zz);
		if (!(sq_fxfzr_zz.equals("")))	wheresql+=" and  (sq_fxfzr.zz='"+sq_fxfzr_zz+"')";
	}
	sq_fxfzr_sfzh=request.getParameter("sq_fxfzr_sfzh");
	if (sq_fxfzr_sfzh!=null)
	{
		sq_fxfzr_sfzh=cf.GB2Uni(sq_fxfzr_sfzh);
		if (!(sq_fxfzr_sfzh.equals("")))	wheresql+=" and  (sq_fxfzr.sfzh='"+sq_fxfzr_sfzh+"')";
	}
	sq_fxfzr_lx=request.getParameter("sq_fxfzr_lx");
	if (sq_fxfzr_lx!=null)
	{
		sq_fxfzr_lx=cf.GB2Uni(sq_fxfzr_lx);
		if (!(sq_fxfzr_lx.equals("")))	wheresql+=" and  (sq_fxfzr.lx='"+sq_fxfzr_lx+"')";
	}
	ls_sql="SELECT sq_fxfzr.ssfgs,sq_dwxx.dwmc,sgdmc,DECODE(sq_fxfzr.lx,'1','ľ��','2','���߹�','3','ˮ�繤','4','���Ṥ'),sq_fxfzr.fzrmc, DECODE(sq_fxfzr.xb,'M','��','W','Ů'),sq_fxfzr.dh,sq_fxfzr.zz,sq_fxfzr.sfzh,sq_fxfzr.bz  ";
	ls_sql+=" FROM sq_dwxx,sq_fxfzr,sq_sgd  ";
    ls_sql+=" where sq_fxfzr.ssfgs=sq_dwxx.dwbh(+) and sq_fxfzr.sgd=sq_sgd.sgd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_fxfzr.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_fxfzr.ssfgs,sq_fxfzr.sgd,sq_fxfzr.lx,sq_fxfzr.fzrmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_fxfzrList.jsp","","","EditSq_fxfzr.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ssfgs","sq_dwxx_dwmc","fzrmc","sq_fxfzr_xb","sq_fxfzr_dh","sq_fxfzr_zz","sq_fxfzr_sfzh","sq_fxfzr_lx","sq_fxfzr_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ssfgs","fzrmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Sq_fxfzrList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem=cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from sq_fxfzr where "+chooseitem;
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="8%">�����ֹ�˾</td>
	<td  width="6%">����ʩ����</td>
	<td  width="6%">����</td>
	<td  width="7%">�����������</td>
	<td  width="6%">�Ա�</td>
	<td  width="14%">�绰</td>
	<td  width="14%">סַ</td>
	<td  width="9%">���֤��</td>
	<td  width="14%">��ע</td>
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