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
	String kp_gdrcjcjl_jcjlh=null;
	String kp_gdrcjcjl_khbh=null;
	String kp_gdrcjcjl_sgd=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String kp_gdrcjcjl_jcr=null;
	String kp_gdrcjcjl_jcsj=null;
	String kp_gdrcjcjl_rcjclxbm=null;
	String kp_gdrcjcjl_rcjcjgbm=null;
	String kp_gdrcjcjl_spbz=null;
	String kp_gdrcjcjl_spr=null;
	String kp_gdrcjcjl_spsj=null;
	String kp_gdrcjcjl_lrr=null;
	String kp_gdrcjcjl_lrsj=null;
	String kp_gdrcjcjl_lrbm=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	kp_gdrcjcjl_jcjlh=request.getParameter("kp_gdrcjcjl_jcjlh");
	if (kp_gdrcjcjl_jcjlh!=null)
	{
		kp_gdrcjcjl_jcjlh=cf.GB2Uni(kp_gdrcjcjl_jcjlh);
		if (!(kp_gdrcjcjl_jcjlh.equals("")))	wheresql+=" and  (kp_gdrcjcjl.jcjlh='"+kp_gdrcjcjl_jcjlh+"')";
	}
	kp_gdrcjcjl_khbh=request.getParameter("kp_gdrcjcjl_khbh");
	if (kp_gdrcjcjl_khbh!=null)
	{
		kp_gdrcjcjl_khbh=cf.GB2Uni(kp_gdrcjcjl_khbh);
		if (!(kp_gdrcjcjl_khbh.equals("")))	wheresql+=" and  (kp_gdrcjcjl.khbh='"+kp_gdrcjcjl_khbh+"')";
	}
	kp_gdrcjcjl_sgd=request.getParameter("kp_gdrcjcjl_sgd");
	if (kp_gdrcjcjl_sgd!=null)
	{
		kp_gdrcjcjl_sgd=cf.GB2Uni(kp_gdrcjcjl_sgd);
		if (!(kp_gdrcjcjl_sgd.equals("")))	wheresql+=" and  (kp_gdrcjcjl.sgd='"+kp_gdrcjcjl_sgd+"')";
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
	kp_gdrcjcjl_jcr=request.getParameter("kp_gdrcjcjl_jcr");
	if (kp_gdrcjcjl_jcr!=null)
	{
		kp_gdrcjcjl_jcr=cf.GB2Uni(kp_gdrcjcjl_jcr);
		if (!(kp_gdrcjcjl_jcr.equals("")))	wheresql+=" and  (kp_gdrcjcjl.jcr='"+kp_gdrcjcjl_jcr+"')";
	}
	kp_gdrcjcjl_jcsj=request.getParameter("kp_gdrcjcjl_jcsj");
	if (kp_gdrcjcjl_jcsj!=null)
	{
		kp_gdrcjcjl_jcsj=kp_gdrcjcjl_jcsj.trim();
		if (!(kp_gdrcjcjl_jcsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.jcsj>=TO_DATE('"+kp_gdrcjcjl_jcsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_jcsj=request.getParameter("kp_gdrcjcjl_jcsj2");
	if (kp_gdrcjcjl_jcsj!=null)
	{
		kp_gdrcjcjl_jcsj=kp_gdrcjcjl_jcsj.trim();
		if (!(kp_gdrcjcjl_jcsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.jcsj<=TO_DATE('"+kp_gdrcjcjl_jcsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_rcjclxbm=request.getParameter("kp_gdrcjcjl_rcjclxbm");
	if (kp_gdrcjcjl_rcjclxbm!=null)
	{
		kp_gdrcjcjl_rcjclxbm=cf.GB2Uni(kp_gdrcjcjl_rcjclxbm);
		if (!(kp_gdrcjcjl_rcjclxbm.equals("")))	wheresql+=" and  (kp_gdrcjcjl.rcjclxbm='"+kp_gdrcjcjl_rcjclxbm+"')";
	}
	kp_gdrcjcjl_rcjcjgbm=request.getParameter("kp_gdrcjcjl_rcjcjgbm");
	if (kp_gdrcjcjl_rcjcjgbm!=null)
	{
		kp_gdrcjcjl_rcjcjgbm=cf.GB2Uni(kp_gdrcjcjl_rcjcjgbm);
		if (!(kp_gdrcjcjl_rcjcjgbm.equals("")))	wheresql+=" and  (kp_gdrcjcjl.rcjcjgbm='"+kp_gdrcjcjl_rcjcjgbm+"')";
	}
	kp_gdrcjcjl_spbz=request.getParameter("kp_gdrcjcjl_spbz");
	if (kp_gdrcjcjl_spbz!=null)
	{
		kp_gdrcjcjl_spbz=cf.GB2Uni(kp_gdrcjcjl_spbz);
		if (!(kp_gdrcjcjl_spbz.equals("")))	wheresql+=" and  (kp_gdrcjcjl.spbz='"+kp_gdrcjcjl_spbz+"')";
	}
	kp_gdrcjcjl_spr=request.getParameter("kp_gdrcjcjl_spr");
	if (kp_gdrcjcjl_spr!=null)
	{
		kp_gdrcjcjl_spr=cf.GB2Uni(kp_gdrcjcjl_spr);
		if (!(kp_gdrcjcjl_spr.equals("")))	wheresql+=" and  (kp_gdrcjcjl.spr='"+kp_gdrcjcjl_spr+"')";
	}
	kp_gdrcjcjl_spsj=request.getParameter("kp_gdrcjcjl_spsj");
	if (kp_gdrcjcjl_spsj!=null)
	{
		kp_gdrcjcjl_spsj=kp_gdrcjcjl_spsj.trim();
		if (!(kp_gdrcjcjl_spsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.spsj>=TO_DATE('"+kp_gdrcjcjl_spsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_spsj=request.getParameter("kp_gdrcjcjl_spsj2");
	if (kp_gdrcjcjl_spsj!=null)
	{
		kp_gdrcjcjl_spsj=kp_gdrcjcjl_spsj.trim();
		if (!(kp_gdrcjcjl_spsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.spsj<=TO_DATE('"+kp_gdrcjcjl_spsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_lrr=request.getParameter("kp_gdrcjcjl_lrr");
	if (kp_gdrcjcjl_lrr!=null)
	{
		kp_gdrcjcjl_lrr=cf.GB2Uni(kp_gdrcjcjl_lrr);
		if (!(kp_gdrcjcjl_lrr.equals("")))	wheresql+=" and  (kp_gdrcjcjl.lrr='"+kp_gdrcjcjl_lrr+"')";
	}
	kp_gdrcjcjl_lrsj=request.getParameter("kp_gdrcjcjl_lrsj");
	if (kp_gdrcjcjl_lrsj!=null)
	{
		kp_gdrcjcjl_lrsj=kp_gdrcjcjl_lrsj.trim();
		if (!(kp_gdrcjcjl_lrsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.lrsj>=TO_DATE('"+kp_gdrcjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_lrsj=request.getParameter("kp_gdrcjcjl_lrsj2");
	if (kp_gdrcjcjl_lrsj!=null)
	{
		kp_gdrcjcjl_lrsj=kp_gdrcjcjl_lrsj.trim();
		if (!(kp_gdrcjcjl_lrsj.equals("")))	wheresql+="  and (kp_gdrcjcjl.lrsj<=TO_DATE('"+kp_gdrcjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_gdrcjcjl_lrbm=request.getParameter("kp_gdrcjcjl_lrbm");
	if (kp_gdrcjcjl_lrbm!=null)
	{
		kp_gdrcjcjl_lrbm=cf.GB2Uni(kp_gdrcjcjl_lrbm);
		if (!(kp_gdrcjcjl_lrbm.equals("")))	wheresql+=" and  (kp_gdrcjcjl.lrbm='"+kp_gdrcjcjl_lrbm+"')";
	}
	ls_sql="SELECT kp_gdrcjcjl.jcjlh,kp_gdrcjcjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.sjs,crm_khxx.hth,kp_gdrcjcjl.jcr,kp_gdrcjcjl.jcsj,dm_rcjclxbm.rcjclxmc,dm_rcjcjgbm.rcjcjgmc, DECODE(kp_gdrcjcjl.spbz,'1','δ����','2','����'),kp_gdrcjcjl.spr,kp_gdrcjcjl.spsj,kp_gdrcjcjl.lrr,kp_gdrcjcjl.lrsj,dwmc,kp_gdrcjcjl.bz  ";
	ls_sql+=" FROM crm_khxx,dm_rcjcjgbm,dm_rcjclxbm,kp_gdrcjcjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where kp_gdrcjcjl.rcjcjgbm=dm_rcjcjgbm.rcjcjgbm(+) and kp_gdrcjcjl.rcjclxbm=dm_rcjclxbm.rcjclxbm(+) and kp_gdrcjcjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and kp_gdrcjcjl.sgd=sq_sgd.sgd(+) and kp_gdrcjcjl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by kp_gdrcjcjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_gdrcjcjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jcjlh","kp_gdrcjcjl_khbh","kp_gdrcjcjl_sgd","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_hth","kp_gdrcjcjl_jcr","kp_gdrcjcjl_jcsj","dm_rcjclxbm_rcjclxmc","dm_rcjcjgbm_rcjcjgmc","kp_gdrcjcjl_spbz","kp_gdrcjcjl_spr","kp_gdrcjcjl_spsj","kp_gdrcjcjl_lrr","kp_gdrcjcjl_lrsj","kp_gdrcjcjl_lrbm","kp_gdrcjcjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jcjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_gdrcjcjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jcjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����¼��</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">���ʦ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="5%">�������</td>
	<td  width="5%">�����</td>
	<td  width="4%">������־</td>
	<td  width="4%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="6%">¼�뵥λ</td>
	<td  width="25%">��ע</td>
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