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



	ls_sql="SELECT crm_zxkhxx.khbh,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,crm_zxkhxx.ywy,dwmc,TO_CHAR(crm_zxkhxx.lrsj,'YYYY-MM-DD HH24:MI'),crm_zxkhxx.jlfdjsj,crm_zxkhxx.jhddjsj";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx";
    ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) ";
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"' ";

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ls_sql+=" and (MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jlfdjsj)>3 OR MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jhddjsj)>3)";

	ls_sql+=" order by crm_zxkhxx.lrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
//	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������δ������������<%=dwmc%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ͻ����</td>
	<td  width="7%">״̬</td>
	<td  width="9%">����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="9%">���ʦ</td>
	<td  width="8%">ҵ��Ա</td>
 	<td  width="12%">��ѯ����</td>
	<td  width="12%">��ѯ�ͻ�¼��ʱ��</td>
	<td  width="8%">����ƶ���ʱ��</td>
	<td  width="8%">�������ʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table>
</body>
</html>