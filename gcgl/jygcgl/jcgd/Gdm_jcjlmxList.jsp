<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String jcjlh=request.getParameter("jcjlh");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����¼��ϸ������¼�ţ�<%=jcjlh%>��</font></B>
</CENTER>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">��Ŀ����</td>
	<td  width="8%">��ĿС��</td>
	<td  width="5%">��Ŀ����</td>
	<td  width="15%">��Ŀ����</td>
	<td  width="5%">Υ�漶��</td>
	<td  width="5%">����Ҫ��</td>
	<td  width="5%">������Աְ��</td>
	<td  width="5%">������Ա����</td>
	<td  width="5%">Ա���۷�</td>
	<td  width="5%">Ա��������</td>
	<td  width="5%">ʩ���ӿ۷�</td>
	<td  width="5%">ʩ���ӷ�����</td>
	<td  width="5%">Υ�´���</td>
	<td  width="85%">��ע</td>
</tr>
<%
	ls_sql="SELECT xmdlmc,xmxlmc,xmbm,xmmc,wgjbmc,zgyq,xzzwbm,yhmc,ygkf,ygfkje,sgdkf,sgdfkje,wzcs,bz  ";
	ls_sql+=" FROM gdm_jcjlmx  ";
    ls_sql+=" where gdm_jcjlmx.jcjlh='"+jcjlh+"'";
    ls_sql+=" order by xmdlbm,xmxlbm,xmbm ";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","DeleteGdm_jcjlmx.jsp?jcjlh="+jcjlh,"EditGdm_jcjlmx.jsp?jcjlh="+jcjlh);
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"xmbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("ɾ��");

	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDateSum();
%> 
</table>
</body>
</html>