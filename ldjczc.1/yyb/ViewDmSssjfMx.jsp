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



	ls_sql="SELECT '',crm_zxkhxx.sjs,crm_zxkhxx.khbh,khxm,fwdz,crm_zxkhxx.khjl,crm_zxkhxx.hth,TO_CHAR(sjhtje) sjhtje,qsjhtsj,TO_CHAR(fwmj),DECODE(sjfbz,'N','δ����Ʒ�','Y','�ѽ���','T','����Ʒ�'),cw_khfkjl.fkje,cw_khfkjl.sjsj,crm_zxkhxx.lrsj,sczbjsj,zjsmsj,smcs";
	ls_sql+=" FROM crm_zxkhxx,cw_khfkjl ";
	ls_sql+=" where crm_zxkhxx.khbh=cw_khfkjl.khbh ";
	ls_sql+=" and cw_khfkjl.dwbh='"+dwbh+"' and cw_khfkjl.fklxbm='53' and cw_khfkjl.scbz='N'";
	ls_sql+=" and cw_khfkjl.fkje>0 and cw_khfkjl.zffs!='31'";//11:�ֽ�12��֧Ʊ��13�����ۣ�14�����п���15������ת�ʣ�16���ֽ�ȯ��31��ת����99������
	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by crm_zxkhxx.sjs,cw_khfkjl.sjsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("khjl","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("sjhtje","1");//�в����������Hash��
	spanColHash.put("qsjhtsj","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

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
  <B><font size="3">ʵ����Ʒѿͻ���<%=dwmc%>��
  <BR>(ʵ����Ʒ�ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">�ͻ����</td>
	<td  width="6%">����</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="6%">��ƺ�ͬ��</td>
	<td  width="6%">��ƺ�ͬ���</td>
	<td  width="6%">ǩ��ƺ�ͬʱ��</td>
	<td  width="5%">�������</td>
	<td  width="6%">������Ʒ�</td>
	<td  width="6%">ʵ����Ʒѽ��</td>
	<td  width="6%">ʵ����Ʒ�ʱ��</td>
	<td  width="6%">���ʱ��</td>
	<td  width="6%">�״�������ʱ��</td>
	<td  width="6%">�������ʱ��</td>
	<td  width="4%">���Ŵ���</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>