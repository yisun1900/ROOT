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
	String crm_yglkgsjl_jlh=null;
	String crm_yglkgsjl_ygbh=null;
	String crm_yglkgsjl_yhmc=null;
	String crm_yglkgsjl_ygbm=null;
	String crm_yglkgsjl_rylx=null;
	String crm_yglkgsjl_jhlkrq=null;
	String crm_yglkgsjl_jhlksj=null;
	String crm_yglkgsjl_jhfhsj=null;
	String crm_yglkgsjl_lkgsmd=null;
	String crm_yglkgsjl_zt=null;
	String crm_yglkgsjl_lrr=null;
	String crm_yglkgsjl_lrsj=null;
	String crm_yglkgsjl_ssfgs=null;
	crm_yglkgsjl_jlh=request.getParameter("crm_yglkgsjl_jlh");
	if (crm_yglkgsjl_jlh!=null)
	{
		crm_yglkgsjl_jlh=crm_yglkgsjl_jlh.trim();
		if (!(crm_yglkgsjl_jlh.equals("")))	wheresql+=" and (crm_yglkgsjl.jlh="+crm_yglkgsjl_jlh+") ";
	}
	crm_yglkgsjl_ygbh=request.getParameter("crm_yglkgsjl_ygbh");
	if (crm_yglkgsjl_ygbh!=null)
	{
		crm_yglkgsjl_ygbh=crm_yglkgsjl_ygbh.trim();
		if (!(crm_yglkgsjl_ygbh.equals("")))	wheresql+=" and (crm_yglkgsjl.ygbh="+crm_yglkgsjl_ygbh+") ";
	}
	crm_yglkgsjl_yhmc=request.getParameter("crm_yglkgsjl_yhmc");
	if (crm_yglkgsjl_yhmc!=null)
	{
		crm_yglkgsjl_yhmc=cf.GB2Uni(crm_yglkgsjl_yhmc);
		if (!(crm_yglkgsjl_yhmc.equals("")))	wheresql+=" and  (crm_yglkgsjl.yhmc='"+crm_yglkgsjl_yhmc+"')";
	}
	crm_yglkgsjl_ygbm=request.getParameter("crm_yglkgsjl_ygbm");
	if (crm_yglkgsjl_ygbm!=null)
	{
		crm_yglkgsjl_ygbm=cf.GB2Uni(crm_yglkgsjl_ygbm);
		if (!(crm_yglkgsjl_ygbm.equals("")))	wheresql+=" and  (crm_yglkgsjl.ygbm='"+crm_yglkgsjl_ygbm+"')";
	}
	crm_yglkgsjl_rylx=request.getParameter("crm_yglkgsjl_rylx");
	if (crm_yglkgsjl_rylx!=null)
	{
		crm_yglkgsjl_rylx=cf.GB2Uni(crm_yglkgsjl_rylx);
		if (!(crm_yglkgsjl_rylx.equals("")))	wheresql+=" and  (crm_yglkgsjl.rylx='"+crm_yglkgsjl_rylx+"')";
	}
	crm_yglkgsjl_jhlkrq=request.getParameter("crm_yglkgsjl_jhlkrq");
	if (crm_yglkgsjl_jhlkrq!=null)
	{
		crm_yglkgsjl_jhlkrq=crm_yglkgsjl_jhlkrq.trim();
		if (!(crm_yglkgsjl_jhlkrq.equals("")))	wheresql+="  and (crm_yglkgsjl.jhlkrq>=TO_DATE('"+crm_yglkgsjl_jhlkrq+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_jhlkrq=request.getParameter("crm_yglkgsjl_jhlkrq2");
	if (crm_yglkgsjl_jhlkrq!=null)
	{
		crm_yglkgsjl_jhlkrq=crm_yglkgsjl_jhlkrq.trim();
		if (!(crm_yglkgsjl_jhlkrq.equals("")))	wheresql+="  and (crm_yglkgsjl.jhlkrq<=TO_DATE('"+crm_yglkgsjl_jhlkrq+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_jhlksj=request.getParameter("crm_yglkgsjl_jhlksj");
	if (crm_yglkgsjl_jhlksj!=null)
	{
		crm_yglkgsjl_jhlksj=crm_yglkgsjl_jhlksj.trim();
		if (!(crm_yglkgsjl_jhlksj.equals("")))	wheresql+=" and  (crm_yglkgsjl.jhlksj="+crm_yglkgsjl_jhlksj+") ";
	}
	crm_yglkgsjl_jhfhsj=request.getParameter("crm_yglkgsjl_jhfhsj");
	if (crm_yglkgsjl_jhfhsj!=null)
	{
		crm_yglkgsjl_jhfhsj=crm_yglkgsjl_jhfhsj.trim();
		if (!(crm_yglkgsjl_jhfhsj.equals("")))	wheresql+=" and  (crm_yglkgsjl.jhfhsj="+crm_yglkgsjl_jhfhsj+") ";
	}
	crm_yglkgsjl_lkgsmd=request.getParameter("crm_yglkgsjl_lkgsmd");
	if (crm_yglkgsjl_lkgsmd!=null)
	{
		crm_yglkgsjl_lkgsmd=cf.GB2Uni(crm_yglkgsjl_lkgsmd);
		if (!(crm_yglkgsjl_lkgsmd.equals("")))	wheresql+=" and  (crm_yglkgsjl.lkgsmd='"+crm_yglkgsjl_lkgsmd+"')";
	}
	crm_yglkgsjl_zt=request.getParameter("crm_yglkgsjl_zt");
	if (crm_yglkgsjl_zt!=null)
	{
		crm_yglkgsjl_zt=cf.GB2Uni(crm_yglkgsjl_zt);
		if (!(crm_yglkgsjl_zt.equals("")))	wheresql+=" and  (crm_yglkgsjl.zt='"+crm_yglkgsjl_zt+"')";
	}
	crm_yglkgsjl_lrr=request.getParameter("crm_yglkgsjl_lrr");
	if (crm_yglkgsjl_lrr!=null)
	{
		crm_yglkgsjl_lrr=cf.GB2Uni(crm_yglkgsjl_lrr);
		if (!(crm_yglkgsjl_lrr.equals("")))	wheresql+=" and  (crm_yglkgsjl.lrr='"+crm_yglkgsjl_lrr+"')";
	}
	crm_yglkgsjl_lrsj=request.getParameter("crm_yglkgsjl_lrsj");
	if (crm_yglkgsjl_lrsj!=null)
	{
		crm_yglkgsjl_lrsj=crm_yglkgsjl_lrsj.trim();
		if (!(crm_yglkgsjl_lrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lrsj>=TO_DATE('"+crm_yglkgsjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_yglkgsjl_lrsj=request.getParameter("crm_yglkgsjl_lrsj2");
	if (crm_yglkgsjl_lrsj!=null)
	{
		crm_yglkgsjl_lrsj=crm_yglkgsjl_lrsj.trim();
		if (!(crm_yglkgsjl_lrsj.equals("")))	wheresql+="  and (crm_yglkgsjl.lrsj<=TO_DATE('"+crm_yglkgsjl_lrsj+"','YYYY/MM/DD'))";
	}

	crm_yglkgsjl_ssfgs=request.getParameter("crm_yglkgsjl_ssfgs");
	if (crm_yglkgsjl_ssfgs!=null)
	{
		crm_yglkgsjl_ssfgs=cf.GB2Uni(crm_yglkgsjl_ssfgs);
		if (!(crm_yglkgsjl_ssfgs.equals("")))	wheresql+=" and  (crm_yglkgsjl.ssfgs='"+crm_yglkgsjl_ssfgs+"')";
	}
	ls_sql="SELECT crm_yglkgsjl.jlh,DECODE(crm_yglkgsjl.zt,'1','¼������','2','�뿪��˾','3','���ع�˾','4','�����'),crm_yglkgsjl.ygbh,crm_yglkgsjl.yhmc,b.dwmc ygbm,crm_yglkgsjl.rylx,crm_yglkgsjl.jhlkrq,crm_yglkgsjl.jhlksj,crm_yglkgsjl.jhfhsj,crm_yglkgsjl.lkgsmd,crm_yglkgsjl.lkgssm,crm_yglkgsjl.lrr,crm_yglkgsjl.lrsj,a.dwmc fgs,crm_yglkgsjl.bz  ";
	ls_sql+=" FROM crm_yglkgsjl,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where crm_yglkgsjl.ssfgs=a.dwbh(+) and crm_yglkgsjl.ygbm=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_yglkgsjl.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_yglkgsjl.ygbm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jlh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_yglkgsjlLkXgList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jlh","crm_yglkgsjl_ygbh","crm_yglkgsjl_yhmc","crm_yglkgsjl_ygbm","crm_yglkgsjl_rylx","crm_yglkgsjl_jhlkrq","crm_yglkgsjl_jhlksj","crm_yglkgsjl_jhfhsj","crm_yglkgsjl_lkgsmd","crm_yglkgsjl_lkgssm","crm_yglkgsjl_zt","crm_yglkgsjl_lrr","crm_yglkgsjl_lrsj","crm_yglkgsjl_lrbm","sq_dwxx_dwmc","crm_yglkgsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ���Ǽ�"};//��ť����ʾ����
	String[] buttonLink={"DeleteLkCrm_yglkgsjl.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_yglkgsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jlh",coluParm);//�в����������Hash��
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
  <B><font size="3">�뿪�Ǽǣ�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">��¼��</td>
	<td  width="4%">״̬</td>
	<td  width="3%">Ա�����</td>
	<td  width="4%">Ա������</td>
	<td  width="7%">Ա������</td>
	<td  width="4%">��Ա����</td>
	<td  width="5%">�ƻ��뿪����</td>
	<td  width="3%">�ƻ��뿪ʱ��</td>
	<td  width="3%">�ƻ�����ʱ��</td>
	<td  width="7%">�뿪��˾Ŀ��</td>
	<td  width="25%">�뿪��˾˵��</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="7%">������˾</td>
	<td  width="15%">��ע</td>
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