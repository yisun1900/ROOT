<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String day=request.getParameter("day");
	String qssj=request.getParameter("qssj");
	String jzsj=request.getParameter("jzsj");



	ls_sql=" select '',crm_tsjl.tsjlh,crm_tsjl.khbh,crm_tsjl.khxm,crm_tsjl.fwdz,crm_tsjl.sjs,sgdmc sgd,crm_tsjl.zjy,slfsmc,tslxmc,tsyymc,slsj,b.dwmc slbm,yhmc,DECODE(clzt,0,'�ǿͷ��Ǽ�',1,'�ͷ�����',2,'�ڴ���',3,'�᰸')";
	ls_sql+=" from crm_tsjl,dm_slfsbm,dm_tslxbm,dm_tsyybm,sq_sgd,sq_dwxx b,sq_yhxx";
	ls_sql+=" where crm_tsjl.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tslxbm=dm_tslxbm.tslxbm ";
	ls_sql+=" and crm_tsjl.sgd=sq_sgd.sgd(+) and crm_tsjl.slbm=b.dwbh(+) and crm_tsjl.slr=sq_yhxx.yhdlm(+)";

	ls_sql+=" and zxhfsj is null and lx='2' and clzt!='3'";
	ls_sql+=" and ROUND(SYSDATE-slsj)="+day;
	
	ls_sql+=" order by crm_tsjl.slsj,crm_tsjl.tsjlh";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

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
  <B><font size="2">Ͷ��<%=day%>�������δ�ط���ϸ
  <BR>(����ʱ�䣺<%=qssj%>--<%=jzsj%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="6%">Ͷ�߼�¼��</td>
	<td  width="6%">�ͻ����</td>
	<td  width="5%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ʼ�Ա</td>
	<td  width="5%">����ʽ</td>
	<td  width="7%">����</td>
	<td  width="11%">С��</td>
	<td  width="7%">����ʱ��</td>
	<td  width="7%">������</td>
	<td  width="5%">������</td>
	<td  width="5%">����״̬</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>
</body>
</html>