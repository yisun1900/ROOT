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

String bjjbbm = null;
String bjjbmc=null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String lbxmbm=null;
String lbmc=null;
String xmmc=null;
String ppmc=null;
String xh=null;
String jldw=null;
String zqdjStr=null;
String djStr=null;
String sjzjStr=null;
String slStr=null;
String lxStr=null;
String bz=null;


double zqdj=0;
double dj=0;
double sjzj=0;
double sl=0;
String lx=null;

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
	bjjbbm =up.getParameter("bjjbbm");

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
<form method="post" action="SaveLoadDataYh.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入套餐优惠项目</p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>报价级别</b><font color="#FF0000"><b>[<%=bjjbbm%>]</b></font><b>；</b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="7%">礼包名称</td>
	<td  width="6%">项目编码</td>
	<td  width="14%">项目名称</td>
	<td  width="10%">品牌</td>
	<td  width="12%">型号</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">折前单价</td>
	<td  width="5%">优惠单价</td>
	<td  width="5%">升级折价</td>
	<td  width="4%">数量</td>
	<td  width="4%">类型</td>
	<td  width="24%">备注及工艺说明</td>
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
		if (len<8)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		lbmc=outStr[i][0].trim();
		lbxmbm=outStr[i][1].trim();
		xmmc=outStr[i][2].trim();
		ppmc=outStr[i][3].trim();
		xh=outStr[i][4].trim();
		jldw=outStr[i][5].trim();
		zqdjStr=outStr[i][6].trim();
		djStr=outStr[i][7].trim();
		sjzjStr=outStr[i][8].trim();
		slStr=outStr[i][9].trim();
		lxStr=outStr[i][10].trim();
		bz=outStr[i][11].trim();


		if (lbxmbm.equals(""))
		{
			out.println("行号["+row+"]错误！礼包项目编码为空");
			return;
		}

		int count=0;
		sql=" select count(*)" ;
		sql+=" from tc_yhlb " ;
		sql+=" where lbmc='"+lbmc+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("行号["+row+"]错误！不存在的[礼包名称]："+lbmc);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			out.println("行号["+row+"]错误！不存在的[计量单位]："+jldw);
			return;
		}



		if (zqdjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[折前单价]不能为空");
			return;
		}
		else{
			try{
				zqdj=Double.parseDouble(zqdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[折前单价:"+zqdjStr+"]不是数字:"+e);
				return;
			}
		}

		if (djStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[优惠单价]不能为空");
			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[优惠单价:"+djStr+"]不是数字:"+e);
				return;
			}
		}


		if (sjzjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级折价]不能为空");
			return;
		}
		else{
			try{
				sjzj=Double.parseDouble(sjzjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级折价:"+sjzjStr+"]不是数字:"+e);
				return;
			}
		}

		if (slStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[数量]不能为空");
			return;
		}
		else{
			try{
				sl=Double.parseDouble(slStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[数量:"+slStr+"]不是数字:"+e);
				return;
			}
		}

		if (lxStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[类型]不能为空");
			return;
		}
		else if (lxStr.equals("工程"))
		{
			lx="1";//1：工程；2：主材
		}
		else if (lxStr.equals("主材"))
		{
			lx="2";//1：工程；2：主材
		}
		else{
			out.println("<BR>行号["+row+"]错误！[类型]只能是:工程、主材,实际为:"+lxStr);
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
 	  <td><%=lbmc%>
        <input name="lbmc" type="hidden" value="<%=lbmc%>">
      </td>
     <td><%=lbxmbm%>
        <input name="lbxmbm" type="hidden" value="<%=lbxmbm%>">
      </td>
      <td><%=xmmc%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>">
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>">
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td><%=zqdjStr%>
        <input name="zqdj" type="hidden" value="<%=zqdj%>" >
      </td>
      <td><%=djStr%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=sjzjStr%>
        <input name="sjzj" type="hidden" value="<%=sjzj%>" >
      </td>
      <td><%=slStr%>
        <input name="sl" type="hidden" value="<%=sl%>" >
      </td>
      <td><%=lxStr%>
        <input name="lx" type="hidden" value="<%=lx%>" >
      </td>
	  <td><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
