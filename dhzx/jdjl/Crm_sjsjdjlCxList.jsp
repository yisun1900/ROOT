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
	String crm_sjsjdjl_sjsjdjlh=null;
	String crm_sjsjdjl_khbh=null;
	String crm_zxkhxx_khxm=null;
	String crm_zxkhxx_xb=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_lxfs=null;
	String crm_zxkhxx_lrsj=null;
	String crm_sjsjdjl_ssfgs=null;
	String crm_sjsjdjl_zxdm=null;
	String crm_sjsjdjl_sjs=null;
	String crm_sjsjdjl_kssj=null;
	String crm_sjsjdjl_kslrr=null;
	String crm_sjsjdjl_jssj=null;
	String crm_sjsjdjl_jslrr=null;
	String crm_sjsjdjl_sbyybm=null;
	String crm_sjsjdjl_zxzt=null;
	crm_sjsjdjl_sjsjdjlh=request.getParameter("crm_sjsjdjl_sjsjdjlh");
	if (crm_sjsjdjl_sjsjdjlh!=null)
	{
		crm_sjsjdjl_sjsjdjlh=cf.GB2Uni(crm_sjsjdjl_sjsjdjlh);
		if (!(crm_sjsjdjl_sjsjdjlh.equals("")))	wheresql+=" and  (crm_sjsjdjl.sjsjdjlh='"+crm_sjsjdjl_sjsjdjlh+"')";
	}
	crm_sjsjdjl_khbh=request.getParameter("crm_sjsjdjl_khbh");
	if (crm_sjsjdjl_khbh!=null)
	{
		crm_sjsjdjl_khbh=cf.GB2Uni(crm_sjsjdjl_khbh);
		if (!(crm_sjsjdjl_khbh.equals("")))	wheresql+=" and  (crm_sjsjdjl.khbh='"+crm_sjsjdjl_khbh+"')";
	}
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
	crm_sjsjdjl_ssfgs=request.getParameter("crm_sjsjdjl_ssfgs");
	if (crm_sjsjdjl_ssfgs!=null)
	{
		crm_sjsjdjl_ssfgs=cf.GB2Uni(crm_sjsjdjl_ssfgs);
		if (!(crm_sjsjdjl_ssfgs.equals("")))	wheresql+=" and  (crm_sjsjdjl.ssfgs='"+crm_sjsjdjl_ssfgs+"')";
	}
	crm_sjsjdjl_zxdm=request.getParameter("crm_sjsjdjl_zxdm");
	if (crm_sjsjdjl_zxdm!=null)
	{
		crm_sjsjdjl_zxdm=cf.GB2Uni(crm_sjsjdjl_zxdm);
		if (!(crm_sjsjdjl_zxdm.equals("")))	wheresql+=" and  (crm_sjsjdjl.zxdm='"+crm_sjsjdjl_zxdm+"')";
	}
	crm_sjsjdjl_sjs=request.getParameter("crm_sjsjdjl_sjs");
	if (crm_sjsjdjl_sjs!=null)
	{
		crm_sjsjdjl_sjs=cf.GB2Uni(crm_sjsjdjl_sjs);
		if (!(crm_sjsjdjl_sjs.equals("")))	wheresql+=" and  (crm_sjsjdjl.sjs='"+crm_sjsjdjl_sjs+"')";
	}
	crm_sjsjdjl_kssj=request.getParameter("crm_sjsjdjl_kssj");
	if (crm_sjsjdjl_kssj!=null)
	{
		crm_sjsjdjl_kssj=crm_sjsjdjl_kssj.trim();
		if (!(crm_sjsjdjl_kssj.equals("")))	wheresql+="  and (crm_sjsjdjl.kssj>=TO_DATE('"+crm_sjsjdjl_kssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_kssj=request.getParameter("crm_sjsjdjl_kssj2");
	if (crm_sjsjdjl_kssj!=null)
	{
		crm_sjsjdjl_kssj=crm_sjsjdjl_kssj.trim();
		if (!(crm_sjsjdjl_kssj.equals("")))	wheresql+="  and (crm_sjsjdjl.kssj<=TO_DATE('"+crm_sjsjdjl_kssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_kslrr=request.getParameter("crm_sjsjdjl_kslrr");
	if (crm_sjsjdjl_kslrr!=null)
	{
		crm_sjsjdjl_kslrr=cf.GB2Uni(crm_sjsjdjl_kslrr);
		if (!(crm_sjsjdjl_kslrr.equals("")))	wheresql+=" and  (crm_sjsjdjl.kslrr='"+crm_sjsjdjl_kslrr+"')";
	}
	crm_sjsjdjl_jssj=request.getParameter("crm_sjsjdjl_jssj");
	if (crm_sjsjdjl_jssj!=null)
	{
		crm_sjsjdjl_jssj=crm_sjsjdjl_jssj.trim();
		if (!(crm_sjsjdjl_jssj.equals("")))	wheresql+="  and (crm_sjsjdjl.jssj>=TO_DATE('"+crm_sjsjdjl_jssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_jssj=request.getParameter("crm_sjsjdjl_jssj2");
	if (crm_sjsjdjl_jssj!=null)
	{
		crm_sjsjdjl_jssj=crm_sjsjdjl_jssj.trim();
		if (!(crm_sjsjdjl_jssj.equals("")))	wheresql+="  and (crm_sjsjdjl.jssj<=TO_DATE('"+crm_sjsjdjl_jssj+"','YYYY/MM/DD'))";
	}
	crm_sjsjdjl_jslrr=request.getParameter("crm_sjsjdjl_jslrr");
	if (crm_sjsjdjl_jslrr!=null)
	{
		crm_sjsjdjl_jslrr=cf.GB2Uni(crm_sjsjdjl_jslrr);
		if (!(crm_sjsjdjl_jslrr.equals("")))	wheresql+=" and  (crm_sjsjdjl.jslrr='"+crm_sjsjdjl_jslrr+"')";
	}
	crm_sjsjdjl_sbyybm=request.getParameter("crm_sjsjdjl_sbyybm");
	if (crm_sjsjdjl_sbyybm!=null)
	{
		crm_sjsjdjl_sbyybm=cf.GB2Uni(crm_sjsjdjl_sbyybm);
		if (!(crm_sjsjdjl_sbyybm.equals("")))	wheresql+=" and  (crm_sjsjdjl.sbyybm='"+crm_sjsjdjl_sbyybm+"')";
	}
	crm_sjsjdjl_zxzt=request.getParameter("crm_sjsjdjl_zxzt");
	if (crm_sjsjdjl_zxzt!=null)
	{
		crm_sjsjdjl_zxzt=cf.GB2Uni(crm_sjsjdjl_zxzt);
		if (!(crm_sjsjdjl_zxzt.equals("")))	wheresql+=" and  (crm_sjsjdjl.zxzt='"+crm_sjsjdjl_zxzt+"')";
	}
	ls_sql="SELECT a.dwmc ssfgs,b.dwmc zxdm,crm_sjsjdjl.sjs,crm_sjsjdjl.sjsjdjlh,DECODE(crm_sjsjdjl.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') ,crm_sjsjdjl.khbh,crm_zxkhxx.khxm, DECODE(crm_zxkhxx.xb,'M','��','W','Ů'),crm_zxkhxx.fwdz,crm_zxkhxx.lrsj,crm_sjsjdjl.kssj,crm_sjsjdjl.kslrr,crm_sjsjdjl.jssj,crm_sjsjdjl.jslrr,dm_sbyybm.sbyymc,crm_sjsjdjl.sbyyxs";
	ls_sql+=" FROM dm_sbyybm,sq_dwxx a,sq_dwxx b,crm_zxkhxx,crm_sjsjdjl  ";
    ls_sql+=" where crm_sjsjdjl.sbyybm=dm_sbyybm.sbyybm(+) and crm_sjsjdjl.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_sjsjdjl.ssfgs=a.dwbh and crm_sjsjdjl.zxdm=b.dwbh";
    ls_sql+=" and (crm_sjsjdjl.zt='1' or crm_sjsjdjl.zt is null)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_sjsjdjl.ssfgs,crm_sjsjdjl.zxdm,crm_sjsjdjl.sjs,crm_sjsjdjl.sjsjdjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_sjsjdjlCxList.jsp","SelectCxCrm_sjsjdjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sjsjdjlh","crm_sjsjdjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_lrsj","crm_sjsjdjl_ssfgs","sq_dwxx_dwmc","crm_sjsjdjl_sjs","crm_sjsjdjl_kssj","crm_sjsjdjl_kslrr","crm_sjsjdjl_jssj","crm_sjsjdjl_jslrr","dm_sbyybm_sbyymc","crm_sjsjdjl_sbyyxs","crm_sjsjdjl_zxzt"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sjsjdjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"֪ͨ"};//��ť����ʾ����
	String[] buttonLink={"SaveTz.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">���ʦ�ӵ���¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">�����ֹ�˾</td>
	<td  width="7%">��ѯ����</td>
	<td  width="4%">���ʦ</td>
	<td  width="5%">���ʦ�ӵ���¼��</td>
	<td  width="6%">��ѯ״̬</td>
	<td  width="4%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="3%">�Ա�</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="5%">�״�����˾ʱ��</td>
	<td  width="4%">��ʼ¼����</td>
	<td  width="5%">����ʱ��</td>
	<td  width="4%">����¼����</td>
	<td  width="7%">ʧ��ԭ��</td>
	<td  width="15%">ʧ��ԭ������</td>
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