<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String jsjlh=request.getParameter("gdjsjlh");

	String ls_sql=null;

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','����','N','��') sftsqk,crm_tsjl.tsnr,crm_tsjl.yqjjsj,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','�ǿͷ��Ǽ�','1','�ͷ�����','2','�ڴ���','3','�᰸','9','������') jazt,crm_wxfmx.wxzfy,crm_wxfmx.zrfcdfy,DECODE(crm_wxfmx.jsbz,'N','δ����','Y','�ѽ���') jsbz,crm_wxfmx.jsjlh";
	ls_sql+=" FROM crm_khxx,crm_tsjl,sq_sgd,crm_wxfmx";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsjl.tsjlh=crm_wxfmx.tsjlh";
    ls_sql+=" and crm_wxfmx.jsjlh='"+jsjlh+"' ";
    ls_sql+=" order by crm_tsjl.tsjlh,crm_wxfmx.lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"sgd","khxm","tsjlh","sftsqk","tsnr","slsj","jazt","wxzfy","zrfcdfy","jsbz","jsjlh"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgd","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("tsjlh","1");//�в����������Hash��
	spanColHash.put("sftsqk","1");//�в����������Hash��
	spanColHash.put("tsnr","1");//�в����������Hash��
	spanColHash.put("slsj","1");//�в����������Hash��
	spanColHash.put("jazt","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ά�޼�¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">ʩ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">���޼�¼��</td>
	<td  width="5%">�Ƿ��������</td>
	<td  width="25%">��������</td>
	<td  width="7%">����ʱ��</td>
	<td  width="7%">�᰸״̬</td>
	<td  width="9%">ά���ܷ���</td>
	<td  width="9%">ʩ���ӳе�����</td>
	<td  width="6%">�����־</td>
	<td  width="8%">�����¼��</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>