<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sqxh=request.getParameter("sqxh");

	ls_sql="SELECT oa_xcplqmx.xcpbm,DECODE(sfxsp,'N','����Ҫ','Y','��Ҫ'),oa_xcplqmx.xcpmc,oa_xcpflbm.xcpflmc,oa_xcplqmx.jldw,oa_xcplqmx.jhlqsl,oa_xcplqmx.slqsl  ";
	ls_sql+=" FROM oa_xcpflbm,oa_xcplqmx  ";
    ls_sql+=" where oa_xcplqmx.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=" and oa_xcplqmx.sqxh="+sqxh;
    ls_sql+=" order by oa_xcplqmx.xcpbm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditOa_xcplqmxMain.jsp?sqxh="+sqxh);
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"xcpbm","oa_xcplqmx_xcpmc","oa_xcpflbm_xcpflmc","oa_xcplqmx_jldw","oa_xcplqmx_dj","oa_xcplqmx_jhlqsl","oa_xcplqmx_slqsl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xcpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteOa_xcplqmx.jsp?sqxh="+sqxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ӡˢƷ��ȡ��ϸ��������ţ�<%=sqxh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="9%">ӡˢƷ����</td>
	<td  width="10%">�Ƿ�������</td>
	<td  width="22%">ӡˢƷ����</td>
	<td  width="22%">ӡˢƷ����</td>
	<td  width="10%">������λ</td>
	<td  width="8%">�ƻ���ȡ����</td>
	<td  width="8%">ʵ��ȡ����</td>
</tr>
<%
	pageObj.displayDateSum();
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