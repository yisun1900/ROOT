<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String kpjlh=request.getParameter("kpjlh");

	String ls_sql=null;

	ls_sql="SELECT '',kp_yzfsgdkhpyd.kpjlh,sgdmc,kp_yzfsgdkhpyd.sgdjbbm,kp_yzfsgdkhpyd.zbj,kp_yzfsgdkhpyd.bzs,kp_yzfsgdkhpyd.khmyd||'%',xjgdpjkf,xjgdjf,gdyspjkf,gdysjf,wxtss,yztss,ybtss,qwtss,tsjf,yqgds,yqgdjf,aqsggsrs,aqsggwrs,aqsgjf,sfkpd,kp_yzfsgdkhpyd.pdyxj,kp_yzfsgdkhpyd.kpkssj,kp_yzfsgdkhpyd.kpjzsj,dwmc";
	ls_sql+=" FROM kp_yzfsgdkhpyd,sq_sgd,sq_dwxx";
    ls_sql+=" where kp_yzfsgdkhpyd.sgd=sq_sgd.sgd(+) and kp_yzfsgdkhpyd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=" and kp_yzfsgdkhpyd.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_yzfsgdkhpyd.kpjlh,kp_yzfsgdkhpyd.ssfgs,kp_yzfsgdkhpyd.khmyd desc,sgdmc";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ�����������¼�ţ�<%=kpjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="4%">������¼��</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">ʩ���Ӽ���</td>
	<td  width="3%">�ʱ���</td>
	<td  width="3%">������</td>
	<td  width="3%">�������</td>
	<td  width="3%">Ѳ�칤��ƽ���۷�</td>
	<td  width="3%">Ѳ�칤�ؼ���</td>
	<td  width="3%">��������ƽ���۷�</td>
	<td  width="3%">�������ռ���</td>
	<td  width="3%">Σ��Ͷ����</td>
	<td  width="3%">����Ͷ����</td>
	<td  width="3%">һ��Ͷ����</td>
	<td  width="3%">��΢Ͷ����</td>
	<td  width="3%">Ͷ�߼���</td>
	<td  width="3%">���ڹ�����</td>
	<td  width="3%">���ڹ��ؼ���</td>
	<td  width="3%">��ȫ�¹ʹ�������</td>
	<td  width="3%">��ȫ�¹ʹ�������</td>
	<td  width="3%">��ȫ�¹ʼ���</td>
	<td  width="3%">�Ƿ���ɵ�</td>
	<td  width="3%">�ɵ����ȼ�</td>
	<td  width="4%">������ʼʱ��</td>
	<td  width="4%">������ֹʱ��</td>
	<td  width="13%">�ֹ�˾</td>
</tr>
<%
	pageObj.printDate(true);
	pageObj.printFoot();
%> 

</body>
</html>