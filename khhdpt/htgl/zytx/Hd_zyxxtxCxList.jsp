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
	String hd_zyxxtx_txxh=null;
	String hd_zyxxtx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String hd_zyxxtx_txbt=null;
	String hd_zyxxtx_txfl=null;
	String hd_zyxxtx_khsfyck=null;
	String hd_zyxxtx_khckr=null;
	String hd_zyxxtx_khcksj=null;
	String hd_zyxxtxly_lysfyck=null;
	String hd_zyxxtxly_lyckr=null;
	String hd_zyxxtxly_lycksj=null;
	String hd_zyxxtx_lrr=null;
	String hd_zyxxtx_lrsj=null;
	String hd_zyxxtx_lrbm=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String txdj=null;
	txdj=request.getParameter("txdj");
	if (txdj!=null)
	{
		if (!(txdj.equals("")))	wheresql+=" and (hd_zyxxtx.txdj="+txdj+") ";
	}

	String sfyxkhly=null;
	sfyxkhly=request.getParameter("sfyxkhly");
	if (sfyxkhly!=null)
	{
		if (!(sfyxkhly.equals("")))	wheresql+=" and (hd_zyxxtx.sfyxkhly='"+sfyxkhly+"') ";
	}

	hd_zyxxtx_txxh=request.getParameter("hd_zyxxtx_txxh");
	if (hd_zyxxtx_txxh!=null)
	{
		hd_zyxxtx_txxh=hd_zyxxtx_txxh.trim();
		if (!(hd_zyxxtx_txxh.equals("")))	wheresql+=" and (hd_zyxxtx.txxh='"+hd_zyxxtx_txxh+"') ";
	}
	hd_zyxxtx_khbh=request.getParameter("hd_zyxxtx_khbh");
	if (hd_zyxxtx_khbh!=null)
	{
		hd_zyxxtx_khbh=cf.GB2Uni(hd_zyxxtx_khbh);
		if (!(hd_zyxxtx_khbh.equals("")))	wheresql+=" and  (hd_zyxxtx.khbh='"+hd_zyxxtx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	hd_zyxxtx_txbt=request.getParameter("hd_zyxxtx_txbt");
	if (hd_zyxxtx_txbt!=null)
	{
		hd_zyxxtx_txbt=cf.GB2Uni(hd_zyxxtx_txbt);
		if (!(hd_zyxxtx_txbt.equals("")))	wheresql+=" and  (hd_zyxxtx.txbt like '%"+hd_zyxxtx_txbt+"5')";
	}
	hd_zyxxtx_txfl=request.getParameter("hd_zyxxtx_txfl");
	if (hd_zyxxtx_txfl!=null)
	{
		hd_zyxxtx_txfl=cf.GB2Uni(hd_zyxxtx_txfl);
		if (!(hd_zyxxtx_txfl.equals("")))	wheresql+=" and  (hd_zyxxtx.txfl='"+hd_zyxxtx_txfl+"')";
	}
	hd_zyxxtx_khsfyck=request.getParameter("hd_zyxxtx_khsfyck");
	if (hd_zyxxtx_khsfyck!=null)
	{
		hd_zyxxtx_khsfyck=cf.GB2Uni(hd_zyxxtx_khsfyck);
		if (!(hd_zyxxtx_khsfyck.equals("")))	wheresql+=" and  (hd_zyxxtx.khsfyck='"+hd_zyxxtx_khsfyck+"')";
	}
	hd_zyxxtx_khckr=request.getParameter("hd_zyxxtx_khckr");
	if (hd_zyxxtx_khckr!=null)
	{
		hd_zyxxtx_khckr=cf.GB2Uni(hd_zyxxtx_khckr);
		if (!(hd_zyxxtx_khckr.equals("")))	wheresql+=" and  (hd_zyxxtx.khckr='"+hd_zyxxtx_khckr+"')";
	}
	hd_zyxxtx_khcksj=request.getParameter("hd_zyxxtx_khcksj");
	if (hd_zyxxtx_khcksj!=null)
	{
		hd_zyxxtx_khcksj=hd_zyxxtx_khcksj.trim();
		if (!(hd_zyxxtx_khcksj.equals("")))	wheresql+="  and (hd_zyxxtx.khcksj>=TO_DATE('"+hd_zyxxtx_khcksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_khcksj=request.getParameter("hd_zyxxtx_khcksj2");
	if (hd_zyxxtx_khcksj!=null)
	{
		hd_zyxxtx_khcksj=hd_zyxxtx_khcksj.trim();
		if (!(hd_zyxxtx_khcksj.equals("")))	wheresql+="  and (hd_zyxxtx.khcksj<=TO_DATE('"+hd_zyxxtx_khcksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtxly_lysfyck=request.getParameter("hd_zyxxtxly_lysfyck");
	if (hd_zyxxtxly_lysfyck!=null)
	{
		hd_zyxxtxly_lysfyck=cf.GB2Uni(hd_zyxxtxly_lysfyck);
		if (!(hd_zyxxtxly_lysfyck.equals("")))	wheresql+=" and  (hd_zyxxtxly.lysfyck='"+hd_zyxxtxly_lysfyck+"')";
	}
	hd_zyxxtxly_lyckr=request.getParameter("hd_zyxxtxly_lyckr");
	if (hd_zyxxtxly_lyckr!=null)
	{
		hd_zyxxtxly_lyckr=cf.GB2Uni(hd_zyxxtxly_lyckr);
		if (!(hd_zyxxtxly_lyckr.equals("")))	wheresql+=" and  (hd_zyxxtxly.lyckr='"+hd_zyxxtxly_lyckr+"')";
	}
	hd_zyxxtxly_lycksj=request.getParameter("hd_zyxxtxly_lycksj");
	if (hd_zyxxtxly_lycksj!=null)
	{
		hd_zyxxtxly_lycksj=hd_zyxxtxly_lycksj.trim();
		if (!(hd_zyxxtxly_lycksj.equals("")))	wheresql+="  and (hd_zyxxtxly.lycksj>=TO_DATE('"+hd_zyxxtxly_lycksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtxly_lycksj=request.getParameter("hd_zyxxtxly_lycksj2");
	if (hd_zyxxtxly_lycksj!=null)
	{
		hd_zyxxtxly_lycksj=hd_zyxxtxly_lycksj.trim();
		if (!(hd_zyxxtxly_lycksj.equals("")))	wheresql+="  and (hd_zyxxtxly.lycksj<=TO_DATE('"+hd_zyxxtxly_lycksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_lrr=request.getParameter("hd_zyxxtx_lrr");
	if (hd_zyxxtx_lrr!=null)
	{
		hd_zyxxtx_lrr=cf.GB2Uni(hd_zyxxtx_lrr);
		if (!(hd_zyxxtx_lrr.equals("")))	wheresql+=" and  (hd_zyxxtx.lrr='"+hd_zyxxtx_lrr+"')";
	}
	hd_zyxxtx_lrsj=request.getParameter("hd_zyxxtx_lrsj");
	if (hd_zyxxtx_lrsj!=null)
	{
		hd_zyxxtx_lrsj=hd_zyxxtx_lrsj.trim();
		if (!(hd_zyxxtx_lrsj.equals("")))	wheresql+="  and (hd_zyxxtx.lrsj>=TO_DATE('"+hd_zyxxtx_lrsj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_lrsj=request.getParameter("hd_zyxxtx_lrsj2");
	if (hd_zyxxtx_lrsj!=null)
	{
		hd_zyxxtx_lrsj=hd_zyxxtx_lrsj.trim();
		if (!(hd_zyxxtx_lrsj.equals("")))	wheresql+="  and (hd_zyxxtx.lrsj<=TO_DATE('"+hd_zyxxtx_lrsj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_lrbm=request.getParameter("hd_zyxxtx_lrbm");
	if (hd_zyxxtx_lrbm!=null)
	{
		hd_zyxxtx_lrbm=cf.GB2Uni(hd_zyxxtx_lrbm);
		if (!(hd_zyxxtx_lrbm.equals("")))	wheresql+=" and  (hd_zyxxtx.lrbm='"+hd_zyxxtx_lrbm+"')";
	}

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,hd_zyxxtx.txxh,DECODE(hd_zyxxtx.txdj,1,'һ��',2,'��Ҫ',3,'�ر���Ҫ') txdj,hd_zyxxtx.txbt,hd_zyxxtx.txnr, DECODE(hd_zyxxtx.txfl,'1','��������','2','������������','3','��������','4','���ɲ�Ʒ����','9','��������') txfl, DECODE(hd_zyxxtx.sfyxkhly,'N','������','Y','����') sfyxkhly,hd_zyxxtx.lrr,hd_zyxxtx.lrsj,a.dwmc lrbm,hd_zyxxtx.bz, DECODE(hd_zyxxtx.khsfyck,'N','δ�鿴','Y','�Ѳ鿴') khsfyck,hd_zyxxtx.khcksj,hd_zyxxtxly.lysj,hd_zyxxtxly.lynr, DECODE(hd_zyxxtxly.lysfyck,'N','δ�鿴','Y','�Ѳ鿴'),hd_zyxxtxly.lyckr,hd_zyxxtxly.lycksj,hd_zyxxtxly.lyhfnr  ";
	ls_sql+=" FROM crm_khxx,hd_zyxxtx,hd_zyxxtxly,sq_dwxx a";
    ls_sql+=" where hd_zyxxtx.lrbm=a.dwbh(+) and hd_zyxxtx.khbh=crm_khxx.khbh ";
    ls_sql+=" and hd_zyxxtx.txxh=hd_zyxxtxly.txxh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.fgsbh,hd_zyxxtx.txxh,hd_zyxxtxly.lyxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hd_zyxxtxCxList.jsp","SelectCxHd_zyxxtx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"txxh","hd_zyxxtx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_dwbh","hd_zyxxtx_txbt","hd_zyxxtx_txnr","hd_zyxxtx_txfl","hd_zyxxtx_sfyxkhly","hd_zyxxtx_khsfyck","hd_zyxxtx_khckr","hd_zyxxtx_khcksj","hd_zyxxtx_khlynr","hd_zyxxtx_lysfyck","hd_zyxxtx_lyckr","hd_zyxxtx_lycksj","hd_zyxxtx_lrr","hd_zyxxtx_lrsj","sq_dwxx_dwmc","hd_zyxxtx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"txxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("txxh","1");//�в����������Hash��
	spanColHash.put("txdj","1");//�в����������Hash��
	spanColHash.put("txbt","1");//�в����������Hash��
	spanColHash.put("txnr","1");//�в����������Hash��
	spanColHash.put("txfl","1");//�в����������Hash��
	spanColHash.put("sfyxkhly","1");//�в����������Hash��
	spanColHash.put("lrr","1");//�в����������Hash��
	spanColHash.put("lrsj","1");//�в����������Hash��
	spanColHash.put("lrbm","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��
	spanColHash.put("khsfyck","1");//�в����������Hash��
	spanColHash.put("khcksj","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%" bgcolor="#9999FF">��ͬ��</td>
	<td  width="2%" bgcolor="#9999FF">�ͻ�����</td>
	<td  width="7%" bgcolor="#9999FF">���ݵ�ַ</td>
	<td  width="3%" bgcolor="#CCCCFF">�������</td>
	<td  width="2%" bgcolor="#CCCCFF">���ѵȼ�</td>
	<td  width="8%" bgcolor="#CCCCFF">���ѱ���</td>
	<td  width="13%" bgcolor="#CCCCFF">��������</td>
	<td  width="4%" bgcolor="#CCCCFF">���ѷ���</td>
	<td  width="2%" bgcolor="#CCCCFF">�ͻ��Ƿ��������</td>
	<td  width="2%" bgcolor="#CCCCFF">¼����</td>
	<td  width="3%" bgcolor="#CCCCFF">¼��ʱ��</td>
	<td  width="5%" bgcolor="#CCCCFF">¼�벿��</td>
	<td  width="7%" bgcolor="#CCCCFF">���ѱ�ע</td>
	<td  width="2%" bgcolor="#CCFFFF">�ͻ��Ƿ��Ѳ鿴</td>
	<td  width="3%" bgcolor="#CCFFFF">����鿴ʱ��</td>
	<td  width="3%" bgcolor="#CCFFFF">����ʱ��</td>
	<td  width="12%" bgcolor="#CCFFFF">��������</td>
	<td  width="2%" bgcolor="#FFCCFF">�����Ƿ��Ѳ鿴</td>
	<td  width="2%" bgcolor="#FFCCFF">���Բ鿴��</td>
	<td  width="3%" bgcolor="#FFCCFF">���Բ鿴ʱ��</td>
	<td  width="12%" bgcolor="#FFCCFF">���Իظ�����</td>
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