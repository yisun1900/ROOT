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
	String dxpjzbbm=null;
	String dxpjzb=null;
	String hfdxbm=null;
	String xh=null;
	dxpjzbbm=request.getParameter("dxpjzbbm");
	if (dxpjzbbm!=null)
	{
		dxpjzbbm=cf.GB2Uni(dxpjzbbm);
		if (!(dxpjzbbm.equals("")))	wheresql+=" and  (hdm_dxpjzb.dxpjzbbm='"+dxpjzbbm+"')";
	}
	dxpjzb=request.getParameter("dxpjzb");
	if (dxpjzb!=null)
	{
		dxpjzb=cf.GB2Uni(dxpjzb);
		if (!(dxpjzb.equals("")))	wheresql+=" and  (hdm_dxpjzb.dxpjzb='"+dxpjzb+"')";
	}
	hfdxbm=request.getParameter("hfdxbm");
	if (hfdxbm!=null)
	{
		hfdxbm=cf.GB2Uni(hfdxbm);
		if (!(hfdxbm.equals("")))	wheresql+=" and  (hdm_dxpjzb.hfdxbm='"+hfdxbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (hdm_dxpjzb.xh="+xh+") ";
	}
	ls_sql="SELECT hfdxflmc,hfdxmc,hdm_dxpjzb.xh,hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb  ";
	ls_sql+=" FROM hdm_dxpjzb,hdm_hfdxbm,hdm_hfdxflbm  ";
    ls_sql+=" where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm(+)";
    ls_sql+=" and hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_dxpjzb.hfdxbm,hdm_dxpjzb.dxpjzbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hdm_dxpjzbList.jsp","","","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dxpjzbbm","dxpjzb","hfdxbm","xh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dxpjzbbm"};
	pageObj.setKey(keyName);


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfdxflmc","1");//�в����������Hash��
	spanColHash.put("hfdxmc","1");//�в����������Hash��
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
  <B><font size="3">�طö�������ָ�꣭����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="28%">�طö������</td>
	<td  width="32%">�طö���</td>
	<td  width="6%">���</td>
	<td  width="10%">�طö�������ָ�����</td>
	<td  width="24%">�طö�������ָ��</td>
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