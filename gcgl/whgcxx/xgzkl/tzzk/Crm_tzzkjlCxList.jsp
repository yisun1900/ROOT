<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
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

	String crm_zxkhxx_zxdm=null;
	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";

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

	String crm_zxkhxx_khxm=null;
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	String crm_zxkhxx_khxm2=null;
	crm_zxkhxx_khxm2=request.getParameter("crm_zxkhxx_khxm2");
	if (crm_zxkhxx_khxm2!=null)
	{
		crm_zxkhxx_khxm2=cf.GB2Uni(crm_zxkhxx_khxm2);
		if (!(crm_zxkhxx_khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm2+"%')";
	}
	
	String crm_zxkhxx_fwdz=null;
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+crm_zxkhxx_fwdz+"')";
	}
	String crm_zxkhxx_fwdz2=null;
	crm_zxkhxx_fwdz2=request.getParameter("crm_zxkhxx_fwdz2");
	if (crm_zxkhxx_fwdz2!=null)
	{
		crm_zxkhxx_fwdz2=cf.GB2Uni(crm_zxkhxx_fwdz2);
		if (!(crm_zxkhxx_fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz2+"%')";
	}
	String crm_zxkhxx_lxfs=null;
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	String crm_zxkhxx_lxfs2=null;
	crm_zxkhxx_lxfs2=request.getParameter("crm_zxkhxx_lxfs2");
	if (crm_zxkhxx_lxfs2!=null)
	{
		crm_zxkhxx_lxfs2=cf.GB2Uni(crm_zxkhxx_lxfs2);
		if (!(crm_zxkhxx_lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+crm_zxkhxx_lxfs2+"%')";
	}

	String crm_zxkhxx_khbh=null;
	
	crm_zxkhxx_khbh=request.getParameter("crm_zxkhxx_khbh");
	if (crm_zxkhxx_khbh!=null)
	{
		crm_zxkhxx_khbh=cf.GB2Uni(crm_zxkhxx_khbh);
		if (!(crm_zxkhxx_khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+crm_zxkhxx_khbh+"')";
	}

	
	String crm_tzzkjl_clzt=null;
	String crm_tzzkjl_lrr=null;
	String crm_tzzkjl_lrsj=null;
	String crm_tzzkjl_lrbm=null;
	String crm_tzzkjl_tzjlh=null;
	String crm_tzzkjl_zklx=null;
	String crm_tzzkjl_zjxzklx=null;
	String crm_tzzkjl_bfxmdldz=null;
	String crm_tzzkjl_spsj=null;

	crm_tzzkjl_clzt=request.getParameter("crm_tzzkjl_clzt");
	if (crm_tzzkjl_clzt!=null)
	{
		crm_tzzkjl_clzt=cf.GB2Uni(crm_tzzkjl_clzt);
		if (!(crm_tzzkjl_clzt.equals("")))	wheresql+=" and  (crm_tzzkjl.clzt='"+crm_tzzkjl_clzt+"')";
	}
	crm_tzzkjl_lrr=request.getParameter("crm_tzzkjl_lrr");
	if (crm_tzzkjl_lrr!=null)
	{
		crm_tzzkjl_lrr=cf.GB2Uni(crm_tzzkjl_lrr);
		if (!(crm_tzzkjl_lrr.equals("")))	wheresql+=" and  (crm_tzzkjl.lrr='"+crm_tzzkjl_lrr+"')";
	}
	crm_tzzkjl_lrsj=request.getParameter("crm_tzzkjl_lrsj");
	if (crm_tzzkjl_lrsj!=null)
	{
		crm_tzzkjl_lrsj=crm_tzzkjl_lrsj.trim();
		if (!(crm_tzzkjl_lrsj.equals("")))	wheresql+="  and (crm_tzzkjl.lrsj>=TO_DATE('"+crm_tzzkjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tzzkjl_lrsj=request.getParameter("crm_tzzkjl_lrsj2");
	if (crm_tzzkjl_lrsj!=null)
	{
		crm_tzzkjl_lrsj=crm_tzzkjl_lrsj.trim();
		if (!(crm_tzzkjl_lrsj.equals("")))	wheresql+="  and (crm_tzzkjl.lrsj<=TO_DATE('"+crm_tzzkjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tzzkjl_lrbm=request.getParameter("crm_tzzkjl_lrbm");
	if (crm_tzzkjl_lrbm!=null)
	{
		crm_tzzkjl_lrbm=cf.GB2Uni(crm_tzzkjl_lrbm);
		if (!(crm_tzzkjl_lrbm.equals("")))	wheresql+=" and  (crm_tzzkjl.lrbm='"+crm_tzzkjl_lrbm+"')";
	}
	crm_tzzkjl_tzjlh=request.getParameter("crm_tzzkjl_tzjlh");
	if (crm_tzzkjl_tzjlh!=null)
	{
		crm_tzzkjl_tzjlh=cf.GB2Uni(crm_tzzkjl_tzjlh);
		if (!(crm_tzzkjl_tzjlh.equals("")))	wheresql+=" and  (crm_tzzkjl.tzjlh='"+crm_tzzkjl_tzjlh+"')";
	}
	crm_tzzkjl_zklx=request.getParameter("crm_tzzkjl_zklx");
	if (crm_tzzkjl_zklx!=null)
	{
		crm_tzzkjl_zklx=cf.GB2Uni(crm_tzzkjl_zklx);
		if (!(crm_tzzkjl_zklx.equals("")))	wheresql+=" and  (crm_tzzkjl.zklx='"+crm_tzzkjl_zklx+"')";
	}
	crm_tzzkjl_zjxzklx=request.getParameter("crm_tzzkjl_zjxzklx");
	if (crm_tzzkjl_zjxzklx!=null)
	{
		crm_tzzkjl_zjxzklx=cf.GB2Uni(crm_tzzkjl_zjxzklx);
		if (!(crm_tzzkjl_zjxzklx.equals("")))	wheresql+=" and  (crm_tzzkjl.zjxzklx='"+crm_tzzkjl_zjxzklx+"')";
	}
	crm_tzzkjl_bfxmdldz=request.getParameter("crm_tzzkjl_bfxmdldz");
	if (crm_tzzkjl_bfxmdldz!=null)
	{
		crm_tzzkjl_bfxmdldz=cf.GB2Uni(crm_tzzkjl_bfxmdldz);
		if (!(crm_tzzkjl_bfxmdldz.equals("")))	wheresql+=" and  (crm_tzzkjl.bfxmdldz='"+crm_tzzkjl_bfxmdldz+"')";
	}
	crm_tzzkjl_spsj=request.getParameter("crm_tzzkjl_spsj");
	if (crm_tzzkjl_spsj!=null)
	{
		crm_tzzkjl_spsj=crm_tzzkjl_spsj.trim();
		if (!(crm_tzzkjl_spsj.equals("")))	wheresql+="  and (crm_tzzkjl.spsj>=TO_DATE('"+crm_tzzkjl_spsj+"','YYYY/MM/DD'))";
	}
	crm_tzzkjl_spsj=request.getParameter("crm_tzzkjl_spsj2");
	if (crm_tzzkjl_spsj!=null)
	{
		crm_tzzkjl_spsj=crm_tzzkjl_spsj.trim();
		if (!(crm_tzzkjl_spsj.equals("")))	wheresql+="  and (crm_tzzkjl.spsj<=TO_DATE('"+crm_tzzkjl_spsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_tzzkjl.tzjlh, DECODE(crm_tzzkjl.clzt,'1','δ���','2','ֱ���޸��ۿ۳ɹ�','3','������','4','����ͨ���Ѹ��ۿ�','5','����δͨ��'),crm_tzzkjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs, DECODE(crm_tzzkjl.zklx,'1','��������','2','�������','3','���ַ��ô���'),crm_tzzkjl.zdzk,crm_tzzkjl.gcfqdzk,crm_tzzkjl.glfzk,crm_tzzkjl.sjzk,crm_tzzkjl.sjfzk,crm_tzzkjl.qtsfxmzk, DECODE(crm_tzzkjl.zjxzklx,'1','ͬ��ͬ','2','�����ۿ�'), DECODE(crm_tzzkjl.bfxmdldz,'Y','��','N','��'),crm_tzzkjl.hdzsjz,crm_tzzkjl.djjbfb,crm_tzzkjl.djjje,crm_tzzkjl.spsj,crm_tzzkjl.tzyy,crm_tzzkjl.spr,crm_tzzkjl.spsm,crm_tzzkjl.lrr,crm_tzzkjl.lrsj,dwmc  ";
	ls_sql+=" FROM crm_tzzkjl,crm_zxkhxx,sq_dwxx  ";
    ls_sql+=" where crm_tzzkjl.khbh=crm_zxkhxx.khbh and crm_tzzkjl.lrbm=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tzzkjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tzzkjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"crm_tzzkjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_sjs","crm_tzzkjl_tzyy","crm_tzzkjl_clzt","crm_tzzkjl_lrr","crm_tzzkjl_lrsj","crm_tzzkjl_lrbm","crm_tzzkjl_gcfqdzk","crm_tzzkjl_glfzk","crm_tzzkjl_sjzk","crm_tzzkjl_sjfzk","crm_tzzkjl_tzhmll","crm_tzzkjl_spr","crm_tzzkjl_spsm","tzjlh","crm_tzzkjl_zklx","crm_tzzkjl_zdzk","crm_tzzkjl_qtsfxmzk","crm_tzzkjl_zjxzklx","crm_tzzkjl_bfxmdldz","crm_tzzkjl_hdzsjz","crm_tzzkjl_djjbfb","crm_tzzkjl_djjje","crm_tzzkjl_spsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tzjlh"};
	pageObj.setKey(keyName);


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
  <B><font size="3">��ѯ�����ۿۼ�¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">������¼��</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>

	<td  width="3%">�ۿ�����</td>
	<td  width="2%">�����ۿ�</td>
	<td  width="2%">���̷��ۿ�</td>
	<td  width="2%">������ۿ�</td>
	<td  width="2%">˰���ۿ�</td>
	<td  width="2%">��Ʒ��ۿ�</td>
	<td  width="3%">�����շ���Ŀ�ۿ�</td>

	<td  width="3%">�������ۿ�����</td>
	<td  width="3%">������Ŀ��������</td>
	<td  width="3%">���;�ֵ</td>
	<td  width="3%">����ȯ�ٷֱ�</td>
	<td  width="3%">����ȯ���</td>
	<td  width="3%">����ʱ��</td>
	<td  width="18%">����ԭ��</td>
	<td  width="2%">������</td>
	<td  width="15%">����˵��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
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