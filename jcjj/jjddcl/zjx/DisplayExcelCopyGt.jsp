<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>拷贝Excel文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=request.getParameter("zjxxh");

String dataStr=cf.GB2Uni(request.getParameter("dataStr"));

String gtbcpp=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int gtStart=0;
int bjStart=3;
int pjStart=0;
try {
	conn=cf.getConnection();

 %>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>增减项序号：<%=zjxxh%><P>请检查拷贝的Excel文件是否正确，若错误改正后重新拷贝
		<input name="ddbh" type="hidden" value="<%=ddbh%>">
		<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
          <input name="button" type="button" onClick="f_do(editform)"  value="存盘">
      </td>
    </tr>
    <tr>
      <td>
<%

	String[] lineStr=dataStr.split("\r\n");
	if (lineStr==null || lineStr.length<2)
	{
		out.println("<BR>错误！未录入报价数据");
		return;
	}
%>
	 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
			<tr bgcolor="#CCCCCC"  align="center">
			  <td><STRONG><font color="#FF0000">柜体</font></STRONG></td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
		  </tr>
			<tr bgcolor="#CCCCCC"  align="center"> 
				<td  width="15%"><strong>柜体名称</strong></td>
				<td  width="13%"><strong>安装位置</strong></td>
				<td  width="12%"><strong>规格</strong></td>
				<td  width="11%"><strong>家具系列</strong></td>
				<td  width="11%"><strong>板材类型</strong></td>
				<td  width="9%"><strong>板材颜色</strong></td>
				<td  width="29%"><strong>备注</strong></td>
			</tr>
<%

	//检查列顺序是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String rowData=lineStr[gtStart+1];
	String[] colStr=rowData.split("	");
	if (colStr==null || colStr.length!=7)
	{
		out.println("<BR>错误！列数量不足，应该是7列，实际列："+colStr.length);
		return;
	}
	//取数据＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=gtStart+2;i<3;i++ )
	{
		rowData=lineStr[i];
		colStr=rowData.split("	",7);
		if (colStr==null || colStr.length<6)
		{
			out.println("<BR>第["+(i+1)+"]行错误！列数量不足，应该是7列，本行数据被放弃，实际列："+colStr.length);
			return;
		}

		String gtmc=colStr[0].trim();
		String jjazwz=colStr[1].trim();
		String guige=colStr[2].trim();
		String jjlx=colStr[3].trim();
		String gtbclx=colStr[4].trim();
		String bcys=colStr[5].trim();
		String gtbz=null;
		if (colStr.length==7)
		{
			gtbz=colStr[6].trim();
		}
		else{
			gtbz="";
		}


		//检查[板件名称]等是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_jjazwzbm";
		ls_sql+=" where jjazwzmc='"+jjazwz+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("<BR>第["+(i+1)+"]行错误！【安装位置："+jjazwz+"】不存在");
			return;
		}

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_jjlbbm";
		ls_sql+=" where jjlbmc='"+jjlx+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("<BR>第["+(i+1)+"]行错误！【家具系列："+jjlx+"】不存在");
			return;
		}

		ls_sql="SELECT bcpp";
		ls_sql+=" FROM jc_jjbjbj";
		ls_sql+=" where bclx='"+gtbclx+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gtbcpp=rs.getString(1);
		}
		else{
			out.println("<BR>第["+(i+1)+"]行错误！【板材类型："+gtbclx+"】不存在");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jdm_gtbcysbm";
		ls_sql+=" where gtbcysmc='"+bcys+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("<BR>第["+(i+1)+"]行错误！【板材颜色："+bcys+"】不存在");
			return;
		}


		double dj=0;

		double bzdj=0;
		double zqje=0;


		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><input name="gtmc" type="hidden" value="<%=gtmc%>"><%=gtmc%></td>
			<td><input name="jjazwz" type="hidden" value="<%=jjazwz%>"><%=jjazwz%></td>
			<td><input name="guige" type="hidden" value="<%=guige%>"><%=guige%></td>
			<td><input name="jjlx" type="hidden" value="<%=jjlx%>"><%=jjlx%></td>
			<td><input name="gtbclx" type="hidden" value="<%=gtbclx%>"><%=gtbclx%>
			<input name="bcpp" type="hidden" value="<%=gtbcpp%>">
			</td>
			<td><input name="bcys" type="hidden" value="<%=bcys%>"><%=bcys%></td>
			<td><input name="gtbz" type="hidden" value="<%=gtbz%>"><%=gtbz%></td>
		</tr>
		<%
	}
