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
	ls_sql="SELECT hdm_dxpjzb.xh,hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb,hfdxmc,hfdxflmc  ";
	ls_sql+=" FROM hdm_dxpjzb,hdm_hfdxbm,hdm_hfdxflbm  ";
    ls_sql+=" where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm(+)";
    ls_sql+=" and hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_dxpjzb.hfdxbm,hdm_dxpjzb.dxpjzbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hdm_dxpjzbList.jsp","","","EditHdm_dxpjzb.jsp");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dxpjzbbm","dxpjzb","hfdxbm","xh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dxpjzbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Hdm_dxpjzbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfdxmc","1");//�в����������Hash��
	spanColHash.put("hfdxflmc","2");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] dxpjzbbm = request.getParameterValues("dxpjzbbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dxpjzbbm,"dxpjzbbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from hdm_dxpjzb where "+chooseitem;
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
  <B><font size="3">�طö�������ָ�꣭��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">���</td>
	<td  width="10%">�طö�������ָ�����</td>
	<td  width="25%">�طö�������ָ��</td>
	<td  width="28%">�طö���</td>
	<td  width="23%">�طö������</td>
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