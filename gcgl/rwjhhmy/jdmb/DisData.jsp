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

String mbbm = null;
String mbmc = null;


String[][] outStr=null; 
String bgcolor=null;


String rwbm=null;
String rwmc=null;
String rwsfsjStr=null;
int rwsfsj=0;
String rwtsStr=null;
int rwts=0;
String rwxhStr=null;
int rwxh=0;


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

	mbbm =up.getParameter("mbbm");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select mbmc" ;
	sql+=" from gdm_sgjdmb " ;
	sql+=" where mbbm='"+mbbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		mbmc = rs.getString("mbmc");			    
	}
	else{
		out.println("错误！模版不存在");
		return;
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>模版时间节点 </p>
    <p><font color="#FF0000"><b>请注意：模版[<%=mbmc%>]</b></font>
  </div>
	<input type="hidden" name="mbbm" value="<%=mbbm%>">

	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="10%">任务序号</td>
		<td width="60%">任务名称</td>
		<td width="15%">任务发生时间</td>
		<td width="15%">任务天数</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xmbhStr=new String[outStr.length-1];

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
		if (len<3)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		rwxhStr=outStr[i][0].trim();
		rwmc=outStr[i][1].trim();
		rwsfsjStr=outStr[i][2].trim();
		rwtsStr=outStr[i][3].trim();

		if (rwmc.equals(""))
		{
			out.println("！！！行号["+row+"]错误，任务名称为空");
			return;
		}


		rwbm="";
		sql=" select rwbm" ;
		sql+=" from gdm_rwbm " ;
		sql+=" where rwmc='"+rwmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			rwbm = rs.getString("rwbm");			    
		}
		else{
			out.println("<BR>！！！任务序号["+rwxhStr+"]错误，不存在的[任务名称]："+rwmc);
//			return;
		}
		rs.close();
		ps.close();




		if (rwxhStr.equals(""))
		{
			out.println("<BR>！！！任务序号["+rwxhStr+"]错误，任务发生时间不能为空");
//			return;
		}
		else{
			try{
				rwxh=Integer.parseInt(rwxhStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[任务发生时间:"+rwxhStr+"]不是数字:"+e);
				return;
			}
		}

		if (rwsfsjStr.equals(""))
		{
			out.println("<BR>！！！任务序号["+rwxhStr+"]错误，任务发生时间不能为空");
//			return;
		}
		else{
			try{
				rwsfsj=Integer.parseInt(rwsfsjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[任务发生时间:"+rwsfsjStr+"]不是数字:"+e);
				return;
			}
		}

		if (rwtsStr.equals(""))
		{
			out.println("<BR>！！！任务序号["+rwxhStr+"]错误，任务天数不能为空");
//			return;
		}
		else{
			try{
				rwts=Integer.parseInt(rwtsStr.trim());
			}
			catch (Exception e){
				out.println("<BR>[任务天数:"+rwtsStr+"]不是数字:"+e);
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=rwxhStr%> 
        <input name="rwxh" type="hidden" value="<%=rwxh%>">
      </td>
      <td align="left"><%=rwmc%> 
        <input name="rwbm" type="hidden" value="<%=rwbm%>">
      </td>
      <td><%=rwsfsjStr%> 
        <input name="rwsfsj" type="hidden" value="<%=rwsfsj%>">
      </td>
      <td><%=rwtsStr%> 
        <input name="rwts" type="hidden" value="<%=rwts%>">
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
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
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
	return true;
}
//-->
</SCRIPT>