%>	
	</table>
	<BR>

	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#CCCCCC">
            <td><STRONG><font color="#FF0000">柜体板件</font></STRONG></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr align="center" bgcolor="#CCCCCC">
			<td  width="14%"><strong>板材类型</strong></td>
			<td  width="9%"><strong>板件名称</strong></td>
			<td  width="9%"><strong>板材厚度(mm)</strong></td>
			<td  width="7%"><strong>长(mm)</strong></td>
			<td  width="7%"><strong>宽(mm)</strong></td>
			<td  width="6%"><strong>数量</strong></td>
			<td  width="8%"><strong><font color="#0000FF">单价</font></strong></td>
			<td  width="9%"><strong><font color="#0000FF">金额</font></strong></td>
			<td  width="31%"><strong>备注</strong></td>
          </tr>
<%

	//检查列顺序是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	rowData=lineStr[bjStart+1];
	colStr=rowData.split("	");
	if (colStr==null || colStr.length!=7)
	{
		out.println("<BR>错误！列数量不足，应该是7列，实际列："+colStr.length);
		return;
	}


	//取数据＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=bjStart+2;i<lineStr.length ;i++ )
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
		String bjslStr=colStr[5].trim();
		String bjbz=null;
		if (colStr.length==7)
		{
			bjbz=colStr[6].trim();
		}
		else{
			bjbz="";
		}

		if (bclx.equals("柜体配件"))
		{
			pjStart=i;
			break;
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

		int bjsl=0;
		try{
			bjsl=Integer.parseInt(bjslStr);
		}
		catch (Exception e){
			out.println("<BR>第["+(i+1)+"]行错误！[数量]不是数字："+bjslStr);
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

		double bjbzdj=dj;
		double bjzqje=cf.round(bjbzdj*cd/1000*kd/1000*bjsl,2);


		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><input name="bclx" type="hidden" value="<%=bclx%>"><%=bclx%></td>
			<td><input name="bjmc" type="hidden" value="<%=bjmc%>"><%=bjmc%></td>
			<td><input name="bchd" type="hidden" value="<%=bchd%>"><%=bchd%></td>
			<td><input name="cd" type="hidden" value="<%=cd%>"><%=cd%></td>
			<td><input name="kd" type="hidden" value="<%=kd%>"><%=kd%></td>
			<td><input name="bjsl" type="hidden" value="<%=bjsl%>"><%=bjsl%></td>
			<td><input name="bjbzdj" type="hidden" value="<%=bjbzdj%>"><%=bjbzdj%></td>
			<td><input name="bjzqje" type="hidden" value="<%=bjzqje%>"><%=bjzqje%></td>
			<td><input name="bjbz" type="hidden" value="<%=bjbz%>"><%=bjbz%></td>
		</tr>
		<%
	}

%>

	</table>
	<BR>

	 <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#CCCCCC">
            <td><STRONG><font color="#FF0000">柜体配件</font></STRONG></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr align="center" bgcolor="#CCCCCC">
			<td  width="8%"><strong>配件编号</strong></td>
			<td  width="14%"><strong>配件名称</strong></td>
			<td  width="13%"><strong>型号</strong></td>
			<td  width="10%"><strong>规格</strong></td>
			<td  width="7%"><strong>计量单位</strong></td>
			<td  width="6%"><strong>数量</strong></td>
			<td  width="8%"><strong><font color="#0000FF">单价</font></strong></td>
			<td  width="9%"><strong><font color="#0000FF">金额</font></strong></td>
			<td  width="25%"><strong>备注</strong></td>
          </tr>
<%

	//检查列顺序是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	rowData=lineStr[pjStart+1];
	colStr=rowData.split("	");
	if (colStr==null || colStr.length!=7)
	{
		out.println("<BR>错误！列数量不足，应该是7列，实际列："+colStr.length);
		return;
	}



	//取数据＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=pjStart+2;i<lineStr.length ;i++ )
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
		String pjslStr=colStr[5].trim();
		String pjbz=null;
		if (colStr.length==7)
		{
			pjbz=colStr[6].trim();
		}
		else{
			pjbz="";
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

		int pjsl=0;
		try{
			pjsl=Integer.parseInt(pjslStr);
		}
		catch (Exception e){
			out.println("<BR>第["+(i+1)+"]行错误！[数量]不是数字："+pjslStr);
			return;
		}

		double pjbzdj=getdj;
		double pjzqje=cf.round(pjbzdj*pjsl,2);


		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><input name="gtpjbh" type="hidden" value="<%=gtpjbh%>"><%=gtpjbh%></td>
			<td><%=gtpjmc%></td>
			<td><%=xinghao%></td>
			<td><%=guige%></td>
			<td><%=jldwmc%></td>
			<td><input name="pjsl" type="hidden" value="<%=pjsl%>"><%=pjsl%></td>
			<td><input name="pjbzdj" type="hidden" value="<%=pjbzdj%>"><%=pjbzdj%></td>
			<td><input name="pjzqje" type="hidden" value="<%=pjzqje%>"><%=pjzqje%></td>
			<td><input name="pjbz" type="hidden" value="<%=pjbz%>"><%=pjbz%></td>
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

	</table>

      </td>
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
	FormName.action="SaveExcelCopyGt.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
