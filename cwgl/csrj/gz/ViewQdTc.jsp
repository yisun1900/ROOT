<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">Ա������</td>
	<td  width="7%">����ְ��</td>
	<td  width="8%">��������</td>
	<td  width="5%">�ͻ����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="15%">��ַ</td>
	<td  width="7%">��װǩԼ��</td>
	<td  width="7%">���Ľ��</td>
	<td  width="7%">��ɻ���</td>
	<td  width="5%">��ɱ���</td>
	<td  width="7%">��ɽ��</td>
	<td  width="5%">ǩ����ɱ���</td>
	<td  width="5%">ҵ��Ա�۵�</td>
	<td  width="5%">���Ŀ�����ɱ���</td>
	<td  width="7%">��ע</td>
</tr>
<%
	String ssfgs=request.getParameter("ssfgs");
	String khzq=request.getParameter("khzq");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT rs_qdtcmx.yhmc,rs_qdtcmx.xzzwbm,dwmc,rs_qdtcmx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,rs_qdtcmx.qye,rs_qdtcmx.zcje,tcjs,tcbl||'%',tcje,qdtcbl||'%',ywykd||'%',zckhtcbl||'%',rs_qdtcmx.bz  ";
	ls_sql+=" from rs_qdtcmx,sq_dwxx,crm_zxkhxx";
	ls_sql+=" where rs_qdtcmx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_qdtcmx.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=" and rs_qdtcmx.khzq='"+khzq+"' and rs_qdtcmx.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_qdtcmx.xzzwbm,rs_qdtcmx.yhmc,rs_qdtcmx.ygbh,rs_qdtcmx.khbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
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