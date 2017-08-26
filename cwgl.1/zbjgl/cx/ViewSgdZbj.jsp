<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String sgd=request.getParameter("sgd");
	String ls_sql=null;


	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	double allzbj=0;
	String sgdmc=null;

	double jxje=0;
	double zjje=0;
	double jsje=0;
	double allzjzbj=0;
	
	try {
		conn=cf.getConnection();

		ls_sql="select sgdmc,zbj";
		ls_sql+=" from  sq_sgd";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sgdmc=rs.getString("sgdmc");
			allzbj=rs.getDouble("zbj");
		}
		rs.close();
		ps.close();

		ls_sql="select sum(je)";
		ls_sql+=" from  cw_zbjjsjl";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jxje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(je)";
		ls_sql+=" from  cw_zbzjsjl";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(wxj)";
		ls_sql+=" from  cw_gdjsjl";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jsje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		allzjzbj=zjje+jsje-jxje;


	}
	catch (Exception e) {
		out.print("<BR>����:" + e);
		out.print("<BR>SQL=" + ls_sql);
		return;
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}


%>
<body bgcolor="#FFFFFF">
<div align="center">�����ʱ���ʩ���ӣ�<%=sgdmc%>��Ŀǰ�ʱ���<%=allzbj%>���������ʱ���<%=cf.formatDouble(jxje+zjje+jsje)%>�� </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">���</td>
	<td  width="8%">ʩ����</td>
	<td  width="14%">�ʱ������ԭ��</td>
	<td  width="14%">���</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="38">��ע</td>
</tr>

<%
	ls_sql="SELECT cw_zbjjsjl.xuhao,sq_sgd.sgdmc,dm_zbjjsyybm.zbjjsyymc,cw_zbjjsjl.je,cw_zbjjsjl.lrr,cw_zbjjsjl.lrsj,cw_zbjjsjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjjsjl  ";
    ls_sql+=" where cw_zbjjsjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjjsjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_zbjjsjl.sgd='"+sgd+"'";
    ls_sql+=" order by cw_zbjjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


<div align="center"> �����ʱ���</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">���</td>
	<td  width="10%">ʩ����</td>
	<td  width="14%">���</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="50%">��ע</td>
  </tr>
  <%

	ls_sql="SELECT cw_zbzjsjl.xuhao,sq_sgd.sgdmc,cw_zbzjsjl.je,cw_zbzjsjl.lrr,cw_zbzjsjl.lrsj,cw_zbzjsjl.bz  ";
	ls_sql+=" FROM sq_sgd,cw_zbzjsjl  ";
    ls_sql+=" where cw_zbzjsjl.sgd=sq_sgd.sgd";
    ls_sql+=" and cw_zbzjsjl.sgd='"+sgd+"'";
    ls_sql+=" order by cw_zbzjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pdsgd","1");//�в����������Hash��
	spanColHash.put("sgdlx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

<div align="center">ʩ�����깤���� </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����¼��</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">��ͬ��</td>
	<td  width="9%">����ԭ����</td>
	<td  width="9%">����ǩԼ��</td>
	<td  width="5%">�ۿ���</td>
	<td  width="8%">��������</td>
	<td  width="8%">���ʱ���</td>
	<td  width="5%">���ʱ������</td>
	<td  width="9%">Ӧ������</td>
	<td  width="8%">����ʱ��</td>
	<td  width="20%">��ע</td>
</tr>

<%

	ls_sql="SELECT cw_gdjsjl.gdjsjlh,crm_khxx.khxm,crm_khxx.hth,cw_gdjsjl.wdzgce,cw_gdjsjl.qye,TO_CHAR(cw_gdjsjl.zkl),cw_gdjsjl.zjxje,cw_gdjsjl.wxj,cw_gdjsjl.wxjbfb||'%',cw_gdjsjl.gdjskze,cw_gdjsjl.jssj,cw_gdjsjl.bz";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_gdjsjl.sgd='"+sgd+"' and cw_gdjsjl.wxj>0";
	ls_sql+=" order by cw_gdjsjl.jssj desc ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


</body>
</html>
