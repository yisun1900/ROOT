<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String jjgwmc=request.getParameter("jjgwmc");//���մӱ�����jjgwmc
	jjgwmc=URLDecoder.decode(jjgwmc,"UTF-8");//����jjgwmc

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_zcdd.ddbh,clztmc,zcxlbm,ppbm,crm_khxx.khxm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy, DECODE(jc_zcdd.jkxz,'1','δ����','2','ȫ��','3','�����������','4','Ԥ�������','5','�˻������'), DECODE(jc_zcdd.jkdd,'1','�������ֳ������','2','�����տ�','3','��˾�����տ�'), DECODE(jc_zcdd.ddshbz,'1','�������','2','����δ֪ͨ','3','������֪ͨ'),jc_zcdd.hkze,zjhze, DECODE(jc_zcdd.xclbz,'1','�������','2','�ȴ�����֪ͨ','3','������֪ͨ','4','�Ѳ���'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,jdm_zcddzt";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh ";
    ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.khbh='"+khbh+"' ";
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
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���Ķ�����ϸ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�������</td>
	<td  width="5%">����״̬</td>
	<td  width="6%">����С��</td>
	<td  width="7%">Ʒ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">פ��Ҿӹ���</td>
	<td  width="4%"><font color=red>չ���Ҿӹ���</font></td>
	<td  width="4%">��ĿרԱ</td>
	<td  width="5%">�ͻ���������</td>
	<td  width="6%">����ص�</td>
	<td  width="5%">�ȴ��ͻ�֪ͨ</td>
	<td  width="6%">��ͬ�ܶ�</td>
	<td  width="6%">��������</td>
	<td  width="4%">�����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
	<td  width="9%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
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