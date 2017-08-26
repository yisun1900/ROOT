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

String dataStr=cf.GB2Uni(request.getParameter("dataStr"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

 %>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>柜体序号：<%=gtxh%><P>请检查拷贝的Excel文件是否正确，若错误改正后重新拷贝</b>
		<input name="gtxh" type="hidden" value="<%=gtxh%>">
		<input name="ddbh" type="hidden" value="<%=ddbh%>">
          <input name="button" type="button" onClick="f_do(editform)"  value="存盘">
          <input type="radio" name="czfs" value="1">
          替换柜体所有配件
          <input name="czfs" type="radio" value="2" checked>
          增加新配件</td>
    </tr>
    <tr>
      <td>
	 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">
			<td  width="8%">配件编号</td>
			<td  width="14%">配件名称</td>
			<td  width="13%">型号</td>
			<td  width="10%">规格</td>
			<td  width="7%">计量单位</td>
			<td  width="6%">数量</td>
			<td  width="8%"><font color="#0000FF">单价</font></td>
			<td  width="9%"><font color="#0000FF">金额</font></td>
			<td  width="25%">备注</td>
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

		String gtpjbh=colStr[0].trim();
		String gtpjmc=colStr[1].trim();
		String xinghao=colStr[2].trim();
		String guige=colStr[3].trim();
		String jldwmc=colStr[4].trim();
		String slStr=colStr[5].trim();
		String bz=null;
		if (colStr.length==7)
		{
			bz=colStr[6].trim();
		}
		else{
			bz="";
		}


		//检查[配件编号]等是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

		//[配件编号]是否存在
		String getgtpjmc=null;
		String getjjpjflbm=null;
		String getjldwmc=null;
		String getxinghao=null;
		String getguige=null;
		double getdj=0;
		ls_sql="SELECT gtpjmc,jjpjflbm,jldwmc,xinghao,guige,dj";
		ls_sql+=" FROM jc_jjpjbj,jdm_jldwbm";
		ls_sql+=" where jc_jjpjbj.jldwbm=jdm_jldwbm.jldwbm(+) and gtpjbh='"+gtpjbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getgtpjmc=cf.fillNull(rs.getString("gtpjmc"));
			getjjpjflbm=cf.fillNull(rs.getString("jjpjflbm"));
			getjldwmc=cf.fillNull(rs.getString("jldwmc"));
			getxinghao=cf.fillNull(rs.getString("xinghao"));
			getguige=cf.fillNull(rs.getString("guige"));
			getdj=rs.getDouble("dj");
		}
		else{
			out.println("<BR>第["+(i+1)+"]行错误！【配件编号："+gtpjbh+"】不存在");
			return;
		}
		rs.close();
		ps.close();


		if (!getgtpjmc.equals(gtpjmc))//配件名称
		{
			out.println("<BR>第["+(i+1)+"]行错误！[配件名称]不正确，正确为【"+getgtpjmc+"】，导入为【"+gtpjmc+"】");
			return;
		}
		if (!getjldwmc.equals(jldwmc))
		{
			out.println("<BR>第["+(i+1)+"]行错误！[计量单位]不正确，正确为【"+getjldwmc+"】，导入为【"+jldwmc+"】");
			return;
		}
		if (!getxinghao.equals(xinghao))
		{
			out.println("<BR>第["+(i+1)+"]行错误！[计量单位]不正确，正确为【"+getxinghao+"】，导入为【"+xinghao+"】");
			return;
		}
		if (!getguige.equals(guige))
		{
			out.println("<BR>第["+(i+1)+"]行错误！[计量单位]不正确，正确为【"+getguige+"】，导入为【"+guige+"】");
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

		double bzdj=getdj;
		double zqje=cf.round(bzdj*sl,2);


		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><input name="gtpjbh" type="hidden" value="<%=gtpjbh%>"><%=gtpjbh%></td>
			<td><%=gtpjmc%></td>
			<td><%=xinghao%></td>
			<td><%=guige%></td>
			<td><%=jldwmc%></td>
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
	FormName.action="SaveExcelCopyPj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
