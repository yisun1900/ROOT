<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sqbh=request.getParameter("sqbh");

	ls_sql="SELECT sgdmc,crm_khxx.khbh khbh,crm_khxx.khxm,crm_khxx.fwdz,ybjyxq,fgflmc,zxjwmc,hxmc,hxmjmc,ysmc,ybj_fpybj.fpsj as ybj_fpybj_fpsj  ";
	ls_sql+=" FROM ybj_fpybj,crm_khxx,ybj_cgsq,sq_sgd  ";
	ls_sql+=" ,dm_fgflbm,dm_hxmjbm,dm_hxbm,dm_ysbm,dm_zxjwbm";
    ls_sql+=" where ybj_fpybj.khbh=crm_khxx.khbh and ybj_fpybj.sqbh=ybj_cgsq.sqbh ";
    ls_sql+=" and crm_khxx.ysbm=dm_ysbm.ysbm and crm_khxx.hxbm=dm_hxbm.hxbm and crm_khxx.sgd=sq_sgd.sgd";
    ls_sql+=" and crm_khxx.hxmjbm=dm_hxmjbm.hxmjbm and crm_khxx.zxjwbm=dm_zxjwbm.zxjwbm and crm_khxx.fgflbm=dm_fgflbm.fgflbm";
    ls_sql+=" and ybj_fpybj.sqbh="+sqbh;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"sqbh","crm_khxx_ybjmc","crm_khxx_fgflbm","crm_khxx_zxjwbm","crm_khxx_hxmjbm","crm_khxx_sgjdbm","crm_khxx_kcgqkbm","crm_khxx_ysbm","ybj_fpybj_fpsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
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
//���ð�ť����
	String[] buttonName={"ɾ���ѷ��������"};//��ť����ʾ����
	String[] buttonLink={"DeleteYbj_fpybj.jsp?sqbh="+sqbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sqbh","1");//�в����������Hash��
	spanColHash.put("sgdmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">�ѷ���������б�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="7%">ʩ����</td>
	<td  width="8%">�������</td>
	<td  width="6%">����</td>
	<td  width="20%">������ַ</td>
	<td  width="10%">��Ч��</td>
	<td  width="6%">���</td>
	<td  width="8%">��λ</td>
	<td  width="8%">����</td>
	<td  width="8%">���</td>
	<td  width="6%">��ɫ</td>
	<td  width="10%">����ʱ��</td>
</tr>
<%
	pageObj.displayDate();
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