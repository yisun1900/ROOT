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
	String hd_zyxxtx_lysfyck=null;
	String hd_zyxxtx_lyckr=null;
	String hd_zyxxtx_lycksj=null;
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
	hd_zyxxtx_lysfyck=request.getParameter("hd_zyxxtx_lysfyck");
	if (hd_zyxxtx_lysfyck!=null)
	{
		hd_zyxxtx_lysfyck=cf.GB2Uni(hd_zyxxtx_lysfyck);
		if (!(hd_zyxxtx_lysfyck.equals("")))	wheresql+=" and  (hd_zyxxtx.lysfyck='"+hd_zyxxtx_lysfyck+"')";
	}
	hd_zyxxtx_lyckr=request.getParameter("hd_zyxxtx_lyckr");
	if (hd_zyxxtx_lyckr!=null)
	{
		hd_zyxxtx_lyckr=cf.GB2Uni(hd_zyxxtx_lyckr);
		if (!(hd_zyxxtx_lyckr.equals("")))	wheresql+=" and  (hd_zyxxtx.lyckr='"+hd_zyxxtx_lyckr+"')";
	}
	hd_zyxxtx_lycksj=request.getParameter("hd_zyxxtx_lycksj");
	if (hd_zyxxtx_lycksj!=null)
	{
		hd_zyxxtx_lycksj=hd_zyxxtx_lycksj.trim();
		if (!(hd_zyxxtx_lycksj.equals("")))	wheresql+="  and (hd_zyxxtx.lycksj>=TO_DATE('"+hd_zyxxtx_lycksj+"','YYYY/MM/DD'))";
	}
	hd_zyxxtx_lycksj=request.getParameter("hd_zyxxtx_lycksj2");
	if (hd_zyxxtx_lycksj!=null)
	{
		hd_zyxxtx_lycksj=hd_zyxxtx_lycksj.trim();
		if (!(hd_zyxxtx_lycksj.equals("")))	wheresql+="  and (hd_zyxxtx.lycksj<=TO_DATE('"+hd_zyxxtx_lycksj+"','YYYY/MM/DD'))";
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

	ls_sql="SELECT crm_khxx.khxm,crm_khxx.fwdz,hd_zyxxtx.txxh,DECODE(hd_zyxxtx.txdj,1,'һ��',2,'��Ҫ',3,'�ر���Ҫ'),hd_zyxxtx.txbt,hd_zyxxtx.txnr, DECODE(hd_zyxxtx.txfl,'1','��������','2','������������','3','��������','4','���ɲ�Ʒ����','9','��������'), DECODE(hd_zyxxtx.sfyxkhly,'N','������','Y','����'),hd_zyxxtx.lrr,hd_zyxxtx.lrsj,a.dwmc lrbm,hd_zyxxtx.bz,crm_khxx.sjs,crm_khxx.hth,crm_khxx.qyrq,sgdmc,crm_khxx.zjxm,b.dwmc dm  ";
	ls_sql+=" FROM crm_khxx,hd_zyxxtx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where hd_zyxxtx.lrbm=a.dwbh(+) and hd_zyxxtx.khbh=crm_khxx.khbh and crm_khxx.dwbh=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hd_zyxxtx.khbh,hd_zyxxtx.txxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hd_zyxxtxList.jsp","SelectHd_zyxxtx.jsp","","EditHd_zyxxtx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"txxh","hd_zyxxtx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_dwbh","hd_zyxxtx_txbt","hd_zyxxtx_txnr","hd_zyxxtx_txfl","hd_zyxxtx_sfyxkhly","hd_zyxxtx_khsfyck","hd_zyxxtx_khckr","hd_zyxxtx_khcksj","hd_zyxxtx_khlynr","hd_zyxxtx_lysfyck","hd_zyxxtx_lyckr","hd_zyxxtx_lycksj","hd_zyxxtx_lrr","hd_zyxxtx_lrsj","sq_dwxx_dwmc","hd_zyxxtx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"txxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Hd_zyxxtxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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


}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] txxh = request.getParameterValues("txxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(txxh,"txxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from hd_zyxxtxly where "+chooseitem;
		sql[1]="delete from hd_zyxxtx where "+chooseitem;
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
  <B><font size="3">��Ҫ����ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="4%">�������</td>
	<td  width="3%">���ѵȼ�</td>
	<td  width="9%">���ѱ���</td>
	<td  width="19%">��������</td>
	<td  width="5%">���ѷ���</td>
	<td  width="3%">�ͻ��Ƿ��������</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="6%">���ѱ�ע</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ʼ�</td>
	<td  width="6%">ǩԼ����</td>
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