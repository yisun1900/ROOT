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

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz+"%')";
	}
	
	
	
	String crm_fdkhhf_hfjlh=null;
	String crm_fdkhhf_hfr=null;
	String crm_fdkhhf_hfsj=null;
	String crm_fdkhhf_hfsbyybm=null;
	String crm_fdkhhf_hfsbkhlx=null;
	String crm_fdkhhf_hfsbsj=null;
	String crm_fdkhhf_lx=null;
	String crm_fdkhhf_lrr=null;
	String crm_fdkhhf_lrsj=null;
	String crm_fdkhhf_lrbm=null;
	crm_fdkhhf_hfjlh=request.getParameter("crm_fdkhhf_hfjlh");
	if (crm_fdkhhf_hfjlh!=null)
	{
		crm_fdkhhf_hfjlh=cf.GB2Uni(crm_fdkhhf_hfjlh);
		if (!(crm_fdkhhf_hfjlh.equals("")))	wheresql+=" and  (crm_fdkhhf.hfjlh='"+crm_fdkhhf_hfjlh+"')";
	}
	crm_fdkhhf_hfr=request.getParameter("crm_fdkhhf_hfr");
	if (crm_fdkhhf_hfr!=null)
	{
		crm_fdkhhf_hfr=cf.GB2Uni(crm_fdkhhf_hfr);
		if (!(crm_fdkhhf_hfr.equals("")))	wheresql+=" and  (crm_fdkhhf.hfr='"+crm_fdkhhf_hfr+"')";
	}
	crm_fdkhhf_hfsj=request.getParameter("crm_fdkhhf_hfsj");
	if (crm_fdkhhf_hfsj!=null)
	{
		crm_fdkhhf_hfsj=crm_fdkhhf_hfsj.trim();
		if (!(crm_fdkhhf_hfsj.equals("")))	wheresql+="  and (crm_fdkhhf.hfsj>=TO_DATE('"+crm_fdkhhf_hfsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_hfsj=request.getParameter("crm_fdkhhf_hfsj2");
	if (crm_fdkhhf_hfsj!=null)
	{
		crm_fdkhhf_hfsj=crm_fdkhhf_hfsj.trim();
		if (!(crm_fdkhhf_hfsj.equals("")))	wheresql+="  and (crm_fdkhhf.hfsj<=TO_DATE('"+crm_fdkhhf_hfsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_hfsbyybm=request.getParameter("crm_fdkhhf_hfsbyybm");
	if (crm_fdkhhf_hfsbyybm!=null)
	{
		crm_fdkhhf_hfsbyybm=cf.GB2Uni(crm_fdkhhf_hfsbyybm);
		if (!(crm_fdkhhf_hfsbyybm.equals("")))	wheresql+=" and  (crm_fdkhhf.hfsbyybm='"+crm_fdkhhf_hfsbyybm+"')";
	}
	crm_fdkhhf_hfsbkhlx=request.getParameter("crm_fdkhhf_hfsbkhlx");
	if (crm_fdkhhf_hfsbkhlx!=null)
	{
		crm_fdkhhf_hfsbkhlx=cf.GB2Uni(crm_fdkhhf_hfsbkhlx);
		if (!(crm_fdkhhf_hfsbkhlx.equals("")))	wheresql+=" and  (crm_fdkhhf.hfsbkhlx='"+crm_fdkhhf_hfsbkhlx+"')";
	}
	crm_fdkhhf_hfsbsj=request.getParameter("crm_fdkhhf_hfsbsj");
	if (crm_fdkhhf_hfsbsj!=null)
	{
		crm_fdkhhf_hfsbsj=crm_fdkhhf_hfsbsj.trim();
		if (!(crm_fdkhhf_hfsbsj.equals("")))	wheresql+="  and (crm_fdkhhf.hfsbsj=TO_DATE('"+crm_fdkhhf_hfsbsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_lx=request.getParameter("crm_fdkhhf_lx");
	if (crm_fdkhhf_lx!=null)
	{
		crm_fdkhhf_lx=cf.GB2Uni(crm_fdkhhf_lx);
		if (!(crm_fdkhhf_lx.equals("")))	wheresql+=" and  (crm_fdkhhf.lx='"+crm_fdkhhf_lx+"')";
	}
	crm_fdkhhf_lrr=request.getParameter("crm_fdkhhf_lrr");
	if (crm_fdkhhf_lrr!=null)
	{
		crm_fdkhhf_lrr=cf.GB2Uni(crm_fdkhhf_lrr);
		if (!(crm_fdkhhf_lrr.equals("")))	wheresql+=" and  (crm_fdkhhf.lrr='"+crm_fdkhhf_lrr+"')";
	}
	crm_fdkhhf_lrsj=request.getParameter("crm_fdkhhf_lrsj");
	if (crm_fdkhhf_lrsj!=null)
	{
		crm_fdkhhf_lrsj=crm_fdkhhf_lrsj.trim();
		if (!(crm_fdkhhf_lrsj.equals("")))	wheresql+="  and (crm_fdkhhf.lrsj>=TO_DATE('"+crm_fdkhhf_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_lrsj=request.getParameter("crm_fdkhhf_lrsj2");
	if (crm_fdkhhf_lrsj!=null)
	{
		crm_fdkhhf_lrsj=crm_fdkhhf_lrsj.trim();
		if (!(crm_fdkhhf_lrsj.equals("")))	wheresql+="  and (crm_fdkhhf.lrsj<=TO_DATE('"+crm_fdkhhf_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_lrbm=request.getParameter("crm_fdkhhf_lrbm");
	if (crm_fdkhhf_lrbm!=null)
	{
		crm_fdkhhf_lrbm=cf.GB2Uni(crm_fdkhhf_lrbm);
		if (!(crm_fdkhhf_lrbm.equals("")))	wheresql+=" and  (crm_fdkhhf.lrbm='"+crm_fdkhhf_lrbm+"')";
	}
	ls_sql="SELECT crm_fdkhhf.hfjlh, DECODE(crm_fdkhhf.lx,'1','�ɵ��ط�','2','����ط�','3','��Ϣ�˻ط�'),crm_fdkhhf.khbh,a.dwmc,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_fdkhhf.hfr,crm_fdkhhf.hfsj,sbyymc,crm_fdkhhf.hfsbkhlx,crm_fdkhhf.hfsbyyxs,crm_fdkhhf.hfsbsj,crm_fdkhhf.lrr,crm_fdkhhf.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM crm_fdkhhf,crm_zxkhxx,sq_dwxx a,sq_dwxx b,dm_sbyybm  ";
    ls_sql+=" where crm_fdkhhf.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_zxkhxx.zxdm=a.dwbh(+)";
    ls_sql+=" and crm_fdkhhf.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_fdkhhf.hfsbyybm=dm_sbyybm.sbyybm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_fdkhhf.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_fdkhhfCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hfjlh","crm_fdkhhf_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_fdkhhf_hfr","crm_fdkhhf_hfsj","crm_fdkhhf_hfsbyybm","crm_fdkhhf_hfsbkhlx","crm_fdkhhf_hfsbyyxs","crm_fdkhhf_hfsbsj","crm_fdkhhf_lx","crm_fdkhhf_lrr","crm_fdkhhf_lrsj","crm_fdkhhf_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�ɵ��طò�ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�طü�¼��</td>
	<td  width="5%">����</td>
	<td  width="4%">�ͻ����</td>
	<td  width="8%">����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="4%">�ط���</td>
	<td  width="5%">�ط�ʱ��</td>
	<td  width="7%">�ط÷ɵ�ԭ��</td>
	<td  width="7%">�ط÷ɵ��ͻ�����</td>
	<td  width="19%">�ط÷ɵ�ԭ������</td>
	<td  width="5%">�ط÷ɵ�ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
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