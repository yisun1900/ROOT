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
	String wheresql="";
	String ls_sql=null;

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

	
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (crm_khxx.xmzy='"+xmzy+"')";
	}
	
	String hflxbm=null;
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (crm_khxx.hflxbm='"+hflxbm+"') ";
	}
	
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	
	String gcjdbm=null;
	gcjdbm=request.getParameter("gcjdbm");
	if (gcjdbm!=null)
	{
		gcjdbm=cf.GB2Uni(gcjdbm);
		if (!(gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+gcjdbm+"')";
		
	}
	
	String hfrq=null;
	hfrq=request.getParameter("hfrq");
	if (hfrq!=null)
	{
		hfrq=cf.GB2Uni(hfrq);
		if (!(hfrq.equals("")))	wheresql+=" and  (crm_khxx.hfrq>=TO_DATE('"+hfrq+"','YYYY/MM/DD')) ";
	}
	
	String hfrq2=null;
	hfrq2=request.getParameter("hfrq2");
	if (hfrq2!=null)
	{
		hfrq2=cf.GB2Uni(hfrq2);
		if (!(hfrq2.equals("")))	wheresql+=" and  (crm_khxx.hfrq<=TO_DATE('"+hfrq2+"','YYYY/MM/DD'))";
	}
	
	String sjkgrq=null;
	sjkgrq=request.getParameter("sjkgrq");
	if (sjkgrq!=null)
	{
		sjkgrq=cf.GB2Uni(sjkgrq);
		if (!(sjkgrq.equals("")))	wheresql+=" and  (crm_khxx.sjkgrq>=TO_DATE('"+sjkgrq+"','YYYY/MM/DD'))";
	}
	
	String sjkgrq2=null;
	sjkgrq2=request.getParameter("sjkgrq2");
	if (sjkgrq2!=null)
	{
		sjkgrq2=cf.GB2Uni(sjkgrq2);
		if (!(sjkgrq2.equals("")))	wheresql+=" and  (crm_khxx.sjkgrq<=TO_DATE('"+sjkgrq2+"','YYYY/MM/DD'))";
	}
	
	String sjjgrq=null;
	sjjgrq=request.getParameter("sjjgrq");
	if (sjjgrq!=null)
	{
		sjjgrq=cf.GB2Uni(sjjgrq);
		if (!(sjjgrq.equals("")))	wheresql+=" and  (crm_khxx.sjjgrq>=TO_DATE('"+sjjgrq+"','YYYY/MM/DD'))";
	}
	
	String sjjgrq2=null;
	sjjgrq2=request.getParameter("sjjgrq2");
	if (sjjgrq2!=null)
	{
		sjjgrq2=cf.GB2Uni(sjjgrq2);
		if (!(sjjgrq2.equals("")))	wheresql+=" and  (crm_khxx.sjjgrq<=TO_DATE('"+sjjgrq2+"','YYYY/MM/DD'))";
	}

	String sjhfts=request.getParameter("sjhfts");

	ls_sql="SELECT sjhfsj,hflxmc,hfrq,sjkgrq,sjjgrq,khxm,fwdz,ysgcjdmc,sgdmc,dwmc,khbh";
	ls_sql+=" FROM crm_khxx,sq_dwxx,dm_hflxbm,dm_gcjdbm ,sq_sgd ";
    ls_sql+=" where zt='2' and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.hflxbm=dm_hflxbm.hflxbm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm";
//   ls_sql+=" and (hfdjbz not in('1','3') or (hfdjbz in('1','3') and jhjdsj<=SYSDATE)) ";
    ls_sql+=" and (  (SYSDATE-sjhfsj)>"+sjhfts+" OR (sjhfsj is null)  )";
    ls_sql+=" and (SYSDATE-crm_khxx.sjjgrq<600 OR crm_khxx.sjjgrq is null)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
    ls_sql+=" order by qyrq";
    pageObj.sql=ls_sql;
//	out.print(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Crm_khxxCxList.jsp","SelectCxCrm_khxx.jsp","InsertHf_sjhfjl.jsp","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","dwbh","pdclzt","pdsj","sfxhf","hfrq","hflxbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("�ط�");
//	pageObj.setViewBolt("");
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">����طÿͻ��������깤ʱ��С��600��ͻ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(135);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%"><B>�ϴ�����ط�ʱ��</B></td>
	<td  width="9%">�´λط�����</td>
	<td  width="7%">Ӧ�ط�ʱ��</td>
	<td  width="7%">ʵ����</td>
	<td  width="7%">ʵ�ʿ�������</td>
	<td  width="6%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="6%">���̽���</td>
	<td  width="6%">ʩ����</td>
	<td  width="8%">ǩԼ����</td>
	<td  width="5%">�ͻ����</td>
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