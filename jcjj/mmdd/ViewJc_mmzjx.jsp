<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String yddbh=request.getParameter("yddbh");

	String ls_sql=null;


	ls_sql="SELECT jc_mmzjx.zjxxh,DECODE(jc_mmzjx.clzt,'00','¼��δ���','01','¼�������','02','������ȷ��','03','�����','04','��װ���','99','ȡ������'),crm_khxx.khxm,mmzjxyymc,jc_mmzjx.zjxze,jc_mmzjx.zjxfssj,jc_mmzjx.lrsj,c.dwmc lrbm, jc_mmydd.pdgc,jc_mmydd.pdgcmc, jc_mmydd.ppmc, jc_mmydd.gys ";
	ls_sql+=" FROM crm_khxx,jc_mmzjx,sq_dwxx c,jdm_mmzjxyybm,jc_mmydd  ";
    ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) and jc_mmzjx.mmzjxyybm=jdm_mmzjxyybm.mmzjxyybm(+)";
	ls_sql+=" and jc_mmzjx.dwbh=c.dwbh(+)";
    ls_sql+=" and jc_mmzjx.yddbh=jc_mmydd.yddbh ";
    ls_sql+=" and jc_mmzjx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmzjx.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yddbh","zjxxh","jc_jjzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_jjzjx_zjxyybm","jc_jjzjx_jjzjxje","jc_jjzjx_xcmzjxje","jc_jjzjx_wjzjxje","jc_jjzjx_dqzjxje","jc_jjzjx_zjxze","jc_jjzjx_qrsj","jc_jjzjx_qrr","jc_jjzjx_srksj","jc_jjzjx_rkr","jc_jjzjx_rksm","jc_jjzjx_jhazsj","jc_jjzjx_azwcsj","jc_jjzjx_clzt","jc_jjzjx_lrr","jc_jjzjx_lrsj","jc_jjzjx_dwbh","jc_jjzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmcl/mmzjx/ViewJc_mmzjx.jsp?yddbh="+yddbh;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Ҿ������������ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���������</td>
	<td  width="7%">����״̬</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="10%">������ԭ��</td>
	<td  width="10%">�������ܶ�</td>
	<td  width="8%">�������ʱ��</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="12%">¼�벿��</td>
	<td  width="5%">�ɵ�����</td>
	<td  width="9%">�ɵ�����</td>
	<td  width="9%">Ʒ��</td>
	<td  width="11%">��Ӧ��</td>
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