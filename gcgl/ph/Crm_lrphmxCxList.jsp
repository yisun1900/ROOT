<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String lrph=null;
	lrph=request.getParameter("lrph");
	if (lrph!=null)
	{
		lrph=lrph.trim();
		if (!(lrph.equals("")))	wheresql+=" and (crm_lrphmx.lrph="+lrph+") ";
	}
	ls_sql="SELECT crm_lrphmx.lrxh,crm_lrphmx.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_khxx.qyrq,a.dwmc sbdm,crm_khxx.sjkgrq,crm_khxx.sjjgrq  ";
	ls_sql+=" FROM crm_khxx,crm_lrphmx,sq_dwxx a,sq_sgd ";
    ls_sql+=" where crm_lrphmx.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_lrphmx.lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"lrph","crm_lrphmx_lrxh","khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_qyrq","crm_khxx_sjkgrq","crm_khxx_sjzkrq","crm_khxx_sjjgrq","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

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
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">������ϸ�����ţ�<%=lrph%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="6%">�ͻ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="10%">��ϵ��ʽ</td>
	<td  width="21%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">���̵���</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="10%">ǩԼ����</td>
	<td  width="7%">ʵ��������</td>
	<td  width="7%">ʵ��������</td>
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

