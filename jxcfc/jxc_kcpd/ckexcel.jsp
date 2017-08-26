<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>维护主材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
double zcpsl=0;
double ccpsl=0;
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
String yxuhao=null;
String yckmc=null;
String yhjmc=null;
String yhwmc=null;
String yclbm=null;
String ykcsl=null;
String yzcpsl=null;
String yccpsl=null;
String ybfpsl=null;
String dqbm=null;
String dqmc=null;
String ydqmc=null;
int count=0;
String pdph=null;
try 
{
	conn=cf.getConnection();    //得到连接
	

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	pdph =up.getParameter("pdph");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
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
	else
	{
		out.println("<BR>！！！序号["+xuhao+"]错误，不存在的仓库["+yckmc+"]！！！");
		return;
	}
	rs.close();
	ps.close();
	%> 
<form method="post" action="Saveexcel.jsp" name="editform" target="_blank">
  <div align="center">录入盘点结果明细</div>
   <input name="pdph" type="hidden" value="<%=pdph%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">序号</td>
	<td  width="5%">地区</td>
	<td  width="8%">仓库</td>
	<td  width="6%">材料编码</td>
	<td  width="12%">材料名称</td>	
	<td  width="8%">型号</td>
	<td  width="8%">规格</td>
	<td  width="7%">内部编码</td>
	<td  width="4%">正常品数量</td>
	<td  width="4%">残次品数量</td>
	<td  width="4%">报废品数量</td>
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
		yxuhao=outStr[i][0].trim();
		ydqmc=outStr[i][1].trim();
		yckmc=outStr[i][2].trim();
		yclbm=outStr[i][3].trim();
		yclmc=outStr[i][4].trim();
		yxh=outStr[i][5].trim();
		ygg=outStr[i][6].trim();
		ynbbm=outStr[i][7].trim();
		yzcpsl=outStr[i][8].trim();
		yccpsl=outStr[i][9].trim();
		ybfpsl=outStr[i][10].trim();

		//序号
		xuhao=yxuhao;
		//地区名称
		if (!(dqmc.equals(ydqmc)))
		{out.println("<BR>！！！序号["+xuhao+"]错误，仓库不符！盘点地区为:["+dqmc+"];您录入的地区为:["+ydqmc+"];");return;}

		//仓库名称
		if (!(ckmc.equals(yckmc)))
		{out.println("<BR>！！！序号["+xuhao+"]错误，仓库不符！盘点仓库为:["+ckmc+"];您录入的仓库为:["+yckmc+"];");return;}
		
		
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

		//盘点正常品数量
		zcpsl=0;
		if (yzcpsl!=null && !yzcpsl.trim().equals(""))
		{
			try{
				zcpsl=Double.parseDouble(yzcpsl.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[盘点正常品数量]非数字：" + yzcpsl);
				return;
			}
		}
		if (zcpsl<0)
		{out.println("<BR>！！！序号["+xuhao+"]错误，[盘点正常品数量]必须大于等于零！！！");
			return;}
			//盘点残次品数量
		ccpsl=0;
		if (yccpsl!=null && !yccpsl.trim().equals(""))
		{
			try{
				ccpsl=Double.parseDouble(yccpsl.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[盘点残次品数量]非数字：" + yccpsl);
				return;
			}
		}
		if (ccpsl<0)
		{out.println("<BR>！！！序号["+xuhao+"]错误，[盘点残次品数量]必须大于等于零！！！");
			return;}
			//盘点报废品数量
		bfpsl=0;
		if (ybfpsl!=null && !ybfpsl.trim().equals(""))
		{
			try{
				bfpsl=Double.parseDouble(ybfpsl.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[盘点报废品数量]非数字：" + ybfpsl);
				return;
			}
		}
		if (bfpsl<0)
		{out.println("<BR>！！！序号["+xuhao+"]错误，[盘点报废品数量]必须大于等于零！！！");
			return;}
		

%> 
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=yxuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
	  <td><%=ydqmc%> 
        <input name="dqbm" type="hidden" value="<%=dqbm%>">
      </td>
		<td><%=yckmc%> 
        <input name="ckbh" type="hidden" value="<%=ckbh%>">
      </td>
	  <td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
	  <td><%=yclmc%></td>
	  <td><%=yxh%></td>
	  <td><%=ygg%></td>
	  <td><%=ynbbm%></td>
	  <td><%=zcpsl%> 
        <input name="zcpsl" type="hidden" value="<%=zcpsl%>">
      </td>
	  <td><%=ccpsl%> 
        <input name="ccpsl" type="hidden" value="<%=ccpsl%>">
      </td>
	  <td><%=bfpsl%> 
        <input name="bfpsl" type="hidden" value="<%=bfpsl%>">
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
//	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
