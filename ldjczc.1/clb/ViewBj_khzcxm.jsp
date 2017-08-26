<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj =new ybl.common.PageObject();

	String ls_sql=null;

	String fgsbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));
	String zcdlbm=request.getParameter("zcdlbm");

	ls_sql="SELECT bjjbmc,bj_khzcxm.khbh,crm_khxx.khxm,NVL(bj_khzcxm.fjddbh,'&nbsp;') ddbh,bj_khzcxm.cpmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.xdjldw,TO_CHAR(bj_khzcxm.jsj),bj_khzcxm.xdsl,ROUND(bj_khzcxm.jsj*bj_khzcxm.xdsl,2),bj_khzcxm.gysmc  ";
	ls_sql+=" FROM bj_khzcxm,crm_khxx,bdm_bjjbbm  ";
    ls_sql+=" where bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.khbh=crm_khxx.khbh";
	ls_sql+=" and bj_khzcxm.ddcljjfs in('0','1')";//0���ײ����ģ�1�������������ģ�2����������շ����ģ�3���ײ�ѡ������
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and bj_khzcxm.ppmc='"+ppbm+"'";
	ls_sql+=" and bj_khzcxm.tccpdlbm='"+zcdlbm+"'";
    ls_sql+=" order by bj_khzcxm.tccpdlbm,bj_khzcxm.ppmc,bj_khzcxm.bjjbbm,bj_khzcxm.khbh,bj_khzcxm.fjddbh ";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("bjjbmc","1");//�в����������Hash��
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fjddbh","1");//�в����������Hash��
	spanColHash.put("gysmc","2");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ӧ�����۱���Ʒ��:<%=ppbm%>��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���ۼ���</td>
	<td  width="6%">�ͻ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="7%">����</td>
	<td  width="13%">��Ʒ����</td>
	<td  width="13%">�ͺ�</td>
	<td  width="13%">���</td>
	<td  width="5%">������λ</td>
	<td  width="5%">����</td>
	<td  width="6%">����</td>
	<td  width="7%">���</td>
	<td  width="16%">��Ӧ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</table>
</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>