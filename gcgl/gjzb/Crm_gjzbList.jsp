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
	String crm_gjzb_djbh=null;
	String crm_gjzb_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_gjzb_bgr=null;
	String crm_gjzb_bgqssj=null;
	String crm_gjzb_bgjzsj=null;
	String crm_gjzb_sybz=null;
	String crm_gjzb_syr=null;
	String crm_gjzb_sysj=null;
	String crm_gjzb_lrr=null;
	String crm_gjzb_lrsj=null;
	String crm_gjzb_lrbm=null;
	crm_gjzb_djbh=request.getParameter("crm_gjzb_djbh");
	if (crm_gjzb_djbh!=null)
	{
		crm_gjzb_djbh=cf.GB2Uni(crm_gjzb_djbh);
		if (!(crm_gjzb_djbh.equals("")))	wheresql+=" and  (crm_gjzb.djbh='"+crm_gjzb_djbh+"')";
	}
	crm_gjzb_khbh=request.getParameter("crm_gjzb_khbh");
	if (crm_gjzb_khbh!=null)
	{
		crm_gjzb_khbh=cf.GB2Uni(crm_gjzb_khbh);
		if (!(crm_gjzb_khbh.equals("")))	wheresql+=" and  (crm_gjzb.khbh='"+crm_gjzb_khbh+"')";
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
	crm_gjzb_bgr=request.getParameter("crm_gjzb_bgr");
	if (crm_gjzb_bgr!=null)
	{
		crm_gjzb_bgr=cf.GB2Uni(crm_gjzb_bgr);
		if (!(crm_gjzb_bgr.equals("")))	wheresql+=" and  (crm_gjzb.bgr='"+crm_gjzb_bgr+"')";
	}
	crm_gjzb_bgqssj=request.getParameter("crm_gjzb_bgqssj");
	if (crm_gjzb_bgqssj!=null)
	{
		crm_gjzb_bgqssj=crm_gjzb_bgqssj.trim();
		if (!(crm_gjzb_bgqssj.equals("")))	wheresql+="  and (crm_gjzb.bgqssj>=TO_DATE('"+crm_gjzb_bgqssj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_bgqssj=request.getParameter("crm_gjzb_bgqssj2");
	if (crm_gjzb_bgqssj!=null)
	{
		crm_gjzb_bgqssj=crm_gjzb_bgqssj.trim();
		if (!(crm_gjzb_bgqssj.equals("")))	wheresql+="  and (crm_gjzb.bgqssj<=TO_DATE('"+crm_gjzb_bgqssj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_bgjzsj=request.getParameter("crm_gjzb_bgjzsj");
	if (crm_gjzb_bgjzsj!=null)
	{
		crm_gjzb_bgjzsj=crm_gjzb_bgjzsj.trim();
		if (!(crm_gjzb_bgjzsj.equals("")))	wheresql+="  and (crm_gjzb.bgjzsj>=TO_DATE('"+crm_gjzb_bgjzsj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_bgjzsj=request.getParameter("crm_gjzb_bgjzsj2");
	if (crm_gjzb_bgjzsj!=null)
	{
		crm_gjzb_bgjzsj=crm_gjzb_bgjzsj.trim();
		if (!(crm_gjzb_bgjzsj.equals("")))	wheresql+="  and (crm_gjzb.bgjzsj<=TO_DATE('"+crm_gjzb_bgjzsj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_sybz=request.getParameter("crm_gjzb_sybz");
	if (crm_gjzb_sybz!=null)
	{
		crm_gjzb_sybz=cf.GB2Uni(crm_gjzb_sybz);
		if (!(crm_gjzb_sybz.equals("")))	wheresql+=" and  (crm_gjzb.sybz='"+crm_gjzb_sybz+"')";
	}
	crm_gjzb_syr=request.getParameter("crm_gjzb_syr");
	if (crm_gjzb_syr!=null)
	{
		crm_gjzb_syr=cf.GB2Uni(crm_gjzb_syr);
		if (!(crm_gjzb_syr.equals("")))	wheresql+=" and  (crm_gjzb.syr='"+crm_gjzb_syr+"')";
	}
	crm_gjzb_sysj=request.getParameter("crm_gjzb_sysj");
	if (crm_gjzb_sysj!=null)
	{
		crm_gjzb_sysj=crm_gjzb_sysj.trim();
		if (!(crm_gjzb_sysj.equals("")))	wheresql+="  and (crm_gjzb.sysj>=TO_DATE('"+crm_gjzb_sysj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_sysj=request.getParameter("crm_gjzb_sysj2");
	if (crm_gjzb_sysj!=null)
	{
		crm_gjzb_sysj=crm_gjzb_sysj.trim();
		if (!(crm_gjzb_sysj.equals("")))	wheresql+="  and (crm_gjzb.sysj<=TO_DATE('"+crm_gjzb_sysj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_lrr=request.getParameter("crm_gjzb_lrr");
	if (crm_gjzb_lrr!=null)
	{
		crm_gjzb_lrr=cf.GB2Uni(crm_gjzb_lrr);
		if (!(crm_gjzb_lrr.equals("")))	wheresql+=" and  (crm_gjzb.lrr='"+crm_gjzb_lrr+"')";
	}
	crm_gjzb_lrsj=request.getParameter("crm_gjzb_lrsj");
	if (crm_gjzb_lrsj!=null)
	{
		crm_gjzb_lrsj=crm_gjzb_lrsj.trim();
		if (!(crm_gjzb_lrsj.equals("")))	wheresql+="  and (crm_gjzb.lrsj=TO_DATE('"+crm_gjzb_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gjzb_lrbm=request.getParameter("crm_gjzb_lrbm");
	if (crm_gjzb_lrbm!=null)
	{
		crm_gjzb_lrbm=cf.GB2Uni(crm_gjzb_lrbm);
		if (!(crm_gjzb_lrbm.equals("")))	wheresql+=" and  (crm_gjzb.lrbm='"+crm_gjzb_lrbm+"')";
	}
	ls_sql="SELECT crm_gjzb.djbh,DECODE(crm_gjzb.sybz,'N','δ��','Y','������'),crm_gjzb.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_gjzb.bgr,crm_gjzb.bgqssj,crm_gjzb.bgjzsj,crm_gjzb.qksm, crm_gjzb.syr,crm_gjzb.sysj,crm_gjzb.sysm,crm_gjzb.lrr,crm_gjzb.lrsj,dwmc";
	ls_sql+=" FROM crm_gjzb,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_gjzb.khbh=crm_khxx.khbh(+) and crm_gjzb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_gjzb.sybz='N'";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_gjzbList.jsp","","","EditCrm_gjzb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"djbh","crm_gjzb_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_gjzb_bgr","crm_gjzb_bgqssj","crm_gjzb_bgjzsj","crm_gjzb_qksm","crm_gjzb_sybz","crm_gjzb_syr","crm_gjzb_sysj","crm_gjzb_sysm","crm_gjzb_lrr","crm_gjzb_lrsj","crm_gjzb_lrbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_gjzbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] djbh = request.getParameterValues("djbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(djbh,"djbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from crm_gjzbzp where "+chooseitem;
		sql[1]="delete from crm_gjzb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ܼ��ܱ�����ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">�ǼǱ��</td>
	<td  width="3%">���ı�־</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="4%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">������</td>
	<td  width="4%">������ʼʱ��</td>
	<td  width="4%">�������ʱ��</td>
	<td  width="20%">���˵��</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="18%">����˵��</td>
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