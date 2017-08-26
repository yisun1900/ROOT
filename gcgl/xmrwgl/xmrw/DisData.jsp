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

String jjrksg = null;
String khbh = null;
String khxm = null;


String[][] outStr=null; 
String bgcolor=null;

String rwxh=null;
String rwbm=null;
String rwmc=null;
String jhkssj=null;
String jhjssj=null;
String jhgzr=null;

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

	khbh =up.getParameter("khbh");
	jjrksg =up.getParameter("jjrksg");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select khxm" ;
	sql+=" from crm_khxx " ;
	sql+=" where khbh='"+khbh+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		khxm = rs.getString("khxm");			    
	}
	else{
		out.println("错误！客户不存在");
		return;
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入项目计划（客户：<font color="#FF0000"><b><%=khxm%></b></font>）</p>
  </div>
	<input type="hidden" name="jjrksg" value="<%=jjrksg%>">
	<input type="hidden" name="khbh" value="<%=khbh%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="6%">任务序号</td>
      <td width="54%">任务名称</td>
      <td width="15%">计划开始时间</td>
      <td width="15%">计划结束时间</td>
      <td width="10%">计划工日</td>
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

		row++;

		int len=outStr[i].length;
		if (len<3)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		rwxh=outStr[i][0].trim();
		rwmc=outStr[i][1].trim();
		jhkssj=outStr[i][2].trim();
		jhjssj=outStr[i][3].trim();
		jhgzr=outStr[i][4].trim();

		if (rwmc.equals(""))
		{
			out.println("！！！行号["+i+"]错误，[任务名称]为空");
			return;
		}

		if (rwxh.equals(""))
		{
			out.println("<BR>行号["+i+"]错误，[任务序号]不能为空");
			return;
		}
		else{
			try
			{
				Integer.parseInt(rwxh.trim());
			}
			catch (Exception e)
			{
				out.print("<BR>行号["+i+"]错误，[任务序号]不是数字类型:" +rwxh);
				return;
			}
		}

		if (jhgzr.equals(""))//计划工日为空
		{
			if (jhkssj.equals(""))//开始时间为空
			{
				out.println("<BR>行号["+i+"]错误，[计划开始时间]、[计划工日]不能同时为空");
				return;
			}
			else{//开始时间不为空
				if (jhjssj.equals(""))//结束时间为空
				{
					out.println("<BR>行号["+i+"]错误，[计划结束时间]、[计划工日]不能同时为空");
					return;
				}
				else{//结束时间不为空,根据[计划开始时间]、[计划结束时间]自动计算[计划工日]
					sql="select count(*)";
					sql+=" from  dm_gzrl";
					sql+=" where rq>=TO_DATE('"+jhkssj+"','YYYY-MM-DD') and rq<=TO_DATE('"+jhjssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1：节、假日不可施工
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2：节日不可施工
					{
						sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
					}
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						jhgzr=rs.getString(1);
					}
					rs.close();
					ps.close();
				}
			}

		}
		else{//计划工日不为空
			try
			{
				Integer.parseInt(jhgzr.trim());
			}
			catch (Exception e)
			{
				out.print("<BR>行号["+i+"]错误，[计划工日]不是数字类型:" +jhgzr);
				return;
			}

			if (jhkssj.equals(""))//开始时间为空
			{
				if (jhjssj.equals(""))
				{
					out.println("<BR>行号["+i+"]错误，[计划结束时间]、[计划开始时间]不能同时为空");
					return;
				}
				else{//根据结束时间自动取开始时间
					try{
						java.sql.Date.valueOf(jhjssj.trim());
					}
					catch (Exception e){
						out.println("<BR>行号["+i+"]错误，[计划结束时间]不是日期类型:"+jhjssj);
						return;
					}

					sql="select rq";

					sql+=" from (";

					sql+=" select rq";
					sql+=" from  dm_gzrl";
					sql+=" where rq<=TO_DATE('"+jhjssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1：节、假日不可施工
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2：节日不可施工
					{
						sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
					}
					sql+=" order by rq desc";

					sql+=" )";

					sql+=" where rownum<="+jhgzr;
					sql+=" order by rq";
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						jhkssj=cf.fillNull(rs.getDate(1));
					}
					rs.close();
					ps.close();
				}
			}
			else{//开始时间不为空
				try{
					java.sql.Date.valueOf(jhkssj.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+i+"]错误，[计划开始时间]不是日期类型:"+jhkssj);
					return;
				}

				if (!jhjssj.equals(""))//结束不为空，检查工日是否正确
				{
					try{
						java.sql.Date.valueOf(jhjssj.trim());
					}
					catch (Exception e){
						out.println("<BR>行号["+i+"]错误，[计划结束时间]不是日期类型:"+jhjssj);
						return;
					}

					String day=null;
					sql="select count(*)";
					sql+=" from  dm_gzrl";
					sql+=" where rq>=TO_DATE('"+jhkssj+"','YYYY-MM-DD') and rq<=TO_DATE('"+jhjssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1：节、假日不可施工
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2：节日不可施工
					{
						sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
					}
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						day=rs.getString(1);
					}
					rs.close();
					ps.close();

					if (!day.equals(jhgzr))
					{
						out.println("<BR>任务["+i+"]错误，[计划工日]不正确，应为："+day);
						return;
					}
				}
				else{//结束时间为空，根据开始时间自动取结束时间
					sql="select rq";

					sql+=" from (";

					sql+=" select rq";
					sql+=" from  dm_gzrl";
					sql+=" where rq>=TO_DATE('"+jhkssj+"','YYYY-MM-DD')";
					if (jjrksg.equals("1"))//1：节、假日不可施工
					{
						sql+=" and jjrbz='N'";
					}
					else if (jjrksg.equals("2"))//2：节日不可施工
					{
						sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
					}
					sql+=" order by rq";

					sql+=" )";

					sql+=" where rownum<="+jhgzr;
					sql+=" order by rq desc";
				//	out.println(sql);
					ps= conn.prepareStatement(sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						jhjssj=cf.fillNull(rs.getDate(1));
					}
					rs.close();
					ps.close();
				}
			}
		}




		sql=" select rwbm" ;
		sql+=" from dm_bzrwbm " ;
		sql+=" where rwmc='"+rwmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			rwbm = rs.getString("rwbm");			    
		}
		else{
			out.println("！！！序号["+i+"]错误，不存在的[任务名称]："+rwmc);
			return;
		}
		rs.close();
		ps.close();


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=rwxh%> 
        <input name="rwxh" type="hidden" value="<%=rwxh%>">
      </td>
      <td align="left">【任务编码：<%=rwbm%>】<%=rwmc%>
        <input name="rwbm" type="hidden" value="<%=rwbm%>">
        <input name="rwmc" type="hidden" value="<%=rwmc%>">
      </td>
      <td><%=jhkssj%> 
        <input name="jhkssj" type="hidden" value="<%=jhkssj%>">
      </td>
      <td> <%=jhjssj%>
        <input name="jhjssj" type="hidden" value="<%=jhjssj%>" >
      </td>
	  <td align="center"> <%=jhgzr%>
        <input name="jhgzr" type="hidden" value="<%=jhgzr%>" >
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
      共导入数：<%=row%>
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
