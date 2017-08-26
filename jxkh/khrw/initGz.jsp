<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入考核任务</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String ssfgs =null;
String khzq =null;

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ssfgs = up.getParameter("ssfgs");
	khzq = up.getParameter("khzq");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();

	%> 
<form method="post" action="saveInitGz.jsp" name="editform" >
<div align="center">导入考核任务</div>
<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
<input type="hidden" name="khzq" value="<%=khzq%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="17"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="10%">员工序号</td>
	<td  width="20%">所属部门</td>
	<td  width="15%">工号</td>
	<td  width="15%">员工姓名</td>
	<td  width="20%">行政职务</td>
	<td  width="15%">考核业绩</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 

	if (outStr==null)
	{
		out.println("错误！Execel文件无法识别，请重新复制一份新文件");
		return;
	}

	conn=cf.getConnection();    //得到连接

	String ygbh=null;
	String dwbh=null;
	String dwmc=null;
	String bianhao=null;
	String yhmc=null;
	String xzzwbm=null;

	String byrwStr=null;
	double byrw=0;
	
	
	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}


		ygbh=outStr[i][0].trim();
		dwmc=outStr[i][1].trim();
		bianhao=outStr[i][2].trim();
		yhmc=outStr[i][3].trim();
		xzzwbm=outStr[i][4].trim();

		byrwStr=outStr[i][5].trim();
		
		
		if (ygbh.equals(""))
		{
			out.println("提醒!第"+i+"行[员工序号]为空,下面的数据自动被放弃");
			break;
		}

		sql="select dwbh";
		sql+=" from  sq_dwxx";
		sql+=" where dwmc='"+dwmc+"' and ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
		}
		else{
			out.println("<BR>错误!所属部门不存在："+dwmc);
		}
		rs.close();
		ps.close();


		int count=0;
		sql="select count(*)";
		sql+=" from  sq_yhxx";
		sql+=" where ygbh='"+ygbh+"' and dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count<1)
		{
			out.println("<BR>错误！该[员工序号]【"+ygbh+"】不存在："+sql);
		}
		
		String getyhmc=null;
		String getbianhao=null;
		String getxzzwbm=null;
		sql="select yhmc,bianhao,xzzwbm";
		sql+=" from  sq_yhxx";
		sql+=" where ygbh='"+ygbh+"' and dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getyhmc=rs.getString("yhmc");
			getbianhao=rs.getString("bianhao");
			getxzzwbm=rs.getString("xzzwbm");
		}
		rs.close();
		ps.close();

		if (!getyhmc.equals(yhmc))
		{
			out.println("<BR>错误！【员工序号:"+ygbh+"】姓名不正确，正确为："+getyhmc+"，而导入为："+yhmc);
		}
		if (!getbianhao.equals(bianhao))
		{
			out.println("<BR>错误！【员工序号:"+ygbh+"】工号不正确，正确为："+getbianhao+"，而导入为："+bianhao);
		}
		if (!getxzzwbm.equals(xzzwbm))
		{
			out.println("<BR>错误！【员工序号:"+ygbh+"】行政职务不正确，正确为："+getxzzwbm+"，而导入为："+xzzwbm);
		}
		
		
		
		if (byrwStr.equals(""))
		{
			out.println("<BR>["+yhmc+"]提醒！[考核业绩]为空");
			byrwStr="0";
			byrw=0;
		}
		else{
			try{
				byrw=Double.parseDouble(byrwStr);
			}
			catch (Exception e){
				out.println("["+yhmc+"]错误！[考核业绩]不是数字");
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=ygbh%> 
        <input name="ygbh" type="hidden" value="<%=ygbh%>" >
      </td>
      <td><%=dwmc%> 
        <input name="dwbh" type="hidden" value="<%=dwbh%>" >
      </td>
	  </td>
      <td> <%=bianhao%>
        <input name="bianhao" type="hidden" value="<%=bianhao%>">
		</td>
      <td> <%=yhmc%>
        <input name="yhmc" type="hidden" value="<%=yhmc%>">
		</td>
      <td> <%=xzzwbm%>
        <input name="xzzwbm" type="hidden" value="<%=xzzwbm%>">
		</td>
      <td><%=byrwStr%>
        <input name="byrw" type="hidden" value="<%=byrw%>">
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	out.print("<BR>SQL=" + sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
		f.close();
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
