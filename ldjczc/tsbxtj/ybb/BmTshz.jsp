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
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsbm.dwbh in(select dwbh from sq_dwxx where dwlx in('A1','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsbm.dwbh='"+dwbh+"'";
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ͻ�Ͷ�߻��ܱ�
  <BR>(����ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="13%">���β���</td>
  <td  width="12%">Ͷ�ߴ���</td>
  <td  width="13%">Ͷ��С��</td>
  <td  width="21%">Ͷ��ԭ��</td>
  <td  width="8%">����</td>
  <td  width="28%">�ٷֱ� </td>
</tr>
<%
String all=null;
String tsbm=null;
int[] mark={1,3,3,1,2,4};//������ʾ������
//0:��;1���ϲ��У���С�ƣ�2����ֵ�У���С�ơ��ܼƣ�3���ϲ��У���С�ƣ�4�����ϲ��У�5��������С������ʾ
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
	conn=cf.getConnection();

	ls_sql="select distinct crm_tsbm.dwbh";
	ls_sql+=" FROM crm_tsjl,crm_tsbm  ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
	ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
    ls_sql+=wheresql;
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by crm_tsbm.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsbm=rs.getString("dwbh");

		//��ȡ����
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_tsjl,crm_tsbm  ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsbm.dwbh='"+tsbm+"'";
		ls_sql+=" and lx='1'";//1��Ͷ�ߣ�2������
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		all=cf.executeQuery(ls_sql);

		ls_sql="SELECT dwmc,tslxmc,tsxlmc,tsyymc,count(*),'<img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||ROUND(count(*)/"+all+"*100,2)||'%' ";
		ls_sql+=" FROM crm_tsjl,dm_tslxbm,dm_tsxlbm,dm_tsyybm,sq_dwxx,crm_tsbm  ";
		ls_sql+=" where crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh and crm_tsbm.dwbh='"+tsbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by dwmc,crm_tsbm.tslxbm,tslxmc,crm_tsbm.tsxlbm,tsxlmc,crm_tsbm.tsyybm,tsyymc";
		ls_sql+=" order by dwmc,crm_tsbm.tslxbm,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";


		so.addData(ls_sql);
	}
	ps.close();
	rs.close();

	//�������
	so.outData(out,mark);



%> 
</table>

<P><center>������Ͷ����ռ�ٷֱ�</center>
<%

	ls_sql="SELECT dwmc,count(*)";
	ls_sql+=" FROM crm_tsjl,sq_dwxx,crm_tsbm  ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by count(*)";
	
	so.outRatioColuG(out,ls_sql);
%> 

<BR>
<CENTER >
  <B>�ͻ����޻��ܱ�
  <BR>(����ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="13%">���β���</td>
  <td  width="12%">���޴���</td>
  <td  width="13%">����С��</td>
  <td  width="21%">����ԭ��</td>
  <td  width="8%">����</td>
  <td  width="28%">�ٷֱ� </td>
</tr>
<%
so.clearData();



	ls_sql="select distinct crm_tsbm.dwbh";
	ls_sql+=" FROM crm_tsjl,crm_tsbm  ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
	ls_sql+=" and crm_tsjl.lx='2'";//1��Ͷ�ߣ�2������
    ls_sql+=wheresql;
	ls_sql+=" order by crm_tsbm.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsbm=rs.getString("dwbh");

		//��ȡ����
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh='"+tsbm+"'";
		ls_sql+=" and crm_tsjl.lx='2'";//1��Ͷ�ߣ�2������
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		all=cf.executeQuery(ls_sql);

		ls_sql="SELECT dwmc,tslxmc,tsxlmc,tsyymc,count(*),'<img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||ROUND(count(*)/"+all+"*100,2)||'%' ";
		ls_sql+=" FROM crm_tsjl,dm_tslxbm,dm_tsxlbm,dm_tsyybm,sq_dwxx,crm_tsbm  ";
		ls_sql+=" where crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='2'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh and crm_tsbm.dwbh='"+tsbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" group by dwmc,crm_tsbm.tslxbm,tslxmc,crm_tsbm.tsxlbm,tsxlmc,crm_tsbm.tsyybm,tsyymc";
		ls_sql+=" order by dwmc,crm_tsbm.tslxbm,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";


		so.addData(ls_sql);
	}
	ps.close();
	rs.close();

	//�������
	so.outData(out,mark);

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("����ʧ��,��������: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
</table>

<P><center>������������ռ�ٷֱ�</center>
<%

	ls_sql="SELECT dwmc,count(*)";
	ls_sql+=" FROM crm_tsjl,sq_dwxx,crm_tsbm  ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc";
	ls_sql+=" order by count(*)";
	
	so.outRatioColuG(out,ls_sql);
%> 


</body>
</html>