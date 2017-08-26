<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

%>
<%
	String wheresql="";
	String qh_tgglb_djrq=null;
	String qh_tgglb_xqmc=null;
	String qh_tgglb_dm=null;
	qh_tgglb_djrq=request.getParameter("sjfw");
	if (qh_tgglb_djrq!=null)
	{
		qh_tgglb_djrq=qh_tgglb_djrq.trim();
		if (!(qh_tgglb_djrq.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+qh_tgglb_djrq+"','YYYY/MM/DD'))";
	}
	qh_tgglb_djrq=request.getParameter("sjfw2");
	if (qh_tgglb_djrq!=null)
	{
		qh_tgglb_djrq=qh_tgglb_djrq.trim();
		if (!(qh_tgglb_djrq.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+qh_tgglb_djrq+"','YYYY/MM/DD'))";
	}
	qh_tgglb_xqmc=request.getParameter("qh_tgglb_xqmc");
	if (qh_tgglb_xqmc!=null)
	{
		qh_tgglb_xqmc=cf.GB2Uni(qh_tgglb_xqmc);
		if (!(qh_tgglb_xqmc.equals("")))	wheresql+="  and (qh_tgglb.xqmc='"+qh_tgglb_xqmc+"')";
	}
	qh_tgglb_dm=request.getParameter("dwbh");
	if (qh_tgglb_dm!=null)
	{
		qh_tgglb_dm=cf.GB2Uni(qh_tgglb_dm);
		if (!(qh_tgglb_dm.equals("")))	wheresql+="  and (dwbh='"+qh_tgglb_dm+"')";
	}
%>
<html>
<head>
<title>�Ź����ͳ�Ʊ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center><B>�Ź����ͳ�Ʒ���</B></center><BR>
<%
//����ѯ�ͻ���ѡȡ���������ļ�¼
Connection conn  = null;
PreparedStatement ps=null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql3=null;

String xqbm=null;
String zxdm=null;
int zxsl=0;
int qys=0;
int ixh=0;
String xh=null;
String xhs=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	//����Ź������
	ls_sql="delete   from qh_tgglb";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();

	ls_sql="insert into  qh_tgglb(xqbm) select distinct dm_xqbm.xqbm from dm_xqbm,crm_zxkhxx where dm_xqbm.xqbm=crm_zxkhxx.xqbm and dm_xqbm.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();

    //��С��������ѯ�ͻ�����
	ls_sql="select  distinct xqbm from qh_tgglb ";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		xqbm=cf.fillNull(rs.getString("xqbm"));
		//out.println(xqbm);

   		//��ĳС������ѯ����
		ls_sql2="select count(khbh) as sl from crm_zxkhxx where xqbm='"+xqbm+"' ";
		ls_sql2+=wheresql;
		ps2= conn.prepareStatement(ls_sql2);
		rs2=ps2.executeQuery();
		if (rs2.next())
		{
			zxsl=rs2.getInt("sl");
			ls_sql3="update qh_tgglb set zxs=? where xqbm='"+xqbm+"'";
			ps3= conn.prepareStatement(ls_sql3);
			ps3.setInt(1,zxsl);
			ps3.executeUpdate();
		 	ps3.close();
	
			
       }
	   ps2.close();
	   rs2.close();
	  //��ĳС����ǩ������
		ls_sql2="select count(khbh) as sl from crm_khxx where xqbm='"+xqbm+"' ";
		ls_sql2+=wheresql;
		ps2= conn.prepareStatement(ls_sql2);
		rs2=ps2.executeQuery();
		if (rs2.next())
		{
			qys=rs2.getInt("sl");
			ls_sql3="update qh_tgglb set qys=? where xqbm='"+xqbm+"'";
			ps3= conn.prepareStatement(ls_sql3);
			ps3.setInt(1,qys);
			ps3.executeUpdate();
           ps3.close();

		} 

	   ps2.close();
	   rs2.close();
	  


	}
	ps.close();
	rs.close();


}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close(); 

		if (ps2!= null) ps2.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps3!= null) ps3.close(); 

		if (conn != null) cf.close(conn); 

	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<table style='FONT-SIZE:12px' width='100%' border='1' cellspacing='0' cellpadding='1'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">���</td>
 	<td  width="12%">С������</td>
	<td  width="12%">ʵ��ʹ����</td>
	<td  width="12%">ǩԼ��</td>
	<td  width="12%">�ɿ���</td>
	<td  width="12%">��ѯ��</td>
</tr>
<%
	
	int[] mark={1,1,1,2,2,2};//������ʾ������
	//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ

	ls_sql="SELECT ROWNUM,dm_xqbm.xqmc,qh_tgglb.sysz,qh_tgglb.qys,qh_tgglb.kkjs,qh_tgglb.zxs  ";
	ls_sql+=" FROM qh_tgglb,sq_dwxx,dm_xqbm ";
    ls_sql+=" where qh_tgglb.dwbh=sq_dwxx.dwbh(+) and qh_tgglb.xqbm=dm_xqbm.xqbm(+) and (zxs>0 or qys>0) ";
   // ls_sql+=wheresql;
    ls_sql+=" order by ROWNUM,dm_xqbm.xqbm";
   // ls_sql+=" group by qh_tgglb.xh,qh_tgglb.djrq,qh_tgglb.xm,qh_tgglb.dh,qh_tgglb.xqmc,qh_tgglb.dm";
	so.addData(ls_sql);

	//�������
	so.outData(out,mark);
%>
</table>
</body>
</html>

