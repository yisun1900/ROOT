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
	if (!(fgs.equals("")))	wheresql+=" and  (call_ldjl.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (call_ldjl.lrbm='"+dwbh+"')";
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

	String jtzt=null;
	jtzt=request.getParameter("jtzt");
	if (jtzt!=null)
	{
		jtzt=cf.GB2Uni(jtzt);
		if (!(jtzt.equals("")))	wheresql+=" and  (call_ldjl.jtzt='"+jtzt+"')";
	}

	String khlx=null;
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+=" and  (call_ldjl.khlx='"+khlx+"')";
	}
	
	String call_ldjl_xh=null;
	String call_ldjl_ldsj=null;
	String call_ldjl_ldhm=null;
	String call_ldjl_ldlxbm=null;
	String call_ldjl_khbh=null;
	String call_ldjl_bjhm=null;
	String call_ldjl_lywjml=null;
	String call_ldjl_lywj=null;
	String call_ldjl_lrr=null;

	call_ldjl_xh=request.getParameter("call_ldjl_xh");
	if (call_ldjl_xh!=null)
	{
		call_ldjl_xh=call_ldjl_xh.trim();
		if (!(call_ldjl_xh.equals("")))	wheresql+=" and (call_ldjl.xh="+call_ldjl_xh+") ";
	}
	call_ldjl_ldsj=request.getParameter("call_ldjl_ldsj");
	if (call_ldjl_ldsj!=null)
	{
		call_ldjl_ldsj=call_ldjl_ldsj.trim();
		if (!(call_ldjl_ldsj.equals("")))	wheresql+="  and (call_ldjl.ldsj>=TO_DATE('"+call_ldjl_ldsj+"','YYYY/MM/DD'))";
	}
	call_ldjl_ldsj=request.getParameter("call_ldjl_ldsj2");
	if (call_ldjl_ldsj!=null)
	{
		call_ldjl_ldsj=call_ldjl_ldsj.trim();
		if (!(call_ldjl_ldsj.equals("")))	wheresql+="  and (call_ldjl.ldsj<=TO_DATE('"+call_ldjl_ldsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	call_ldjl_ldhm=request.getParameter("call_ldjl_ldhm");
	if (call_ldjl_ldhm!=null)
	{
		call_ldjl_ldhm=cf.GB2Uni(call_ldjl_ldhm);
		if (!(call_ldjl_ldhm.equals("")))	wheresql+=" and  (call_ldjl.ldhm like '%"+call_ldjl_ldhm+"%')";
	}
	call_ldjl_ldlxbm=request.getParameter("call_ldjl_ldlxbm");
	if (call_ldjl_ldlxbm!=null)
	{
		call_ldjl_ldlxbm=cf.GB2Uni(call_ldjl_ldlxbm);
		if (!(call_ldjl_ldlxbm.equals("")))	wheresql+=" and  (call_ldjl.ldlxbm='"+call_ldjl_ldlxbm+"')";
	}
	call_ldjl_khbh=request.getParameter("call_ldjl_khbh");
	if (call_ldjl_khbh!=null)
	{
		call_ldjl_khbh=cf.GB2Uni(call_ldjl_khbh);
		if (!(call_ldjl_khbh.equals("")))	wheresql+=" and  (call_ldjl.khbh='"+call_ldjl_khbh+"')";
	}
	call_ldjl_bjhm=request.getParameter("call_ldjl_bjhm");
	if (call_ldjl_bjhm!=null)
	{
		call_ldjl_bjhm=cf.GB2Uni(call_ldjl_bjhm);
		if (!(call_ldjl_bjhm.equals("")))	wheresql+=" and  (call_ldjl.bjhm like '%"+call_ldjl_bjhm+"%')";
	}
	call_ldjl_lywjml=request.getParameter("call_ldjl_lywjml");
	if (call_ldjl_lywjml!=null)
	{
		call_ldjl_lywjml=cf.GB2Uni(call_ldjl_lywjml);
		if (!(call_ldjl_lywjml.equals("")))	wheresql+=" and  (call_ldjl.lywjml like '%"+call_ldjl_lywjml+"%')";
	}
	call_ldjl_lywj=request.getParameter("call_ldjl_lywj");
	if (call_ldjl_lywj!=null)
	{
		call_ldjl_lywj=cf.GB2Uni(call_ldjl_lywj);
		if (!(call_ldjl_lywj.equals("")))	wheresql+=" and  (call_ldjl.lywj like '%"+call_ldjl_lywj+"%')";
	}
	call_ldjl_lrr=request.getParameter("call_ldjl_lrr");
	if (call_ldjl_lrr!=null)
	{
		call_ldjl_lrr=cf.GB2Uni(call_ldjl_lrr);
		if (!(call_ldjl_lrr.equals("")))	wheresql+=" and  (call_ldjl.lrr='"+call_ldjl_lrr+"')";
	}


	ls_sql="SELECT call_ldjl.xh,call_ldjl.ldsj,call_ldjl.ldhm,dm_ldlxbm.ldlxmc,DECODE(call_ldjl.khlx,'1','��ѯ','2','ǩ��','3','δ֪'),DECODE(call_ldjl.jtzt,'1','δ��ͨ','2','��ͨ'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,sgdmc,call_ldjl.khbh,call_ldjl.bjhm,call_ldjl.lywjml,call_ldjl.lywj,call_ldjl.lrr,call_ldjl.lrsj,a.dwmc lrbm,b.dwmc ssfgs  ";
	ls_sql+=" FROM dm_ldlxbm,call_ldjl,crm_khxx,sq_sgd,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where call_ldjl.ldlxbm=dm_ldlxbm.ldlxbm(+)";
    ls_sql+=" and call_ldjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and call_ldjl.lrbm=a.dwbh(+)";
    ls_sql+=" and call_ldjl.ssfgs=b.dwbh(+)";
 	
 	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and call_ldjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and call_ldjl.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by call_ldjl.xh desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Call_ldjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","call_ldjl_ldsj","call_ldjl_ldhm","dm_ldlxbm_ldlxmc","call_ldjl_khbh","call_ldjl_bjhm","call_ldjl_lywjml","call_ldjl_lywj","call_ldjl_lrr","call_ldjl_lrsj","call_ldjl_lrbm","call_ldjl_ssfgs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");

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
  <B><font size="3">�����¼����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="7%">����ʱ��</td>
	<td  width="5%">�������</td>
	<td  width="3%">��������</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">��ͨ״̬</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ʼ�</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ͻ����</td>
	<td  width="5%">��������</td>
	<td  width="8%">¼���ļ�Ŀ¼</td>
	<td  width="19%">¼���ļ�</td>
	<td  width="3%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="5%">�����ֹ�˾</td>
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