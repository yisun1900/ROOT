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


	String sq_sgd_sgd=null;
	String sq_sgd_sgdmc=null;
	sq_sgd_sgd=request.getParameter("sq_sgd_sgd");
	if (sq_sgd_sgd!=null)
	{
		sq_sgd_sgd=cf.GB2Uni(sq_sgd_sgd);
		if (!(sq_sgd_sgd.equals("")))	wheresql+=" and  (sq_sgd.sgd='"+sq_sgd_sgd+"')";
	}

	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc like '%"+sq_sgd_sgdmc+"%')";
	}

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_sgd.ssfgs='"+ssfgs+"')";
	}
	String cxbz=null;
	cxbz=request.getParameter("cxbz");
	if (cxbz!=null)
	{
		if (!(cxbz.equals("")))	wheresql+=" and  (sq_sgd.cxbz='"+cxbz+"')";
	}


	String cw_zbjxgjl_zbjjsyybm=null;
	String cw_zbjxgjl_lrr=null;
	String cw_zbjxgjl_lrsj=null;

	cw_zbjxgjl_zbjjsyybm=request.getParameter("cw_zbjxgjl_zbjjsyybm");
	if (cw_zbjxgjl_zbjjsyybm!=null)
	{
		cw_zbjxgjl_zbjjsyybm=cf.GB2Uni(cw_zbjxgjl_zbjjsyybm);
		if (!(cw_zbjxgjl_zbjjsyybm.equals("")))	wheresql+=" and  (cw_zbjxgjl.zbjjsyybm='"+cw_zbjxgjl_zbjjsyybm+"')";
	}
	cw_zbjxgjl_lrr=request.getParameter("cw_zbjxgjl_lrr");
	if (cw_zbjxgjl_lrr!=null)
	{
		cw_zbjxgjl_lrr=cf.GB2Uni(cw_zbjxgjl_lrr);
		if (!(cw_zbjxgjl_lrr.equals("")))	wheresql+=" and  (cw_zbjxgjl.lrr='"+cw_zbjxgjl_lrr+"')";
	}
	cw_zbjxgjl_lrsj=request.getParameter("cw_zbjxgjl_lrsj");
	if (cw_zbjxgjl_lrsj!=null)
	{
		cw_zbjxgjl_lrsj=cw_zbjxgjl_lrsj.trim();
		if (!(cw_zbjxgjl_lrsj.equals("")))	wheresql+="  and (cw_zbjxgjl.lrsj>=TO_DATE('"+cw_zbjxgjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zbjxgjl_lrsj=request.getParameter("cw_zbjxgjl_lrsj2");
	if (cw_zbjxgjl_lrsj!=null)
	{
		cw_zbjxgjl_lrsj=cw_zbjxgjl_lrsj.trim();
		if (!(cw_zbjxgjl_lrsj.equals("")))	wheresql+="  and (cw_zbjxgjl.lrsj<=TO_DATE('"+cw_zbjxgjl_lrsj+"','YYYY/MM/DD'))";
	}

	String jsjlh=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		jsjlh=cf.GB2Uni(jsjlh);
		if (!(jsjlh.equals("")))	wheresql+=" and  (cw_zbjxgjl.jsjlh='"+jsjlh+"')";
	}
	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");
	if (tsjlh!=null)
	{
		tsjlh=cf.GB2Uni(tsjlh);
		if (!(tsjlh.equals("")))	wheresql+=" and  (cw_zbjxgjl.tsjlh='"+tsjlh+"')";
	}
	String scbz=null;
	scbz=request.getParameter("scbz");
	if (scbz!=null)
	{
		scbz=cf.GB2Uni(scbz);
		if (!(scbz.equals("")))	wheresql+=" and  (cw_zbjxgjl.scbz='"+scbz+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (cw_zbjxgjl.lx='"+lx+"')";
	}

	ls_sql="SELECT cw_zbjxgjl.xuhao,sq_sgd.sgdmc,DECODE(cw_zbjxgjl.lx,'1','�ֹ�¼��','2','�깤����','3','����ά��') lx,cw_zbjxgjl.je,dm_zbjjsyybm.zbjjsyymc,cw_zbjxgjl.jsjlh,cw_zbjxgjl.tsjlh,cw_zbjxgjl.lrr,cw_zbjxgjl.lrsj,dwmc,DECODE(cw_zbjxgjl.scbz,'N','δɾ��','Y','ɾ��'),cw_zbjxgjl.scr,cw_zbjxgjl.scsj,cw_zbjxgjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjxgjl,sq_dwxx  ";
    ls_sql+=" where cw_zbjxgjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjxgjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_zbjxgjl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_sgd.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zbjxgjl.xuhao desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zbjxgjlList.jsp","","","EditCw_zbjxgjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","sq_sgd_sgdmc","dm_zbjjsyybm_zbjjsyymc","cw_zbjxgjl_je","cw_zbjxgjl_lrr","cw_zbjxgjl_lrsj","cw_zbjxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_zbjxgjl.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸��ʱ����޸ļ�¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="3%">���</td>
	<td  width="5%">ʩ����</td>
	<td  width="6%">����</td>
	<td  width="8%">���</td>
	<td  width="10%">�ʱ������ԭ��</td>
	<td  width="6%">�����¼��</td>
	<td  width="6%">Ͷ�߱��޼�¼��</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="5%">ɾ����־</td>
	<td  width="5%">ɾ����</td>
	<td  width="7%">ɾ��ʱ��</td>
	<td  width="38%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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