<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");


	ls_sql="SELECT  yddbh,clztmc,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.pdgc,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,c.dwmc,ysgcjdmc,cxhdbm,jc_mmydd.sccsj,jc_mmydd.htrq,jc_mmydd.jhazsj,kazsj,aztzsj,jc_mmydd.azkssj,jc_mmydd.azjssj,jc_mmydd.tdsj,TO_CHAR(jc_mmydd.mmzkl) mmzkl,jc_mmydd.dzyy,jc_mmydd.wdzje,jc_mmydd.htje,jc_mmydd.zqzjhze,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����') wjqk,DECODE(jc_mmydd.wjsgsbz,'Y','���͹�˾','N','δ�͹�˾') wjsgsbz,jc_mmydd.lrr,jc_mmydd.lrsj,jc_mmydd.khbh ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx c,jdm_mmyddzt,dm_gcjdbm  ";
    ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=c.dwbh(+) and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and jc_mmydd.khbh='"+khbh+"'";
    ls_sql+=" order by yddbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yddbh","khbh","crm_khxx_khxm","crm_khxx_hth","jc_mmydd_wjqk","jc_mmydd_sqdj","jc_mmydd_clgw","jc_mmydd_pdgc","jc_mmydd_htje","jc_mmydd_wjsgsbz","jc_mmydd_clzt","jc_mmydd_lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ľ�Ŷ�����ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">Ԥ�������</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">�ɵ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="2%">��װ���ʦ</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="2%">���̽���</td>
    <td  width="6%">�����</td>
	<td  width="3%">��������</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">��ͬ��װ����</td>
	<td  width="3%">Э�̰�װʱ��</td>
	<td  width="3%">֪ͨ��װʱ��</td>
	<td  width="3%">��װ��ʼ����</td>
	<td  width="3%">��װ��������</td>
	<td  width="3%">ȷ���˵�����</td>
	<td  width="2%">�ۿ���</td>
	<td  width="10%">����ԭ��</td>
	<td  width="3%">��ǰ��ͬ��</td>
	<td  width="3%">��ͬ���</td>
	<td  width="3%">�������ܶ�-��ǰ</td>
	<td  width="3%">�������ܶ�-�ۺ�</td>
	<td  width="3%">������</td>
	<td  width="3%">�Թ������͹�˾</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">�ͻ����</td>
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