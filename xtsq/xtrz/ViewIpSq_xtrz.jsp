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

	String yhdlm=request.getParameter("yhdlm");
	String ip=request.getParameter("ip");

	ls_sql="SELECT sq_xtrz.xh,sq_xtrz.ip,sq_xtrz.yhdlm,sq_yhxx.yhmc,sq_yhxx.xzzwbm,sq_xtrz.dlsj,sq_xtrz.tcsj,b.dwmc xxx,a.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_xtrz,sq_dwxx b,sq_dwxx a  ";
    ls_sql+=" where sq_xtrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.ssfgs=a.dwbh(+)";
    ls_sql+=" and  sq_xtrz.yhdlm='"+yhdlm+"'";
    ls_sql+=" and  sq_xtrz.ip='"+ip+"'";
    ls_sql+=" order by sq_xtrz.ip,sq_xtrz.dlsj ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("ViewSq_xtrz.jsp","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��
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
	<td  width="6%">���</td>
	<td  width="13%">IP��ַ</td>
	<td  width="12%">�û���½��</td>
	<td  width="8%">�û�����</td>
	<td  width="9%">ְ��</td>
	<td  width="16%">��½ʱ��</td>
	<td  width="10%">�˳�ʱ��</td>
	<td  width="14%">������λ</td>
	<td  width="14%">�����ֹ�˾</td>
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