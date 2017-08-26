<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入数据 </title>
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

String dqbm=null;
String dqmc=null;
String wybh=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmdlmc=null;
String xmxlmc=null;
String xmxlbm=null;

String xh=null;
String bjjbbm=null;
String bjjbmc=null;
String glflbm=null;
String glflmc=null;
String glmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
String jldwmc=null;
String xhlstr=null;
double xhl=0;
String djstr=null;
double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();


	String yxdqmc=null;
	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		yxdqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveDisGlfx.jsp" name="editform" target="_blank">
<div align="center">
    导入工料分析
    <BR><font color="#FF0000"><b>请注意：</b></font><b>地区</b><font color="#FF0000"><b>[<%=yxdqmc%>]
	<BR>千万不要重复存盘，否则将导入重复数据</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="3%">序号</td>
		<td width="4%">地区</td>
		<td width="6%">项目大类</td>
		<td width="8%">项目小类</td>
		<td width="6%">项目编号</td>
		<td width="14%">项目名称</td>

		<td width="5%">报价级别</td>
		<td width="5%">工料分类</td>
		<td width="13%">工料名称</td>
		<td width="5%">计量单位</td>
		<td width="5%">消耗量</td>
		<td width="5%">单价</td>
		<td width="10%">品牌</td>
		<td width="13%">型号规格</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 

	int row=0;

	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1].equals(""))
		{
			out.println("提醒!序号["+xh+"]下面一行的数据为空,下面的数据自动被放弃");
			break;
		}

		xh=outStr[i][0];
		dqmc=outStr[i][1];
		xmdlmc=outStr[i][2];
		xmxlmc=outStr[i][3];
		xmbh=outStr[i][4];
		xmmc=outStr[i][5];
		bjjbmc=outStr[i][6];
		glflmc=outStr[i][7];
		glmc=outStr[i][8];
		jldwmc=outStr[i][9];
		xhlstr=outStr[i][10];
		djstr=outStr[i][11];
		pp=outStr[i][12];
		xhgg=outStr[i][13];

		if (!yxdqmc.equals(dqmc.trim()))
		{
			out.println("！！！序号["+xh+"]错误，[地区]不正确："+dqmc);
			return;
		}

		sql=" select xmdlbm" ;
		sql+=" from bdm_xmdlbm " ;
		sql+=" where xmdlmc='"+xmdlmc.trim()+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmdlbm = rs.getString("xmdlbm");			    
		}
		else{
			out.println("！！！序号["+xh+"]错误，不存在的[项目大类]："+xmdlmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select xmxlbm" ;
		sql+=" from bdm_xmxlbm " ;
		sql+=" where xmxlmc='"+xmxlmc.trim()+"' and xmdlbm='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmxlbm = rs.getString("xmxlbm");			    
		}
		else{
			out.println("！！！序号["+xh+"]错误，项目大类中不存在的[项目小类]："+xmxlmc);
			return;
		}
		rs.close();
		ps.close();


		String yxmmc="";
		if (xmbh.equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[项目编号]为空");
			return;
		}
		else{
			sql=" select xmmc" ;
			sql+=" from bj_gzbjb " ;
			sql+=" where xmbh='"+xmbh.trim()+"' and dqbm='"+dqbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				yxmmc = rs.getString("xmmc");			    
			}
			else{
				out.println("！！！序号["+xh+"]错误，不存在的[项目编号]："+xmbh);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xmmc.equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[项目名称]为空");
			return;
		}
		else{
			if (!yxmmc.trim().equals(xmmc.trim()))
			{
				out.println("！！！序号["+xh+"]错误，家装报价表中的[项目名称]与导入文件中不一致，家装报价表中项目名称：["+yxmmc+"]");
				return;
			}
		}
		if (glmc.equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[工料名称]为空");
			return;
		}

		if (bjjbmc.equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[报价级别]为空");
			return;
		}
		else{
			sql=" select bjjbbm" ;
			sql+=" from bdm_bjjbbm " ;
			sql+=" where bjjbmc='"+bjjbmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				bjjbbm = rs.getString("bjjbbm");			    
			}
			else{
				out.println("！！！序号["+xh+"]错误，不存在的[报价级别]："+bjjbmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (glflmc.equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[工料分类]为空");
			return;
		}
		else{
			sql=" select glflbm" ;
			sql+=" from bdm_glflbm " ;
			sql+=" where glflmc='"+glflmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				glflbm = rs.getString("glflbm");			    
			}
			else{
				out.println("！！！序号["+xh+"]错误，不存在的[工料分类]："+glflmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jldwmc.equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select cljldwbm" ;
			sql+=" from bdm_cljldwbm " ;
			sql+=" where cljldwmc='"+jldwmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("cljldwbm");			    
			}
			else{
				out.println("！！！序号["+xh+"]错误，不存在的[计量单位]："+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xhlstr.trim().equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[消耗量]为空");
			return;
		}
		else{
			xhl=Double.parseDouble(xhlstr.trim());
		}

		if (djstr.trim().equals(""))
		{
			out.println("！！！序号["+xh+"]错误，[单价]为空");
			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="xh" type="hidden" value="<%=xh%>">
      </td>
      <td><%=dqmc%> 
      </td>
      <td><%=xmdlmc%> 
      </td>
      <td><%=xmxlmc%> 
      </td>
      <td><%=xmbh%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
      <td><%=xmmc%>
      </td>
      <td><%=bjjbmc%>
        <input name="bjjb" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=glflmc%>
        <input name="glflbm" type="hidden" value="<%=glflbm%>" >
      </td>
      <td><%=glmc%>
        <input name="glmc" type="hidden" value="<%=glmc%>" >
      </td>
      <td><%=jldwmc%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=xhl%>
        <input name="xhl" type="hidden" value="<%=xhl%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=pp%>
        <input name="pp" type="hidden" value="<%=pp%>" >
      </td>
      <td><%=xhgg%>
        <input name="xhgg" type="hidden" value="<%=xhgg%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	return;
}
finally 
{
	try{
		f.close();
		if (f != null) f.close(); 
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)" name="bc">
        <input type="reset"  value="允许存盘" onClick="bc.disabled=false;">
        <input type="reset"  value="重输">
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
