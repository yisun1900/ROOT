<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");


	String ls_sql=null;

	ls_sql="SELECT crm_khxx.khxm,jxc_clpsd.psph,DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','1','�ȴ����','2','�ȴ�����','3','�ѳ���','5','���ֳ���','6','���������޸�','7','����') psdzt,DECODE(jxc_clpsd.shjl,'Y','ͬ��','N','����','M','���������޸�'),jxc_clpsd.dysj,jxc_clpsd.pszsl,jxc_clpsd.pszje,jxc_clpsd.yf,jxc_clpsd.qtsf,jxc_clpsd.fkje,jxc_clpsd.lrrq,jxc_clpsd.bz  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx ";
    ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and jxc_clpsd.khbh='"+khbh+"' and jxc_clpsd.psdzt!='7'";;
    ls_sql+=" order by jxc_clpsd.lrrq ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"psph"};
	pageObj.setKey(keyName);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"psph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jxcfc/psdgl/ViewJxc_clpsd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("psph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ϵ���ѯ</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ͻ�����</td>
	<td  width="9%">���ϵ���</td>
	<td  width="6%">���ϵ�״̬</td>
	<td  width="8%">��˽���</td>
	<td  width="7%">��ӡʱ��</td>
	<td  width="8%">������</td>
	<td  width="8%">�ܽ��</td>
	<td  width="6%">�����˷�</td>
	<td  width="6%">�����շ�</td>
	<td  width="6%">������</td>
	<td  width="7%">¼������</td>
	<td  width="22%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%> 

</table>
</body>

</html>