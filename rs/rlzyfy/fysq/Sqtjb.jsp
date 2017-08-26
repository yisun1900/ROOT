<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;
	String hzbh=null;
	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");
	String nianyue=null;
	String nianyue2=null;
	nianyue=sjfw.substring(0,4)+sjfw.substring(5,7);
	nianyue2=sjfw2.substring(0,4)+sjfw2.substring(5,7);
//不得跨月
	if (!(nianyue.equals(nianyue2)))
	{
		out.print("请选择同一个月份，不得跨月！");
		return;
	}

	String fgs=request.getParameter("fgs");
	hzbh=fgs+nianyue;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>费用申请提交
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</B> 
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
	String yshz=null;


	ls_sql="select count(*) cs";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where rs_fysq.fgs='"+fgs+"' ";
	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	if (rs.next())
	{
		allcs=rs.getInt("cs");
	}
	rs.close();
	ps.close();

	if(allcs==0)
	{
		out.print("本月预算未输入！");
		return;
	}

	ls_sql="select count(*) cs";
	ls_sql+=" from rs_fysh";
	ls_sql+=" where hzbh='"+hzbh+"' and yshz!='04' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcs=rs.getInt("cs");
	}
	rs.close();
	ps.close();
//当预算未提交时返回。
	if(allcs==1)
	{
		out.print("本月预算已提交！");
		return;
	}
	ls_sql="select yshz";
	ls_sql+=" from rs_fysh";
	ls_sql+=" where hzbh='"+hzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yshz=rs.getString("yshz");
	}
	rs.close();
	ps.close();
	if ((yshz!="") && (yshz!=null) && (yshz.equals("04")))
	{
		out.print("<font color=red>修改后的预算提交！</font>");
	}

	ls_sql="select count(*) cs,sum(fy) zj";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='01' and rs_fysq.fgs='"+fgs+"' ";
	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
	ls_sql+=" where xqlx='01' and rs_fysq.fgs='"+fgs+"' ";
	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

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
	ls_sql+=" where xqlx='02' and rs_fysq.fgs='"+fgs+"' ";
	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
ls_sql+=" where xqlx='02' and rs_fysq.fgs='"+fgs+"' ";
ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

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
		ls_sql+=" where xqlx='03' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
		ls_sql+=" where xqlx='03' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

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
		ls_sql+=" where xqlx='04' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
		ls_sql+=" where xqlx='04' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

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
		ls_sql+=" where xqlx='05' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
		ls_sql+=" where xqlx='05' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

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
		ls_sql+=" where xqlx='06' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
		ls_sql+=" where xqlx='06' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

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
		ls_sql+=" where xqlx='07' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
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
		ls_sql+=" where xqlx='07' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

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
%>
  <input type="hidden" name="fgs"  value="<%=fgs%>" >
  <input type="hidden" name="sjfw"  value="<%=sjfw%>">
  <input type="hidden" name="yshz"  value="<%=yshz%>">
  <tr align="center">
    <td colspan="6"><input name="button" type="button" value="提交" onClick="f_do(tjform)">
    </td>
  </tr>
<%
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