<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
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


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>��˾����С��ͳ��<BR>
  (ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">�������</td>
  <td  width="10%">ǩԼ��</td>
  <td  width="14%">����ǩԼ��</td>
  <td  width="10%">ƽ������</td>
  <td  width="10%">ƽ�׾���</td>
  <td  width="35%">ǩԼ���ٷֱ� </td>
</tr>
<%
	String max=null;
	String all=null;
	int[] mark={3,2,2,4,4,4};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ
		

	//��ȡ����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where ";
	ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	all=cf.executeQuery(ls_sql);
	
	//��ȡ���
	ls_sql="SELECT max(count(*))";
	ls_sql+=" FROM crm_khxx,kp_deflbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc";

	max=cf.executeQuery(ls_sql);

	ls_sql="SELECT deflmc,count(*),sum(qye),ROUND(sum(qye)/count(*)),ROUND(sum(qye)/sum(fwmj)),'<img src=\"/images/ColuGif.gif\" width='||count(*)*150/"+max+"||' height=14>'||ROUND(count(*)/"+all+"*100,1)||'%' ";
	ls_sql+=" FROM crm_khxx,kp_deflbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc";
	ls_sql+=" order by deflbm";
//	out.println(ls_sql);


	so.addData(ls_sql);


	//�������
	so.outData(out,mark);

%>
</table>
<P>
<CENTER >
    <B>��������С��ͳ��<BR>
    (ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">�������</td>
  <td  width="10%">����</td>
  <td  width="10%">ǩԼ��</td>
  <td  width="14%">����ǩԼ��</td>
  <td  width="10%">����ƽ������</td>
  <td  width="25%">ǩԼ���ٷֱ� </td>
</tr>
<%
	int[] mark1={3,1,2,2,4,4};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ
		

	so.clearData();

	//��ȡ����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where ";
	ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	all=cf.executeQuery(ls_sql);
	
	//��ȡ���
	ls_sql="SELECT max(count(*))";
	ls_sql+=" FROM crm_khxx,kp_deflbm,dm_cqbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and crm_khxx.cqbm=dm_cqbm.cqbm";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc,crm_khxx.cqbm,cqmc";

	max=cf.executeQuery(ls_sql);

	ls_sql="SELECT deflmc,cqmc,count(*),sum(qye),ROUND(sum(qye)/count(*)),'<img src=\"/images/ColuGif.gif\" width='||count(*)*150/"+max+"||' height=14>'||ROUND(count(*)/"+all+"*100,1)||'%' ";
	ls_sql+=" FROM crm_khxx,kp_deflbm,dm_cqbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and crm_khxx.cqbm=dm_cqbm.cqbm";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc,crm_khxx.cqbm,cqmc";
	ls_sql+=" order by deflbm,count(*) desc";
//	out.println(ls_sql);


	so.addData(ls_sql);


	//�������
	so.outData(out,mark1);

%>
</table>

</body>
</html>