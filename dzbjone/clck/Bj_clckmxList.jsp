<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ckdh=request.getParameter("ckdh");


	ls_sql="SELECT bj_clckmx.wlbm,bj_clckmx.glmc,bj_clckmx.xhgg,bj_clckmx.pp,cljldwmc,TO_CHAR(bj_clckmx.dj),bj_clckmx.sl,bj_clckmx.dj*bj_clckmx.sl,jswlbm,bj_jscljgb.glmc||NVL2(bj_jscljgb.pp,'('||bj_jscljgb.pp||')',''),cldlmc";
	ls_sql+=" FROM bj_clckmx,bdm_cldlbm,bdm_cljldwbm,bj_jscljgb ";
	ls_sql+=" where bj_clckmx.cldlbm=bdm_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_clckmx.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_clckmx.jswlbm=bj_jscljgb.wlbm(+)";
    ls_sql+=" and bj_clckmx.ckdh='"+ckdh+"'";
    ls_sql+=" order by bj_clckmx.wlbm";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqmc","cldlbm","wlbm","glmc","pp","xhgg","cljldwmc","dj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"wlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteBj_clckmx.jsp?ckdh="+ckdh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ϳ�����ϸ�����ⵥ�ţ�<%=ckdh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="7%">�������ϱ���</td>
    <td  width="12%">������������</td>
	<td  width="11%">�ͺŹ��</td>
	<td  width="15%">Ʒ��</td>
	<td  width="5%">������λ</td>
	<td  width="5%">����</td>
	<td  width="6%">��������</td>
	<td  width="7%">������</td>
	<td  width="6%">�������ϱ���</td>
	<td  width="12%">������������</td>
	<td  width="8%">�������</td>
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