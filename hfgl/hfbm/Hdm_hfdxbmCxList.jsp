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
	String hfdxbm=null;
	String hfdxmc=null;
	String hfdxflbm=null;
	String xh=null;
	hfdxbm=request.getParameter("hfdxbm");
	if (hfdxbm!=null)
	{
		hfdxbm=cf.GB2Uni(hfdxbm);
		if (!(hfdxbm.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxbm='"+hfdxbm+"')";
	}
	hfdxmc=request.getParameter("hfdxmc");
	if (hfdxmc!=null)
	{
		hfdxmc=cf.GB2Uni(hfdxmc);
		if (!(hfdxmc.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxmc='"+hfdxmc+"')";
	}
	hfdxflbm=request.getParameter("hfdxflbm");
	if (hfdxflbm!=null)
	{
		hfdxflbm=cf.GB2Uni(hfdxflbm);
		if (!(hfdxflbm.equals("")))	wheresql+=" and  (hdm_hfdxbm.hfdxflbm='"+hfdxflbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ls_sql="SELECT hfdxflmc,hdm_hfdxbm.xh,hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc ";
	ls_sql+=" FROM hdm_hfdxbm,hdm_hfdxflbm  ";
    ls_sql+=" where hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm(+)  ";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_hfdxbm.hfdxflbm,hdm_hfdxbm.hfdxbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hdm_hfdxbmCxList.jsp","","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hfdxbm","hfdxmc","hfdxflbm","hflxbm","xh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hfdxbm"};
	pageObj.setKey(keyName);


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//�в����������Hash��
	spanColHash.put("hfdxflmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">�طö��󣭣���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="34%">�طö������</td>
	<td  width="8%">���</td>
	<td  width="14%">�طö������</td>
	<td  width="44%">�طö�������</td>
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