<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String ls_sql=null;
String xmbm=cf.GB2Uni(request.getParameter("xmbm"));

	
	ls_sql="SELECT gdm_gcxmcfbz.xmbm,gdm_gcxmcfbz.wgjbbm,gdm_wgjbbm.wgjbmc,gdm_gcxmcfbz.xzzwbm,gdm_gcxmcfbz.zgyq,gdm_gcxmcfbz.sgdkf,gdm_gcxmcfbz.sgdfkje,gdm_gcxmcfbz.ygkf,gdm_gcxmcfbz.ygfkje,gdm_gcxmcfbz.bz  ";
	ls_sql+=" FROM gdm_wgjbbm,gdm_gcxmcfbz  ";
    ls_sql+=" where gdm_gcxmcfbz.wgjbbm=gdm_wgjbbm.wgjbbm(+)";
    ls_sql+=" and gdm_gcxmcfbz.xmbm='"+xmbm+"'";
    ls_sql+=" order by gdm_gcxmcfbz.wgjbbm,gdm_gcxmcfbz.xzzwbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditGdm_gcxmcfbz.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xmbm","wgjbbm","gdm_wgjbbm_wgjbmc","xzzwbm","gdm_gcxmcfbz_zgyq","gdm_gcxmcfbz_sgdkf","gdm_gcxmcfbz_sgdfkje","gdm_gcxmcfbz_ygkf","gdm_gcxmcfbz_ygfkje","gdm_gcxmcfbz_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xmbm","wgjbbm","xzzwbm"};
	pageObj.setKey(keyName);

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
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">��Ŀ����</td>
	<td  width="8%">Υ�漶��</td>
	<td  width="8%">Υ�漶������</td>
	<td  width="11%">������Աְ��</td>
	<td  width="11%">����Ҫ��</td>
	<td  width="8%">ʩ���ӿ۷�</td>
	<td  width="8%">ʩ���ӷ�����</td>
	<td  width="8%">Ա���۷�</td>
	<td  width="8%">Ա��������</td>
	<td  width="88%">��ע</td>
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