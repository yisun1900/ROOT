<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	
	ls_sql="SELECT '',crm_zxkhxx.lfdj,TO_CHAR(crm_zxkhxx.jlfdjsj,'YYYY-MM-DD') jlfdjsj,crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ') jzbz,crm_zxkhxx.cxhdbm,b.dwmc ssfgs,a.dwmc qydm,TO_CHAR(crm_zxkhxx.lrsj,'YYYY-MM-DD HH24:MI') lrsj";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_zxkhxx.lfdjbz='Y' and crm_zxkhxx.ssfgs='"+fgsbh+"'";
    ls_sql+=" and crm_zxkhxx.zxdm=a.dwbh(+) and crm_zxkhxx.ssfgs=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.zxzt in ('3') ";
	ls_sql+=" order by crm_zxkhxx.lfdj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fwdz",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������������ǩ����
  <BR>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="8%">��������</td>
	<td  width="7%">����������ʱ��</td>
	<td  width="7%">�ͻ����</td>
	<td  width="6%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">��װ��־</td>
	<td  width="10%">�����</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="10%">��ѯ����</td>
	<td  width="12%">¼��ʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>