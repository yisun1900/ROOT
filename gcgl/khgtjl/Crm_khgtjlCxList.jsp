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
	String crm_khgtjl_djbh=null;
	String crm_khgtjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khgtjl_gtr=null;
	String crm_khgtjl_gtsj=null;
	String crm_khgtjl_sfxcl=null;
	String crm_khgtjl_clr=null;
	String crm_khgtjl_clsj=null;
	String crm_khgtjl_lrr=null;
	String crm_khgtjl_lrsj=null;
	String crm_khgtjl_lrbm=null;
	crm_khgtjl_djbh=request.getParameter("crm_khgtjl_djbh");
	if (crm_khgtjl_djbh!=null)
	{
		crm_khgtjl_djbh=cf.GB2Uni(crm_khgtjl_djbh);
		if (!(crm_khgtjl_djbh.equals("")))	wheresql+=" and  (crm_khgtjl.djbh='"+crm_khgtjl_djbh+"')";
	}
	crm_khgtjl_khbh=request.getParameter("crm_khgtjl_khbh");
	if (crm_khgtjl_khbh!=null)
	{
		crm_khgtjl_khbh=cf.GB2Uni(crm_khgtjl_khbh);
		if (!(crm_khgtjl_khbh.equals("")))	wheresql+=" and  (crm_khgtjl.khbh='"+crm_khgtjl_khbh+"')";
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
	crm_khgtjl_gtr=request.getParameter("crm_khgtjl_gtr");
	if (crm_khgtjl_gtr!=null)
	{
		crm_khgtjl_gtr=cf.GB2Uni(crm_khgtjl_gtr);
		if (!(crm_khgtjl_gtr.equals("")))	wheresql+=" and  (crm_khgtjl.gtr='"+crm_khgtjl_gtr+"')";
	}
	crm_khgtjl_gtsj=request.getParameter("crm_khgtjl_gtsj");
	if (crm_khgtjl_gtsj!=null)
	{
		crm_khgtjl_gtsj=crm_khgtjl_gtsj.trim();
		if (!(crm_khgtjl_gtsj.equals("")))	wheresql+="  and (crm_khgtjl.gtsj>=TO_DATE('"+crm_khgtjl_gtsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_gtsj=request.getParameter("crm_khgtjl_gtsj2");
	if (crm_khgtjl_gtsj!=null)
	{
		crm_khgtjl_gtsj=crm_khgtjl_gtsj.trim();
		if (!(crm_khgtjl_gtsj.equals("")))	wheresql+="  and (crm_khgtjl.gtsj<=TO_DATE('"+crm_khgtjl_gtsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_sfxcl=request.getParameter("crm_khgtjl_sfxcl");
	if (crm_khgtjl_sfxcl!=null)
	{
		crm_khgtjl_sfxcl=cf.GB2Uni(crm_khgtjl_sfxcl);
		if (!(crm_khgtjl_sfxcl.equals("")))	wheresql+=" and  (crm_khgtjl.sfxcl='"+crm_khgtjl_sfxcl+"')";
	}
	crm_khgtjl_clr=request.getParameter("crm_khgtjl_clr");
	if (crm_khgtjl_clr!=null)
	{
		crm_khgtjl_clr=cf.GB2Uni(crm_khgtjl_clr);
		if (!(crm_khgtjl_clr.equals("")))	wheresql+=" and  (crm_khgtjl.clr='"+crm_khgtjl_clr+"')";
	}
	crm_khgtjl_clsj=request.getParameter("crm_khgtjl_clsj");
	if (crm_khgtjl_clsj!=null)
	{
		crm_khgtjl_clsj=crm_khgtjl_clsj.trim();
		if (!(crm_khgtjl_clsj.equals("")))	wheresql+="  and (crm_khgtjl.clsj>=TO_DATE('"+crm_khgtjl_clsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_clsj=request.getParameter("crm_khgtjl_clsj2");
	if (crm_khgtjl_clsj!=null)
	{
		crm_khgtjl_clsj=crm_khgtjl_clsj.trim();
		if (!(crm_khgtjl_clsj.equals("")))	wheresql+="  and (crm_khgtjl.clsj<=TO_DATE('"+crm_khgtjl_clsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_lrr=request.getParameter("crm_khgtjl_lrr");
	if (crm_khgtjl_lrr!=null)
	{
		crm_khgtjl_lrr=cf.GB2Uni(crm_khgtjl_lrr);
		if (!(crm_khgtjl_lrr.equals("")))	wheresql+=" and  (crm_khgtjl.lrr='"+crm_khgtjl_lrr+"')";
	}
	crm_khgtjl_lrsj=request.getParameter("crm_khgtjl_lrsj");
	if (crm_khgtjl_lrsj!=null)
	{
		crm_khgtjl_lrsj=crm_khgtjl_lrsj.trim();
		if (!(crm_khgtjl_lrsj.equals("")))	wheresql+="  and (crm_khgtjl.lrsj>=TO_DATE('"+crm_khgtjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_lrsj=request.getParameter("crm_khgtjl_lrsj2");
	if (crm_khgtjl_lrsj!=null)
	{
		crm_khgtjl_lrsj=crm_khgtjl_lrsj.trim();
		if (!(crm_khgtjl_lrsj.equals("")))	wheresql+="  and (crm_khgtjl.lrsj<=TO_DATE('"+crm_khgtjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_lrbm=request.getParameter("crm_khgtjl_lrbm");
	if (crm_khgtjl_lrbm!=null)
	{
		crm_khgtjl_lrbm=cf.GB2Uni(crm_khgtjl_lrbm);
		if (!(crm_khgtjl_lrbm.equals("")))	wheresql+=" and  (crm_khgtjl.lrbm='"+crm_khgtjl_lrbm+"')";
	}
	ls_sql="SELECT crm_khgtjl.djbh,DECODE(crm_khgtjl.sfxcl,'N','���账��','Y','�账��','M','�Ѵ���'),crm_khgtjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khgtjl.gtr,crm_khgtjl.gtsj,crm_khgtjl.qksm, crm_khgtjl.clr,crm_khgtjl.clsj,crm_khgtjl.clsm,crm_khgtjl.lrr,crm_khgtjl.lrsj,dwmc";
	ls_sql+=" FROM crm_khxx,crm_khgtjl,sq_dwxx  ";
    ls_sql+=" where crm_khgtjl.khbh=crm_khxx.khbh(+) and crm_khgtjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khgtjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"djbh","crm_khgtjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khgtjl_gtr","crm_khgtjl_gtsj","crm_khgtjl_qksm","crm_khgtjl_sfxcl","crm_khgtjl_clr","crm_khgtjl_clsj","crm_khgtjl_clsm","crm_khgtjl_lrr","crm_khgtjl_lrsj","crm_khgtjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);

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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�ǼǱ��</td>
	<td  width="4%">�Ƿ��账��</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">��ͨ��</td>
	<td  width="4%">��ͨʱ��</td>
	<td  width="23%">���˵��</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="21%">����˵��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
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