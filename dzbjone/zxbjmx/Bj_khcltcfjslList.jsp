<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String lx=cf.GB2Uni(request.getParameter("lx"));
	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.getParameter(request,"tcmc");

	String ls_sql=null;
	ls_sql="SELECT bj_khcltcfjsl.jgwzbm,bj_khcltcfjsl.bzsl,bj_khcltcfjsl.sl,'ѡ��' xz,'¼��' lr ";
	ls_sql+=" FROM bj_khcltcfjsl  ";
    ls_sql+=" where bj_khcltcfjsl.khbh='"+khbh+"'";
    ls_sql+=" and bj_khcltcfjsl.tcmc='"+tcmc+"'";
    ls_sql+=" order by bj_khcltcfjsl.jgwzbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jgwzbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="SelectCxBj_cltczcmx.jsp?khbh="+khbh+"&dqbm="+dqbm+"&tcmc="+tcmc+"&lx="+lx;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xz",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"jgwzbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="Bj_khcltczcmxList.jsp?khbh="+khbh+"&dqbm="+dqbm+"&tcmc="+tcmc+"&lx="+lx;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("lr",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


%>

<html>
<head>
<title>�����ײͷ�������</title>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����λ��</td>
	<td  width="9%">��׼����</td>
	<td  width="9%">ʵ������</td>
	<td  width="9%">ѡ���ͺ�</td>
	<td  width="9%">¼������</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
</html>