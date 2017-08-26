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

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String lrqye=request.getParameter("qye");
	String lrqye2=request.getParameter("qye2");


	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>公司大中小单统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="20%">签约额范围</td>
  <td  width="10%">签约数</td>
  <td  width="14%">工程签约额</td>
  <td  width="10%">平均单额</td>
  <td  width="35%">签约数百分比 </td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int allqys=0;
int allqye=0;
int allpjqye=0;

int qys1=0;
int qye1=0;
int pjqye1=0;

int qys2=0;
int qye2=0;
int pjqye2=0;

int qys3=0;
int qye3=0;
int pjqye3=0;


try {
	conn=cf.getConnection();

	//获取总数
	ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where ";
	ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allqye=rs.getInt(2);
		allpjqye=rs.getInt(3);
	}
	rs.close();
	ps.close();

	if (!lrqye.equals("") && lrqye2.equals(""))
	{
		ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qye<="+lrqye;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys1=rs.getInt(1);
			qye1=rs.getInt(2);
			pjqye1=rs.getInt(3);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qye>"+lrqye;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys2=rs.getInt(1);
			qye2=rs.getInt(2);
			pjqye2=rs.getInt(3);
		}
		rs.close();
		ps.close();

		%>
		<tr align="center">
			<td >小于等于<%=lrqye%></td>
			<td  align="right"><%=qys1%></td>
			<td  align="right"><%=qye1%></td>
			<td  align="right"><%=pjqye1%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width=<%=(250*qys1/allqys)%> height=14><%=(qys1*100/allqys)%>%</td>
		</tr>
		<tr align="center">
			<td >大于<%=lrqye%></td>
			<td  align="right"><%=qys2%></td>
			<td  align="right"><%=qye2%></td>
			<td  align="right"><%=pjqye2%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(250*qys2/allqys)%>" height=14><%=(qys2*100/allqys)%>%</td>
		</tr>
		<tr align="center">
			<td  bgcolor="#E8E8FF" ><B>总 计</B></td>
			<td  align="right" bgcolor="#E8E8FF" ><%=allqys%></td>
			<td  align="right" bgcolor="#E8E8FF" ><%=allqye%></td>
			<td  align="right"  bgcolor="#E8E8FF" ><%=allpjqye%></td>
			<td  align="left" bgcolor="#E8E8FF" ><img src="/images/ColuGif.gif" width=250 height=14>100%</td>
		</tr>
		<%
	}
	else if (lrqye.equals("") && !lrqye2.equals(""))
	{
		ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+=" qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qye<="+lrqye2;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys1=rs.getInt(1);
			qye1=rs.getInt(2);
			pjqye1=rs.getInt(3);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qye>"+lrqye2;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys2=rs.getInt(1);
			qye2=rs.getInt(2);
			pjqye2=rs.getInt(3);
		}
		rs.close();
		ps.close();

		%>
		<tr align="center">
			<td >小于等于<%=lrqye2%></td>
			<td  align="right"><%=qys1%></td>
			<td  align="right"><%=qye1%></td>
			<td  align="right"><%=pjqye1%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width=<%=(250*qys1/allqys)%> height=14><%=(qys1*100/allqys)%>%</td>
		</tr>
		<tr align="center">
			<td >大于<%=lrqye2%></td>
			<td  align="right"><%=qys2%></td>
			<td  align="right"><%=qye2%></td>
			<td  align="right"><%=pjqye2%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(250*qys2/allqys)%>" height=14><%=(qys2*100/allqys)%>%</td>
		</tr>
		<tr align="center">
			<td  bgcolor="#E8E8FF" ><B>总 计</B></td>
			<td  align="right" bgcolor="#E8E8FF" ><%=allqys%></td>
			<td  align="right" bgcolor="#E8E8FF" ><%=allqye%></td>
			<td  align="right"  bgcolor="#E8E8FF" ><%=allpjqye%></td>
			<td  align="left" bgcolor="#E8E8FF" ><img src="/images/ColuGif.gif" width=250 height=14>100%</td>
		</tr>
		<%
	}
	else if (!lrqye.equals("") && !lrqye2.equals(""))
	{
		ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qye<"+lrqye;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys1=rs.getInt(1);
			qye1=rs.getInt(2);
			pjqye1=rs.getInt(3);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qye>="+lrqye+" and qye<="+lrqye2;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys2=rs.getInt(1);
			qye2=rs.getInt(2);
			pjqye2=rs.getInt(3);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT count(*),sum(qye),ROUND(sum(qye)/count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where ";
		ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and qye>"+lrqye2;
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys3=rs.getInt(1);
			qye3=rs.getInt(2);
			pjqye3=rs.getInt(3);
		}
		rs.close();
		ps.close();

		%>
		<tr align="center">
			<td >小于<%=lrqye%></td>
			<td  align="right"><%=qys1%></td>
			<td  align="right"><%=qye1%></td>
			<td  align="right"><%=pjqye1%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width=<%=(250*qys1/allqys)%> height=14><%=(qys1*100/allqys)%>%</td>
		</tr>
		<tr align="center">
			<td ><%=lrqye%>---<%=lrqye2%></td>
			<td  align="right"><%=qys2%></td>
			<td  align="right"><%=qye2%></td>
			<td  align="right"><%=pjqye2%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width=<%=(250*qys2/allqys)%> height=14><%=(qys2*100/allqys)%>%</td>
		</tr>
		<tr align="center">
			<td >大于<%=lrqye2%></td>
			<td  align="right"><%=qys3%></td>
			<td  align="right"><%=qye3%></td>
			<td  align="right"><%=pjqye3%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=(250*qys3/allqys)%>" height=14><%=(qys3*100/allqys)%>%</td>
		</tr>
		<tr align="center">
			<td  bgcolor="#E8E8FF" ><B>总 计</B></td>
			<td  align="right" bgcolor="#E8E8FF" ><%=allqys%></td>
			<td  align="right" bgcolor="#E8E8FF" ><%=allqye%></td>
			<td  align="right"  bgcolor="#E8E8FF" ><%=allpjqye%></td>
			<td  align="left" bgcolor="#E8E8FF" ><img src="/images/ColuGif.gif" width=250 height=14>100%</td>
		</tr>
		<%
	
	}
	else{
	}


}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>

<P><b><font color="#0000CC">注意：此统计表以[签约日期]为准、而非[首付款日期]</font></b>
</body>
</html>