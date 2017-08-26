<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_dgqk.khbh as khbh,crm_dgqk.cpbm as cpbm,dm_cpbm.cpmc as dm_cpbm_cpmc,crm_dgqk.sjfy as crm_dgqk_sjfy,crm_dgqk.yazrq as crm_dgqk_yazrq,crm_dgqk.sazrq as crm_dgqk_sazrq,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,sq_dwxx.dwmc as sq_dwxx_dwmc,sq_dwxx.dwdh as sq_dwxx_dwdh, DECODE(crm_dgqk.azbz,'N','δ��װ','Y','�Ѱ�װ') as crm_dgqk_azbz  ";
	ls_sql+=" FROM crm_dgqk,crm_khxx,dm_cpbm,sq_dwxx  ";
    ls_sql+=" where crm_dgqk.cpbm=dm_cpbm.cpbm and crm_dgqk.khbh=crm_khxx.khbh and crm_dgqk.gys=sq_dwxx.dwbh";
    ls_sql+=" and crm_dgqk.khbh='"+khbh+"'";
    ls_sql+=" order by crm_dgqk.khbh,crm_dgqk.cpbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditCrm_dgqk.jsp?khbh="+khbh);
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","dm_cpbm_cpmc","crm_dgqk_sjfy","crm_dgqk_yazrq","crm_dgqk_sazrq","sq_dwxx_dwmc","sq_dwxx_dwdh","crm_dgqk_azbz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteDgqk.jsp?khbh="+khbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("crm_khxx_khxm","1");//�в����������Hash��
	spanColHash.put("crm_khxx_fwdz","1");//�в����������Hash��
	spanColHash.put("crm_khxx_lxfs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	<td  width="7%">�ͻ����</td>
	<td  width="6%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="7%">�ͻ��绰</td>
	<td  width="6%">��Ʒ</td>
	<td  width="7%">ʵ�ʷ���</td>
	<td  width="9%">Ӧ��װ����</td>
	<td  width="9%">ʵ��װ����</td>
	<td  width="9%">��Ӧ��</td>
	<td  width="8%">��Ӧ�̵绰</td>
	<td  width="6%">��װ</td>
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