<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
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

String bjbbh = null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String tcsjflbm = null;
String tcsjflmc=null;
String bjjbbm=null;
String bjjbmc=null;
String bjjbbm1=null;
String bjjbmc1=null;
String jldw=null;
String sjcjStr=null;

double sjcj=0;

String sjsfycxstr=null;
String cxsjcjstr=null;
String cxkssjstr=null;
String cxjssjstr=null;

String sjsfycx=null;
double cxsjcj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjssj=null;

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
<form method="post" action="SaveLoadDataSj.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入套餐价格</p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>版本号</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>；</b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="15%">套餐升级分类</td>
		<td width="10%">原报价级别</td>
		<td width="10%">升级报价级别</td>
		<td width="10%">计量单位</td>
		<td width="10%">升级差价</td>
		<td  width="15%">升级是否有促销</td>
		<td  width="10%">促销升级差价</td>
		<td  width="10%">促销开始时间</td>
		<td  width="10%">促销结束时间</td>
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
		if (len<9)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		tcsjflmc=outStr[i][0].trim();
		bjjbmc=outStr[i][1].trim();
		bjjbmc1=outStr[i][2].trim();
		jldw=outStr[i][3].trim();
		sjcjStr=outStr[i][4].trim();

		sjsfycxstr=outStr[i][5].trim();
		cxsjcjstr=outStr[i][6].trim();
		cxkssjstr=outStr[i][7].trim();
		cxjssjstr=outStr[i][8].trim();

		if (bjjbmc.equals(""))
		{
			out.println("行号["+row+"]错误！户型为空");
			return;
		}

		sql=" select tcsjflbm" ;
		sql+=" from bj_tcsjflbm " ;
		sql+=" where tcsjflmc='"+tcsjflmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tcsjflbm = rs.getString("tcsjflbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[套餐升级分类]："+tcsjflmc);
			return;
		}
		rs.close();
		ps.close();

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
			out.println("行号["+row+"]错误！不存在的[原报价级别]："+bjjbmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select bjjbbm" ;
		sql+=" from bdm_bjjbbm " ;
		sql+=" where bjjbmc='"+bjjbmc1+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			bjjbbm1 = rs.getString("bjjbbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[升级报价级别]："+bjjbmc1);
			return;
		}
		rs.close();
		ps.close();

		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[计量单位]："+jldw);
			return;
		}
		rs.close();
		ps.close();



		if (sjcjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级差价]不能为空");
			return;
		}
		else{
			try{
				sjcj=Double.parseDouble(sjcjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级差价:"+sjcjStr+"]不是数字:"+e);
				return;
			}
		}

		
		//是否有促销
		sjsfycx="1";
		if (sjsfycxstr!=null && !sjsfycxstr.equals(""))
		{
			if (sjsfycxstr.equals("无数量限制促销"))
			{
				sjsfycx="2";
			}
			else if (sjsfycxstr.equals("有数量限制促销"))
			{
				sjsfycx="3";
			}
			else if (sjsfycxstr.equals("无促销"))
			{
				sjsfycx="1";
			}
			else{
				out.println("<BR>！！！行号["+row+"]错误，[是否有促销]只能是【无数量限制促销】或【有数量限制促销】或【无促销】："+sjsfycxstr);
				return;
			}
		}
		
		if (sjsfycx.equals("2") || sjsfycx.equals("3"))
		{
			//促销价
			if (cxsjcjstr==null || cxsjcjstr.trim().equals(""))
			{
				out.print("<BR>行号["+row+"]错误！因为有促销，[促销价]不存在");
				return;
			}
			//促销开始时间
			if (cxkssjstr==null || cxkssjstr.trim().equals(""))
			{
				out.print("<BR>行号["+row+"]错误！因为有促销，[促销开始时间]不存在");
				return;
			}
			//促销结束时间
			if (cxjssjstr==null || cxjssjstr.trim().equals(""))
			{
				out.print("<BR>行号["+row+"]错误！因为有促销，[促销结束时间]不存在");
				return;
			}
		}
		else{
			//促销价
			if (cxsjcjstr!=null && !cxsjcjstr.trim().equals("") && !cxsjcjstr.trim().equals("0"))
			{
				out.print("行号["+row+"]错误！因为没有促销，不能有[促销价]");
				return;
			}
			//促销开始时间
			if (cxkssjstr!=null && !cxkssjstr.trim().equals(""))
			{
				out.print("行号["+row+"]错误！因为没有促销，不能有[促销开始时间]");
				return;
			}
			//促销结束时间
			if (cxjssjstr!=null && !cxjssjstr.trim().equals(""))
			{
				out.print("行号["+row+"]错误！因为没有促销，不能有[促销结束时间]");
				return;
			}
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=tcsjflmc%>
        <input name="tcsjflbm" type="hidden" value="<%=tcsjflbm%>" >
      </td>
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>">
      </td>
      <td><%=bjjbmc1%>
        <input name="bjjbbm1" type="hidden" value="<%=bjjbbm1%>">
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>">
      </td>
      </td>
      <td><%=sjcj%>
        <input name="sjcj" type="hidden" value="<%=sjcj%>" >
      </td>
      <td><%=sjsfycxstr%>
        <input name="sjsfycx" type="hidden" value="<%=sjsfycx%>" >
      </td>
      <td><%=cxsjcjstr%>
        <input name="cxsjcj" type="hidden" value="<%=cxsjcjstr%>" >
      </td>
      <td><%=cxkssjstr%>
        <input name="cxkssj" type="hidden" value="<%=cxkssjstr%>" >
      </td>
      <td><%=cxjssjstr%>
        <input name="cxjssj" type="hidden" value="<%=cxjssjstr%>" >
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
