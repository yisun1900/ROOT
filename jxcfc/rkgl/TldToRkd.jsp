<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_dwxx_dwmc=null;
String dqbm=null;
String gysbm=null;
String gysmc=null;
String cglb=null;
String cllb=null;
String dhzsl=null;
String dhzje=null;
String xdr=null;
String xdrq=null;
String psfs=null;
String yqdhsj=null;
String gysjsr=null;
String gysjsrq=null;
String fhsfwc=null;
String gysfhr=null;
String gysfhrq=null;
String sfjs=null;
String jsr=null;
String jsrq=null;
String sgph=null;
String ddzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String nian=null;
String bz=null;
String sfrksgdw=null;

String psph=cf.GB2Uni(request.getParameter("lydh"));
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String ls_sql=null;
%>

<html>
<head>
<title>���ϵ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">���ϵ������
  <input type="button" value="���ϵ����" onclick="window.close();window.open('SaveTldToRkd.jsp?psph=<%=psph%>&rkph=<%=rkph%>');">
</div>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="7%">���ϱ���</td>
	<td  width="7%">�ڲ�����</td>
	<td  width="13%">��������</td>
	<td  width="11%">�ͺ�</td>
	<td  width="11%">���</td>
	<td  width="5%">������λ</td>
	<td  width="6%">���ⵥ��</td>
	<td  width="6%">��������</td>
	<td  width="7%">������</td>
	<td  width="10%">Ʒ��</td>
	<td  width="18%">����С��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT psxh,clbm,nbbm,clmc,xh,gg,jldwbm,TO_CHAR(dj),pssl,psje,ppmc,clxlbm ";
	ls_sql+=" FROM jxc_clpsmx ";
    ls_sql+=" where psph='"+psph+"'";
	ls_sql+=" order by psxh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.printDateSum();
%> 
</table>

</body>
</html>