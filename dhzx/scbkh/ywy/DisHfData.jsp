<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入数据 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

%>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;
String[][] outStr=null; 
String ls=null;

String scbkhbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String sfxhf=null;
String sfxhfStr=null;
java.sql.Date xchfsj=null;
String xchfsjStr=null;
String sckhyxbm=null;
String sckhyxbmStr=null;
java.sql.Date yyddsj=null;
String yyddsjStr=null;
String gzsm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

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
<form method="post" action="SaveDisHfData.jsp" name="editform" target="_blank">
<div align="center">导入回访结果</div>
  <table width="150%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="0" cellspacing="1">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">*客户编号</td>
      <td width="6%">*客户姓名</td>
      <td width="18%">*房屋地址</td>
	  <td width="12%">电话</td>
	  <td width="5%">业务员</td>
	  <td width="4%">*是否需回访</td>
	  <td width="6%">下次回访时间</td>
	  <td width="7%">*客户意向</td>
	  <td width="6%">预约到店时间</td>
      <td width="66%">*跟踪说明</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 
	String bgcolor="";
	String row="";

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}
		
		scbkhbh=outStr[i][0].trim();
		khxm=outStr[i][1].trim();
		fwdz=outStr[i][2].trim();
		lxfs=outStr[i][3].trim();
		ywy=outStr[i][4].trim();
		sfxhfStr=outStr[i][5].trim();
		xchfsjStr=outStr[i][6].trim();
		sckhyxbmStr=outStr[i][7].trim();
		yyddsjStr=outStr[i][8].trim();
		gzsm=outStr[i][9].trim();

		if(khxm==null||khxm.equals(""))
		{
//			out.print("<BR>提醒！序号『"+row+"』客户姓名为空，下面数据自动放弃！");
			break;
		}

		int count=0;
		String getkhxm="";
		sql="select khxm";
		sql+=" from  crm_scbkhxx";
		sql+=" where scbkhbh='"+scbkhbh+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkhxm=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (getkhxm.equals(""))
		{
			out.print("<BR>客户编号『"+scbkhbh+"』不存在！");
			return;
		}
		else{
			if (!getkhxm.equals(khxm))
			{
				out.print("<BR>提醒！客户编号『"+scbkhbh+"』姓名与系统不一致，系统为【"+getkhxm+"】，导入为【"+khxm+"】！");
			}
		}

		if (count==0)
		{
		}

		//检查『客户意向』是否正确
		sql="select sckhyxbm";
		sql+=" from  dm_sckhyxbm";
		sql+=" where sckhyxmc='"+sckhyxbmStr+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sckhyxbm=rs.getString("sckhyxbm");
		}
		else{
			out.print("<BR>客户编号『"+scbkhbh+"』错误！客户意向『"+sckhyxbmStr+"』不存在！");
			return;
		}
		rs.close();
		ps.close();

		//检查『是否需回访』是否正确
		if (sfxhfStr==null || sfxhfStr.equals(""))//Y：需回访；N：不需回访
		{
			out.print("<BR>客户编号『"+scbkhbh+"』错误！『是否需回访』不能为空！");
			return;
		}
		else if (sfxhfStr.trim().equals("需要"))
		{
			sfxhf="Y";

			//检查『回访日期』是否正确
			if (xchfsjStr==null || xchfsjStr.equals(""))
			{
				out.print("<BR>客户编号『"+scbkhbh+"』错误！『回访日期』不能为空！");
				return;
			}
			else{
				try{
					xchfsj=java.sql.Date.valueOf(xchfsjStr.trim());
				}
				catch (Exception e){
					out.print("<BR>客户编号『"+scbkhbh+"』错误！回访日期『"+xchfsjStr+"』不是日期类型格式『YYYY-MM-DD』！");
					return;
				}
			}
		}
		else if (sfxhfStr.trim().equals("否"))
		{
			sfxhf="N";
			xchfsjStr="";
			xchfsj=null;
		}
		else{
			out.print("<BR>客户编号『"+scbkhbh+"』错误！『是否需回访』不正确，只能是『需要、否』其中之一！");
			return;
		}

		if (yyddsjStr==null || yyddsjStr.equals(""))
		{
			yyddsj=null;
		}
		else{
			try{
				yyddsj=java.sql.Date.valueOf(yyddsjStr);
			}
			catch (Exception e){
				out.print("<BR>客户编号『"+scbkhbh+"』错误！预约到店时间『"+yyddsjStr+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=scbkhbh%> 
        <input name="scbkhbh" type="hidden" value="<%=scbkhbh%>">
      </td>
      <td><%=khxm%> 
        <input name="khxm" type="hidden" value="<%=khxm%>">
      </td>
      <td><%=fwdz%> 
        <input name="fwdz" type="hidden" value="<%=fwdz%>">
      </td>
      <td><%=lxfs%>
        <input name="lxfs" type="hidden" value="<%=lxfs%>" >
      </td>
	  <td><%=ywy%>
        <input name="ywy" type="hidden" value="<%=ywy%>" >
      </td>
	  <td><%=sfxhfStr%>
        <input name="sfxhf" type="hidden" value="<%=sfxhf%>" >
      </td>
	  <td><%=xchfsjStr%>
        <input name="xchfsj" type="hidden" value="<%=xchfsjStr%>" >
      </td>
	  <td><%=sckhyxbmStr%>
        <input name="sckhyxbm" type="hidden" value="<%=sckhyxbm%>" >
      </td>
      <td><%=yyddsjStr%>
        <input name="yyddsj" type="hidden" value="<%=yyddsjStr%>" >
      </td>
 	  <td  align="left"> <%=gzsm%>
        <input name="gzsm" type="hidden" value="<%=gzsm%>" >
      </td>
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
		if (f != null) f.close(); 
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
	return true;
}
//-->
</SCRIPT>
