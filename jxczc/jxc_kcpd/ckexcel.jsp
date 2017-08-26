<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>维护主材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;
String xuhao=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String clbm=null;
double kcsl=0;
double ykcsl=0;
double sjsl=0;
double bfpsl=0;

String ckmc=null;
String hjmc=null;
String hwmc=null;
String zljb=null;
String yclmc=null;
String yxh=null;
String ygg=null;
String ynbbm=null;
String yzljb=null;
String yckmc=null;
String yhjmc=null;
String yhwmc=null;
String yclbm=null;
String ykcslStr=null;
String sjslStr=null;
String ybfpsl=null;
String dqbm=null;
String dqmc=null;
String ydqmc=null;
String yppmc=null;
int count=0;
String pdph=null;
String scph=null; 
String scrq=null; 
try 
{
	conn=cf.getConnection();    //得到连接
	

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	pdph =up.getParameter("pdph");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\jxczc\\jxc_kcpd\\excel\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();


	//查询盘点记录中的仓库名称
	sql=" select ckmc,jxc_kcpdjl.ckbh ckbh,dqmc,jxc_kcpdjl.dqbm dqbm " ;
	sql+=" from jxc_kcpdjl,jxc_ckmc,dm_dqbm " ;
	sql+=" where jxc_kcpdjl.dqbm=dm_dqbm.dqbm and jxc_kcpdjl.ckbh=jxc_ckmc.ckbh and pdph='"+pdph+"' " ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");
		dqbm = rs.getString("dqbm");
		ckmc = rs.getString("ckmc");
		ckbh = rs.getString("ckbh");			
	}
	rs.close();
	ps.close();
	%> 
<form method="post" action="Saveexcel.jsp" name="editform" target="_blank">
  <div align="center">录入盘点结果明细</div>
   <input name="pdph" type="hidden" value="<%=pdph%>">
   <input name="dqbm" type="hidden" value="<%=dqbm%>">
   <input name="ckbh" type="hidden" value="<%=ckbh%>">
  <table width="160%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">序号</td>
	<td  width="5%">地区</td>
	<td  width="9%">仓库</td>
	<td  width="9%">货架</td>
	<td  width="7%">生产批号</td>
	<td  width="6%">生产日期</td>
	<td  width="8%">材料编码</td>
	<td  width="12%">材料名称</td>	
	<td  width="11%">型号</td>
	<td  width="10%">规格</td>
	<td  width="8%">品牌</td>
	<td  width="5%">内部编码</td>
	<td  width="4%">库存数量</td>
	<td  width="4%">实际数量</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][1]==null || outStr[i][1].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}

		xuhao=outStr[i][0].trim();
		ydqmc=outStr[i][1].trim();
		yckmc=outStr[i][2].trim();
		yhjmc=outStr[i][3].trim();
		scph=outStr[i][4].trim();
		scrq=outStr[i][5].trim();
		yclbm=outStr[i][6].trim();
		yclmc=outStr[i][7].trim();
		yxh=outStr[i][8].trim();
		ygg=outStr[i][9].trim();
		yppmc=outStr[i][10].trim();
		ynbbm=outStr[i][11].trim();
		ykcslStr=outStr[i][12].trim();
		sjslStr=outStr[i][13].trim();

		//序号

		//地区名称
		if (!dqmc.equals(ydqmc))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，仓库不符！盘点地区为:["+dqmc+"];您录入的地区为:["+ydqmc+"];");
			return;
		}

		//仓库名称
		if (!ckmc.equals(yckmc))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，仓库不符！盘点仓库为:["+ckmc+"];您录入的仓库为:["+yckmc+"];");
			return;
		}

		//材料编码
		if (yclbm!=null && !yclbm.trim().equals(""))
		{
			clbm=cf.addZero(yclbm,13);
		}
		else
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[材料编码]不可为空！！！");
			return;
		}

		//库存数量
		ykcsl=0;
		if (ykcslStr!=null && !ykcslStr.equals(""))
		{
			try{
				ykcsl=Double.parseDouble(ykcslStr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[库存数量]非数字：" + ykcslStr);
				return;
			}
		}

		if (ykcsl<0)
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[库存数量]必须大于等于零！！！");
			return;
		}

		//实际数量
		sjsl=0;
		if (sjslStr!=null && !sjslStr.trim().equals(""))
		{
			try{
				sjsl=Double.parseDouble(sjslStr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[实际数量]非数字：" + sjslStr);
				return;
			}
		}
		if (sjsl<0)
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[实际数量]必须大于等于零！！！");
			return;
		}

		sql="select hjbh";
		sql+=" from  jxc_hjmc";
		sql+=" where hjmc='"+yhjmc+"' and ckbh="+ckbh ;
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			hjbh=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (hjbh==null || hjbh.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[货架名称]不存在:"+yhjmc);
//			return;
		}
	

%> 
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
	  <td><%=ydqmc%></td>
		<td><%=yckmc%></td>
		<td><%=yhjmc%> 
        <input name="hjbh" type="hidden" value="<%=hjbh%>">
      </td>

	  <td><%=scph%>
        <input name="scph" type="hidden" value="<%=scph%>">
	  </td>
	  <td><%=scrq%>
        <input name="scrq" type="hidden" value="<%=scrq%>">
	  </td>


		<td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
	  <td><%=yclmc%></td>
	  <td><%=yxh%></td>
	  <td><%=ygg%></td>
		<td><%=yppmc%> 
      </td>
	  <td><%=ynbbm%></td>
	  <td><%=ykcsl%> 
        <input name="ykcsl" type="hidden" value="<%=ykcsl%>">
      </td>
	  <td><%=sjsl%> 
        <input name="sjsl" type="hidden" value="<%=sjsl%>">
      </td>
    </tr>
    <%
	}
	rwe=null;
}
catch (Exception e) {
	out.print("序号["+xuhao+"]出错：" + e);
	return;
}
finally 
{
	outStr=null; 

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
      <td colspan="42"> 
        <input type="button"  value="存盘" name="bc" onClick="f_do(editform)">
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
