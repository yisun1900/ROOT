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
	String dm_gcysxm_gcysxmbm=null;
	String dm_gcysxm_gcysxmmc=null;
	String dm_gcysxm_ysxmflbm=null;

	String dygcjdbm=null;
	dygcjdbm=request.getParameter("dygcjdbm");
	if (dygcjdbm!=null)
	{
		dygcjdbm=cf.GB2Uni(dygcjdbm);
		if (!(dygcjdbm.equals("")))	wheresql+=" and  (dm_gcysxm.dygcjdbm='"+dygcjdbm+"')";
	}
	String sfhf=null;
	sfhf=request.getParameter("sfhf");
	if (sfhf!=null)
	{
		sfhf=cf.GB2Uni(sfhf);
		if (!(sfhf.equals("")))	wheresql+=" and  (dm_gcysxm.sfhf='"+sfhf+"')";
	}

	dm_gcysxm_gcysxmbm=request.getParameter("dm_gcysxm_gcysxmbm");
	if (dm_gcysxm_gcysxmbm!=null)
	{
		dm_gcysxm_gcysxmbm=cf.GB2Uni(dm_gcysxm_gcysxmbm);
		if (!(dm_gcysxm_gcysxmbm.equals("")))	wheresql+=" and  (dm_gcysxm.gcysxmbm='"+dm_gcysxm_gcysxmbm+"')";
	}
	dm_gcysxm_gcysxmmc=request.getParameter("dm_gcysxm_gcysxmmc");
	if (dm_gcysxm_gcysxmmc!=null)
	{
		dm_gcysxm_gcysxmmc=cf.GB2Uni(dm_gcysxm_gcysxmmc);
		if (!(dm_gcysxm_gcysxmmc.equals("")))	wheresql+=" and  (dm_gcysxm.gcysxmmc='"+dm_gcysxm_gcysxmmc+"')";
	}
	dm_gcysxm_ysxmflbm=request.getParameter("dm_gcysxm_ysxmflbm");
	if (dm_gcysxm_ysxmflbm!=null)
	{
		dm_gcysxm_ysxmflbm=cf.GB2Uni(dm_gcysxm_ysxmflbm);
		if (!(dm_gcysxm_ysxmflbm.equals("")))	wheresql+=" and  (dm_gcysxm.ysxmflbm='"+dm_gcysxm_ysxmflbm+"')";
	}
	ls_sql="SELECT dm_ysxmflbm.ysxmflmc,dm_gcysxm.gcysxmbm,dm_gcysxm.gcysxmmc,gcjdmc,DECODE(dm_gcysxm.sfhf,'Y','�ط�','N','��'),hflxmc,ljskbfb||'%',dm_gcysxm.bz  ";
	ls_sql+=" FROM dm_gcysxm,dm_ysxmflbm,dm_gcjdbm,dm_hflxbm  ";
    ls_sql+=" where dm_gcysxm.ysxmflbm=dm_ysxmflbm.ysxmflbm(+) and dm_gcysxm.dygcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and dm_gcysxm.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_gcysxm.ysxmflbm,dm_gcysxm.gcysxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_gcysxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"gcysxmbm","dm_gcysxm_gcysxmmc","dm_gcysxm_ysxmflbm","dm_ysxmflbm_ysxmflmc","dm_gcysxm_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gcysxmbm"};
	pageObj.setKey(keyName);

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
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">��Ŀ����</td>
	<td  width="7%">������Ŀ����</td>
	<td  width="30%">������Ŀ����</td>
	<td  width="10%">��Ӧ���̽���</td>
	<td  width="5%">�Ƿ�ط�</td>
	<td  width="10%">�ط�����</td>
	<td  width="8%">�ۼƼ�װ�տ�ٷֱ�</td>
	<td  width="21%">��ע</td>
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