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

	String yhjs=(String)session.getAttribute("yhjs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权



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

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		wheresql+=" and crm_tsbm.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		wheresql+=" and crm_tsbm.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>客户投诉汇总表
  <BR>(受理时间：<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%" rowspan="2">分公司</td>
  <td  width="14%" rowspan="2">责任部门</td>
  <td colspan="9">周期</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="7%">在施工地数</td>
  <td  width="7%">投诉客户数</td>
  <td  width="7%">投诉次数</td>
  <td  width="7%">投诉率</td>
  <td  width="7%">结案率</td>
  <td  width="7%">赔偿率</td>
  <td  width="7%">平均解决天数</td>
  <td  width="7%">结案满意率</td>
  <td  width="7%">首要投诉原因</td>
  </tr>


<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getfgsbh=null;
	String fgsmc=null;
	ls_sql =" SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where sq_dwxx.dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");


		String tsbm=null;
		String dwmc=null;
		ls_sql="select distinct crm_tsbm.dwbh,dwmc";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,sq_dwxx  ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
		ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh";
		ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修
		ls_sql+=" and crm_tsbm.ssfgs='"+getfgsbh+"'";
		ls_sql+=wheresql;
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" order by crm_tsbm.dwbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			tsbm=rs1.getString("dwbh");
			dwmc=rs1.getString("dwmc");

			//签单
			int tssl=0;
			int khsl=0;

			ls_sql="select count(*),count(distinct crm_tsjl.khbh)";
			ls_sql+=" FROM crm_tsjl,crm_tsbm,sq_dwxx  ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh";
			ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh";
			ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修
			ls_sql+=" and crm_tsbm.ssfgs='"+getfgsbh+"'";
			ls_sql+=" and crm_tsbm.dwbh='"+tsbm+"'";
			ls_sql+=wheresql;
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" order by crm_tsbm.dwbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tssl=rs.getInt(1);
				khsl=rs.getInt(2);
			}
			rs.close();
			ps.close();

			%>
			<tr bgcolor="#FFFFFF"  align="center">
			  <td><%=fgsmc%></td>
			  <td><%=dwmc%></td>
			  <td>&nbsp;</td>
			  <td><%=khsl%></td>
			  <td><%=tssl%></td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			</tr>
			<%

		}
		ps1.close();
		rs1.close();
	}
	ps2.close();
	rs2.close();



%> 
<tr bgcolor="#FFFFFF"  align="center">
  <td colspan="2">分公司小计</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>

<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("存盘失败,发生意外: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 



</body>
</html>