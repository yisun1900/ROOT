<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=null;
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (cw_gckkjl.khbh='"+khbh+"')";
	}

	ls_sql="SELECT cw_gckkjl.kkjlh,crm_khxx.khxm,sgdmc,cw_gckkjl.spgckk,cw_gckkjl.spsjsfy,cw_gckkjl.spsgdfy,cw_gckkjl.spzjfy,cw_gckkjl.spgsfy,cw_gckkjl.spqtfy,cw_gckkjl.lrr,cw_gckkjl.lrsj,a.dwmc lrbm,cw_gckkjl.bz";
	ls_sql+=" FROM crm_khxx,cw_gckkjl,sq_dwxx a,sq_sgd  ";
    ls_sql+=" where cw_gckkjl.lrbm=a.dwbh and cw_gckkjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_gckkjl.spbz in('2') and cw_gckkjl.jsbz='Y'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_gckkjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditCw_gckkjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kkjlh","khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_dwbh","cw_gckkjl_gckk","cw_gckkjl_sjsfy","cw_gckkjl_sgdfy","cw_gckkjl_zjfy","cw_gckkjl_gsfy","cw_gckkjl_qtfy","cw_gckkjl_spgckk","cw_gckkjl_spsjsfy","cw_gckkjl_spsgdfy","cw_gckkjl_spzjfy","cw_gckkjl_spgsfy","cw_gckkjl_spqtfy","cw_gckkjl_lrr","cw_gckkjl_lrsj","sq_dwxx_dwmc","cw_gckkjl_spbz","cw_gckkjl_spyj","cw_gckkjl_spr","cw_gckkjl_spsj","cw_gckkjl_jsbz","cw_gckkjl_jsjlh","cw_gckkjl_sjsjsbz","cw_gckkjl_sjsjsjlh","cw_gckkjl_zjjsbz","cw_gckkjl_zjjsjlh","cw_gckkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kkjlh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_gckkjl.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸Ŀۿ���Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="7%">�ۿ��¼��</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">ʩ����</td>
	<td  width="6%">���̿ۿ�</td>
	<td  width="6%">���ʦ�е�����</td>
	<td  width="6%">ʩ���ӳе�����</td>
	<td  width="6%">�ʼ�е�����</td>
	<td  width="6%">��˾�е�����</td>
	<td  width="6%">�������е�����</td>
	<td  width="6%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="16%">��ע</td>
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