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
	if (!(fgs.equals("")))	wheresql+=" and  (call_qdjl.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (call_qdjl.lrbm='"+dwbh+"')";
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
		if (!(jtzt.equals("")))	wheresql+=" and  (call_qdjl.jtzt='"+jtzt+"')";
	}

	String khlx=null;
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+=" and  (call_qdjl.khlx='"+khlx+"')";
	}
	
	String call_qdjl_xh=null;
	String call_qdjl_ldsj=null;
	String call_qdjl_ldhm=null;
	String call_qdjl_ldlxbm=null;
	String call_qdjl_khbh=null;
	String call_qdjl_bjhm=null;
	String call_qdjl_lywjml=null;
	String call_qdjl_lywj=null;
	String call_qdjl_lrr=null;

	call_qdjl_xh=request.getParameter("call_qdjl_xh");
	if (call_qdjl_xh!=null)
	{
		call_qdjl_xh=call_qdjl_xh.trim();
		if (!(call_qdjl_xh.equals("")))	wheresql+=" and (call_qdjl.xh="+call_qdjl_xh+") ";
	}
	call_qdjl_ldsj=request.getParameter("call_qdjl_ldsj");
	if (call_qdjl_ldsj!=null)
	{
		call_qdjl_ldsj=call_qdjl_ldsj.trim();
		if (!(call_qdjl_ldsj.equals("")))	wheresql+="  and (call_qdjl.ldsj>=TO_DATE('"+call_qdjl_ldsj+"','YYYY/MM/DD'))";
	}
	call_qdjl_ldsj=request.getParameter("call_qdjl_ldsj2");
	if (call_qdjl_ldsj!=null)
	{
		call_qdjl_ldsj=call_qdjl_ldsj.trim();
		if (!(call_qdjl_ldsj.equals("")))	wheresql+="  and (call_qdjl.ldsj<=TO_DATE('"+call_qdjl_ldsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	call_qdjl_ldhm=request.getParameter("call_qdjl_ldhm");
	if (call_qdjl_ldhm!=null)
	{
		call_qdjl_ldhm=cf.GB2Uni(call_qdjl_ldhm);
		if (!(call_qdjl_ldhm.equals("")))	wheresql+=" and  (call_qdjl.ldhm like '%"+call_qdjl_ldhm+"%')";
	}
	call_qdjl_ldlxbm=request.getParameter("call_qdjl_ldlxbm");
	if (call_qdjl_ldlxbm!=null)
	{
		call_qdjl_ldlxbm=cf.GB2Uni(call_qdjl_ldlxbm);
		if (!(call_qdjl_ldlxbm.equals("")))	wheresql+=" and  (call_qdjl.ldlxbm='"+call_qdjl_ldlxbm+"')";
	}
	call_qdjl_khbh=request.getParameter("call_qdjl_khbh");
	if (call_qdjl_khbh!=null)
	{
		call_qdjl_khbh=cf.GB2Uni(call_qdjl_khbh);
		if (!(call_qdjl_khbh.equals("")))	wheresql+=" and  (call_qdjl.khbh='"+call_qdjl_khbh+"')";
	}
	call_qdjl_bjhm=request.getParameter("call_qdjl_bjhm");
	if (call_qdjl_bjhm!=null)
	{
		call_qdjl_bjhm=cf.GB2Uni(call_qdjl_bjhm);
		if (!(call_qdjl_bjhm.equals("")))	wheresql+=" and  (call_qdjl.bjhm like '%"+call_qdjl_bjhm+"%')";
	}
	call_qdjl_lywjml=request.getParameter("call_qdjl_lywjml");
	if (call_qdjl_lywjml!=null)
	{
		call_qdjl_lywjml=cf.GB2Uni(call_qdjl_lywjml);
		if (!(call_qdjl_lywjml.equals("")))	wheresql+=" and  (call_qdjl.lywjml like '%"+call_qdjl_lywjml+"%')";
	}
	call_qdjl_lywj=request.getParameter("call_qdjl_lywj");
	if (call_qdjl_lywj!=null)
	{
		call_qdjl_lywj=cf.GB2Uni(call_qdjl_lywj);
		if (!(call_qdjl_lywj.equals("")))	wheresql+=" and  (call_qdjl.lywj like '%"+call_qdjl_lywj+"%')";
	}
	call_qdjl_lrr=request.getParameter("call_qdjl_lrr");
	if (call_qdjl_lrr!=null)
	{
		call_qdjl_lrr=cf.GB2Uni(call_qdjl_lrr);
		if (!(call_qdjl_lrr.equals("")))	wheresql+=" and  (call_qdjl.lrr='"+call_qdjl_lrr+"')";
	}


	ls_sql="SELECT call_qdjl.xh,call_qdjl.ldsj,call_qdjl.ldhm,dm_ldlxbm.ldlxmc,DECODE(call_qdjl.khlx,'1','��ѯ','2','ǩ��','3','δ֪'),DECODE(call_qdjl.jtzt,'1','δ��ͨ','2','��ͨ'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,sgdmc,call_qdjl.khbh,call_qdjl.bjhm,call_qdjl.lywjml,call_qdjl.lywj,call_qdjl.lrr,call_qdjl.lrsj,a.dwmc lrbm,b.dwmc ssfgs  ";
	ls_sql+=" FROM dm_ldlxbm,call_qdjl,crm_khxx,sq_sgd,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where call_qdjl.ldlxbm=dm_ldlxbm.ldlxbm(+)";
    ls_sql+=" and call_qdjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and call_qdjl.lrbm=a.dwbh(+)";
    ls_sql+=" and call_qdjl.ssfgs=b.dwbh(+)";
 	
 	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and call_qdjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and call_qdjl.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by call_qdjl.xh desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Call_qdjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","call_qdjl_ldsj","call_qdjl_ldhm","dm_ldlxbm_ldlxmc","call_qdjl_khbh","call_qdjl_bjhm","call_qdjl_lywjml","call_qdjl_lywj","call_qdjl_lrr","call_qdjl_lrsj","call_qdjl_lrbm","call_qdjl_ssfgs"};
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
  <B><font size="3">ȥ���¼����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="7%">ȥ��ʱ��</td>
	<td  width="5%">ȥ�����</td>
	<td  width="3%">ȥ������</td>
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