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
	String pfbm=null;
	String pfmc=null;
	String df=null;
	String xh=null;
	dxpjzbbm=request.getParameter("dxpjzbbm");
	if (dxpjzbbm!=null)
	{
		dxpjzbbm=cf.GB2Uni(dxpjzbbm);
		if (!(dxpjzbbm.equals("")))	wheresql+=" and  (hdm_pjzbpf.dxpjzbbm='"+dxpjzbbm+"')";
	}
	pfbm=request.getParameter("pfbm");
	if (pfbm!=null)
	{
		pfbm=cf.GB2Uni(pfbm);
		if (!(pfbm.equals("")))	wheresql+=" and  (hdm_pjzbpf.pfbm='"+pfbm+"')";
	}
	pfmc=request.getParameter("pfmc");
	if (pfmc!=null)
	{
		pfmc=cf.GB2Uni(pfmc);
		if (!(pfmc.equals("")))	wheresql+=" and  (hdm_pjzbpf.pfmc='"+pfmc+"')";
	}
	df=request.getParameter("df");
	if (df!=null)
	{
		df=df.trim();
		if (!(df.equals("")))	wheresql+=" and  (hdm_pjzbpf.df="+df+") ";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (hdm_pjzbpf.xh="+xh+") ";
	}
	ls_sql="SELECT hfdxmc,dxpjzb,hdm_pjzbpf.xh ,hdm_pjzbpf.pfbm,hdm_pjzbpf.pfmc,hdm_pjzbpf.df ";
	ls_sql+=" FROM hdm_pjzbpf,hdm_dxpjzb,hdm_hfdxbm  ";
    ls_sql+=" where hdm_pjzbpf.dxpjzbbm=hdm_dxpjzb.dxpjzbbm(+)";
    ls_sql+=" and hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_pjzbpf.dxpjzbbm,hdm_pjzbpf.xh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hdm_pjzbpfList.jsp","","","");
	pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dxpjzbbm","pfbm","pfmc","df","xh"};
	pageObj.setDisColName(disColName);
*/



//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfdxmc","1");//�в����������Hash��
	spanColHash.put("dxpjzb","1");//�в����������Hash��
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
  <B><font size="3">����ָ�����֣�����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="28%">�طö���</td>
	<td  width="28%">����ָ��</td>
	<td  width="8%">���</td>
	<td  width="8%">���ֱ���</td>
	<td  width="20%">��������</td>
	<td  width="8%">�÷�</td>
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