<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String day=request.getParameter("day");
	String qssj=request.getParameter("qssj");
	String jzsj=request.getParameter("jzsj");
	String hflxbm=request.getParameter("hflxbm");
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");


	ls_sql="SELECT distinct '',crm_hfjl.hfjlh as hfjlh,crm_hfjl.khbh as khbh,khxm,fwdz,sjs,sgdmc,zjxm,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[��]��'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[��]��'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[��]��'||sgdhfnr) as hfnr,yhfrq,crm_hfjl.hfsj,yhmc";
	ls_sql+=" FROM crm_hfjl,crm_khxx,crm_gchffkbm,sq_sgd,sq_yhxx,dm_jglxbm   ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_hfjl.jglxbm=dm_jglxbm.jglxbm";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+)";
	ls_sql+=" and crm_hfjl.hflxbm='"+hflxbm+"' and crm_hfjl.hfr=trim(sq_yhxx.yhdlm(+))";

	ls_sql+=" and hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and hfsj-yhfrq="+day;
	ls_sql+=" order by hfsj";

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
  <B><font size="2">ʵ�ط�ʱ���ͺ�Ӧ�ط�ʱ��<%=day%>�죨<%=hflxmc%>��
  <BR>(�ط�ʱ�䣺<%=qssj%>--<%=jzsj%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="6%">�طü�¼��</td>
	<td  width="6%">�ͻ����</td>
	<td  width="5%">����</td>
	<td  width="18%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ʼ�Ա</td>
	<td  width="6%">�طý��</td>
	<td  width="22%">�ط�����</td>
	<td  width="7%">Ӧ�ط�ʱ��</td>
	<td  width="7%">ʵ�ط�ʱ��</td>
	<td  width="5%">�ط���</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>
</body>
</html>