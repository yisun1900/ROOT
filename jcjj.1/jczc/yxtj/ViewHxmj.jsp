<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String hxmjbm=request.getParameter("hxmjbm");
	String hxmjmc=cf.executeQuery("select hxmjmc from dm_hxmjbm where hxmjbm='"+hxmjbm+"'");

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql=" and crm_khxx.hxmjbm='"+hxmjbm+"' ";

	if (fgs!=null)
	{
		if (!(fgs.equals("")) && !(fgs.equals("null")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")) && !(dwbh.equals("null")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";



	ls_sql="SELECT '',hth,khxm,fwdz,fwmj,qye,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD'),TO_CHAR(qyrq,'YYYY-MM-DD'),sjs,sgdmc sgd,zjxm,khbh";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,lrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������ͳ�ƣ�<%=hxmjmc%>��
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="20%">���ݵ�ַ</td>
	<td  width="6%">�������</td>
	<td  width="8%">����ǩԼ��</td>
	<td  width="10%">ǩԼ����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ʼ�Ա</td>
	<td  width="5%">�ͻ����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>