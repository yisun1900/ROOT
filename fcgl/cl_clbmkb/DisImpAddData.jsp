<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>增加新的辅材编码</title>

</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">

<%

ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String dwbh = null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String cldlmc=null;
String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String gdj=null;
String cbj=null;
String lx=null;
String lxStr=null;
String bjjbbm=null;
String bjjbmc=null;
String ppmc=null;
String wxr=null;
String bz=null;
String paixu=null;

int row=0;

int count=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dwbh =up.getParameter("dwbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\fcgl\\cl_cljg\\impdata\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">增加新的辅材报价</div>
<input name="dwbh" type="hidden" value="<%=dwbh%>" >
  <table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="3%">行号</td>
		<td width="7%">材料大类</td>
		<td width="7%">材料编码</td>
		<td width="14%">材料名称</td>
		<td width="9%">材料规格</td>
		<td width="5%">计量单位</td>
		<td width="5%">工队价</td>
		<td width="5%">成本价</td>
		<td width="4%">是否常用</td>
		<td width="9%">报价级别</td>
		<td width="9%">品牌</td>
		<td width="4%">维护人</td>
		<td width="15%">备注</td>
		<td width="4%">排序</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


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

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}


		cldlmc=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		clmc=outStr[i][2].trim();
		clgg=outStr[i][3].trim();
		jldwmc=outStr[i][4].trim();
		gdj=outStr[i][5].trim();
		cbj=outStr[i][6].trim();
		lxStr=outStr[i][7].trim();
		bjjbmc=outStr[i][8].trim();
		ppmc=outStr[i][9].trim();
		wxr=outStr[i][10].trim();
		bz=outStr[i][11].trim();
		paixu=outStr[i][12].trim();

		if (clbm.equals(""))
		{
			out.println("<BR>！！！序号["+i+"]错误，[材料编码]不能为空");
			return;
		}

		sql=" select count(*)" ;
		sql+=" from cl_clbm " ;
		sql+=" where clbm='"+clbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("<BR>！！！序号["+i+"]提醒，[材料编码:"+clbm+"]已存在");
		}

		sql=" select count(*)" ;
		sql+=" from cl_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
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
			out.println("！！！序号["+i+"]错误，不存在的[材料大类]："+cldlmc);
			return;
		}

		sql=" select bjjbbm" ;
		sql+=" from bdm_bjjbbm " ;
		sql+=" where bjjbmc='"+bjjbmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			bjjbbm = rs.getString(1);			    
		}
		else{
			rs.close();
			ps.close();
			out.println("！！！序号["+i+"]错误，不存在的[报价级别]："+bjjbmc);
			return;
		}

		rs.close();
		ps.close();


		if (lxStr.equals(""))
		{
			lx="2";//1：常用；2：非常用；3：停用
		}
		else if (lxStr.equals("常用"))
		{
			lx="1";
		}
		else if (lxStr.equals("非常用"))
		{
			lx="2";
		}
		else
		{
			out.println("！！！序号["+i+"]错误，[是否常用]只能是【常用、非常用】:"+lxStr);
			return;
		}


		if (gdj.equals(""))
		{
			out.println("<BR>行号["+i+"]错误，[工队价]不能为空");
			return;
		}
		else{
			try
			{
				Double.parseDouble(gdj.trim());
			}
			catch (Exception e)
			{
				out.print("<BR>行号["+i+"]错误，[工队价]不是数字类型:" +gdj);
				return;
			}
		}
		if (cbj.equals(""))
		{
			cbj="0";
		}
		else{
			try
			{
				Double.parseDouble(cbj.trim());
			}
			catch (Exception e)
			{
				out.print("<BR>行号["+i+"]错误，[成本价]不是数字类型:" +cbj);
				return;
			}
		}

		if (paixu.equals(""))
		{
			paixu="";
		}
		else{
			try
			{
				Integer.parseInt(paixu.trim());
			}
			catch (Exception e)
			{
				out.print("<BR>行号["+i+"]错误，[排序]不是数字类型:" +paixu);
				return;
			}
		}

%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
	   <td><%=cldlmc%>
	   <input name="cldlmc" type="hidden" value="<%=cldlmc%>">
      </td>
     
      <td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
      <td><%=clmc%>
	   <input name="clmc" type="hidden" value="<%=clmc%>">
      </td>
      <td><%=clgg%>
	   <input name="clgg" type="hidden" value="<%=clgg%>">
      </td>
	 
      <td><%=jldwmc%>
	   <input name="jldwmc" type="hidden" value="<%=jldwmc%>">
      </td>
		<td><%=gdj%>
	   <input name="gdj" type="hidden" value="<%=gdj%>">
      </td> 
	  <td><%=cbj%>
	   <input name="cbj" type="hidden" value="<%=cbj%>">
      </td>

	  <td><%=lxStr%>
	   <input name="lx" type="hidden" value="<%=lx%>">
      </td> 
	  <td><%=bjjbmc%>
	   <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>">
      </td>
	  	<td><%=ppmc%>
	   <input name="ppmc" type="hidden" value="<%=ppmc%>">
      </td> 
	  <td><%=wxr%>
	   <input name="wxr" type="hidden" value="<%=wxr%>">
      </td>
	   <td><%=bz%>
	   <input name="bz" type="hidden" value="<%=bz%>">
      </td>
	  <td><%=paixu%>
	   <input name="paixu" type="hidden" value="<%=paixu%>">
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("序号["+row+"]出错：" + e);
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
