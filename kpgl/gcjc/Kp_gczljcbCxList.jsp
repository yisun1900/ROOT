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
	String kp_gczljcb_kpxh=null;
	String kp_gczljcb_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sjkgrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String kp_gczljcb_kpr=null;
	String kp_gczljcb_kpsj=null;
	String kp_gczljcb_kplx=null;
	kp_gczljcb_kpxh=request.getParameter("kp_gczljcb_kpxh");
	if (kp_gczljcb_kpxh!=null)
	{
		kp_gczljcb_kpxh=cf.GB2Uni(kp_gczljcb_kpxh);
		if (!(kp_gczljcb_kpxh.equals("")))	wheresql+=" and  (kp_gczljcb.kpxh='"+kp_gczljcb_kpxh+"')";
	}
	kp_gczljcb_khbh=request.getParameter("kp_gczljcb_khbh");
	if (kp_gczljcb_khbh!=null)
	{
		kp_gczljcb_khbh=cf.GB2Uni(kp_gczljcb_khbh);
		if (!(kp_gczljcb_khbh.equals("")))	wheresql+=" and  (kp_gczljcb.khbh='"+kp_gczljcb_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq>=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sjkgrq=request.getParameter("crm_khxx_sjkgrq2");
	if (crm_khxx_sjkgrq!=null)
	{
		crm_khxx_sjkgrq=crm_khxx_sjkgrq.trim();
		if (!(crm_khxx_sjkgrq.equals("")))	wheresql+="  and (crm_khxx.sjkgrq<=TO_DATE('"+crm_khxx_sjkgrq+"','YYYY/MM/DD'))";
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
	kp_gczljcb_kpr=request.getParameter("kp_gczljcb_kpr");
	if (kp_gczljcb_kpr!=null)
	{
		kp_gczljcb_kpr=cf.GB2Uni(kp_gczljcb_kpr);
		if (!(kp_gczljcb_kpr.equals("")))	wheresql+=" and  (kp_gczljcb.kpr='"+kp_gczljcb_kpr+"')";
	}
	kp_gczljcb_kpsj=request.getParameter("kp_gczljcb_kpsj");
	if (kp_gczljcb_kpsj!=null)
	{
		kp_gczljcb_kpsj=kp_gczljcb_kpsj.trim();
		if (!(kp_gczljcb_kpsj.equals("")))	wheresql+="  and (kp_gczljcb.kpsj>=TO_DATE('"+kp_gczljcb_kpsj+"','YYYY/MM/DD'))";
	}
	kp_gczljcb_kpsj=request.getParameter("kp_gczljcb_kpsj2");
	if (kp_gczljcb_kpsj!=null)
	{
		kp_gczljcb_kpsj=kp_gczljcb_kpsj.trim();
		if (!(kp_gczljcb_kpsj.equals("")))	wheresql+="  and (kp_gczljcb.kpsj<=TO_DATE('"+kp_gczljcb_kpsj+"','YYYY/MM/DD'))";
	}
	kp_gczljcb_kplx=request.getParameter("kp_gczljcb_kplx");
	if (kp_gczljcb_kplx!=null)
	{
		kp_gczljcb_kplx=cf.GB2Uni(kp_gczljcb_kplx);
		if (!(kp_gczljcb_kplx.equals("")))	wheresql+=" and  (kp_gczljcb.kplx='"+kp_gczljcb_kplx+"')";
	}
	ls_sql="SELECT kp_gczljcb.kpxh as kpxh,kp_gczljcb.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sjs as crm_khxx_sjs,sgdmc as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,DECODE(kplx,'1','�ʼ�Ա','2','Ѳ��Ա','3','��˾���') kplx,kp_gczljcb.kpr as kp_gczljcb_kpr,kp_gczljcb.kpsj as kp_gczljcb_kpsj  ";
	ls_sql+=" FROM crm_khxx,kp_gczljcb,sq_sgd  ";
    ls_sql+=" where kp_gczljcb.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by kp_gczljcb.khbh,kp_gczljcb.kpxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_gczljcbCxList.jsp","SelectCxKp_gczljcb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"kpxh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm","kplx","kp_gczljcb_kpr","kp_gczljcb_kpsj"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"kpxh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/kpgl/gcjc/ViewAllKp_gczljcb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("crm_khxx_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"kpxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/kpgl/gcjc/ViewKp_gczljcb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("kpxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("crm_khxx_khxm","1");//�в����������Hash��
	spanColHash.put("crm_khxx_fwdz","1");//�в����������Hash��
	spanColHash.put("crm_khxx_lxfs","1");//�в����������Hash��
	spanColHash.put("crm_khxx_sjs","1");//�в����������Hash��
	spanColHash.put("crm_khxx_sgd","1");//�в����������Hash��
	spanColHash.put("crm_khxx_zjxm","1");//�в����������Hash��
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">�������</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="13%">��ϵ��ʽ</td>
	<td  width="7%">���ʦ</td>
	<td  width="7%">ʩ����</td>
	<td  width="7%">�ʼ�</td>
	<td  width="8%">��������</td>
	<td  width="7%">������</td>
	<td  width="13%">����ʱ��</td>
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