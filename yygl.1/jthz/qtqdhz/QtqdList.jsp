<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}


Connection conn = null;
String wheresql="";
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String zqs=request.getParameter("zqs");//周期数

String date_bs=null;//本周开始时间
String date_be=null;
String date_ss=null;//上周日期开始
String date_se=null;


try{
	conn=cf.getConnection();

	ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" where zqs="+zqs;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();
%>

<div align="center">其他渠道汇总</div>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr>
 <td width="11%" height="28" align="right">上周日期：</td>
 <td width="20%"><%=date_ss%> 至 <%=date_se%></td>
<td width="11%" align="right">本周日期：</td>
 <td width="20%" ><%=date_bs%> 至 <%=date_be%></td>
 <td width="38%" >&nbsp;</td>
  </tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
<tr height=28 bgcolor="#CCCCCC"  >
  <td width="118" rowspan=2 align="center">分公司</td>
    <td width="60" rowspan=2 align="center">家装顾问人数</td>
  <td height="28" colspan=7 align="center">目标客户数量</td>
  <td colspan=7 align="center">收取定金数量</td>
 </tr>
 <tr bgcolor="#CCCCCC">
  <td  width="80" height="31" align="center">本月计划</td>
  <td  width="80" align="center">本月累计</td>
  <td  width="80" align="center">本月达成率</td>
  <td  width="80" align="center">本月人均邀约数</td>
  <td  width="80" align="center">上周计划</td>
  <td  width="80"align="center">上周完成</td>
  <td  width="80" align="center">本周预计</td>
  <td  width="80"align="center">本月计划</td>
  <td  width="80" align="center">本月累计</td>
  <td  width="80" align="center">本月达成率</td>
  <td  width="80" align="center">本月定金成功率</td>
  <td  width="80" align="center">上周计划</td>
  <td  width="80" align="center">上周完成</td>
  <td  width="80" align="center">本周预计</td>
 </tr>
 <tr>
  <%
	int xjsl=0;

	int xjkh_byjh=0;//目标客户数量本月计划
	int xjkh_bylj=0;//目标客户数量本月累计
	int xjkh_szjh=0;//目标客户数量上周计划
	int xjkh_szwc=0;//目标客户数量上周完成
	int xjkh_bzyj=0;//目标客户数量本周预计

	int xjdj_byjh=0;//收取定金本月计划
	int xjdj_bylj=0;//收取定金本月累计
	int xjdj_szjh=0;//收取定金上周计划
	int xjdj_szwc=0;//收取定金上周完成
	int xjdj_bzyj=0;//收取定金本周预计

	//目标客户数量-本月达成率	 
	double kh_bydcl=0;
	//定金-本月达成率	 
	double dj_bydcl=0;
	//本月定金成功率
	double djcgl=0;

	double kh_rjyy=0;//本月人均邀约数=本月累计/家装顾问人数

	String dwmc=null;
	String dwbh=null;
	ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
    ls_sql+=" order by dwbh";
    ps = conn.prepareStatement(ls_sql);
    rs =ps.executeQuery();
	while(rs.next())
	{
		dwbh=rs.getString("dwbh");	
		dwmc=rs.getString("dwmc");	


		int sl=0;
		ls_sql="select count(*) rs"; 
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and zqs="+zqs;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			sl=rs1.getInt("rs");
		}
		rs1.close();
		ps1.close();

		int kh_byjh=0;//目标客户数量本月计划
		int kh_bylj=0;//目标客户数量本月累计
		int kh_szjh=0;//目标客户数量上周计划
		int kh_szwc=0;//目标客户数量上周完成
		int kh_bzyj=0;//目标客户数量本周预计

		int dj_byjh=0;//收取定金本月计划
		int dj_bylj=0;//收取定金本月累计
		int dj_szjh=0;//收取定金上周计划
		int dj_szwc=0;//收取定金上周完成
		int dj_bzyj=0;//收取定金本周预计

		ls_sql="select sum(yy_qtqdkh_byjh),sum(yy_qtqdkh_bylj),sum(yy_qtqdkh_szjh),sum(yy_qtqdkh_szwc),sum(yy_qtqdkh_bzyj) ";
		ls_sql+="     ,sum(yy_qtqddj_byjh),sum(yy_qtqddj_bylj),sum(yy_qtqddj_szjh),sum(yy_qtqddj_szwc),sum(yy_qtqddj_bzyj)";
		ls_sql+=" from yy_qtqd ";
		ls_sql+=" where ssfgs='"+dwbh+"'";
		ls_sql+=" and  zqs='"+zqs+"'" ;
		ps1 = conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			kh_byjh=rs1.getInt(1);
			kh_bylj=rs1.getInt(2);
			kh_szjh=rs1.getInt(3);
			kh_szwc=rs1.getInt(4);
			kh_bzyj=rs1.getInt(5);

			dj_byjh=rs1.getInt(6);
			dj_bylj=rs1.getInt(7);
			dj_szjh=rs1.getInt(8);
			dj_szwc=rs1.getInt(9);
			dj_bzyj=rs1.getInt(10);
		}
		rs1.close();
		ps1.close();


		//目标客户数量-本月达成率	 
		if (kh_byjh!=0)
		{
			kh_bydcl=cf.round(kh_bylj*100.0/kh_byjh,2);
		}
		else{
			kh_bydcl=0;
		}

		//定金-本月达成率	 
		if (dj_byjh!=0)
		{
			dj_bydcl=cf.round(dj_bylj*100.0/dj_byjh,2);
		}
		else{
			dj_bydcl=0;
		}

		//本月定金成功率=本月累计/家装顾问人数
		if (sl!=0)
		{
			djcgl=cf.round(dj_bylj*100.0/sl,2);
		}
		else{
			djcgl=0;
		}

		//本月人均邀约数=本月累计/家装顾问人数
		if (sl!=0)
		{
			kh_rjyy=cf.round(kh_bylj/sl,2);
		}
		else{
			kh_rjyy=0;
		}

		xjsl+=sl;
		xjkh_byjh+=kh_byjh;//目标客户数量本月计划
		xjkh_bylj+=kh_bylj;//目标客户数量本月累计
		xjkh_szjh+=kh_szjh;//目标客户数量上周计划
		xjkh_szwc+=kh_szwc;//目标客户数量上周完成
		xjkh_bzyj+=kh_bzyj;//目标客户数量本周预计

		xjdj_byjh+=dj_byjh;//收取定金本月计划
		xjdj_bylj+=dj_bylj;//收取定金本月累计
		xjdj_szjh+=dj_szjh;//收取定金上周计划
		xjdj_szwc+=dj_szwc;//收取定金上周完成
		xjdj_bzyj+=dj_bzyj;//收取定金本周预计


		%>
		<tr align="center">
			<td><%=dwmc%></td>
			<td><%=sl%></td>

			<td ><%=kh_byjh%></td> 
			<td ><%=kh_bylj%></td>  
			<td ><%=kh_bydcl%>%</td>  
			<td><%=kh_rjyy%></td>
			<td ><%=kh_szjh%></td>  
			<td ><%=kh_szwc%></td>  
			<td ><%=kh_bzyj%></td>  

			<td ><%=dj_byjh%></td>  
			<td ><%=dj_bylj%></td>  
			<td ><%=dj_bydcl%>%</td>  
			<td ><%=djcgl%>%</td>  
			<td ><%=dj_szjh%></td>  
			<td ><%=dj_szwc%></td>  
			<td ><%=dj_bzyj%></td>  
		</tr>
		<%
    
    }
	rs.close();
	ps.close();
  
	//目标客户数量-本月达成率	 
	if (xjkh_byjh!=0)
	{
		kh_bydcl=cf.round(xjkh_bylj*100.0/xjkh_byjh,2);
	}
	else{
		kh_bydcl=0;
	}

	//定金-本月达成率	 
	if (xjdj_byjh!=0)
	{
		dj_bydcl=cf.round(xjdj_bylj*100.0/xjdj_byjh,2);
	}
	else{
		dj_bydcl=0;
	}

	//本月定金成功率=本月累计/家装顾问人数
	if (xjsl!=0)
	{
		djcgl=cf.round(xjdj_bylj*100.0/xjsl,2);
	}
	else{
		djcgl=0;
	}

	//本月人均邀约数=本月累计/家装顾问人数
	if (xjsl!=0)
	{
		kh_rjyy=cf.round(xjkh_bylj/xjsl,2);
	}
	else{
		kh_rjyy=0;
	}


	%>
	<tr align="center">
		<td>小计</td>
		<td><%=xjsl%></td>

		<td ><%=xjkh_byjh%></td> 
		<td ><%=xjkh_bylj%></td>  
		<td ><%=kh_bydcl%>%</td>  
		<td><%=kh_rjyy%></td>
		<td ><%=xjkh_szjh%></td>  
		<td ><%=xjkh_szwc%></td>  
		<td ><%=xjkh_bzyj%></td>  

		<td ><%=xjdj_byjh%></td>  
		<td ><%=xjdj_bylj%></td>  
		<td ><%=dj_bydcl%>%</td>  
		<td ><%=djcgl%>%</td>  
		<td ><%=xjdj_szjh%></td>  
		<td ><%=xjdj_szwc%></td>  
		<td ><%=xjdj_bzyj%></td>  
	</tr>
	<%
}  
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>

</body>

</html>
