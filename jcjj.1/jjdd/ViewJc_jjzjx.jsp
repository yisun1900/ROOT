<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ddbh=request.getParameter("ddbh");

	String ls_sql=null;


	ls_sql="SELECT jc_jjzjx.zjxxh,DECODE(jc_jjzjx.clzt,'00','¼��δ���','01','¼�����','02','������ȷ��','04','��װ���','99','�˵�'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,mmzjxyymc,jc_jjzjx.jjzjxje,jc_jjzjx.xcmzjxje,jc_jjzjx.zjxze,jc_jjzjx.qrsj,jc_jjzjx.qrr,jc_jjzjx.srksj,jc_jjzjx.rkr,jc_jjzjx.rksm,jc_jjzjx.jhazsj,jc_jjzjx.azwcsj,jc_jjzjx.lrr,jc_jjzjx.lrsj,dwmc,jc_jjzjx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_jjzjx,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_jjzjx.dwbh=sq_dwxx.dwbh and jc_jjzjx.zjxyybm=jdm_mmzjxyybm.mmzjxyybm";
    ls_sql+=" and jc_jjzjx.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_jjzjx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_jjzjx.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","zjxxh","jc_jjzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_jjzjx_zjxyybm","jc_jjzjx_jjzjxje","jc_jjzjx_xcmzjxje","jc_jjzjx_wjzjxje","jc_jjzjx_dqzjxje","jc_jjzjx_zjxze","jc_jjzjx_qrsj","jc_jjzjx_qrr","jc_jjzjx_srksj","jc_jjzjx_rkr","jc_jjzjx_rksm","jc_jjzjx_jhazsj","jc_jjzjx_azwcsj","jc_jjzjx_clzt","jc_jjzjx_lrr","jc_jjzjx_lrsj","jc_jjzjx_dwbh","jc_jjzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjddcl/zjx/ViewJc_jjzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Ҿ������������ţ�<%=ddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���������</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="5%">������ԭ��</td>
	<td  width="4%">�Ҿ���������</td>
	<td  width="4%">�Ͳ�����������</td>
	<td  width="4%">�������ܶ�</td>
	<td  width="3%">ȷ��ʱ��</td>
	<td  width="2%">ȷ��¼����</td>
	<td  width="3%">ʵ���ʱ��</td>
	<td  width="2%">���¼����</td>
	<td  width="7%">���˵��</td>
	<td  width="3%">�ƻ���װʱ��</td>
	<td  width="3%">��װ���ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="10%">��ע</td>
</tr>
<%
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