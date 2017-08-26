<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT jc_mmydd.yddbh as yddbh,jc_mmydd.khbh as khbh,khxm, DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����') as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.yddze as jc_mmydd_yddze,jc_mmydd.mmzkl mmzkl,jc_mmydd.clgw as jc_mmydd_clgw,clztmc,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz  ";
	ls_sql+=" FROM sq_dwxx,jc_mmydd,crm_khxx,jdm_mmyddzt   ";
    ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
    ls_sql+=" and jc_mmydd.clzt='01'";
    ls_sql+=" order by jc_mmydd.lrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","ZhshJc_mmydd.jsp");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("���");
//������ʾ��
	String[] disColName={"yddbh","khxm","jc_mmydd_wjqk","jc_mmydd_sqdj","jc_mmydd_yddze","mmzkl","jc_mmydd_clgw","clztmc","jc_mmydd_lrr","jc_mmydd_lrsj","sq_dwxx_dwmc","jc_mmydd_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ľ��Ԥ����---�ۺϾ�Ӫ�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">Ԥ�������</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">������</td>
	<td  width="6%">��ȡ����</td>
	<td  width="8%">Ԥ�����ܶ�</td>
	<td  width="5%">ľ���ۿ���</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="8%">����״̬</td>
	<td  width="5%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="11%">¼�벿��</td>
	<td  width="19%">��ע</td>
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