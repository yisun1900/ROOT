<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String dwbh=request.getParameter("dwbh");
	String jzrq=request.getParameter("jzrq");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',sjs,DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),khbh,hth,khxm,qyrq,tdsj,sgdmc,zjxm,wdzgce,qye,suijin,suijinbfb,sjf,guanlif,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy ";
	ls_sql+=" FROM crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_khxx.yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD') and crm_khxx.dwbh='"+dwbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" order by zt desc,crm_khxx.fgsbh,crm_khxx.dwbh,sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">����ǩԼ��ϸ��<%=dwmc%>��
  <b>(ҵ����תʱ�䣺<%=jzrq%>)</b><BR>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">�˵�ʱ��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�</td>
	<td  width="4%">��ǰ��ͬ��</td>
	<td  width="4%">�ۺ��ͬ��</td>
	<td  width="3%">˰��</td>
	<td  width="2%">˰��ٷֱ�</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">�����</td>
	<td  width="3%">��ǰ�ۼƹ���������</td>
	<td  width="3%">�ۺ��ۼƹ���������</td>
	<td  width="2%">������˰��</td>
	<td  width="3%">�ۼƼ�������</td>
	<td  width="3%">�ۼƼ����������</td>
	<td  width="2%">ʵ���ۿ���</td>
	<td  width="4%">�μӴ����</td>
	<td  width="4%">��װʵ�����</td>
	<td  width="2%">��װ�������</td>
	<td  width="3%">�״θ���װ��ʱ��</td>
	<td  width="3%">��װ�������ʱ��</td>
	<td  width="4%">�����װʵ�տ��</td>
	<td  width="2%">�����װ�տ�����</td>
	<td  width="3%">�����״��ռ�װ��ʱ��</td>
	<td  width="3%">�����װ����տ�ʱ��</td>
	<td  width="2%">ҵ��Ա</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>