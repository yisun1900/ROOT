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
	String cw_jrkhzq_khzq=null;
	String cw_jrkhzq_fgsbh=null;
	cw_jrkhzq_khzq=request.getParameter("cw_jrkhzq_khzq");
	if (cw_jrkhzq_khzq!=null)
	{
		cw_jrkhzq_khzq=cf.GB2Uni(cw_jrkhzq_khzq);
		if (!(cw_jrkhzq_khzq.equals("")))	wheresql+=" and  (cw_jrkhzq.khzq='"+cw_jrkhzq_khzq+"')";
	}
	cw_jrkhzq_fgsbh=request.getParameter("cw_jrkhzq_fgsbh");
	if (cw_jrkhzq_fgsbh!=null)
	{
		cw_jrkhzq_fgsbh=cf.GB2Uni(cw_jrkhzq_fgsbh);
		if (!(cw_jrkhzq_fgsbh.equals("")))	wheresql+=" and  (cw_jrkhzq.fgsbh='"+cw_jrkhzq_fgsbh+"')";
	}
	ls_sql="SELECT cw_jrkhzq.khzq,sq_dwxx.dwmc,cw_jrkhzq.khqssj,cw_jrkhzq.khjzsj,cw_jrkhzq.qqts,DECODE(sfkh,'1','δ����','2','¼������','3','����','4','���')  ";
	ls_sql+=" FROM cw_jrkhzq,sq_dwxx  ";
    ls_sql+=" where cw_jrkhzq.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrkhzq.fgsbh,cw_jrkhzq.khzq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrkhzqCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","fgsbh","sq_dwxx_dwmc","cw_jrkhzq_khqssj","cw_jrkhzq_khjzsj"};
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
	<td  width="10%">��������</td>
	<td  width="25%">�ֹ�˾</td>
	<td  width="13%">������ʼʱ��</td>
	<td  width="13%">���˽���ʱ��</td>
	<td  width="10%">ȫ������</td>
	<td  width="10%">�Ƿ񿼺�</td>
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