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
	String crm_cpztgzjl_khbh=null;
	String crm_cpztgzjl_cpflbm=null;
	String crm_cpztgzjl_cpztbm=null;
	String crm_cpztgzjl_fssj=null;
	String crm_cpztgzjl_zrr=null;
	String crm_cpztgzjl_lrr=null;
	String crm_cpztgzjl_lrsj=null;
	String crm_cpztgzjl_lrbm=null;
	crm_cpztgzjl_khbh=request.getParameter("crm_cpztgzjl_khbh");
	if (crm_cpztgzjl_khbh!=null)
	{
		crm_cpztgzjl_khbh=cf.GB2Uni(crm_cpztgzjl_khbh);
		if (!(crm_cpztgzjl_khbh.equals("")))	wheresql+=" and  (crm_cpztgzjl.khbh='"+crm_cpztgzjl_khbh+"')";
	}
	crm_cpztgzjl_cpflbm=request.getParameter("crm_cpztgzjl_cpflbm");
	if (crm_cpztgzjl_cpflbm!=null)
	{
		crm_cpztgzjl_cpflbm=cf.GB2Uni(crm_cpztgzjl_cpflbm);
		if (!(crm_cpztgzjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.cpflbm='"+crm_cpztgzjl_cpflbm+"')";
	}
	crm_cpztgzjl_cpztbm=request.getParameter("crm_cpztgzjl_cpztbm");
	if (crm_cpztgzjl_cpztbm!=null)
	{
		crm_cpztgzjl_cpztbm=cf.GB2Uni(crm_cpztgzjl_cpztbm);
		if (!(crm_cpztgzjl_cpztbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.cpztbm='"+crm_cpztgzjl_cpztbm+"')";
	}
	crm_cpztgzjl_fssj=request.getParameter("crm_cpztgzjl_fssj");
	if (crm_cpztgzjl_fssj!=null)
	{
		crm_cpztgzjl_fssj=crm_cpztgzjl_fssj.trim();
		if (!(crm_cpztgzjl_fssj.equals("")))	wheresql+="  and (crm_cpztgzjl.fssj=TO_DATE('"+crm_cpztgzjl_fssj+"','YYYY/MM/DD'))";
	}
	crm_cpztgzjl_zrr=request.getParameter("crm_cpztgzjl_zrr");
	if (crm_cpztgzjl_zrr!=null)
	{
		crm_cpztgzjl_zrr=cf.GB2Uni(crm_cpztgzjl_zrr);
		if (!(crm_cpztgzjl_zrr.equals("")))	wheresql+=" and  (crm_cpztgzjl.zrr='"+crm_cpztgzjl_zrr+"')";
	}
	crm_cpztgzjl_lrr=request.getParameter("crm_cpztgzjl_lrr");
	if (crm_cpztgzjl_lrr!=null)
	{
		crm_cpztgzjl_lrr=cf.GB2Uni(crm_cpztgzjl_lrr);
		if (!(crm_cpztgzjl_lrr.equals("")))	wheresql+=" and  (crm_cpztgzjl.lrr='"+crm_cpztgzjl_lrr+"')";
	}
	crm_cpztgzjl_lrsj=request.getParameter("crm_cpztgzjl_lrsj");
	if (crm_cpztgzjl_lrsj!=null)
	{
		crm_cpztgzjl_lrsj=crm_cpztgzjl_lrsj.trim();
		if (!(crm_cpztgzjl_lrsj.equals("")))	wheresql+="  and (crm_cpztgzjl.lrsj=TO_DATE('"+crm_cpztgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpztgzjl_lrbm=request.getParameter("crm_cpztgzjl_lrbm");
	if (crm_cpztgzjl_lrbm!=null)
	{
		crm_cpztgzjl_lrbm=cf.GB2Uni(crm_cpztgzjl_lrbm);
		if (!(crm_cpztgzjl_lrbm.equals("")))	wheresql+=" and  (crm_cpztgzjl.lrbm='"+crm_cpztgzjl_lrbm+"')";
	}
	ls_sql="SELECT crm_cpztgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_cpztgzjl.cpflbm,cpflmc,crm_cpztgzjl.cpztbm,cpztmc,crm_cpztgzjl.fssj,crm_cpztgzjl.zrr,crm_cpztgzjl.lrr,crm_cpztgzjl.lrsj,dwmc,crm_cpztgzjl.bz";
	ls_sql+=" FROM crm_cpztgzjl,dm_cpztbm,dm_cpflbm,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_cpztgzjl.cpztbm=dm_cpztbm.cpztbm and crm_cpztgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpztgzjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cpztgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_cpztgzjl.khbh,crm_cpztgzjl.cpflbm,crm_cpztgzjl.fssj ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_cpztgzjlList.jsp","","","EditCrm_cpztgzjl.jsp?");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"cpflmc","cpztmc","fssj","khbh","khxm","fwdz","hth","sjs","zrr","lrr","lrsj","dwmc","bz"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"khbh","cpflbm","cpztbm"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_cpztgzjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ά��״̬��Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="11%">��Ʒ����</td>
	<td  width="7%">��Ʒ״̬</td>
	<td  width="6%">����ʱ��</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="6%">��ͬ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">������</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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