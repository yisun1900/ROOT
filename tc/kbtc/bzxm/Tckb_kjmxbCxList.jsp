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
	String tckb_kjmxb_hxbm=null;
	String tckb_kjmxb_jgwzbm=null;
	String tckb_kjmxb_mj=null;
	tckb_kjmxb_hxbm=request.getParameter("tckb_kjmxb_hxbm");
	if (tckb_kjmxb_hxbm!=null)
	{
		tckb_kjmxb_hxbm=cf.GB2Uni(tckb_kjmxb_hxbm);
		if (!(tckb_kjmxb_hxbm.equals("")))	wheresql+=" and  (tckb_kjmxb.hxbm='"+tckb_kjmxb_hxbm+"')";
	}
	tckb_kjmxb_jgwzbm=request.getParameter("tckb_kjmxb_jgwzbm");
	if (tckb_kjmxb_jgwzbm!=null)
	{
		tckb_kjmxb_jgwzbm=cf.GB2Uni(tckb_kjmxb_jgwzbm);
		if (!(tckb_kjmxb_jgwzbm.equals("")))	wheresql+=" and  (tckb_kjmxb.jgwzbm='"+tckb_kjmxb_jgwzbm+"')";
	}
	tckb_kjmxb_mj=request.getParameter("tckb_kjmxb_mj");
	if (tckb_kjmxb_mj!=null)
	{
		tckb_kjmxb_mj=tckb_kjmxb_mj.trim();
		if (!(tckb_kjmxb_mj.equals("")))	wheresql+=" and (tckb_kjmxb.mj="+tckb_kjmxb_mj+") ";
	}
	ls_sql="SELECT dm_hxbm.hxmc,tckb_kjmxb.jgwzbm,tckb_kjmxb.mj  ";
	ls_sql+=" FROM dm_hxbm,tckb_kjmxb  ";
    ls_sql+=" where tckb_kjmxb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_kjmxb.hxbm,tckb_kjmxb.jgwzbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tckb_kjmxbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hxbm","dm_hxbm_hxmc","jgwzbm","tckb_kjmxb_mj"};
	pageObj.setDisColName(disColName);
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="35%">����</td>
	<td  width="35%">���ܿռ�</td>
	<td  width="25%">�ռ����</td>
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