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

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String wheresql="";
    wheresql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD')";
    wheresql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}


%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
int all=0;
int sl=0;

String hfjgbm=null;
String xsstr="";

String khbh=null;
String tsjlh=null;
String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sgd=null;
String tsnr=null;
String slsj=null;
String tslxmc=null;
String hfjlh=null;

String hfjgmc=null;

int row=0;
String col="#FFFFFF";

String clqk=null;
String dwmc=null;
String clqkoutstr="&nbsp;";
int mark=0;

try {
	conn=cf.getConnection();
%>

<CENTER ><B>�ͻ�Ͷ�����
<BR>����ʱ�䣺(<%=sjfw%>--<%=sjfw2%>)</B> </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">����ʱ��</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="8%">��ϵ��ʽ</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="5%">����</td>
	<td  width="27%">Ͷ������</td>
	<td  width="7%">Ͷ������</td>
	<td  width="16%">Ͷ�ߴ������</td>
	<td  width="5%">�طý��</td>
</tr>
<%

	ls_sql="SELECT slsj,hth,khxm,lxfs,fwdz,sgdmc,tsnr,tslxmc,clqk,hfjgmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm,dm_tslxbm,sq_sgd,sq_dwxx,dm_hfjgbm  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)  and crm_tsbm.tslxbm=dm_tslxbm.tslxbm(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+) and lx='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.khbh,crm_tsjl.tsjlh,crm_tsbm.tslxbm";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
/*
	String[] disColName={"slsj","hth","khxm","lxfs","fwdz","sgd","zjxm","tsjlh","sftsqk","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","jazt","tsxlmc","tsyymc","zrbm","clzt","clr","clsj","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);
*/
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.displayFoot();

%> 
</table>


<CENTER ><B>�ͻ������������ְ������
<BR>����ʱ�䣺(<%=sjfw%>--<%=sjfw2%>)</B> </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">����ʱ��</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="5%">ԭ����</td>
	<td  width="18%">��������</td>
	<td  width="5%">�Ƿ��ڱ�����</td>
	<td  width="7%">��������</td>
	<td  width="22%">���޴������</td>
	<td  width="5%">�طý��</td>
</tr>
<%

	ls_sql="SELECT slsj,hth,khxm,lxfs,fwdz,sgdmc,tsnr,DECODE((bxjzsj-slsj)/ABS(bxjzsj-slsj),-1,'�ѹ�������','�ڱ�����'),tslxmc,clqk,hfjgmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm,dm_tslxbm,sq_sgd,sq_dwxx,dm_hfjgbm  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)  and crm_tsbm.tslxbm=dm_tslxbm.tslxbm(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+) and lx='2' and sq_sgd.cxbz='N'";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.khbh,crm_tsjl.tsjlh,crm_tsbm.tslxbm";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
/*
	String[] disColName={"slsj","hth","khxm","lxfs","fwdz","sgd","zjxm","tsjlh","sftsqk","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","jazt","tsxlmc","tsyymc","zrbm","clzt","clr","clsj","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);
*/
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.displayFoot();

%> 
</table>


<CENTER ><B>�ͻ������������ְ������
<BR>����ʱ�䣺(<%=sjfw%>--<%=sjfw2%>)</B> </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">����ʱ��</td>
	<td  width="6%">��ͬ��</td>
	<td  width="5%">����</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="5%">ԭ����</td>
	<td  width="18%">��������</td>
	<td  width="5%">�Ƿ��ڱ�����</td>
	<td  width="7%">��������</td>
	<td  width="22%">���޴������</td>
	<td  width="5%">�طý��</td>
</tr>
<%

	ls_sql="SELECT slsj,hth,khxm,lxfs,fwdz,sgdmc,tsnr,DECODE((bxjzsj-slsj)/ABS(bxjzsj-slsj),-1,'�ѹ�������','�ڱ�����'),tslxmc,clqk,hfjgmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,crm_tsbm,dm_tslxbm,sq_sgd,sq_dwxx,dm_hfjgbm  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)  and crm_tsbm.tslxbm=dm_tslxbm.tslxbm(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+) and lx='2' and sq_sgd.cxbz='Y'";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.khbh,crm_tsjl.tsjlh,crm_tsbm.tslxbm";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
/*
	String[] disColName={"slsj","hth","khxm","lxfs","fwdz","sgd","zjxm","tsjlh","sftsqk","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","jazt","tsxlmc","tsyymc","zrbm","clzt","clr","clsj","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);
*/
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</table>


<%
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
