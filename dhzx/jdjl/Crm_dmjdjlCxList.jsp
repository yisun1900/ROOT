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
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_xb=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_lxfs=null;
	String crm_zxkhxx_lrsj=null;
	String crm_dmjdjl_dmjdjlh=null;
	String crm_dmjdjl_khbh=null;
	String crm_dmjdjl_ssfgs=null;
	String crm_dmjdjl_zxdm=null;
	String crm_dmjdjl_kssj=null;
	String crm_dmjdjl_kslrr=null;
	String crm_dmjdjl_jssj=null;
	String crm_dmjdjl_jslrr=null;
	String crm_dmjdjl_sbyybm=null;
	String crm_dmjdjl_zxzt=null;
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	crm_zxkhxx_xb=request.getParameter("crm_zxkhxx_xb");
	if (crm_zxkhxx_xb!=null)
	{
		crm_zxkhxx_xb=cf.GB2Uni(crm_zxkhxx_xb);
		if (!(crm_zxkhxx_xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+crm_zxkhxx_xb+"')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+crm_zxkhxx_fwdz+"')";
	}
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj2");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_dmjdjl_dmjdjlh=request.getParameter("crm_dmjdjl_dmjdjlh");
	if (crm_dmjdjl_dmjdjlh!=null)
	{
		crm_dmjdjl_dmjdjlh=cf.GB2Uni(crm_dmjdjl_dmjdjlh);
		if (!(crm_dmjdjl_dmjdjlh.equals("")))	wheresql+=" and  (crm_dmjdjl.dmjdjlh='"+crm_dmjdjl_dmjdjlh+"')";
	}
	crm_dmjdjl_khbh=request.getParameter("crm_dmjdjl_khbh");
	if (crm_dmjdjl_khbh!=null)
	{
		crm_dmjdjl_khbh=cf.GB2Uni(crm_dmjdjl_khbh);
		if (!(crm_dmjdjl_khbh.equals("")))	wheresql+=" and  (crm_dmjdjl.khbh='"+crm_dmjdjl_khbh+"')";
	}
	crm_dmjdjl_ssfgs=request.getParameter("crm_dmjdjl_ssfgs");
	if (crm_dmjdjl_ssfgs!=null)
	{
		crm_dmjdjl_ssfgs=cf.GB2Uni(crm_dmjdjl_ssfgs);
		if (!(crm_dmjdjl_ssfgs.equals("")))	wheresql+=" and  (crm_dmjdjl.ssfgs='"+crm_dmjdjl_ssfgs+"')";
	}
	crm_dmjdjl_zxdm=request.getParameter("crm_dmjdjl_zxdm");
	if (crm_dmjdjl_zxdm!=null)
	{
		crm_dmjdjl_zxdm=cf.GB2Uni(crm_dmjdjl_zxdm);
		if (!(crm_dmjdjl_zxdm.equals("")))	wheresql+=" and  (crm_dmjdjl.zxdm='"+crm_dmjdjl_zxdm+"')";
	}
	crm_dmjdjl_kssj=request.getParameter("crm_dmjdjl_kssj");
	if (crm_dmjdjl_kssj!=null)
	{
		crm_dmjdjl_kssj=crm_dmjdjl_kssj.trim();
		if (!(crm_dmjdjl_kssj.equals("")))	wheresql+="  and (crm_dmjdjl.kssj>=TO_DATE('"+crm_dmjdjl_kssj+"','YYYY/MM/DD'))";
	}
	crm_dmjdjl_kssj=request.getParameter("crm_dmjdjl_kssj2");
	if (crm_dmjdjl_kssj!=null)
	{
		crm_dmjdjl_kssj=crm_dmjdjl_kssj.trim();
		if (!(crm_dmjdjl_kssj.equals("")))	wheresql+="  and (crm_dmjdjl.kssj<=TO_DATE('"+crm_dmjdjl_kssj+"','YYYY/MM/DD'))";
	}
	crm_dmjdjl_kslrr=request.getParameter("crm_dmjdjl_kslrr");
	if (crm_dmjdjl_kslrr!=null)
	{
		crm_dmjdjl_kslrr=cf.GB2Uni(crm_dmjdjl_kslrr);
		if (!(crm_dmjdjl_kslrr.equals("")))	wheresql+=" and  (crm_dmjdjl.kslrr='"+crm_dmjdjl_kslrr+"')";
	}
	crm_dmjdjl_jssj=request.getParameter("crm_dmjdjl_jssj");
	if (crm_dmjdjl_jssj!=null)
	{
		crm_dmjdjl_jssj=crm_dmjdjl_jssj.trim();
		if (!(crm_dmjdjl_jssj.equals("")))	wheresql+="  and (crm_dmjdjl.jssj>=TO_DATE('"+crm_dmjdjl_jssj+"','YYYY/MM/DD'))";
	}
	crm_dmjdjl_jssj=request.getParameter("crm_dmjdjl_jssj2");
	if (crm_dmjdjl_jssj!=null)
	{
		crm_dmjdjl_jssj=crm_dmjdjl_jssj.trim();
		if (!(crm_dmjdjl_jssj.equals("")))	wheresql+="  and (crm_dmjdjl.jssj<=TO_DATE('"+crm_dmjdjl_jssj+"','YYYY/MM/DD'))";
	}
	crm_dmjdjl_jslrr=request.getParameter("crm_dmjdjl_jslrr");
	if (crm_dmjdjl_jslrr!=null)
	{
		crm_dmjdjl_jslrr=cf.GB2Uni(crm_dmjdjl_jslrr);
		if (!(crm_dmjdjl_jslrr.equals("")))	wheresql+=" and  (crm_dmjdjl.jslrr='"+crm_dmjdjl_jslrr+"')";
	}
	crm_dmjdjl_sbyybm=request.getParameter("crm_dmjdjl_sbyybm");
	if (crm_dmjdjl_sbyybm!=null)
	{
		crm_dmjdjl_sbyybm=cf.GB2Uni(crm_dmjdjl_sbyybm);
		if (!(crm_dmjdjl_sbyybm.equals("")))	wheresql+=" and  (crm_dmjdjl.sbyybm='"+crm_dmjdjl_sbyybm+"')";
	}
	crm_dmjdjl_zxzt=request.getParameter("crm_dmjdjl_zxzt");
	if (crm_dmjdjl_zxzt!=null)
	{
		crm_dmjdjl_zxzt=cf.GB2Uni(crm_dmjdjl_zxzt);
		if (!(crm_dmjdjl_zxzt.equals("")))	wheresql+=" and  (crm_dmjdjl.zxzt='"+crm_dmjdjl_zxzt+"')";
	}

	ls_sql="SELECT a.dwmc ssfgs,b.dwmc zxdm,crm_dmjdjl.dmjdjlh, DECODE(crm_dmjdjl.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),crm_dmjdjl.khbh,crm_zxkhxx.khxm, DECODE(crm_zxkhxx.xb,'M','��','W','Ů'),crm_zxkhxx.fwdz,crm_zxkhxx.lrsj,crm_dmjdjl.kssj,crm_dmjdjl.kslrr,crm_dmjdjl.jssj,crm_dmjdjl.jslrr,dm_sbyybm.sbyymc,crm_dmjdjl.sbyyxs";
	ls_sql+=" FROM crm_dmjdjl,crm_zxkhxx,dm_sbyybm,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where crm_dmjdjl.sbyybm=dm_sbyybm.sbyybm(+) and crm_dmjdjl.khbh=crm_zxkhxx.khbh ";
    ls_sql+=" and crm_dmjdjl.ssfgs=a.dwbh and crm_dmjdjl.zxdm=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_dmjdjl.ssfgs,crm_dmjdjl.zxdm,crm_dmjdjl.dmjdjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_dmjdjlCxList.jsp","SelectCxCrm_dmjdjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_lrsj","dmjdjlh","crm_dmjdjl_khbh","crm_dmjdjl_ssfgs","sq_dwxx_dwmc","crm_dmjdjl_kssj","crm_dmjdjl_kslrr","crm_dmjdjl_jssj","crm_dmjdjl_jslrr","dm_sbyybm_sbyymc","crm_dmjdjl_sbyyxs","crm_dmjdjl_zxzt"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dmjdjlh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">����ӵ���¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�����ֹ�˾</td>
	<td  width="7%">��ѯ����</td>
	<td  width="6%">����ӵ���¼��</td>
	<td  width="6%">��ѯ״̬</td>
	<td  width="4%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="3%">�Ա�</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="5%">�״�����˾ʱ��</td>
	<td  width="5%">��ʼʱ��</td>
	<td  width="4%">��ʼ¼����</td>
	<td  width="5%">����ʱ��</td>
	<td  width="4%">����¼����</td>
	<td  width="7%">ʧ��ԭ��</td>
	<td  width="20%">ʧ��ԭ������</td>
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