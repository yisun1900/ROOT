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

	String ssfgs=cf.GB2Uni(request.getParameter("dwbh"));
	String czxh=cf.GB2Uni(request.getParameter("czxh"));
	String khbh=cf.GB2Uni(request.getParameter("khbh"));

	String clmc=null;
	String clgg=null;
	String lrjsfs=null;
	String lrbfb=null;
	String cldj=null;
	String jldwmc=null;
	String cldlmc=null;
	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"')";
	}
	cldj=request.getParameter("cldj");
	if (cldj!=null)
	{
		cldj=cldj.trim();
		if (!(cldj.equals("")))	wheresql+=" and  (cldj>='"+cldj+"') ";
	}
	cldj=request.getParameter("cldj2");
	if (cldj!=null)
	{
		cldj=cldj.trim();
		if (!(cldj.equals("")))	wheresql+=" and  (cldj<='"+cldj+"') ";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (clmc='"+clmc+"')";
	}
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (clgg='"+clgg+"')";
	}
	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (lrjsfs='"+lrjsfs+"')";
	}
	lrbfb=request.getParameter("lrbfb");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (lrbfb>="+lrbfb+") ";
	}
	lrbfb=request.getParameter("lrbfb2");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (lrbfb<="+lrbfb+") ";
	}
	ls_sql="SELECT '¼��' sg,cl_clbm.clbm clbm,clmc,clgg,cldlmc,gdj,jldwmc,bz ";
	ls_sql+=" FROM cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
	ls_sql+=" and cl_jgmx.dwbh='"+ssfgs+"' ";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_clbm.clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_clbmCxList.jsp","","","");
//	pageObj.setEditStr("�깺");
//	pageObj.setPageRow(30);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"clbm","clmc","clgg","lrjsfs","lrbfb","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"clbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="InsertCl_djjmx.jsp?czxh="+czxh+"&khbh="+khbh+"&ssfgs="+ssfgs;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sg",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px' >
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">���ϱ���</td>
	<td  width="10%">��������</td>
	<td  width="10%">���Ϲ��</td>
	<td  width="10%">���ϴ���</td>
	<td  width="5%">���ϵ���</td>
	<td  width="3%">������λ</td>
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