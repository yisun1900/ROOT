<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	String ls_sql=null;

	ls_sql="SELECT jxc_ckd.ckph,DECODE(jxc_ckd.ckdzt,'0','δ�ύ','1','�ȴ��������','2','�ȴ��˻����','3','�ȴ��������','4','�ѽ���','5','�˻����ͨ��','6','�������δͨ��','7','�˻����δͨ��','8','���ܷ������','9','�ύ'), DECODE(jxc_ckd.cklx,'D','��������','B','���ϳ���','T','�˻�����','S','�깺����','P','���ϵ�����','J','���Ĵ���ȯ����','X','���۳���','R','��������'), jxc_ckd.ckzsl,jxc_ckd.ckzje,jxc_ckd.lydh,jxc_ckd.ckr,jxc_ckd.cksj, DECODE(jxc_ckd.sfjz,'Y','����','N','δ����'),ckmc,jxc_ckd.bz  ";
	ls_sql+=" FROM jxc_ckd,jxc_ckmc  ";
    ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+)";
	ls_sql+=" and jxc_ckd.ckcllx='1'";//0�����ģ�1������
	ls_sql+=" and jxc_ckd.khbh='"+khbh+"' and jxc_ckd.cklx='P'";//D�����Ķ������⣻B�����ϳ��⣻T���˻����⣻ S���깺���⣻P�����ϵ����⣻J������ȯ���⣻X�����۳��⣻R:��������
    ls_sql+=" order by jxc_ckd.cksj desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"ckph"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ckph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jxcfc/ckgl/ViewJxc_ckd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ckph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ϵ����⣭��ѯ</font></B>
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">��������</td>
	<td  width="7%">���ⵥ״̬</td>
	<td  width="7%">��������</td>
	<td  width="7%">����������</td>
	<td  width="8%">�����ܽ��</td>
	<td  width="8%">��Դ����</td>
	<td  width="5%">������</td>
	<td  width="7%">����ʱ��</td>
	<td  width="5%">�Ƿ����</td>
	<td  width="8%">����ֿ�</td>
	<td  width="31%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate();
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>