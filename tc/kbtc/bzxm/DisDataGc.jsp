<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入数据 </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String bjbbh = null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String bjjbbm = null;
String bjjbmc=null;
String jldw=null;
String hxbm=null;
String hxmc=null;
String jgwzbm=null;
String xmbh=null;
String xmmc=null;
String slStr=null;
String djStr=null;
String sfkthStr=null;
String sfkscStr=null;
String sfkth=null;
String sfksc=null;


double sl=0;
double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");
	bjbbh =up.getParameter("bjbbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadDataGc.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入套餐标配工程项目</p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>版本号</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>；</b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="8%">报价级别</td>
	<td  width="11%">户型</td>
	<td  width="15%">结构位置</td>
	<td  width="11%">项目编号</td>
	<td  width="20%">项目名称</td>
	<td  width="6%">计量单位</td>
	<td  width="7%">标配数量</td>
	<td  width="8%">单价</td>
	<td  width="7%">是否可替换</td>
	<td  width="7%">是否可删除</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}
		row++;

		int len=outStr[i].length;
		if (len<7)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		bjjbmc=outStr[i][0].trim();
		hxmc=outStr[i][1].trim();
		jgwzbm=outStr[i][2].trim();
		xmbh=outStr[i][3].trim();
		xmmc=outStr[i][4].trim();
		jldw=outStr[i][5].trim();
		slStr=outStr[i][6].trim();
		djStr=outStr[i][7].trim();
		sfkthStr=outStr[i][8].trim();
		sfkscStr=outStr[i][9].trim();


		if (xmbh.equals(""))
		{
			out.println("行号["+row+"]错误！项目编号为空");
			return;
		}

		sql=" select bjjbbm" ;
		sql+=" from bdm_bjjbbm " ;
		sql+=" where bjjbmc='"+bjjbmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			bjjbbm = rs.getString("bjjbbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[报价级别]："+bjjbmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select hxbm" ;
		sql+=" from dm_hxbm " ;
		sql+=" where hxmc='"+hxmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			hxbm = rs.getString("hxbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[户型]："+hxmc);
			return;
		}
		rs.close();
		ps.close();

		String getxmmc = "";
		sql=" select xmmc" ;
		sql+=" from bj_jzbjb " ;
		sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			getxmmc = rs.getString("xmmc");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[项目编号]："+xmbh);
//			return;
		}
		rs.close();
		ps.close();
		if (!getxmmc.equals(xmmc))
		{
			out.println("行号["+row+"]错误！[项目名称]不正确，应为：【"+getxmmc+"】");
//			return;
		}




		if (slStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[标配数量]不能为空");
			return;
		}
		else{
			try{
				sl=Double.parseDouble(slStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[标配数量:"+slStr+"]不是数字:"+e);
				return;
			}
		}


		if (djStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[单价]不能为空");
			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[单价:"+djStr+"]不是数字:"+e);
				return;
			}
		}


		if (sl==0)
		{
			slStr="";
		}
		if (dj==0)
		{
			djStr="";
		}

		if (sfkthStr.equals("可替换"))
		{
			sfkth="Y";
		}
		else if (sfkthStr.equals("否"))
		{
			sfkth="N";
		}
		else{
			out.println("行号["+row+"]错误！[是否可替换]只能为【可替换；否】，目前为["+sfkthStr+"]");
			return;
		}

		if (sfkscStr.equals("可删除"))
		{
			sfksc="Y";
		}
		else if (sfkscStr.equals("否"))
		{
			sfksc="N";
		}
		else{
			out.println("行号["+row+"]错误！[是否可删除]只能为【可删除；否】，目前为["+sfkscStr+"]");
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=hxmc%>
        <input name="hxbm" type="hidden" value="<%=hxbm%>">
      </td>
      <td><%=jgwzbm%>
        <input name="jgwzbm" type="hidden" value="<%=jgwzbm%>">
      </td>
      <td><%=xmbh%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>">
      </td>
	  <td ><%=xmmc%>
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>">
      </td>
      <td><%=slStr%>
        <input name="sl" type="hidden" value="<%=sl%>" >
      </td>
      <td><%=djStr%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=sfkthStr%>
        <input name="sfkth" type="hidden" value="<%=sfkth%>" >
      </td>
      <td><%=sfkscStr%>
        <input name="sfksc" type="hidden" value="<%=sfksc%>" >
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
		f.close();
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
        <input type="button" name="bc" value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输" onClick="bc.disabled=false">
      共导入项目数：<%=row%>
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
