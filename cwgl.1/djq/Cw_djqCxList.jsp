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
	String cw_djq_fgsbh=null;
	String cw_djq_djqmc=null;
	String cw_djq_djqcdbl=null;
	String cw_djq_bz=null;
	cw_djq_fgsbh=request.getParameter("cw_djq_fgsbh");
	if (cw_djq_fgsbh!=null)
	{
		cw_djq_fgsbh=cf.GB2Uni(cw_djq_fgsbh);
		if (!(cw_djq_fgsbh.equals("")))	wheresql+=" and  (cw_djq.fgsbh='"+cw_djq_fgsbh+"')";
	}
	cw_djq_djqmc=request.getParameter("cw_djq_djqmc");
	if (cw_djq_djqmc!=null)
	{
		cw_djq_djqmc=cf.GB2Uni(cw_djq_djqmc);
		if (!(cw_djq_djqmc.equals("")))	wheresql+=" and  (cw_djq.djqmc='"+cw_djq_djqmc+"')";
	}
	cw_djq_djqcdbl=request.getParameter("cw_djq_djqcdbl");
	if (cw_djq_djqcdbl!=null)
	{
		cw_djq_djqcdbl=cw_djq_djqcdbl.trim();
		if (!(cw_djq_djqcdbl.equals("")))	wheresql+=" and  (cw_djq.djqcdbl="+cw_djq_djqcdbl+") ";
	}
	cw_djq_bz=request.getParameter("cw_djq_bz");
	if (cw_djq_bz!=null)
	{
		cw_djq_bz=cf.GB2Uni(cw_djq_bz);
		if (!(cw_djq_bz.equals("")))	wheresql+=" and  (cw_djq.bz='"+cw_djq_bz+"')";
	}
	ls_sql="SELECT sq_dwxx.dwmc,cw_djq.djqmc,cw_djq.djqcdbl,cw_djq.bz  ";
	ls_sql+=" FROM sq_dwxx,cw_djq  ";
    ls_sql+=" where cw_djq.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_djq.fgsbh,cw_djq.djqmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_djqCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fgsbh","sq_dwxx_dwmc","djqmc","cw_djq_djqcdbl","cw_djq_bz"};
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
	<td  width="17%">�ֹ�˾</td>
	<td  width="30%">����ȯ����</td>
	<td  width="10%">����ȯ���ҳе�����</td>
	<td  width="67%">��ע</td>
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