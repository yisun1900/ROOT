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

	String gysddph=request.getParameter("gysddph");

	ls_sql="SELECT jxc_gysddmx.clbm,nbbm,clmc,clxlbm,xh,gg,dhsl,ppmc ";
	ls_sql+=" FROM jxc_gysddmx";
	ls_sql+=" where jxc_gysddmx.gysddph='"+gysddph+"'";
	ls_sql+=" order by dhxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"��ӡѡ�в���"};//��ť����ʾ����
	String[] buttonLink={"PrintGysddClbm.jsp?gysddph="+gysddph};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">��Ӧ�̶���ѡ���ӡ�����빴ѡ���ӡ�Ĳ�Ʒ</font></B><br>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="10%">���ϱ���</td>
	<td  width="10%">�ڲ�����</td>
	<td  width="16%">��������</td>
	<td  width="12%">����С��</td>
	<td  width="14%">�ͺ�</td>
	<td  width="14%">���</td>
	<td  width="8%">��������</td>
	<td  width="13%">Ʒ��</td>
	
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