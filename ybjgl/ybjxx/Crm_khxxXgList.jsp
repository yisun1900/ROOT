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
	String crm_khxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_xb=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hxbm=null;
	String crm_khxx_fgflbm=null;
	String crm_khxx_zxjwbm=null;
	String crm_khxx_hxmjbm=null;
	String crm_khxx_ysbm=null;
	String czbm=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sbrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_ybjyxq=null;
	String crm_khxx_ybjdjsj=null;
	String fgs=null;

	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";


	crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
	if (crm_khxx_khbh!=null)
	{
		crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
		if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_xb=request.getParameter("crm_khxx_xb");
	if (crm_khxx_xb!=null)
	{
		crm_khxx_xb=cf.GB2Uni(crm_khxx_xb);
		if (!(crm_khxx_xb.equals("")))	wheresql+=" and  (crm_khxx.xb='"+crm_khxx_xb+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_hxbm=request.getParameter("crm_khxx_hxbm");
	if (crm_khxx_hxbm!=null)
	{
		crm_khxx_hxbm=cf.GB2Uni(crm_khxx_hxbm);
		if (!(crm_khxx_hxbm.equals("")))	wheresql+=" and  (crm_khxx.hxbm='"+crm_khxx_hxbm+"')";
	}
	crm_khxx_fgflbm=request.getParameter("crm_khxx_fgflbm");
	if (crm_khxx_fgflbm!=null)
	{
		crm_khxx_fgflbm=cf.GB2Uni(crm_khxx_fgflbm);
		if (!(crm_khxx_fgflbm.equals("")))	wheresql+=" and  (crm_khxx.fgflbm='"+crm_khxx_fgflbm+"')";
	}
	crm_khxx_zxjwbm=request.getParameter("crm_khxx_zxjwbm");
	if (crm_khxx_zxjwbm!=null)
	{
		crm_khxx_zxjwbm=cf.GB2Uni(crm_khxx_zxjwbm);
		if (!(crm_khxx_zxjwbm.equals("")))	wheresql+=" and  (crm_khxx.zxjwbm='"+crm_khxx_zxjwbm+"')";
	}
	crm_khxx_hxmjbm=request.getParameter("crm_khxx_hxmjbm");
	if (crm_khxx_hxmjbm!=null)
	{
		crm_khxx_hxmjbm=cf.GB2Uni(crm_khxx_hxmjbm);
		if (!(crm_khxx_hxmjbm.equals("")))	wheresql+=" and  (crm_khxx.hxmjbm='"+crm_khxx_hxmjbm+"')";
	}
	crm_khxx_ysbm=request.getParameter("crm_khxx_ysbm");
	if (crm_khxx_ysbm!=null)
	{
		crm_khxx_ysbm=cf.GB2Uni(crm_khxx_ysbm);
		if (!(crm_khxx_ysbm.equals("")))	wheresql+=" and  (crm_khxx.ysbm='"+crm_khxx_ysbm+"')";
	}
	czbm=request.getParameter("czbm");
	if (czbm!=null)
	{
		czbm=cf.GB2Uni(czbm);
		if (!(czbm.equals("")))	wheresql+=" and  (crm_khxx.czbm='"+czbm+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sbrq=request.getParameter("crm_khxx_sbrq");
	if (crm_khxx_sbrq!=null)
	{
		crm_khxx_sbrq=crm_khxx_sbrq.trim();
		if (!(crm_khxx_sbrq.equals("")))	wheresql+="  and (crm_khxx.sbrq>=TO_DATE('"+crm_khxx_sbrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sbrq=request.getParameter("crm_khxx_sbrq2");
	if (crm_khxx_sbrq!=null)
	{
		crm_khxx_sbrq=crm_khxx_sbrq.trim();
		if (!(crm_khxx_sbrq.equals("")))	wheresql+="  and (crm_khxx.sbrq<=TO_DATE('"+crm_khxx_sbrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_ybjyxq=request.getParameter("crm_khxx_ybjyxq");
	if (crm_khxx_ybjyxq!=null)
	{
		crm_khxx_ybjyxq=crm_khxx_ybjyxq.trim();
		if (!(crm_khxx_ybjyxq.equals("")))	wheresql+="  and (crm_khxx.ybjyxq>=TO_DATE('"+crm_khxx_ybjyxq+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjyxq=request.getParameter("crm_khxx_ybjyxq2");
	if (crm_khxx_ybjyxq!=null)
	{
		crm_khxx_ybjyxq=crm_khxx_ybjyxq.trim();
		if (!(crm_khxx_ybjyxq.equals("")))	wheresql+="  and (crm_khxx.ybjyxq<=TO_DATE('"+crm_khxx_ybjyxq+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjdjsj=request.getParameter("crm_khxx_ybjdjsj");
	if (crm_khxx_ybjdjsj!=null)
	{
		crm_khxx_ybjdjsj=crm_khxx_ybjdjsj.trim();
		if (!(crm_khxx_ybjdjsj.equals("")))	wheresql+="  and (crm_khxx.ybjdjsj>=TO_DATE('"+crm_khxx_ybjdjsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_ybjdjsj=request.getParameter("crm_khxx_ybjdjsj2");
	if (crm_khxx_ybjdjsj!=null)
	{
		crm_khxx_ybjdjsj=crm_khxx_ybjdjsj.trim();
		if (!(crm_khxx_ybjdjsj.equals("")))	wheresql+="  and (crm_khxx.ybjdjsj<=TO_DATE('"+crm_khxx_ybjdjsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT khbh,khxm,fwdz,sjs,sgdmc sgd,a.dwmc sbdm,ybjdjsj,ybjyxq,czmc,fgflmc,zxjwmc,hxmjmc,ysmc ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a ,sq_sgd,dm_fgflbm,dm_zxjwbm,dm_hxmjbm,dm_ysbm,dm_czbm ";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and zt='2'";
	ls_sql+=" and crm_khxx.fgflbm=dm_fgflbm.fgflbm(+) and crm_khxx.zxjwbm=dm_zxjwbm.zxjwbm(+)";
	ls_sql+=" and crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm(+) and crm_khxx.ysbm=dm_ysbm.ysbm(+)";
	ls_sql+=" and crm_khxx.ybjbz='Y' and crm_khxx.czbm=dm_czbm.czbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by ybjdjsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxXgList.jsp","SelectXgCrm_khxx.jsp","","XgCrm_khxx.jsp");
	pageObj.setPageRow(20);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_xb","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_ybjbz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�ͻ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">ʩ����</td>
	<td  width="9%">ǩԼ����</td>
	<td  width="7%">����ʱ��</td>
	<td  width="7%">�������Ч��</td>
	<td  width="7%">����</td>
	<td  width="7%">���</td>
	<td  width="7%">��λ</td>
	<td  width="7%">���</td>
	<td  width="7%">��ɫ</td>
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