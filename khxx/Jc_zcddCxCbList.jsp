<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������','E','ɢ��'),DECODE(jc_zcdd.sfjrht,'Y','����','N','������') sfjrht,DECODE(jc_zcdd.sfjs,'N','δ����','Y','�ѽ���') sfjs,crm_khxx.khxm,ysgcjdmc,ppbm,ppmc,gys,zcdlbm,zcxlbm,crm_khxx.hth,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,c.dwmc dm,crm_khxx.sgbz,sq_bzxx.dh,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.dzyy,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.cbze,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtf,jc_zcdd.htcxhdje,jc_zcdd.zjxcbze,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf,jc_zcdd.zjxcxhdje,DECODE(jc_zcdd.hkze+jc_zcdd.zjhze,0,0,ROUND(((jc_zcdd.hkze+jc_zcdd.zjhze)-(jc_zcdd.cbze+jc_zcdd.zjxcbze))*100/(jc_zcdd.hkze+jc_zcdd.zjhze),2))||'%',jc_zcdd.cbze+jc_zcdd.zjxcbze,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje, DECODE(jc_zcdd.jkxz,'1','δ����','2','ȫ��','3','�����������','4','Ԥ�������'), DECODE(jc_zcdd.jkdd,'1','�������ֳ������','2','�����տ�','3','��˾�����տ�'),jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),DECODE(jc_zcdd.xclbz,'1','�Ƕ���','2','����ʽ��Ʒ'),jc_zcdd.lrr,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.khbh,DECODE(jc_zcdd.sfjs,'N','δ����','Y','�ѽ���'),jc_zcdd.jssj,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,sq_bzxx,dm_gcjdbm ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and jc_zcdd.khbh='"+khbh+"' ";
    ls_sql+=" order by ddlx,ppbm ";
//	out.println(ls_sql);
	//ls_sql+=" order by jc_zcdd.lrsj,jc_zcdd.ddbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	//Hashtable spanColHash=new Hashtable();
	//spanColHash.put("khxm","1");//�в����������Hash��
	//spanColHash.put("lxfs","1");//�в����������Hash��
	//spanColHash.put("fwdz","1");//�в����������Hash��
	//spanColHash.put("hth","1");//�в����������Hash��
	//pageObj.setSpanCol(spanColHash);//�в����������Hash��

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
td{	white-space:nowrap;}
</style>
</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���Ķ�����ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(970);
%>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="60px">�������</td>
	<td  width="80px">����״̬</td>
	<td  width="80px">��������</td>
	<td  width="55px">�Ƿ�����װ��ͬ</td>
	<td  width="50px">�Ƿ��ѽ���</td>
	<td  width="80px">�ͻ�����</td>
	<td  width="110px">���̽���</td>
	<td  width="160px">��Ʒ��</td>
	<td  width="120px">Ʒ��</td>
	<td  width="2%">��Ӧ��</td>
	<td  width="120px">���Ĵ���</td>
	<td  width="120px">����С��</td>
	<td  width="70px">��ͬ��</td>
	<td  width="2%">���ݵ�ַ</td>
	<td  width="2%">�μӴ����</td>
	<td  width="60px">��װ���ʦ</td>
	<td  width="120px">ǩԼ����</td>
	<td  width="60px">ʩ���೤</td>
	<td  width="170px">�೤�绰</td>
	<td  width="60px">פ��Ҿӹ���</td>
	<td  width="60px">չ���Ҿӹ���</td>
	<td  width="60px">��ĿרԱ</td>
	<td  width="60px">�Ҿ����ʦ</td>
	<td  width="50px">�ۿ���</td>
	<td  width="300px">����ԭ��</td>
	<td  width="90px"><strong>��ͬ���Ͷ�</strong></td>
	<td  width="90px"><strong>���������Ͷ�</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ�ɱ�</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ��-��ǰ</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong><font color="#0000CC">��ͬ��-�ۺ�</font></strong></td>

	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ���Ϸ�-��ǰ</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong><font color="#0000CC">��ͬ���Ϸ�-�ۺ�</font></strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬԶ�̷�</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ������</strong></td>


	<td  width="90px" bgcolor="#99FFFF"><strong>��ͬ�������</strong></td>
	<td  width="90px"><strong>������ɱ�</strong></td>
	<td  width="90px"><strong>������-��ǰ</strong></td>
	<td  width="90px"><strong><font color="#0000CC">������-�ۺ�</font></strong></td>

	<td  width="90px"><strong>��������Ϸ�-��ǰ</strong></td>
	<td  width="90px"><strong><font color="#0000CC">��������Ϸ�-�ۺ�</font></strong></td>
	<td  width="90px"><strong>������Զ�̷�</strong></td>
	<td  width="90px"><strong>������������</strong></td>
	
	<td  width="90px"><strong>������������</strong></td>


	<td  width="90px" bgcolor="#FFFFCC"><strong>ë����</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>ȫ���ɱ�</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>ȫ���ܶ�-��ǰ</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong><font color="#0000CC">ȫ���ܶ�-��ǰ</font></strong></td>


	<td  width="90px" bgcolor="#FFFFCC"><strong>���Ϸ��ܼ�-��ǰ</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong><font color="#0000CC">���Ϸ��ܼ�-�ۺ�</font></strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>Զ�̷��ܼ�</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>�������ܼ�</strong></td>
	
	<td  width="90px" bgcolor="#FFFFCC"><strong>�����ܶ�</strong></td>
	<td  width="80px">�ͻ���������</td>
	<td  width="110px">����ص�</td>
	<td  width="65px">ǩ��ͬʱ��</td>
	<td  width="65px">����ȷ��ʱ��</td>
	<td  width="65px">��ͬ�ͻ�ʱ��</td>
	<td  width="65px">�ƻ��ͻ�ʱ��</td>
	<td  width="65px">���ͻ�֪ͨʱ��</td>
	<td  width="65px">ʵ�ͻ�ʱ��</td>
	<td  width="65px">���ʱ��</td>
	<td  width="80px">֪ͨ��Ա</td>
	<td  width="320px">�ͻ����</td>
	<td  width="80px">�ȴ��ͻ�֪ͨ</td>
	<td  width="80px">��Ʒ����</td>
	<td  width="45px">¼����</td>
	<td  width="65px">¼��ʱ��</td>
	<td  width="110px">¼�벿��</td>
	<td  width="50px">�ͻ����</td>
	<td  width="50px">�Ƿ��ѽ���</td>
	<td  width="65px">����ʱ��</td>
	<td  width="310px">��ע</td>
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