<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");
	String wheresql="";
	String xmzymc="";
	if (zdyhbz.equals("Y"))
	{
		xmzymc="ȫ����ĿרԱ";
	}
	else 
	{
		xmzymc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
		wheresql+=" and jc_cgdd.xmzy='"+xmzymc+"'";
	}

	String ls_sql=null;


	ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.clgw,jc_cgdd.xmzy,jc_cgdd.khbh as khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs,jgrq, DECODE(jc_cgdd.clzt,'00','Ԥ����δ���','01','Ԥ���������','02','���ɵ�','03','�ѳ���','04','�Ѹ���','05','ǩ����ͬ','06','��ͬ��ȷ��','07','�����','08','�Ѱ�װ') as jc_cgdd_clzt, DECODE(jc_cgdd.khlx,'1','װ�޿ͻ�','2','����ͻ�') as jc_cgdd_khlx,jc_cgdd.khxm as jc_cgdd_khxm,jc_cgdd.fwdz as jc_cgdd_fwdz,jc_cgdd.hth as jc_cgdd_hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_cgdd,sq_dwxx,crm_khxx  ";
    ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh and jc_cgdd.khbh=crm_khxx.khbh ";
	ls_sql+=" and jgrq-SYSDATE<25";
	ls_sql+=" and jc_cgdd.clzt<'05'";
	ls_sql+=wheresql;
	ls_sql+=" order by jgrq-SYSDATE";
//	out.println(ls_sql);
	
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"ddbh","jc_cgdd_clzt","jc_cgdd_khxm","jc_cgdd_hth","jgrq","clgw","xmzy","jc_cgdd_dj","jc_cgdd_cgsjs","jc_cgdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jc_cgdd_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
  <B><font size="3">����ǩ��ͬ���ڣ���ĿרԱ��<%=xmzymc%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�������</td>
	<td  width="10%">����״̬</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="7%">��ͬ��</td>
	<td  width="8%">��ͬ��������</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="7%">��ĿרԱ</td>
	<td  width="6%">����</td>
	<td  width="6%">�Ҿ����ʦ</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="19%">¼�벿��</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>