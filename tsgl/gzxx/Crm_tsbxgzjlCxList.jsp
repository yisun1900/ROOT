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
	String crm_tsbxgzjl_gzjlh=null;
	String crm_tsbxgzjl_tsjlh=null;
	String crm_tsbxgzjl_khbh=null;
	String crm_tsbxgzjl_lrsj=null;
	String crm_tsbxgzjl_lrr=null;
	String crm_tsbxgzjl_lrbm=null;
	String crm_tsbxgzjl_lx=null;
	crm_tsbxgzjl_gzjlh=request.getParameter("crm_tsbxgzjl_gzjlh");
	if (crm_tsbxgzjl_gzjlh!=null)
	{
		crm_tsbxgzjl_gzjlh=cf.GB2Uni(crm_tsbxgzjl_gzjlh);
		if (!(crm_tsbxgzjl_gzjlh.equals("")))	wheresql+=" and  (crm_tsbxgzjl.gzjlh='"+crm_tsbxgzjl_gzjlh+"')";
	}
	crm_tsbxgzjl_tsjlh=request.getParameter("crm_tsbxgzjl_tsjlh");
	if (crm_tsbxgzjl_tsjlh!=null)
	{
		crm_tsbxgzjl_tsjlh=cf.GB2Uni(crm_tsbxgzjl_tsjlh);
		if (!(crm_tsbxgzjl_tsjlh.equals("")))	wheresql+=" and  (crm_tsbxgzjl.tsjlh='"+crm_tsbxgzjl_tsjlh+"')";
	}
	crm_tsbxgzjl_khbh=request.getParameter("crm_tsbxgzjl_khbh");
	if (crm_tsbxgzjl_khbh!=null)
	{
		crm_tsbxgzjl_khbh=cf.GB2Uni(crm_tsbxgzjl_khbh);
		if (!(crm_tsbxgzjl_khbh.equals("")))	wheresql+=" and  (crm_tsbxgzjl.khbh='"+crm_tsbxgzjl_khbh+"')";
	}
	crm_tsbxgzjl_lrsj=request.getParameter("crm_tsbxgzjl_lrsj");
	if (crm_tsbxgzjl_lrsj!=null)
	{
		crm_tsbxgzjl_lrsj=crm_tsbxgzjl_lrsj.trim();
		if (!(crm_tsbxgzjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxgzjl.lrsj>=TO_DATE('"+crm_tsbxgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxgzjl_lrsj=request.getParameter("crm_tsbxgzjl_lrsj2");
	if (crm_tsbxgzjl_lrsj!=null)
	{
		crm_tsbxgzjl_lrsj=crm_tsbxgzjl_lrsj.trim();
		if (!(crm_tsbxgzjl_lrsj.equals("")))	wheresql+="  and (crm_tsbxgzjl.lrsj<=TO_DATE('"+crm_tsbxgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tsbxgzjl_lrr=request.getParameter("crm_tsbxgzjl_lrr");
	if (crm_tsbxgzjl_lrr!=null)
	{
		crm_tsbxgzjl_lrr=cf.GB2Uni(crm_tsbxgzjl_lrr);
		if (!(crm_tsbxgzjl_lrr.equals("")))	wheresql+=" and  (crm_tsbxgzjl.lrr='"+crm_tsbxgzjl_lrr+"')";
	}
	crm_tsbxgzjl_lrbm=request.getParameter("crm_tsbxgzjl_lrbm");
	if (crm_tsbxgzjl_lrbm!=null)
	{
		crm_tsbxgzjl_lrbm=cf.GB2Uni(crm_tsbxgzjl_lrbm);
		if (!(crm_tsbxgzjl_lrbm.equals("")))	wheresql+=" and  (crm_tsbxgzjl.lrbm='"+crm_tsbxgzjl_lrbm+"')";
	}
	crm_tsbxgzjl_lx=request.getParameter("crm_tsbxgzjl_lx");
	if (crm_tsbxgzjl_lx!=null)
	{
		crm_tsbxgzjl_lx=cf.GB2Uni(crm_tsbxgzjl_lx);
		if (!(crm_tsbxgzjl_lx.equals("")))	wheresql+=" and  (crm_tsbxgzjl.lx='"+crm_tsbxgzjl_lx+"')";
	}
	ls_sql="SELECT crm_tsbxgzjl.gzjlh, DECODE(crm_tsbxgzjl.lx,'1','����רԱ','2','�ͷ�'),crm_tsbxgzjl.tsjlh,crm_tsbxgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_tsjl.tsnr,crm_tsbxgzjl.qksm,crm_tsbxgzjl.lrsj,crm_tsbxgzjl.lrr,dwmc  ";
	ls_sql+=" FROM crm_tsbxgzjl,crm_tsjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_tsbxgzjl.tsjlh=crm_tsjl.tsjlh and crm_tsbxgzjl.khbh=crm_khxx.khbh and crm_tsbxgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tsbxgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tsbxgzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gzjlh","crm_tsbxgzjl_tsjlh","crm_tsjl_tsnr","crm_tsbxgzjl_khbh","crm_tsbxgzjl_qksm","crm_tsbxgzjl_lrsj","crm_tsbxgzjl_lrr","crm_tsbxgzjl_lrbm","crm_tsbxgzjl_lx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gzjlh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ������Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���ټ�¼��</td>
	<td  width="4%">����</td>
	<td  width="5%">Ͷ�߱��޼�¼��</td>
	<td  width="4%">�ͻ����</td>
	<td  width="4%">����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="24%">Ͷ�߱�������</td>
	<td  width="24%">�������</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="4%">¼����</td>
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