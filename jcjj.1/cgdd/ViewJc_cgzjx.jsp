<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String wheresql="";
	String ddbh=request.getParameter("ddbh");


	ls_sql="SELECT jc_cgzjx.ddbh,TO_CHAR(jc_cgzjx.zjxxh) zjxxh,DECODE(jc_cgzjx.clzt,'00','¼��δ���','01','¼�����','02','������ȷ��','04','��װ���','99','�˵�'),crm_khxx.khxm,mmzjxyymc,jc_cgzjx.gtzjxje,jc_cgzjx.tmzjxje,jc_cgzjx.wjzjxje,jc_cgzjx.dqzjxje,jc_cgzjx.zjxze,jc_cgzjx.qrsj,jc_cgzjx.qrr,jc_cgzjx.jhazsj,jc_cgzjx.azwcsj,jc_cgzjx.lrr,jc_cgzjx.lrsj,dwmc,jc_cgzjx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_cgzjx,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgzjx.dwbh=sq_dwxx.dwbh and jc_cgzjx.cgzjxyybm=jdm_mmzjxyybm.mmzjxyybm";
    ls_sql+=" and jc_cgzjx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgzjx.ddbh,jc_cgzjx.zjxxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","zjxxh","jc_cgzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_cgzjx_cgzjxyybm","jc_cgzjx_gtzjxje","jc_cgzjx_tmzjxje","jc_cgzjx_wjzjxje","jc_cgzjx_dqzjxje","jc_cgzjx_zjxze","jc_cgzjx_qrsj","jc_cgzjx_qrr","jc_cgzjx_srksj","jc_cgzjx_rkr","jc_cgzjx_rksm","jc_cgzjx_jhazsj","jc_cgzjx_azwcsj","jc_cgzjx_clzt","jc_cgzjx_lrr","jc_cgzjx_lrsj","jc_cgzjx_dwbh","jc_cgzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh","zjxxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh","zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgcl/zjx/ViewJc_cgzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�������</td>
	<td  width="3%">���������</td>
	<td  width="5%">����״̬</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="9%">������ԭ��</td>
	<td  width="6%">������������</td>
	<td  width="6%">̨����������</td>
	<td  width="6%">�����������</td>
	<td  width="6%">������������</td>
	<td  width="6%">�������ܶ�</td>
	<td  width="5%">ȷ��ʱ��</td>
	<td  width="4%">ȷ��¼����</td>
	<td  width="5%">�ƻ���װʱ��</td>
	<td  width="5%">��װ���ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
	<td  width="10%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>