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

	ls_sql="SELECT a.dwmc,b.dwmc bm,zwmc,sq_xtrz.yhdlm,sq_yhxx.yhmc,sq_xtrz.ip1||'.'||sq_xtrz.ip2||'.'||sq_xtrz.ip3 ,count(*) cc ";
	ls_sql+=" FROM sq_yhxx,sq_xtrz,sq_dwxx b,sq_dwxx a ,dm_zwbm ";
    ls_sql+=" where sq_xtrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and b.ssfgs=a.dwbh and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
    ls_sql+=" and  sq_xtrz.yhdlm='"+yhdlm+"'";
	ls_sql+=" group by sq_xtrz.yhdlm,sq_yhxx.yhmc,a.dwmc,b.dwmc,zwmc,sq_xtrz.ip1,sq_xtrz.ip2,sq_xtrz.ip3";
	ls_sql+=" order by cc";
    
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("yhtj.jsp","","","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
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
  <B><font size="3">IP��ַͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">�����ֹ�˾</td>
	<td  width="15%">����</td>
	<td  width="14%">ְ��</td>
	<td  width="14%">�û���½��</td>
	<td  width="10%">�û�����</td>
	<td  width="14%">IP��ַ</td>
	<td  width="10%">��½����</td>
	
	
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