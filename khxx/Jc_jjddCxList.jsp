<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_jjdd.ddbh,clztmc,ysgcjdmc ,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh ,crm_khxx.sjs,sq_dwxx.dwmc dm ,DECODE(jc_jjdd.sfpsjs,'1','��Ҫ','2','��') sfpsjs,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,cxhdbm,jc_jjdd.pgcsj,jc_jjdd.pdgc,jc_jjdd.pdgcmc,jc_jjdd.jjppmc,jc_jjdd.jjgys,jc_jjdd.xcmgc,jc_jjdd.xcmgcmc,jc_jjdd.xcmppmc,jc_jjdd.xcmgys,jc_jjdd.qhtsj,jc_jjdd.sccsj,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,TO_CHAR(jc_jjdd.jjzkl) jjzkl,jc_jjdd.dzyy,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.cpjjje,jc_jjdd.wdzje,jc_jjdd.zqjjje,jc_jjdd.zqxcmje,jc_jjdd.zqcpjjje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.cpjjzjje,jc_jjdd.zqzjhze,jc_jjdd.zqjjzjje,jc_jjdd.zqxcmzjje,jc_jjdd.zqcpjjzjje,jc_jjdd.lrr,jc_jjdd.lrsj,jc_jjdd.khbh  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx,crm_khxx,sq_bzxx,dm_gcjdbm";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=" and jc_jjdd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_jjdd.ddbh";
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
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�Ҿ߶�����ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(520);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">�������</td>
	<td  width="110px">����״̬</td>
	<td  width="70px">���̽���</td>
	<td  width="110px">�ͻ�����</td>
	<td  width="70px">��ͬ��</td>
	<td  width="240px">���ݵ�ַ</td>
	<td  width="80px">�೤</td>
	<td  width="200px">�೤�绰</td>
	<td  width="70px">��װ���ʦ</td>
	<td  width="150px">ǩԼ����</td>
	<td  width="50px">�����ʦ</td>
	<td  width="70px">�Ҿ����ʦ</td>
	<td  width="70px">��ĿרԱ</td>
	<td  width="70px">פ��Ҿӹ���</td>
	<td  width="70px">չ���Ҿӹ���</td>
    <td  width="200px">�����</td>
	<td  width="80px">�ɹ���ʱ��</td>
	<td  width="60px">�Ҿ߹���</td>
	<td  width="140px">�Ҿ߹���</td>
	<td  width="120px">�Ҿ�Ʒ��</td>
	<td  width="180px">�Ҿ߹�Ӧ��</td>
	<td  width="60px">�Ͳ���</td>
	<td  width="140px">�Ͳ��Ź���</td>
	<td  width="120px">�Ͳ���Ʒ��</td>
	<td  width="180px">�Ͳ��Ź�Ӧ��</td>
	<td  width="80px">ǩԼ����</td>
	<td  width="80px">��������</td>
	<td  width="80px">��ͬ��װ����</td>
	<td  width="80px">��ʼ��װʱ��</td>
	<td  width="80px">��װ�������</td>
	<td  width="80px">ȷ���˵�����</td>
	<td  width="80px">����</td>
	<td  width="60px">�ۿ���</td>
	<td  width="350px">����ԭ��</td>
	<td  width="100px"><font color="#0000CC"><strong>��ͬ�ܶ�-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ҿߺ�ͬ���-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ͳ��ź�ͬ���-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>��Ʒ�Ҿߺ�ͬ���-�ۺ�</strong></font></td>
	<td  width="100px"><strong>��ͬ�ܶ�-��ǰ</strong></td>
	<td  width="100px"><strong>�Ҿߺ�ͬ���-��ǰ</strong></td>
	<td  width="100px"><strong>�Ͳ��ź�ͬ���-��ǰ</strong></td>
	<td  width="100px"><strong>��Ʒ�Ҿߺ�ͬ���-��ǰ</strong></td>
	<td  width="100px"><font color="#0000CC"><strong>�������ܶ�-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ҿ���������-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>�Ͳ�����������-�ۺ�</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>��Ʒ�Ҿ���������-�ۺ�</strong></font></td>
	<td  width="100px"><strong>�������ܶ�-��ǰ</strong></td>
	<td  width="100px"><strong>�Ҿ���������-��ǰ</strong></td>
	<td  width="100px"><strong>�Ͳ�����������-��ǰ</strong></td>
	<td  width="100px"><strong>��Ʒ�Ҿ���������-��ǰ</strong></td>
	<td  width="60px">¼����</td>
	<td  width="80px">¼��ʱ��</td>
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