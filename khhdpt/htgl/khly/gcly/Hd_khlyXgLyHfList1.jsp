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
	String hd_khly_lyxh=null;
	String hd_khly_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_sgbz=null;
	String crm_khxx_dwbh=null;
	String hd_khly_lyr=null;
	String hd_khly_lysj=null;
	String hd_khly_lylx=null;
	String hd_khly_lysfyck=null;
	String hd_khly_lyckr=null;
	String hd_khly_lycksj=null;

	String sfyqhf=null;
	sfyqhf=request.getParameter("sfyqhf");
	if (sfyqhf!=null)
	{
		if (!(sfyqhf.equals("")))	wheresql+=" and  (hd_khly.sfyqhf='"+sfyqhf+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	hd_khly_lyxh=request.getParameter("hd_khly_lyxh");
	if (hd_khly_lyxh!=null)
	{
		hd_khly_lyxh=cf.GB2Uni(hd_khly_lyxh);
		if (!(hd_khly_lyxh.equals("")))	wheresql+=" and  (hd_khly.lyxh='"+hd_khly_lyxh+"')";
	}
	hd_khly_khbh=request.getParameter("hd_khly_khbh");
	if (hd_khly_khbh!=null)
	{
		hd_khly_khbh=cf.GB2Uni(hd_khly_khbh);
		if (!(hd_khly_khbh.equals("")))	wheresql+=" and  (hd_khly.khbh='"+hd_khly_khbh+"')";
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
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
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
	crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
	if (crm_khxx_sgbz!=null)
	{
		crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
		if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	hd_khly_lyr=request.getParameter("hd_khly_lyr");
	if (hd_khly_lyr!=null)
	{
		hd_khly_lyr=cf.GB2Uni(hd_khly_lyr);
		if (!(hd_khly_lyr.equals("")))	wheresql+=" and  (hd_khly.lyr='"+hd_khly_lyr+"')";
	}
	hd_khly_lysj=request.getParameter("hd_khly_lysj");
	if (hd_khly_lysj!=null)
	{
		hd_khly_lysj=hd_khly_lysj.trim();
		if (!(hd_khly_lysj.equals("")))	wheresql+="  and (hd_khly.lysj>=TO_DATE('"+hd_khly_lysj+"','YYYY/MM/DD'))";
	}
	hd_khly_lysj=request.getParameter("hd_khly_lysj2");
	if (hd_khly_lysj!=null)
	{
		hd_khly_lysj=hd_khly_lysj.trim();
		if (!(hd_khly_lysj.equals("")))	wheresql+="  and (hd_khly.lysj<=TO_DATE('"+hd_khly_lysj+"','YYYY/MM/DD'))";
	}
	hd_khly_lylx=request.getParameter("hd_khly_lylx");
	if (hd_khly_lylx!=null)
	{
		hd_khly_lylx=cf.GB2Uni(hd_khly_lylx);
		if (!(hd_khly_lylx.equals("")))	wheresql+=" and  (hd_khly.lylx='"+hd_khly_lylx+"')";
	}
	hd_khly_lysfyck=request.getParameter("hd_khly_lysfyck");
	if (hd_khly_lysfyck!=null)
	{
		hd_khly_lysfyck=cf.GB2Uni(hd_khly_lysfyck);
		if (!(hd_khly_lysfyck.equals("")))	wheresql+=" and  (hd_khly.lysfyck='"+hd_khly_lysfyck+"')";
	}
	hd_khly_lyckr=request.getParameter("hd_khly_lyckr");
	if (hd_khly_lyckr!=null)
	{
		hd_khly_lyckr=cf.GB2Uni(hd_khly_lyckr);
		if (!(hd_khly_lyckr.equals("")))	wheresql+=" and  (hd_khly.lyckr='"+hd_khly_lyckr+"')";
	}
	hd_khly_lycksj=request.getParameter("hd_khly_lycksj");
	if (hd_khly_lycksj!=null)
	{
		hd_khly_lycksj=hd_khly_lycksj.trim();
		if (!(hd_khly_lycksj.equals("")))	wheresql+="  and (hd_khly.lycksj>=TO_DATE('"+hd_khly_lycksj+"','YYYY/MM/DD'))";
	}
	hd_khly_lycksj=request.getParameter("hd_khly_lycksj2");
	if (hd_khly_lycksj!=null)
	{
		hd_khly_lycksj=hd_khly_lycksj.trim();
		if (!(hd_khly_lycksj.equals("")))	wheresql+="  and (hd_khly.lycksj<=TO_DATE('"+hd_khly_lycksj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT hd_khly.lyxh,DECODE(hd_khly.lylx,'1','��������','2','��������','3','�ͻ�Ͷ��','4','�ͻ�����','5','�ͻ�����','6','�ܾ�������','9','��������'),DECODE(hd_khly.sfyqhf,'1','����ظ�','2','����ظ�','3','��Ҫ��'),DECODE(hd_khly.lysfyck,'N','δ�鿴','Y','�ѿ�'),crm_khxx.khxm,crm_khxx.fwdz,hd_khly.lysj,hd_khly.lynr,hd_khly.lyckr,hd_khly.lycksj,hd_khly.lyhfnr,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,sgdmc,crm_khxx.zjxm,dwmc";
	ls_sql+=" FROM crm_khxx,hd_khly,sq_dwxx,sq_sgd  ";
    ls_sql+=" where hd_khly.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hd_khly.lyxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hd_khlyXgLyHfList1.jsp","SelectXgLyHfHd_khly1.jsp","","XgLyHfHd_khly.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lyxh","hd_khly_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_sgbz","crm_khxx_dwbh","hd_khly_lyr","hd_khly_lysj","hd_khly_lynr","hd_khly_lylx","hd_khly_lysfyck","hd_khly_lyckr","hd_khly_lycksj","hd_khly_lyhfnr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lyxh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ�����Իظ�"};//��ť����ʾ����
	String[] buttonLink={"Hd_khlyXgLyHfList.jsp"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] lyxh = request.getParameterValues("lyxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(lyxh,"lyxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="update hd_khly set lysfyck='N',lyckr=null,lycksj=null,lyhfnr=null  where "+chooseitem;
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
  <B><font size="3">��������---�޸Ļظ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">�������</td>
	<td  width="3%">��������</td>
	<td  width="3%">�Ƿ�Ҫ��ظ�</td>
	<td  width="3%">�����Ƿ��Ѳ鿴</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="4%">����ʱ��</td>
	<td  width="19%">��������</td>
	<td  width="3%">���Բ鿴��</td>
	<td  width="4%">���Բ鿴ʱ��</td>
	<td  width="19%">���Իظ�����</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ʼ�</td>
	<td  width="5%">ǩԼ����</td>
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