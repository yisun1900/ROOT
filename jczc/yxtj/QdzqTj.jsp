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

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");
String sjjgstr=request.getParameter("sjjg");
int sjjg=0;
try{
	if (!(sjjgstr.equals("")))  sjjg=Integer.parseInt(sjjgstr.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjg不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[时间间隔]类型转换发生意外:"+e);
	return;
}

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>签单周期统计（时间间隔：<%=sjjg%>天）<BR>
  (统计时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">时间段</td>
  <td  width="7%">签约数</td>
  <td  width="10%">签约额</td>
  <td  width="8%">平均单额</td>
  <td  width="8%">平米均价</td>
  <td  width="15%">平均签单周期</td>
  <td  width="35%">平均签单周期</td>
</tr>
<%
	//累计天数
	int ts=0;
	int allts=0;
	//签约数
	int qys=0;
	int allqys=0;
	//签约额
	double qye=0;
	double allqye=0;
	//房屋面积
	double fwmj=0;
	double allfwmj=0;
	//平均单额
	double pjqye=0;
	double allpjqye=0;
	//每平米均价
	double pmjj=0;
	double allpmjj=0;
	//平均天数
	double pjts=0;
	double allpjts=0;


	//获取时间差
	int sjc=0;
	ls_sql="SELECT TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')-TO_DATE('"+sjfw+"','YYYY-MM-DD')+1";
	ls_sql+=" FROM dm_gcjdbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjc=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//总计
	ls_sql="SELECT sum(qyrq-crm_zxkhxx.lrsj)";
	ls_sql+=" FROM crm_zxkhxx,crm_khxx";
	ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allts=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//签约总数
	ls_sql="SELECT count(*),sum(qye),sum(crm_khxx.fwmj)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" and zt='2'";//2：未退单；3：已退单
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allqye=rs.getDouble(2);
		allfwmj=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	//平均天数
	if (allqys!=0)
	{
		allpjts=allts*1.0/allqys;
	}
	else{
		allpjts=0;
	}
	//工程平均单额
	if (allqys!=0)
	{
		allpjqye=allqye/allqys;
	}
	else{
		allpjqye=0;
	}
	//每平米均价
	if (allfwmj!=0)
	{
		allpmjj=allqye/allfwmj;
	}
	else{
		allpmjj=0;
	}



	int count=0;
	//循环计算
	for (int i=0;i<sjc ;i=count*sjjg)
	{
		//累计天数
		ls_sql="SELECT sum(qyrq-crm_zxkhxx.lrsj)";
		ls_sql+=" FROM crm_zxkhxx,crm_khxx";
		ls_sql+=" where crm_zxkhxx.khbh=crm_khxx.khbh";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')+"+count*sjjg;
		ls_sql+=" and qyrq< TO_DATE('"+sjfw+"','YYYY-MM-DD')+"+(count+1)*sjjg;
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ts=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//签约总数
		ls_sql="SELECT count(*),sum(qye),sum(crm_khxx.fwmj)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')+"+count*sjjg;
		ls_sql+=" and qyrq < TO_DATE('"+sjfw+"','YYYY-MM-DD')+"+(count+1)*sjjg;
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
		ls_sql+=" and zt='2'";//2：未退单；3：已退单
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			qys=rs.getInt(1);
			qye=rs.getDouble(2);
			fwmj=rs.getDouble(3);
		}
		rs.close();
		ps.close();

		//平均天数
		if (qys!=0)
		{
			pjts=ts*1.0/qys;
		}
		else{
			pjts=0;
		}
		//工程平均单额
		if (qys!=0)
		{
			pjqye=qye/qys;
		}
		else{
			pjqye=0;
		}
		//每平米均价
		if (fwmj!=0)
		{
			pmjj=qye/fwmj;
		}
		else{
			pmjj=0;
		}


		%>
		<tr align="center">
		  <td><%=count*sjjg%>-<%=(count+1)*sjjg%>天</td>
		  <td><%=qys%></td>
		  <td><%=cf.formatDouble(qye)%></td>
		  <td><%=cf.formatDouble(pjqye)%></td>
		  <td><%=cf.formatDouble(pmjj)%></td>
		  <td ><%=cf.formatDouble(pjts)%>天</td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=pjts/allpjts*50%>" height="8"></td>
		</tr>
		<%	

		count++;
	}


%>
		<tr align="center">
		  <td>总计</td>
		  <td><%=allqys%></td>
		  <td><%=cf.formatDouble(allqye)%></td>
		  <td><%=cf.formatDouble(allpjqye)%></td>
		  <td><%=cf.formatDouble(allpmjj)%></td>
		  <td ><%=cf.formatDouble(allpjts)%>天</td>
		  <td align="left"><img src="/images/ColuGif.gif" width="<%=150*allpjts/allpjts%>" height="8"></td>
		</tr>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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
</table>

</body>
</html>