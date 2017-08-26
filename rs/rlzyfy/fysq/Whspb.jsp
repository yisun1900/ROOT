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
  <B>费用申请审批维护
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="post" action="" name="shform" target="_blank">
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
	String y_spjl=null;

	ls_sql="select count(*) cs,yshz,spjl";
	ls_sql+=" from rs_fysh";
	ls_sql+=" where hzbh='"+hzbh+"'  group by yshz,spjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcs=rs.getInt("cs");
		yshz=rs.getString("yshz");
		y_spjl=rs.getString("spjl");
	}
	rs.close();
	ps.close();

//当预算未提交时返回。
	if(allcs==0)
	{
		out.print("本月预算还未提交！");
		return;
	}
//当“等待审核”并且不是“返回审核”时返回	
	if(yshz.equals("01") && (!y_spjl.equals("2")))
	{
		out.print("本月预算还未审核！");
		return;
	}
//等待审批状态无法维护
	if(yshz.equals("02"))
	{
		out.print("还未审批，无法进行维护！");
		return;
	}
//招聘费明细
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
//培训费明细
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
//福利费明细
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
</table>
<%		
		String yshjl=null;
		String yshyj=null;
		String yshr=null;
		String yshsj=null;
		String yspjl=null;
		String yspyj=null;
		String yspr=null;
		String yspsj=null;
		ls_sql="select DECODE(shjl,'1','审核通过','2','返回修改','0','取消审核') shjl,shyj,shr,shsj,DECODE(spjl,'1','审批通过','2','返回审核','0','取消审批') spjl,spyj,spr,spsj ";
		ls_sql+=" from rs_fysh";
		ls_sql+=" where hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
		 yshjl=cf.fillHtml(rs.getString("shjl"));
		 yshyj=cf.fillHtml(rs.getString("shyj"));
		 yshr=cf.fillHtml(rs.getString("shr"));
		 yshsj=cf.fillHtml(rs.getDate("shsj"));
		 yspjl=cf.fillHtml(rs.getString("spjl"));
		 yspyj=cf.fillHtml(rs.getString("spyj"));
		 yspr=cf.fillHtml(rs.getString("spr"));
		 yspsj=cf.fillHtml(rs.getDate("spsj"));
		}
		rs.close();
		ps.close();
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%">&nbsp;</td>
	  <td  width="10%">结论</td>
	  <td  width="20%">审核人</td>
	  <td  width="20%">审核时间</td>
	  <td  width="40%">意见</td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%"><font color=red>审核</font></td>
	  <td  width="10%"><%=yshjl%></td>
	  <td  width="20%"><%=yshr%></td>
	  <td  width="20%"><%=yshsj%></td>
	  <td  width="40%"><%=yshyj%></td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%"><font color=red>审批</font></td>
	  <td  width="10%"><%=yspjl%></td>
	  <td  width="20%"><%=yspr%></td>
	  <td  width="20%"><%=yspsj%></td>
	  <td  width="40%"><%=yspyj%></td>
	</tr>
</table>

<%
		String spjl=null;
		String spr=null;
		String spsj=null;
		String spyj=null;
		
		ls_sql="select hzbh,spjl,spr,spsj,spyj";
		ls_sql+=" from rs_fysh";
		ls_sql+=" where hzbh='"+hzbh+"'";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
		hzbh=cf.fillNull(rs.getString("hzbh"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spyj=cf.fillNull(rs.getString("spyj"));
		}
		rs.close();
		ps.close();

%>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">申请编号</font></td> 
  <td width="35%"> 
    <input type="text" name="hzbh" value="<%=hzbh%>" size="20" maxlength="10" readonly>
  </td>
  <td align="right" width="15%">审批结论</td> 
  <td width="35%"> 
    <select name="spjl" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"1+审批通过&2+返回审核&0+取消申请",spjl);
%>
    </select>
  </td>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">审批人</font></td> 
  <td width="35%"> 
    <input type="text" name="spr" size="20" maxlength="20"  value="<%=spr%>" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">审批时间</font></td> 
  <td width="35%"> 
    <input type="text" name="spsj" size="20" maxlength="10"  value="<%=spsj%>" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审批意见</td> 
  <td width="35%" colspan="3"> 
    <textarea name="spyj" cols="71" rows=""><%=spyj%></textarea>
  </td>
</tr>    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="fgs"  value="<%=fgs%>" >
	<input type="hidden" name="sjfw"  value="<%=sjfw%>">
	<input type="hidden" name="yspjl"  value="<%=spjl%>" >
	<input type="button"  value="存盘" onClick="f_do(shform)" name="button">
	<input type="reset"  value="重输" name="reset">
      </td>
    </tr>
</table>

	 </form>
</body>
</html>
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

<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="SaveWhsp.jsp";
	FormName.button.disabled=true;
	FormName.submit();
	return true;
}


//-->
</SCRIPT>