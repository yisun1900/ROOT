<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	String copykhbh=request.getParameter("copykhbh");
	String khxm=cf.GB2Uni(request.getParameter("khxm"));
	String ssfgs=request.getParameter("ssfgs");

	String khbh=request.getParameter("khbh");
	String dqbm=request.getParameter("dqbm");

	ls_sql="SELECT crm_zxkhxx.khxm,cqmc,crm_zxkhxx.xqbm,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�����˻ؿͻ�','3','��ǩԼ','4','��˾ǩ��ʧ��','5','���·������'),dzbjze,bjjbmc,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),sq_dwxx.dwmc as zxdm,sjs,lrsj,crm_zxkhxx.khbh as khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx,bdm_bjjbbm,dm_cqbm ";
    ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and crm_zxkhxx.cqbm=dm_cqbm.cqbm(+)";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.ssfgs='"+ssfgs+"' and crm_zxkhxx.khxm='"+khxm+"' and crm_zxkhxx.khbh='"+copykhbh+"'";
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","CopyKhbj.jsp?drkhbh="+khbh+"&dqbm="+dqbm);
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���Ʊ��ۡ���ͬ���ʦ��Ҳ�ɸ��Ʊ��ۡ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="8%">����</td>
	<td  width="8%">����</td>
	<td  width="14%">С��/�ֵ�</td>
	<td  width="8%">��ѯ״̬</td>
	<td  width="10%">���ӱ����ܶ�</td>
	<td  width="7%">���ۼ���</td>
	<td  width="6%">��װ��־</td>
	<td  width="13%">��ѯ����</td>
	<td  width="7%">���ʦ</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="6%">�ͻ����</td>
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