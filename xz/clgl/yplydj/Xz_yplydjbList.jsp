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
	String xz_yplydjb_xh=null;
	String xz_yplydjb_qcph=null;
	String xz_qcdm_qcxh=null;
	String xz_yplydjb_ybh=null;
	String xz_yplydjb_lysl=null;
	String xz_yplydjb_lyrq=null;
	String xz_yplydjb_lyr=null;
	String xz_yplydjb_ssfgs=null;
	String xz_yplydjb_lrr=null;
	String xz_yplydjb_lrsj=null;
	xz_yplydjb_xh=request.getParameter("xz_yplydjb_xh");
	if (xz_yplydjb_xh!=null)
	{
		xz_yplydjb_xh=xz_yplydjb_xh.trim();
		if (!(xz_yplydjb_xh.equals("")))	wheresql+=" and (xz_yplydjb.xh="+xz_yplydjb_xh+") ";
	}
	xz_yplydjb_qcph=request.getParameter("xz_yplydjb_qcph");
	if (xz_yplydjb_qcph!=null)
	{
		xz_yplydjb_qcph=cf.GB2Uni(xz_yplydjb_qcph);
		if (!(xz_yplydjb_qcph.equals("")))	wheresql+=" and  (xz_yplydjb.qcph like '%"+xz_yplydjb_qcph+"%')";
	}
	xz_qcdm_qcxh=request.getParameter("xz_qcdm_qcxh");
	if (xz_qcdm_qcxh!=null)
	{
		xz_qcdm_qcxh=cf.GB2Uni(xz_qcdm_qcxh);
		if (!(xz_qcdm_qcxh.equals("")))	wheresql+=" and  (xz_qcdm.qcxh like '%"+xz_qcdm_qcxh+"%')";
	}
	xz_yplydjb_ybh=request.getParameter("xz_yplydjb_ybh");
	if (xz_yplydjb_ybh!=null)
	{
		xz_yplydjb_ybh=cf.GB2Uni(xz_yplydjb_ybh);
		if (!(xz_yplydjb_ybh.equals("")))	wheresql+=" and  (xz_yplydjb.ybh='"+xz_yplydjb_ybh+"')";
	}
	xz_yplydjb_lysl=request.getParameter("xz_yplydjb_lysl");
	if (xz_yplydjb_lysl!=null)
	{
		xz_yplydjb_lysl=xz_yplydjb_lysl.trim();
		if (!(xz_yplydjb_lysl.equals("")))	wheresql+=" and  (xz_yplydjb.lysl>="+xz_yplydjb_lysl+") ";
	}
	xz_yplydjb_lysl=request.getParameter("xz_yplydjb_lysl2");
	if (xz_yplydjb_lysl!=null)
	{
		xz_yplydjb_lysl=xz_yplydjb_lysl.trim();
		if (!(xz_yplydjb_lysl.equals("")))	wheresql+=" and  (xz_yplydjb.lysl<="+xz_yplydjb_lysl+") ";
	}
	xz_yplydjb_lyrq=request.getParameter("xz_yplydjb_lyrq");
	if (xz_yplydjb_lyrq!=null)
	{
		xz_yplydjb_lyrq=xz_yplydjb_lyrq.trim();
		if (!(xz_yplydjb_lyrq.equals("")))	wheresql+="  and (xz_yplydjb.lyrq>=TO_DATE('"+xz_yplydjb_lyrq+"','YYYY/MM/DD'))";
	}
	xz_yplydjb_lyrq=request.getParameter("xz_yplydjb_lyrq2");
	if (xz_yplydjb_lyrq!=null)
	{
		xz_yplydjb_lyrq=xz_yplydjb_lyrq.trim();
		if (!(xz_yplydjb_lyrq.equals("")))	wheresql+="  and (xz_yplydjb.lyrq<=TO_DATE('"+xz_yplydjb_lyrq+"','YYYY/MM/DD'))";
	}
	xz_yplydjb_lyr=request.getParameter("xz_yplydjb_lyr");
	if (xz_yplydjb_lyr!=null)
	{
		xz_yplydjb_lyr=cf.GB2Uni(xz_yplydjb_lyr);
		if (!(xz_yplydjb_lyr.equals("")))	wheresql+=" and  (xz_yplydjb.lyr='"+xz_yplydjb_lyr+"')";
	}

	xz_yplydjb_ssfgs=request.getParameter("xz_yplydjb_ssfgs");
	if (!(xz_yplydjb_ssfgs.equals("")))	wheresql+=" and  (xz_yplydjb.ssfgs='"+xz_yplydjb_ssfgs+"')";

	xz_yplydjb_lrr=request.getParameter("xz_yplydjb_lrr");
	if (xz_yplydjb_lrr!=null)
	{
		xz_yplydjb_lrr=cf.GB2Uni(xz_yplydjb_lrr);
		if (!(xz_yplydjb_lrr.equals("")))	wheresql+=" and  (xz_yplydjb.lrr='"+xz_yplydjb_lrr+"')";
	}
	xz_yplydjb_lrsj=request.getParameter("xz_yplydjb_lrsj");
	if (xz_yplydjb_lrsj!=null)
	{
		xz_yplydjb_lrsj=xz_yplydjb_lrsj.trim();
		if (!(xz_yplydjb_lrsj.equals("")))	wheresql+="  and (xz_yplydjb.lrsj=TO_DATE('"+xz_yplydjb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT xz_yplydjb.xh,xz_yplydjb.qcph,xz_qcdm.qcxh,xz_qcdm.sjxm, xz_yplydjb.ybh,xz_yplydjb.dj,xz_yplydjb.lysl,xz_yplydjb.cllcs,xz_yplydjb.lyrq,xz_yplydjb.lyr,sq_dwxx.dwmc,xz_yplydjb.lrr,xz_yplydjb.lrsj,xz_yplydjb.bz  ";
	ls_sql+=" FROM sq_dwxx,xz_qcdm,xz_yplydjb  ";
    ls_sql+=" where xz_yplydjb.qcph=xz_qcdm.qcph and xz_yplydjb.ssfgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by xz_yplydjb.ssfgs,xz_yplydjb.qcph,xz_yplydjb.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_yplydjbList.jsp","SelectXz_yplydjb.jsp","","EditXz_yplydjb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","xz_yplydjb_qcph","xz_qcdm_qcxh","xz_qcdm_sjxm","xz_yplydjb_ybh","xz_yplydjb_lysl","xz_yplydjb_cllcs","xz_yplydjb_lyrq","xz_yplydjb_lyr","sq_dwxx_dwmc","xz_yplydjb_lrr","xz_yplydjb_lrsj","xz_yplydjb_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_yplydjbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from xz_yplydjb where "+chooseitem;
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="4%">���</td>
	<td  width="10%">�����ƺ�</td>
	<td  width="10%">�����ͺ�</td>
	<td  width="4%">˾������</td>
	<td  width="5%">�ͱ��</td>
	<td  width="5%">����</td>
	<td  width="5%">��������</td>
	<td  width="4%">���������</td>
	<td  width="6%">��������</td>
	<td  width="4%">������</td>
	<td  width="10%">�����ֹ�˾</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="17%">��ע</td>
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