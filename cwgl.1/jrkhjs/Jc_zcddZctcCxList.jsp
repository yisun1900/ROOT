<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������'),zctcmc,DECODE(jc_zcdd.sfjrht,'Y','����','N','������') sfjrht,ppbm,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.zqzjhze,jc_zcdd.zjhze ,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.qhtsj,jc_zcdd.clgw,jc_zcdd.jssj,jc_zcdd.bz";
	ls_sql+=" FROM jc_zcdd,sq_dwxx a, jdm_zcddzt  ";
	ls_sql+=" where  jc_zcdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
 	ls_sql+=" and  (jc_zcdd.khbh='"+khbh+"')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09����ͬ�����
	ls_sql+=" and ddlx in('6','7','8','B','C')";//1������Ʒ��B:��������շѡ�C:ѡ�����ģ�3����¼��ͬ��4���п�涩����5���ײͷֽⶩ����6���Ҿ߽����ײͣ�7����ů�����ײͣ�8�������ײͣ�9��tcmc��������
	ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.ddbh";
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


//	out.println(ls_sql);

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);



//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


%>

<html>
<head>
<title>�����ײ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ײ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(130);
%>

<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="5%">�������</td>
	<td  width="6%">����״̬</td>
	<td  width="6%">��������</td>
	<td  width="8%">�ײ�����</td>
	<td  width="4%">�Ƿ�����ͬ</td>
	<td  width="6%">��Ʒ��</td>
	<td  width="6%">��ͬ��-��ǰ</td>
	<td  width="6%">��ͬ��-�ۺ�</td>
	<td  width="6%">������-��ǰ</td>
	<td  width="6%">������-�ۺ�</td>
	<td  width="6%">ȫ���ܶ�-��ǰ</td>
	<td  width="6%">ȫ���ܶ�-��ǰ</td>
	<td  width="6%">ǩ��ͬʱ��</td>
	<td  width="4%">���Ϲ���</td>
	<td  width="6%">����ʱ��</td>
	<td  width="56%">��ע</td>
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