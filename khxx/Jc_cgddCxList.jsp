<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_cgdd.ddbh,clztmc,ysgcjdmc,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh,crm_khxx.sjs,DECODE(jc_cgdd.sfpsjs,'1','��','2','��') sfpsjs, jc_cgdd.cgsjs,sq_dwxx.dwmc dm,cxhdbm,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,jc_cgdd.pgcsj,jc_cgdd.pdgc,jc_cgdd.pdgcmc,jc_cgdd.gys,jc_cgdd.ppmc,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,jc_cgdd.dj,TO_CHAR(jc_cgdd.cgzkl) cgzkl,TO_CHAR(jc_cgdd.tmzkl) tmzkl,TO_CHAR(jc_cgdd.wjzkl) wjzkl,TO_CHAR(jc_cgdd.dqzkl) dqzkl,jc_cgdd.dzyy,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.wdzje,jc_cgdd.zqgtbfje,jc_cgdd.zqtmbfje,jc_cgdd.zqwjhtze,jc_cgdd.zqdqhtze   ,jc_cgdd.zjhze,jc_cgdd.gtzjje,jc_cgdd.tmzjje,jc_cgdd.wjzjje,jc_cgdd.dqzjje ,jc_cgdd.zqzjhze,jc_cgdd.zqgtzjje,jc_cgdd.zqtmzjje,jc_cgdd.zqwjzjje,jc_cgdd.zqdqzjje  ,jc_cgdd.lrr,jc_cgdd.lrsj,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx,crm_khxx,dm_gcjdbm,sq_bzxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)  ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
    ls_sql+=" and jc_cgdd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_cgdd.ddbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���񶩵���ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(660);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">�������</td>
	<td  width="120px">����״̬</td>
	<td  width="90px">���̽���</td>
	<td  width="100px">�ͻ�����</td>
	<td  width="70px">��ͬ��</td>
	<td  width="310px">���ݵ�ַ</td>
	<td  width="120px">�೤</td>
	<td  width="290px">�೤�绰</td>
	<td  width="80px">��װ���ʦ</td>
	<td  width="70px">�������ʦ </td>
	<td  width="70px">�Ҿ����ʦ</td>
	<td  width="160px">ǩԼ����</td>
    <td  width="290px">�����</td>
	<td  width="70px">��ĿרԱ</td>
	<td  width="70px">פ��Ҿӹ���</td>
	<td  width="70px">չ���Ҿӹ���</td>
	<td  width="90px">��������</td>
	<td  width="90px">��������</td>
	<td  width="90px">ǩԼ����</td>
	<td  width="90px">��ͬ��װ����</td>
	<td  width="90px">��װ��ʼ����</td>
	<td  width="90px">��װ�������</td>
	<td  width="90px">ȷ���˵�����</td>
	<td  width="90px">�ɹ���ʱ��</td>
    <td  width="70px">���ɹ������</td>
    <td  width="220px">��������</td>
    <td  width="220px">��Ӧ��</td>
    <td  width="220px">Ʒ��</td>
    <td  width="180px">�����ʽ</td>
    <td  width="180px">������</td>
    <td  width="180px">����ɫ</td>
    <td  width="180px">̨��Ʒ��</td>
    <td  width="180px">̨�滨ɫ</td>
    <td  width="180px">��������</td>
    <td  width="180px">����</td>
	<td  width="80px">��ȡ����</td>
	<td  width="80px">�����ۿ���</td>
	<td  width="80px">̨���ۿ���</td>
	<td  width="80px">����ۿ���</td>
	<td  width="80px">�����ۿ���</td>
	<td  width="400px">����ԭ��</td>
	<td  width="120px"><font color="#000099"><strong>��ͬ�ܶ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>�����ͬ���-�ۺ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>̨���ͬ���-�ۺ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>����ͬ���-�ۺ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>������ͬ���-�ۺ�</strong></font></td>
	<td  width="120px"><strong>δ���ۺ�ͬ��</strong></td>
	<td  width="120px"><strong>�����ͬ���-��ǰ</strong></td>
	<td  width="120px"><strong>̨���ͬ���-��ǰ</strong></td>
	<td  width="120px"><strong>����ͬ���-��ǰ</strong></td>
	<td  width="120px"><strong>������ͬ���-��ǰ</strong></td>
	<td  width="120px"><font color="#000099"><strong>�������ܶ�-�ۺ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>������������-�ۺ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>̨����������-�ۺ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>�����������-�ۺ�</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>������������-�ۺ�</strong></font></td>
	<td  width="120px"><strong>�������ܶ�-��ǰ</strong></td>
	<td  width="120px"><strong>������������-��ǰ</strong></td>
	<td  width="120px"><strong>̨����������-��ǰ</strong></td>
	<td  width="120px"><strong>�����������-��ǰ</strong></td>
	<td  width="120px"><strong>������������-��ǰ</strong></td>
	<td  width="70px">¼����</td>
	<td  width="90px">¼��ʱ��</td>
	<td  width="60px">�ͻ����</td>
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