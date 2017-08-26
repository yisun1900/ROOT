<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>维护模板</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");
String dzbj=cf.GB2Uni(request.getParameter("dzbj"));

String bjjb=null;
String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString(1);
		ssfgs=rs.getString(2);
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString(1);
	}
	rs.close();
	ps.close();
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>请检查拷贝的Excel文件是否正确，若错误改正后重新拷贝</b>
		<input name="khbh" type="hidden" value="<%=khbh%>">
		<input name="bjjb" type="hidden" value="<%=bjjb%>">
		<input name="ssfgs" type="hidden" value="<%=ssfgs%>">
		<input name="dqbm" type="hidden" value="<%=dqbm%>">
          <input name="button" type="button" onClick="f_do(editform)"  value="存盘">
          <input type="radio" name="czfs" value="1">
          替换原报价
          <input name="czfs" type="radio" value="2" checked>
          增加到原报价</td>
    </tr>
    <tr>
      <td width="68%" height="57"><table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">
            <td width="10%"><strong>房间</strong></td>
            <td width="17%"><strong>项目编号</strong></td>
            <td width="45%"><strong>项目名称</strong></td>
            <td width="9%"><strong>计量单位</strong></td>
            <td width="9%"><strong>单价</strong></td>
            <td width="10%"><strong>工程量</strong></td>
          </tr>
<%

	String[] lineStr=dzbj.split("\r\n");
	if (lineStr==null || lineStr.length<2)
	{
		out.println("<BR>错误！未录入报价数据");
		return;
	}

	//检查列顺序是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String rowData=lineStr[0];
	String[] colStr=rowData.split("	");
	if (colStr==null || colStr.length!=6)
	{
		out.println("<BR>错误！列数量不足，应该是6列，实际列："+colStr.length);
		return;
	}

	if (!colStr[0].trim().equals("房间"))
	{
		out.println("<BR>错误！第1列应该是【房间】，而不是："+colStr[0]);
		return;
	}
	if (!colStr[1].trim().equals("项目编号"))
	{
		out.println("<BR>错误！第2列应该是【项目编号】，而不是："+colStr[1]);
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
	//检查列顺序是否正确====================结束

	//取数据＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	for (int i=1;i<lineStr.length ;i++ )
	{
		rowData=lineStr[i];
		colStr=rowData.split("	");
		if (colStr==null || colStr.length!=6)
		{
			out.println("<BR>第["+(i+1)+"]行错误！列数量不足，应该是6列，本行数据被放弃，实际列："+colStr.length);
			continue;
		}

		String jgwzbm=colStr[0].trim();
		String xmbh=colStr[1].trim();
		String xmmc=colStr[2].trim();
		String jldwmc=colStr[3].trim();
		String djStr=colStr[4].trim();
		String slStr=colStr[5].trim();


		//检查项目名称等是否正确＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_jzbjb";
		ls_sql+=" where xmbh='"+xmbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)//项目编号不存在
		{
//			out.println("<BR>第["+(i+1)+"]行错误！项目编号不存在："+xmbh);

			double dj=0;
			try{
				dj=Double.parseDouble(djStr);

				djStr="<font color='#0000CC'>"+dj+"</font>";
			}
			catch (Exception e){
//				out.println("<BR>第["+(i+1)+"]行错误！单价不是数字："+djStr);

				djStr=djStr+"<font color='#FF0000'>（错误非数字）</font>";
			}

			xmbh="<font color='#0000CC'><B>"+xmbh+"不存在</B></font>";
			xmmc="<font color='#0000CC'>"+xmmc+"</font>";
			jldwmc="<font color='#0000CC'>"+jldwmc+"</font>";


			double sl=0;
			try{
				sl=Double.parseDouble(slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>" ><%=jgwzbm%></td>
					<td><input name="xmbh" type="text" value="输入正确值" size="15" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<%=xmbh%>
					</td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>
					<td><input name="sl" type="hidden" value="<%=sl%>" ><%=sl%></td>
				</tr>
				<%
			}
			catch (Exception e){
//				out.println("<BR>第["+(i+1)+"]行错误！工程量不是数字："+slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>" ><%=jgwzbm%></td>
					<td><input name="xmbh" type="text" value="输入正确值" size="15" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<%=xmbh%>
					</td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>
					<td><input name="sl" type="text" value="输入正确值" size="9" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<font color='#0000CC'><B>[<%=slStr%>]非数字</B></font>
					</td>
				</tr>
				<%
			}


		}
		else{//项目编号存在
			String getxmmc=null;
			String getjldwmc=null;
			double getbj=0;
			ls_sql="SELECT xmmc,jldwmc,bj";
			ls_sql+=" FROM bj_jzbjb,jdm_jldwbm";
			ls_sql+=" where bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getxmmc=rs.getString("xmmc");
				getjldwmc=rs.getString("jldwmc");
				getbj=rs.getDouble("bj");
			}
			rs.close();
			ps.close();

			double dj=0;
			try{
				dj=Double.parseDouble(djStr);

				if (getbj!=dj)//检查是否和标准相同
				{
	//				out.println("<BR>第["+(i+1)+"]行：项目编号["+xmbh+"]错误！单价不正确，正确为【"+getbj+"】，您导入为【"+djStr+"】");
					djStr=djStr+"<font color='#FF0000'>（错误！应为"+getbj+"）</font>";
				}
			}
			catch (Exception e){
//				out.println("<BR>第["+(i+1)+"]行错误！单价不是数字："+djStr);
				djStr=djStr+"<font color='#FF0000'>（错误非数字！应为"+getbj+"）</font>";
			}

			if (!getxmmc.equals(xmmc))//检查是否和标准相同
			{
//				out.println("<BR>第["+(i+1)+"]行：项目编号["+xmbh+"]错误！项目名称不正确，正确为【"+getxmmc+"】，您导入为【"+xmmc+"】");
				xmmc=xmmc+"<font color='#FF0000'>（错误！应为【"+getxmmc+"】）</font>";
			}
			if (!getjldwmc.equals(jldwmc))//检查是否和标准相同
			{
//				out.println("<BR>第["+(i+1)+"]行：项目编号["+xmbh+"]错误！计量单位不正确，正确为【"+getjldwmc+"】，您导入为【"+jldwmc+"】");
				jldwmc=jldwmc+"<font color='#FF0000'>（错误！应为【"+getjldwmc+"】）</font>";
			}

			double sl=0;
			try{
				sl=Double.parseDouble(slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>"><%=jgwzbm%></td>
					<td><input name="xmbh" type="hidden" value="<%=xmbh%>"><%=xmbh%></td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>
					<td><input name="sl" type="hidden" value="<%=sl%>"><%=sl%></td>
				</tr>
				<%
			}
			catch (Exception e){
//				out.println("<BR>第["+(i+1)+"]行错误！工程量不是数字："+slStr);

				%>
				<tr align="center" bgcolor="#FFFFFF"> 
					<td><input name="jgwzbm" type="hidden" value="<%=jgwzbm%>"><%=jgwzbm%></td>
					<td><input name="xmbh" type="hidden" value="<%=xmbh%>"><%=xmbh%></td>
					<td><%=xmmc%></td>
					<td><%=jldwmc%></td>
					<td><%=djStr%></td>

					<td><input name="sl" type="text" value="输入正确值" size="9" maxlength="16" style="border-color: #FFFFFF #FFFFFF #FF0000;border-style:solid"> 
					<font color='#0000CC'><B>[<%=slStr%>]非数字</B></font>
					</td>
				</tr>
				<%
			}

		}

		//检查项目名称等是否正确＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		
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
	FormName.action="SaveExcelCopy.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
