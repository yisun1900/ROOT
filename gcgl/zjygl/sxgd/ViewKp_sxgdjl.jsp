<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sxjlh=null;
	sxjlh=request.getParameter("sxjlh");
	String yhdlm=(String)session.getAttribute("yhdlm");

	ls_sql="SELECT kp_sxgdjl.sxsj,crm_khxx.khxm,crm_khxx.khbh,ysgcjdmc,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,sgdmc,crm_khxx.zjxm  ";
	ls_sql+=" FROM crm_khxx,kp_sxgdjl,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d  ";
    ls_sql+=" where kp_sxgdjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+)";
    ls_sql+=" and kp_sxgdjl.sxjlh="+sxjlh+" and kp_sxgdjl.yhdlm='"+yhdlm+"'";
    ls_sql+=" order  by kp_sxgdjl.sxjlh,crm_khxx.fwdz";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//������ʾ��
	String[] disColName={"sxsj","khxm","ysgcjdmc","ybysxmbm","zqysxmbm","fwdz","hth","sjs","kgrq","sjkgrq","jgrq","sgdmc","zjxm"};
	pageObj.setDisColName(disColName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ�����ɸѡ��¼�ţ�<%=sxjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">ɸѡʱ��</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="6%">���̽���</td>
	<td  width="8%">���ι�������</td>
	<td  width="8%">��������</td>
	<td  width="23%">���ݵ�ַ</td>
	<td  width="7%">��ͬ��</td>
	<td  width="5%">���ʦ</td>
	<td  width="7%">��ͬ��������</td>
	<td  width="7%">ʵ�ʿ�������</td>
	<td  width="7%">��ͬ��������</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">���̵���</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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