<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>拷贝Excel文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=request.getParameter("zjxxh");

String dataStr=cf.GB2Uni(request.getParameter("dataStr"));

String gtbcpp=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

 	ls_sql="select bcpp";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gtbcpp=rs.getString("bcpp");
	}
	rs.close();
	ps.close();

 %>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>增减项序号：<%=zjxxh%>,柜体序号：<%=gtxh%><P>请检查拷贝的Excel文件是否正确，若错误改正后重新拷贝</b>
		<input name="gtxh" type="hidden" value="<%=gtxh%>">
		<input name="ddbh" type="hidden" value="<%=ddbh%>">
		<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
          <input name="button" type="button" onClick="f_do(editform)"  value="存盘">
          <input type="radio" name="czfs" value="1">
          替换柜体所有板件
          <input name="czfs" type="radio" value="2" checked>
          增加新板件</td>
    </tr>
    <tr>
      <td>
	 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">
			<td  width="14%">板材类型</td>
			<td  width="9%">板件名称</td>
			<td  width="9%">板材厚度(mm)</td>
			<td  width="7%">长(mm)</td>
			<td  width="7%">宽(mm)</td>
			<td  width="6%">数量</td>
			<td  width="8%"><font color="#0000FF">单价</font></td>
			<td  width="9%"><font color="#0000FF">金额</font></td>
			<td  width="31%">备注</td>
          </tr>
<%

	String[] lineStr=dataStr.split("\r\n");
	if (lineStr==null || lineStr.length<2)
	{
		out.println("<BR>错误！未录入报价数据");
		return;
	}

	//检查列顺序是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String rowData=lineStr[0];
	String[] colStr=rowData.split("	");
	if (colStr==null || colStr.length!=7)
	{
		out.println("<BR>错误！列数量不足，应该是7列，实际列："+colStr.length);
		return;
	}

/*
	if (!colStr[0].trim().equals("板材类型"))
	{
		out.println("<BR>错误！第1列应该是【板材类型】，而不是："+colStr[0]);
		return;
	}
	if (!colStr[1].trim().equals("板件名称"))
	{
		out.println("<BR>错误！第2列应该是【板件名称】，而不是："+colStr[1]);
		return;
	}
	if (!colStr[2].trim().equals("项目名称"))
	{
		out.println("<BR>错误！第3列应该是【项目名称】，而不是："+colStr[2]);
		return;
	}
	if (!colStr[3].trim().equals("计量单位"))
	{
		out.println("<BR>错误！第4列应该是【计量单位】，而不是："+colStr[3]);
		return;
	}
	if (!colStr[4].trim().equals("单价"))
	{
		out.println("<BR>错误！第5列应该是【单价】，而不是："+colStr[4]);
		return;
	}
	if (!colStr[5].trim().equals("工程量"))
	{
		out.println("<BR>错误！第6列应该是【工程量】，而不是："+colStr[5]);
		return;
	}
*/
	//检查列顺序是否正确====================结束

	//取数据＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=1;i<lineStr.length ;i++ )
	{
		rowData=lineStr[i];
		colStr=rowData.split("	",7);
		if (colStr==null || colStr.length<6)
		{
			out.println("<BR>第["+(i+1)+"]行错误！列数量不足，应该是7列，本行数据被放弃，实际列："+colStr.length);
			return;
		}

		String bclx=colStr[0].trim();
		String bjmc=colStr[1].trim();
		String bchd=colStr[2].trim();
		String cdStr=colStr[3].trim();
		String kdStr=colStr[4].trim();
		String slStr=colStr[5].trim();
		String bz=null;
		if (colStr.length==7)
		{
			bz=colStr[6].trim();
		}
		else{
			bz="";
		}


		//检查[板件名称]等是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		int count=0;
		//[板材类型]是否存在
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jc_jjbjbj";
		ls_sql+=" where bclx='"+bclx+"' and bcpp='"+gtbcpp+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)//板材类型
		{
			out.println("<BR>第["+(i+1)+"]行错误！在品牌【"+gtbcpp+"】中【板材类型："+bclx+"】不存在");
			return;
		}

		//[板件名称]是否存在
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_gtbjmc";
		ls_sql+=" where bjmc='"+bjmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)//板件名称
		{
			out.println("<BR>第["+(i+1)+"]行错误！[板件名称]不存在："+bjmc);
			return;
		}

		int cd=0;
		try{
			cd=Integer.parseInt(cdStr);
		}
		catch (Exception e){
			out.println("<BR>第["+(i+1)+"]行错误！[长]不是数字："+cdStr);
			return;
		}
		int kd=0;
		try{
			kd=Integer.parseInt(kdStr);
		}
		catch (Exception e){
			out.println("<BR>第["+(i+1)+"]行错误！[宽]不是数字："+kdStr);
			return;
		}

		int sl=0;
		try{
			sl=Integer.parseInt(slStr);
		}
		catch (Exception e){
			out.println("<BR>第["+(i+1)+"]行错误！[数量]不是数字："+slStr);
			return;
		}

		double dj=0;
		ls_sql="select dj";
		ls_sql+=" from jc_jjbjbj";
		ls_sql+=" where  bclx='"+bclx+"' and bchd="+bchd;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dj=rs.getDouble("dj");
		}
		else{
			out.println("<BR>第["+(i+1)+"]行错误！[单价]不存在，可能是[板材类型]或[板材厚度]不正确，SQL="+ls_sql);
			return;
		}
		rs.close();
		ps.close();

		double bzdj=dj;
		double zqje=cf.round(bzdj*cd/1000*kd/1000*sl,2);


		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><input name="bclx" type="hidden" value="<%=bclx%>"><%=bclx%></td>
			<td><input name="bjmc" type="hidden" value="<%=bjmc%>"><%=bjmc%></td>
			<td><input name="bchd" type="hidden" value="<%=bchd%>"><%=bchd%></td>
			<td><input name="cd" type="hidden" value="<%=cd%>"><%=cd%></td>
			<td><input name="kd" type="hidden" value="<%=kd%>"><%=kd%></td>
			<td><input name="sl" type="hidden" value="<%=sl%>"><%=sl%></td>
			<td><input name="bzdj" type="hidden" value="<%=bzdj%>"><%=bzdj%></td>
			<td><input name="zqje" type="hidden" value="<%=zqje%>"><%=zqje%></td>
			<td><input name="bz" type="hidden" value="<%=bz%>"><%=bz%></td>
		</tr>
		<%
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
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


      </table></td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="SaveExcelCopyBj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
