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




	String cw_chbgfjl_bgfjlh=null;
	String cw_chbgfjl_bfrq=null;
	String cw_chbgfjl_lx=null;
	String cw_chbgfjl_lrr=null;
	String cw_chbgfjl_lrsj=null;

	cw_chbgfjl_bgfjlh=request.getParameter("cw_chbgfjl_bgfjlh");
	if (cw_chbgfjl_bgfjlh!=null)
	{
		cw_chbgfjl_bgfjlh=cf.GB2Uni(cw_chbgfjl_bgfjlh);
		if (!(cw_chbgfjl_bgfjlh.equals("")))	wheresql+=" and  (cw_chbgfjl.bgfjlh='"+cw_chbgfjl_bgfjlh+"')";
	}

	cw_chbgfjl_bfrq=request.getParameter("cw_chbgfjl_bfrq");
	if (cw_chbgfjl_bfrq!=null)
	{
		cw_chbgfjl_bfrq=cw_chbgfjl_bfrq.trim();
		if (!(cw_chbgfjl_bfrq.equals("")))	wheresql+="  and (cw_chbgfjl.bfrq>=TO_DATE('"+cw_chbgfjl_bfrq+"','YYYY/MM/DD'))";
	}
	cw_chbgfjl_bfrq=request.getParameter("cw_chbgfjl_bfrq2");
	if (cw_chbgfjl_bfrq!=null)
	{
		cw_chbgfjl_bfrq=cw_chbgfjl_bfrq.trim();
		if (!(cw_chbgfjl_bfrq.equals("")))	wheresql+="  and (cw_chbgfjl.bfrq<=TO_DATE('"+cw_chbgfjl_bfrq+"','YYYY/MM/DD'))";
	}

	cw_chbgfjl_lx=request.getParameter("cw_chbgfjl_lx");
	if (cw_chbgfjl_lx!=null)
	{
		cw_chbgfjl_lx=cf.GB2Uni(cw_chbgfjl_lx);
		if (!(cw_chbgfjl_lx.equals("")))	wheresql+=" and  (cw_chbgfjl.lx='"+cw_chbgfjl_lx+"')";
	}
	cw_chbgfjl_lrr=request.getParameter("cw_chbgfjl_lrr");
	if (cw_chbgfjl_lrr!=null)
	{
		cw_chbgfjl_lrr=cf.GB2Uni(cw_chbgfjl_lrr);
		if (!(cw_chbgfjl_lrr.equals("")))	wheresql+=" and  (cw_chbgfjl.lrr='"+cw_chbgfjl_lrr+"')";
	}
	cw_chbgfjl_lrsj=request.getParameter("cw_chbgfjl_lrsj");
	if (cw_chbgfjl_lrsj!=null)
	{
		cw_chbgfjl_lrsj=cw_chbgfjl_lrsj.trim();
		if (!(cw_chbgfjl_lrsj.equals("")))	wheresql+="  and (cw_chbgfjl.lrsj>=TO_DATE('"+cw_chbgfjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_chbgfjl_lrsj=request.getParameter("cw_chbgfjl_lrsj2");
	if (cw_chbgfjl_lrsj!=null)
	{
		cw_chbgfjl_lrsj=cw_chbgfjl_lrsj.trim();
		if (!(cw_chbgfjl_lrsj.equals("")))	wheresql+="  and (cw_chbgfjl.lrsj<=TO_DATE('"+cw_chbgfjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT cw_chbgfjl.bgfjlh,cw_chbgfjl.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_chbgfjl.sgbz,gdjsjdmc,cw_chbgfjl.bfrq,cw_chbgfjl.bfbl||'%',cw_chbgfjl.bfje,cw_chbgfjl.qye,cw_chbgfjl.zhhtzcbj,cw_chbgfjl.ssk,cw_chbgfjl.yfgf,cw_chbgfjl.lrr,cw_chbgfjl.lrsj,dwmc,cw_chbgfjl.bz  ";
	ls_sql+=" FROM cw_chbgfjl,sq_sgd,dm_gdjsjd,sq_dwxx,crm_khxx  ";
    ls_sql+=" where cw_chbgfjl.sgd=sq_sgd.sgd(+) and cw_chbgfjl.lx=dm_gdjsjd.gdjsjd(+) and cw_chbgfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_chbgfjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_chbgfjl.lx='B'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_chbgfjl.lrsj desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Cw_chbgfjlShList.jsp","","","ShCw_chbgfjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"bgfjlh","cw_chbgfjl_khbh","sq_sgd_sgdmc","cw_chbgfjl_sgbz","cw_chbgfjl_bfrq","cw_chbgfjl_jsbl","cw_chbgfjl_jsje","cw_chbgfjl_clf","cw_chbgfjl_gdyp","cw_chbgfjl_sjbk","cw_chbgfjl_lx","cw_chbgfjl_lrr","cw_chbgfjl_lrsj","cw_chbgfjl_lrbm","cw_chbgfjl_bz","cw_chbgfjl_jsjs","cw_chbgfjl_htje","cw_chbgfjl_zjxje","cw_chbgfjl_jsjsze"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bgfjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");

//���ð�ť����
	String[] buttonName={"�������"};//��ť����ʾ����
	String[] buttonLink={"SavePlSh.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
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
  <B><font size="3">�����ѣ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">��¼��</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ֳ�������</td>
	<td  width="7%">����</td>
	<td  width="5%">��������</td>
	<td  width="4%">��������</td>
	<td  width="6%">�������</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">����ľ�Ž��</td>
	<td  width="6%">ʵ�տ�</td>
	<td  width="6%">�Ѹ�����</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="9%">��ע</td>
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