<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}


	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");
	
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (hflxbm!=null)
	{
		if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
	}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ط�������ϸ��<%=cf.fillNull(hflxmc)%>�� <BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> <BR>
</CENTER>

<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">��������</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ʩ����</td>
	<td  width="5%">�ʼ�</td>
	<td  width="25%">�ط�����</td>
	<td  width="10%">��ע</td>
	<td  width="10%">��������</td>
	<td  width="15%">�������</td>
</tr>
<%
	String ls_sql=null;

	ls_sql="SELECT distinct jglxmc,khxm,fwdz,sjs,sgdmc dwmc,zjxm,DECODE(sjshfnr,null,'',sjshfnr,'[���ʦ]��'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[�ʼ�]��'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[ʩ����]��'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'<BR>[����]��'||jchfnr) as hfnr,crm_hfjl.bz,b.dwmc fkbm,xwtclqk";
	ls_sql+=" FROM crm_hfjl,dm_jglxbm,crm_khxx,crm_gchffkbm,sq_sgd,sq_dwxx b  ";
    ls_sql+=" where crm_hfjl.jglxbm=dm_jglxbm.jglxbm and crm_khxx.sgd=sq_sgd.sgd and crm_gchffkbm.dwbh=b.dwbh";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+)";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('1','6','7')";
	ls_sql+=wheresql;
	ls_sql+=" order by jglxmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[6]="align='left'";
	pageObj.alignStr[7]="align='left'";
	pageObj.alignStr[9]="align='left'";

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jglxmc","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("zjxm","1");//�в����������Hash��
	spanColHash.put("hfnr","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
	</table>
	
	</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
