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



	ls_sql="SELECT '',crm_zxkhxx.khbh,khxm,fwdz,crm_zxkhxx.sjs,crm_zxkhxx.khjl,crm_zxkhxx.ywy,crm_zxkhxx.hth,sjhtje,qsjhtsj,fwmj,sjf,jsjfsj,crm_zxkhxx.lrsj,zjsmsj,smcs";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where qsjhtbz='Y' ";
	ls_sql+=" and qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=" order by qsjhtsj";

//	out.println(ls_sql);

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
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ƺ�ͬ�ͻ���<%=dwmc%>��
  <BR>(ǩ��ƺ�ͬʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�ͻ����</td>
	<td  width="6%">����</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="4%">ҵ��Ա</td>
	<td  width="6%">��ƺ�ͬ��</td>
	<td  width="6%">��ƺ�ͬ���</td>
	<td  width="6%">ǩ��ƺ�ͬʱ��</td>
	<td  width="5%">�������</td>
	<td  width="7%">ʵ����Ʒѽ��</td>
	<td  width="6%">�տ�ʱ��</td>
	<td  width="6%">���ʱ��</td>
	<td  width="6%">�������ʱ��</td>
	<td  width="5%">���Ŵ���</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>