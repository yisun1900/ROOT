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
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}

	String bgfjlh=null;
	bgfjlh=request.getParameter("bgfjlh");
	if (bgfjlh!=null)
	{
		bgfjlh=cf.GB2Uni(bgfjlh);
		if (!(bgfjlh.equals("")))	wheresql+=" and  (cw_lfbgfjl.bgfjlh='"+bgfjlh+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cw_lfbgfjl.lrr='"+lrr+"')";
	}
	String bfcs=null;
	bfcs=request.getParameter("bfcs");
	if (bfcs!=null)
	{
		bfcs=cf.GB2Uni(bfcs);
		if (!(bfcs.equals("")))	wheresql+=" and  (cw_lfbgfjl.bfcs='"+bfcs+"')";
	}
	String bfjs=null;
	bfjs=request.getParameter("bfjs");
	if (bfjs!=null)
	{
		bfjs=cf.GB2Uni(bfjs);
		if (!(bfjs.equals("")))	wheresql+=" and  (cw_lfbgfjl.bfjs='"+bfjs+"')";
	}
	String bfrq=null;
	bfrq=request.getParameter("bfrq");
	if (bfrq!=null)
	{
		bfrq=bfrq.trim();
		if (!(bfrq.equals("")))	wheresql+="  and (cw_lfbgfjl.bfrq>=TO_DATE('"+bfrq+"','YYYY-MM-DD'))";
	}
	bfrq=request.getParameter("bfrq2");
	if (bfrq!=null)
	{
		bfrq=bfrq.trim();
		if (!(bfrq.equals("")))	wheresql+="  and (cw_lfbgfjl.bfrq<=TO_DATE('"+bfrq+"','YYYY-MM-DD'))";
	}

	ls_sql="SELECT cw_lfbgfjl.bgfjlh,gdjsjdmc,cw_lfbgfjl.bfbl||'%',TO_CHAR(cw_lfbgfjl.zqgcf),TO_CHAR(cw_lfbgfjl.zhgcf),DECODE(cw_lfbgfjl.bfjs,'1','��ǰ���̷�','2','�ۺ󹤳̷�','3','ʵ�տ�'),TO_CHAR(cw_lfbgfjl.bfje),TO_CHAR(cw_lfbgfjl.yfgf),cw_lfbgfjl.sjbk,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.khbh,gcjdmc,sgdmc,cw_lfbgfjl.sgbz,dwmc,cw_lfbgfjl.bfrq  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm,dm_gdjsjd,cw_lfbgfjl ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and cw_lfbgfjl.sgd=sq_sgd.sgd(+)  ";
    ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_lfbgfjl.bfcs=dm_gdjsjd.gdjsjd(+)";
    ls_sql+=" and crm_khxx.khbh=cw_lfbgfjl.khbh";


	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_lfbgfjl.lrsj desc,cw_lfbgfjl.khbh,cw_lfbgfjl.bfcs";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_lfbgfjlList.jsp","","","EditCw_lfbgfjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"bgfjlh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_lfbgfjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">�����ѣ��޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">�����Ѽ�¼��</td>
	<td  width="6%">�����Ѵ���</td>
	<td  width="4%">��������</td>
	<td  width="6%">��ǰ���̷�</td>
	<td  width="6%">�ۺ󹤳̷�</td>
	<td  width="6%">��������</td>
	<td  width="5%">�������</td>
	<td  width="5%">�Ѹ�����</td>
	<td  width="6%">����ʵ�ʲ���</td>

	<td  width="4%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">���̽���</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�೤</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="6%">��������</td>
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