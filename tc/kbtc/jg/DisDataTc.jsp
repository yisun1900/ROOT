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
String hxbm=null;
String hxmc=null;
String fwmjStr=null;
String tcmc=null;
String tcjgStr=null;
String pmzjdjStr=null;
String cpjgStr=null;
String sgjgStr=null;
String jjjgStr=null;

int fwmj=0;
double tcjg=0;
double cpjg=0;
double sgjg=0;
double jjjg=0;
double pmzjdj=0;

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
<form method="post" action="SaveLoadDataTc.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入套餐总价</p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>版本号</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>；</b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	<P>注意：不要重复导入</b></font></p>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="13%">报价级别</td>
	<td  width="13%">户型</td>
	<td  width="10%">起价面积</td>
	<td  width="13%">套餐名称</td>
	<td  width="10%">套餐总价</td>
	<td  width="10%">产品起包价</td>
	<td  width="10%">施工起包价</td>
	<td  width="10%">家具起包价</td>
	<td  width="10%">平米增加单价</td>
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
		fwmjStr=outStr[i][2].trim();
		tcmc=outStr[i][3].trim();
		tcjgStr=outStr[i][4].trim();
		cpjgStr=outStr[i][5].trim();
		sgjgStr=outStr[i][6].trim();
		jjjgStr=outStr[i][7].trim();
		pmzjdjStr=outStr[i][8].trim();

		if (hxmc.equals(""))
		{
			out.println("行号["+row+"]错误！户型为空");
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



		if (fwmjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[起价面积]不能为空");
			return;
		}
		else{
			try{
				fwmj=Integer.parseInt(fwmjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[起价面积:"+fwmjStr+"]不是整数:"+e);
				return;
			}
		}

		if (tcjgStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[套餐总价]不能为空");
			return;
		}
		else{
			try{
				tcjg=Double.parseDouble(tcjgStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[套餐总价:"+tcjgStr+"]不是数字:"+e);
				return;
			}
		}

		if (pmzjdjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[平米增加单价]不能为空");
			return;
		}
		else{
			try{
				pmzjdj=Double.parseDouble(pmzjdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[平米增加单价:"+pmzjdjStr+"]不是数字:"+e);
				return;
			}
		}

		if (cpjgStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[产品起包价]不能为空");
			return;
		}
		else{
			try{
				cpjg=Double.parseDouble(cpjgStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[产品起包价:"+cpjgStr+"]不是数字:"+e);
				return;
			}
		}
		if (sgjgStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[施工起包价]不能为空");
			return;
		}
		else{
			try{
				sgjg=Double.parseDouble(sgjgStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[施工起包价:"+sgjgStr+"]不是数字:"+e);
				return;
			}
		}
		if (jjjgStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[家具起包价]不能为空");
			return;
		}
		else{
			try{
				jjjg=Double.parseDouble(jjjgStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[家具起包价:"+jjjgStr+"]不是数字:"+e);
				return;
			}
		}

		if (tcjg!=cf.round(cpjg+sgjg+jjjg,2))
		{
			out.println("<BR>行号["+row+"]错误！[套餐总价:"+tcjg+"]不等于：产品价格＋施工价格＋家具起包价");
		}




		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=hxmc%>
        <input name="hxbm" type="hidden" value="<%=hxbm%>">
      </td>
      <td><%=fwmjStr%>
        <input name="fwmj" type="hidden" value="<%=fwmj%>">
      </td>
      <td><%=tcmc%>
        <input name="tcmc" type="hidden" value="<%=tcmc%>">
      </td>
      </td>
      <td><%=tcjg%>
        <input name="tcjg" type="hidden" value="<%=tcjg%>" >
      </td>
      <td><%=cpjg%>
        <input name="cpjg" type="hidden" value="<%=cpjg%>" >
      </td>
      <td><%=sgjg%>
        <input name="sgjg" type="hidden" value="<%=sgjg%>" >
      </td>
      <td><%=jjjg%>
        <input name="jjjg" type="hidden" value="<%=jjjg%>" >
      </td>
      <td><%=pmzjdj%>
        <input name="pmzjdj" type="hidden" value="<%=pmzjdj%>" >
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
