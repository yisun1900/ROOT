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
	String crm_scbkhxx_scbkhbh=null;
	String crm_scbkhxx_ywy=null;
	String crm_scbkhxx_ywyssxz=null;
	String crm_scbkhxx_zt=null;
	String crm_scbkhxx_sbyybm=null;
	String crm_scbkhxx_sbdjr=null;
	String crm_scbkhxx_sbdjsj=null;
	String crm_scbkhxx_lrr=null;
	String crm_scbkhxx_lrsj=null;
	String crm_scbkhxx_lrbm=null;
	String crm_scbkhxx_ssfgs=null;

	
	String crm_scbkhxx_yjr=null;
	String crm_scbkhxx_yjbm=null;
	String crm_scbkhxx_yjsj=null;
	crm_scbkhxx_yjr=request.getParameter("crm_scbkhxx_yjr");
	if (crm_scbkhxx_yjr!=null)
	{
		crm_scbkhxx_yjr=cf.GB2Uni(crm_scbkhxx_yjr);
		if (!(crm_scbkhxx_yjr.equals("")))	wheresql+=" and  (crm_scbkhxx.yjr='"+crm_scbkhxx_yjr+"')";
	}
	crm_scbkhxx_yjbm=request.getParameter("crm_scbkhxx_yjbm");
	if (crm_scbkhxx_yjbm!=null)
	{
		crm_scbkhxx_yjbm=cf.GB2Uni(crm_scbkhxx_yjbm);
		if (!(crm_scbkhxx_yjbm.equals("")))	wheresql+=" and  (crm_scbkhxx.yjbm='"+crm_scbkhxx_yjbm+"')";
	}
	crm_scbkhxx_yjsj=request.getParameter("crm_scbkhxx_yjsj");
	if (crm_scbkhxx_yjsj!=null)
	{
		crm_scbkhxx_yjsj=crm_scbkhxx_yjsj.trim();
		if (!(crm_scbkhxx_yjsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjsj>=TO_DATE('"+crm_scbkhxx_yjsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_yjsj=request.getParameter("crm_scbkhxx_yjsj2");
	if (crm_scbkhxx_yjsj!=null)
	{
		crm_scbkhxx_yjsj=crm_scbkhxx_yjsj.trim();
		if (!(crm_scbkhxx_yjsj.equals("")))	wheresql+="  and (crm_scbkhxx.yjsj<=TO_DATE('"+crm_scbkhxx_yjsj+"','YYYY/MM/DD'))";
	}
	
	
	
	crm_scbkhxx_scbkhbh=request.getParameter("crm_scbkhxx_scbkhbh");
	if (crm_scbkhxx_scbkhbh!=null)
	{
		crm_scbkhxx_scbkhbh=cf.GB2Uni(crm_scbkhxx_scbkhbh);
		if (!(crm_scbkhxx_scbkhbh.equals("")))	wheresql+=" and  (crm_scbkhxx.scbkhbh='"+crm_scbkhxx_scbkhbh+"')";
	}

	String crm_scbkhxx_khxm=null;
	String crm_scbkhxx_fwdz=null;
	String crm_scbkhxx_lxfs=null;
	crm_scbkhxx_khxm=request.getParameter("crm_scbkhxx_khxm");
	if (crm_scbkhxx_khxm!=null)
	{
		crm_scbkhxx_khxm=cf.GB2Uni(crm_scbkhxx_khxm);
		if (!(crm_scbkhxx_khxm.equals("")))	wheresql+=" and  (crm_scbkhxx.khxm='"+crm_scbkhxx_khxm+"')";
	}
	crm_scbkhxx_fwdz=request.getParameter("crm_scbkhxx_fwdz");
	if (crm_scbkhxx_fwdz!=null)
	{
		crm_scbkhxx_fwdz=cf.GB2Uni(crm_scbkhxx_fwdz);
		if (!(crm_scbkhxx_fwdz.equals("")))	wheresql+=" and  (crm_scbkhxx.fwdz='"+crm_scbkhxx_fwdz+"')";
	}
	crm_scbkhxx_lxfs=request.getParameter("crm_scbkhxx_lxfs");
	if (crm_scbkhxx_lxfs!=null)
	{
		crm_scbkhxx_lxfs=cf.GB2Uni(crm_scbkhxx_lxfs);
		if (!(crm_scbkhxx_lxfs.equals("")))	wheresql+=" and  (crm_scbkhxx.lxfs='"+crm_scbkhxx_lxfs+"')";
	}

	String crm_scbkhxx_khxm2=null;
	String crm_scbkhxx_fwdz2=null;
	String crm_scbkhxx_lxfs2=null;
	crm_scbkhxx_khxm2=request.getParameter("crm_scbkhxx_khxm2");
	if (crm_scbkhxx_khxm2!=null)
	{
		crm_scbkhxx_khxm2=cf.GB2Uni(crm_scbkhxx_khxm2);
		if (!(crm_scbkhxx_khxm2.equals("")))	wheresql+=" and  (crm_scbkhxx.khxm like '%"+crm_scbkhxx_khxm2+"%')";
	}
	crm_scbkhxx_fwdz2=request.getParameter("crm_scbkhxx_fwdz2");
	if (crm_scbkhxx_fwdz2!=null)
	{
		crm_scbkhxx_fwdz2=cf.GB2Uni(crm_scbkhxx_fwdz2);
		if (!(crm_scbkhxx_fwdz2.equals("")))	wheresql+=" and  (crm_scbkhxx.fwdz like '%"+crm_scbkhxx_fwdz2+"%')";
	}
	crm_scbkhxx_lxfs2=request.getParameter("crm_scbkhxx_lxfs2");
	if (crm_scbkhxx_lxfs2!=null)
	{
		crm_scbkhxx_lxfs2=cf.GB2Uni(crm_scbkhxx_lxfs2);
		if (!(crm_scbkhxx_lxfs2.equals("")))	wheresql+=" and  (crm_scbkhxx.lxfs like '%"+crm_scbkhxx_lxfs2+"%')";
	}


	crm_scbkhxx_ywy=request.getParameter("crm_scbkhxx_ywy");
	if (crm_scbkhxx_ywy!=null)
	{
		crm_scbkhxx_ywy=cf.GB2Uni(crm_scbkhxx_ywy);
		if (!(crm_scbkhxx_ywy.equals("")))	wheresql+=" and  (crm_scbkhxx.ywy='"+crm_scbkhxx_ywy+"')";
	}
	crm_scbkhxx_ywyssxz=request.getParameter("crm_scbkhxx_ywyssxz");
	if (crm_scbkhxx_ywyssxz!=null)
	{
		crm_scbkhxx_ywyssxz=cf.GB2Uni(crm_scbkhxx_ywyssxz);
		if (!(crm_scbkhxx_ywyssxz.equals("")))	wheresql+=" and  (crm_scbkhxx.ywyssxz='"+crm_scbkhxx_ywyssxz+"')";
	}
	crm_scbkhxx_zt=request.getParameter("crm_scbkhxx_zt");
	if (crm_scbkhxx_zt!=null)
	{
		crm_scbkhxx_zt=cf.GB2Uni(crm_scbkhxx_zt);
		if (!(crm_scbkhxx_zt.equals("")))	wheresql+=" and  (crm_scbkhxx.zt='"+crm_scbkhxx_zt+"')";
	}
	crm_scbkhxx_sbyybm=request.getParameter("crm_scbkhxx_sbyybm");
	if (crm_scbkhxx_sbyybm!=null)
	{
		crm_scbkhxx_sbyybm=cf.GB2Uni(crm_scbkhxx_sbyybm);
		if (!(crm_scbkhxx_sbyybm.equals("")))	wheresql+=" and  (crm_scbkhxx.sbyybm='"+crm_scbkhxx_sbyybm+"')";
	}
	crm_scbkhxx_sbdjr=request.getParameter("crm_scbkhxx_sbdjr");
	if (crm_scbkhxx_sbdjr!=null)
	{
		crm_scbkhxx_sbdjr=cf.GB2Uni(crm_scbkhxx_sbdjr);
		if (!(crm_scbkhxx_sbdjr.equals("")))	wheresql+=" and  (crm_scbkhxx.sbdjr='"+crm_scbkhxx_sbdjr+"')";
	}
	crm_scbkhxx_sbdjsj=request.getParameter("crm_scbkhxx_sbdjsj");
	if (crm_scbkhxx_sbdjsj!=null)
	{
		crm_scbkhxx_sbdjsj=crm_scbkhxx_sbdjsj.trim();
		if (!(crm_scbkhxx_sbdjsj.equals("")))	wheresql+="  and (crm_scbkhxx.sbdjsj>=TO_DATE('"+crm_scbkhxx_sbdjsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_sbdjsj=request.getParameter("crm_scbkhxx_sbdjsj2");
	if (crm_scbkhxx_sbdjsj!=null)
	{
		crm_scbkhxx_sbdjsj=crm_scbkhxx_sbdjsj.trim();
		if (!(crm_scbkhxx_sbdjsj.equals("")))	wheresql+="  and (crm_scbkhxx.sbdjsj<=TO_DATE('"+crm_scbkhxx_sbdjsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_lrr=request.getParameter("crm_scbkhxx_lrr");
	if (crm_scbkhxx_lrr!=null)
	{
		crm_scbkhxx_lrr=cf.GB2Uni(crm_scbkhxx_lrr);
		if (!(crm_scbkhxx_lrr.equals("")))	wheresql+=" and  (crm_scbkhxx.lrr='"+crm_scbkhxx_lrr+"')";
	}
	crm_scbkhxx_lrsj=request.getParameter("crm_scbkhxx_lrsj");
	if (crm_scbkhxx_lrsj!=null)
	{
		crm_scbkhxx_lrsj=crm_scbkhxx_lrsj.trim();
		if (!(crm_scbkhxx_lrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj>=TO_DATE('"+crm_scbkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_lrsj=request.getParameter("crm_scbkhxx_lrsj2");
	if (crm_scbkhxx_lrsj!=null)
	{
		crm_scbkhxx_lrsj=crm_scbkhxx_lrsj.trim();
		if (!(crm_scbkhxx_lrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj<=TO_DATE('"+crm_scbkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_scbkhxx_lrbm=request.getParameter("crm_scbkhxx_lrbm");
	if (crm_scbkhxx_lrbm!=null)
	{
		crm_scbkhxx_lrbm=cf.GB2Uni(crm_scbkhxx_lrbm);
		if (!(crm_scbkhxx_lrbm.equals("")))	wheresql+=" and  (crm_scbkhxx.lrbm='"+crm_scbkhxx_lrbm+"')";
	}
	crm_scbkhxx_ssfgs=request.getParameter("crm_scbkhxx_ssfgs");
	if (crm_scbkhxx_ssfgs!=null)
	{
		crm_scbkhxx_ssfgs=cf.GB2Uni(crm_scbkhxx_ssfgs);
		if (!(crm_scbkhxx_ssfgs.equals("")))	wheresql+=" and  (crm_scbkhxx.ssfgs='"+crm_scbkhxx_ssfgs+"')";
	}

	ls_sql="SELECT crm_scbkhxx.scbkhbh,crm_scbkhxx.khxm,crm_scbkhxx.fwdz,crm_scbkhxx.khbh,crm_scbkhxx.jsr,crm_scbkhxx.jssj,crm_scbkhxx.yjr,crm_scbkhxx.yjsj,c.dwmc yjbm,crm_scbkhxx.yjsm,crm_scbkhxx.ywy,crm_scbkhxx.ywyssxz, DECODE(crm_scbkhxx.zt,'1','����','2','ʧ��','3','�ƽ�','4','�ѽ���'),sbyymc,crm_scbkhxx.sbyysm,crm_scbkhxx.sbdjr,crm_scbkhxx.sbdjsj,crm_scbkhxx.lrr,crm_scbkhxx.lrsj,b.dwmc lrbm,a.dwmc ssfgs,crm_scbkhxx.bz  ";
	ls_sql+=" FROM crm_scbkhxx,sq_dwxx a,sq_dwxx b,sq_dwxx c,dm_sbyybm  ";
    ls_sql+=" where crm_scbkhxx.ssfgs=a.dwbh(+) and crm_scbkhxx.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_scbkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
    ls_sql+=" and crm_scbkhxx.yjbm=c.dwbh(+)";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_scbkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_scbkhxx.yjbm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_scbkhxx.yjsj desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Crm_scbkhxxXgJsList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"scbkhbh","crm_scbkhxx_khxm","crm_scbkhxx_fwdz","crm_scbkhxx_lxfs","crm_scbkhxx_ywy","crm_scbkhxx_ywyssxz","crm_scbkhxx_zt","crm_scbkhxx_sbyybm","crm_scbkhxx_sbyysm","crm_scbkhxx_sbdjr","crm_scbkhxx_sbdjsj","crm_scbkhxx_lrr","crm_scbkhxx_lrsj","crm_scbkhxx_lrbm","sq_dwxx_dwmc","crm_scbkhxx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"scbkhbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJsCrm_scbkhxx.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<noscript><iframe scr="*.htm"></iframe></noscript>
<CENTER >
  <B><font size="3">�г����ͻ���ɾ������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">�г����ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="3%">�ͻ����</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="2%">�ƽ���</td>
	<td  width="3%">�ƽ�ʱ��</td>
	<td  width="4%">�ƽ�����</td>
	<td  width="13%">�ƽ�˵��</td>
	<td  width="3%">ҵ��Ա</td>
	<td  width="4%">����С��</td>
	<td  width="2%">״̬</td>
	<td  width="6%">ʧ��ԭ��</td>
	<td  width="9%">ʧ��ԭ��˵��</td>
	<td  width="2%">ʧ�ܵǼ���</td>
	<td  width="3%">ʧ�ܵǼ�ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="10%">��ע</td>
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