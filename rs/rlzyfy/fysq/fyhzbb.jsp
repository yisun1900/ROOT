<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	String ls_sql=null;
	String hzbh=request.getParameter("hzbh");
	String nian=null;
	String yue=null;
	String fgs=request.getParameter("fgs");
	String spr=cf.fillNull(request.getParameter("spr"));
	String shr=cf.fillNull(request.getParameter("shr"));
	String yshz=cf.fillNull(request.getParameter("yshz"));
	nian=hzbh.substring(5,9);
	yue=hzbh.substring(9,11);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>(<%=fgs%>)人力资源预算费用申请<%=nian%>年<%=yue%>月报表</B>
</CENTER>
<form method="post" action="" name="tjform" target="_blank">
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%">费用类型</td>
	  <td  width="8%">序号</td>
	  <td  width="24%">用途/形式</td>
	  <td  width="10%">费用</td>
	  <td  width="12%">合计</td>
	  <td  width="36%">备注</td>
	</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
	conn=cf.getConnection();
	int cs=0;
	double zj=0;
	int row=0;
	String ytxs=null;
	double fy=0;
	String bz=null;
	int allcs=0;
//	ls_sql="select count(*) cs";
//	ls_sql+=" from rs_fysq";
//	ls_sql+=" where rs_fysq.fgs='"+fgs+"' ";
//	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
//	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//	ps = conn.prepareStatement(ls_sql);
//	rs = ps.executeQuery();
//	if (rs.next())
//	{
//		allcs=rs.getInt("cs");
//	}
//	rs.close();
//	ps.close();
//
//	if(allcs==0)
//	{
//		out.print("本月预算未输入！");
//		return;
//	}

//	ls_sql="select count(*) cs";
//	ls_sql+=" from rs_fysh";
//	ls_sql+=" where hzbh='"+hzbh+"' and yshz!='04' ";
//	ps= conn.prepareStatement(ls_sql);
//	rs =ps.executeQuery();
//	if (rs.next())
//	{
//		allcs=rs.getInt("cs");
//	}
//	rs.close();
//	ps.close();
////当预算未提交时返回。
//	if(allcs==1)
//	{
//		out.print("本月预算已提交！");
//		return;
//	}
//	ls_sql="select yshz";
//	ls_sql+=" from rs_fysh";
//	ls_sql+=" where hzbh='"+hzbh+"' ";
//	ps= conn.prepareStatement(ls_sql);
//	rs =ps.executeQuery();
//	if (rs.next())
//	{
//		yshz=rs.getString("yshz");
//	}
//	rs.close();
//	ps.close();
//	if ((yshz!="") && (yshz!=null) && (yshz.equals("04")))
//	{
//		out.print("<font color=red>修改后的预算提交！</font>");
//	}

	ls_sql="select count(*) cs,sum(fy) zj";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='01' and rs_fysq.hzbh='"+hzbh+"' ";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	if (rs.next())
	{
		cs=rs.getInt("cs");
		zj=rs.getDouble("zj");
	}
	rs.close();
	ps.close();
	if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">招聘费</td>
<%

	ls_sql="select ytxs,fy,bz";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='01' and rs_fysq.hzbh='"+hzbh+"' ";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	while (rs.next())
	{
		ytxs=rs.getString("ytxs");
		fy=rs.getDouble("fy");
		bz=cf.fillHtml(rs.getString("bz"));
		row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
	}
	rs.close();
	ps.close();
	}

	cs=0;
	zj=0;
	ytxs=null;
	fy=0;
	bz=null;
	row=0;

	ls_sql="select count(*) cs,sum(fy) zj";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='02' and rs_fysq.hzbh='"+hzbh+"' ";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	if (rs.next())
	{
		cs=rs.getInt("cs");
		zj=rs.getDouble("zj");
	}
	rs.close();
	ps.close();
	if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">培训费</td>
<%

	ls_sql="select ytxs,fy,bz";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='02' and rs_fysq.hzbh='"+hzbh+"' ";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	while (rs.next())
	{
		ytxs=rs.getString("ytxs");
		fy=rs.getDouble("fy");
		bz=cf.fillHtml(rs.getString("bz"));
		row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='03' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">福利费</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='03' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}


		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='04' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">奖励费</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='04' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='05' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">社会保险费</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='05' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='06' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">处罚</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='06' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='07' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">其他费用</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='07' and rs_fysq.hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}
}
catch (Exception e) {
	out.print("发生意外: " + e+ls_sql);
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
<table border="0" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
	<tr>
		<td width="10%" align="right">预算申请状态:</td>
		<td width="20%"><font color=red><%=yshz%></font></td>
		<td width="15%" align="right">审核人：</td>
		<td width="20%"><font color=red><%=shr%></font></td>
		<td width="15%" align="right">审批人：</td>
		<td width="20%"><font color=red><%=spr%></font></td>
	</tr>
</table>
	 </form>
</body>
</html>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="sqtj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>