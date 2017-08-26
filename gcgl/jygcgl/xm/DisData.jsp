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


String[][] outStr=null; 
String bgcolor=null;
String xmdlmc=null;
String xmdlbm=null;
String xmxlmc=null;
String xmxlbm=null;

String xmbm=null;
String xmmc=null;
String wgjbbm=null;
String wgjbmc=null;

String xzzwbm=null;
String zgyq=null;


String bz=null;



String ygkfStr=null;
double ygkf=0;

String ygfkjeStr=null;
double ygfkje=0;

String sgdfkjeStr=null;
double sgdfkje=0;

String sgdkfStr=null;
double sgdkf=0;



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



	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();




	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">导入精益工程项目</div>
  <table width="110%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="8%">项目大类</td>
		<td width="8%">项目小类</td>
		<td width="6%">项目编号</td>
		<td width="12%">项目名称</td>
		<td width="6%">违规级别</td>
		<td width="9%">整改要求</td>
		<td width="8%">处罚人员职务</td>

		<td width="6%">员工罚款金额</td>
		<td width="6%">员工扣分</td>
		<td width="6%">施工队罚款金额</td>
		<td width="6%">施工队扣分</td>
		<td width="57%">备注</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xmbmStr=new String[outStr.length-1];

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
		if (len<12)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		xmdlmc=outStr[i][0].trim();
		xmxlmc=outStr[i][1].trim();

		xmbm=outStr[i][2].trim();
		xmmc=outStr[i][3].trim();

		wgjbmc=outStr[i][4].trim();
		zgyq=outStr[i][5].trim();
		xzzwbm=outStr[i][6].trim();


		ygfkjeStr=outStr[i][7].trim();
		ygkfStr=outStr[i][8].trim();
		sgdfkjeStr=outStr[i][9].trim();
		sgdkfStr=outStr[i][10].trim();
		bz=outStr[i][11].trim();


		if (xmbm.equals(""))
		{
			out.println("！！！行号["+row+"]错误，项目编号为空");
			return;
		}



		sql=" select xmdlbm" ;
		sql+=" from gdm_xmdlbm " ;
		sql+=" where xmdlmc='"+xmdlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmdlbm = rs.getString("xmdlbm");			    
		}
		else{
			out.println("！！！项目编号["+xmbm+"]错误，不存在的[项目大类]："+xmdlbm);
			return;
		}
		rs.close();
		ps.close();

		sql=" select xmxlbm" ;
		sql+=" from gdm_xmxlbm " ;
		sql+=" where xmxlmc='"+xmxlmc+"' and xmdlbm='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmxlbm = rs.getString("xmxlbm");			    
		}
		else{
			out.println("！！！项目编号["+xmbm+"]错误，不存在的[项目小类]："+xmxlbm);
			return;
		}
		rs.close();
		ps.close();

		if (!zgyq.equals(""))
		{
			sql=" select zgyq" ;
			sql+=" from gdm_zgyq " ;
			sql+=" where zgyq='"+zgyq+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				zgyq = rs.getString("zgyq");			    
			}
			else{
				out.println("！！！项目编号["+xmbm+"]错误，不存在的[整改要求]："+zgyq);
				return;
			}
			rs.close();
			ps.close();
		}


		if (wgjbmc.equals(""))
		{
			out.println("！！！项目编号["+xmbm+"]错误，[违规级别]为空");
			return;
		}
		else{
			sql=" select wgjbbm" ;
			sql+=" from gdm_wgjbbm " ;
			sql+=" where wgjbmc='"+wgjbmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				wgjbbm = rs.getString(1);			    
			}
			rs.close();
			ps.close();

			if (wgjbbm==null || wgjbbm.equals(""))
			{
				out.println("！！！项目编号["+xmbm+"]错误，不存在的[违规级别]："+wgjbmc);
				return;
			}
		}

		if (xzzwbm.equals(""))
		{
			out.println("！！！项目编号["+xmbm+"]错误，[处罚人员职务]为空");
			return;
		}
		else{
			int count=0;
			sql=" select count(*)" ;
			sql+=" from gdm_cfry " ;
			sql+=" where xzzwbm='"+xzzwbm+"' and wgjbbm='"+wgjbbm+"'" ;
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
				out.println("！！！项目编号["+xmbm+"]错误，不存在的[处罚人员职务]："+xzzwbm);
//				return;
			}
		}


		if (ygkfStr.equals(""))
		{
			ygkf=0;
		}
		else{
			try{
				ygkf=Double.parseDouble(ygkfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！错误，[员工扣分:"+ygkfStr+"]不是数字:"+e);
				return;
			}
		}



		if (ygfkjeStr.equals(""))
		{
			ygfkje=0;
		}
		else{
			try{
				ygfkje=Double.parseDouble(ygfkjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！错误，[员工罚款金额:"+ygfkjeStr+"]不是数字:"+e);
				return;
			}
		}


		if (sgdkfStr.equals(""))
		{
			sgdkf=0;
		}
		else{
			try{
				sgdkf=Double.parseDouble(sgdkfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！错误，[施工队扣分:"+sgdkfStr+"]不是数字:"+e);
				return;
			}
		}

		if (sgdfkjeStr.equals(""))
		{
			sgdfkje=0;
		}
		else{
			try{
				sgdfkje=Double.parseDouble(sgdfkjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！错误，[施工队罚款金额:"+sgdfkjeStr+"]不是数字:"+e);
				return;
			}
		}


		%> 



	  <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xmdlmc%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=xmxlmc%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td> <%=xmbm%>
        <input name="xmbm" type="hidden" value="<%=xmbm%>" >
      </td>
	  <td align="center"> <%=xmmc%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
	  <td align="center"> <%=wgjbmc%>
        <input name="wgjbbm" type="hidden" value="<%=wgjbbm%>" >
      </td>
      <td> <%=zgyq%>
        <input name="zgyq" type="hidden" value="<%=zgyq%>" >
      </td>
      <td> <%=xzzwbm%>
        <input name="xzzwbm" type="hidden" value="<%=xzzwbm%>" >
      </td>
      <td> <%=ygfkjeStr%>
        <input name="ygfkje" type="hidden" value="<%=ygfkje%>" >
      </td>
        <td> <%=ygkfStr%>
        <input name="ygkf" type="hidden" value="<%=ygkf%>" >
      </td>
    <td> <%=sgdfkjeStr%>
        <input name="sgdfkje" type="hidden" value="<%=sgdfkje%>" >
      </td>
      <td> <%=sgdkfStr%>
        <input name="sgdkf" type="hidden" value="<%=sgdkf%>" >
      </td>
      <td ><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
