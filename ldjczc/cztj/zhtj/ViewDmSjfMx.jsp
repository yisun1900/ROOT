<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");


	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),crm_zxkhxx.sjhtje,crm_zxkhxx.qsjhtsj,sjf,jsjfsj,crm_zxkhxx.fwdz,b.dwmc as zxdm,crm_zxkhxx.sjs,khjl,ywy,dzbjze,bjjbmc,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),crm_zxkhxx.lrsj,fwlxmc";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx b,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=" and crm_zxkhxx.qsjhtbz='Y'";
	ls_sql+=" and crm_zxkhxx.qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" order by b.dwmc,khxm";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);



//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<noscript><iframe scr="*.htm"></iframe></noscript>

<CENTER >
  <B><font size="3">��ƺ�ͬ��ϸ��<%=dwmc%>��</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�ͻ����</td>
	<td  width="4%">����</td>
	<td  width="3%">��ѯ״̬</td>
	<td  width="3%">��ƺ�ͬ���</td>
	<td  width="4%">ǩ��ƺ�ͬʱ��</td>
	<td  width="3%">ʵ����Ʒ�</td>
	<td  width="4%">����Ʒ�ʱ��</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="4%">��ѯ����</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ҵ��Ա</td>
	<td  width="4%">���ӱ����ܶ�</td>
	<td  width="3%">���ۼ���</td>
	<td  width="4%">��װ����</td>
	<td  width="4%">����װ����ʱ��</td>
	<td  width="7%">�μӴ����</td>
	<td  width="4%">�ײ����򶩽�</td>
	<td  width="4%">���ײ����򶩽�ʱ��</td>
	<td  width="4%">����ʱ��</td>
	<td  width="4%">��ƽ��ͼʱ��</td>
	<td  width="4%">��Ч��ͼʱ��</td>
	<td  width="4%">��ʩ��ͼʱ��</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="3%">��������</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>