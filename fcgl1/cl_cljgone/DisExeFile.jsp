<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>更新辅材价格</title>
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


int row=0;

int count=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\jcjj\\zcbj\\impdata\\"+yhdlm+".txt";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveDisExeFile.jsp" name="editform" target="_blank">
  <div align="center">更新辅材价格（<b>注意：<font color="#FF0000">红色</font>代表材料编码不存在</b>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">行号</td>
      <td width="15%">分公司</td>
      <td width="8%">材料编码</td>
      <td width="25%">材料名称</td>
      <td width="8%">与厂家结算价</td>
      <td width="8%">分公司材料单价</td>
      <td width="8%">工队价</td>
      <td width="17%">仓库名称</td>
      <td width="6%">是否入库</td>
    </tr>

    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(10000,filename); 


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
			out.println("提醒!第"+row+"行[数据]为空,下面的数据自动被放弃");
			break;
		}

		String fgsmc=null;
		String clbm=null;
		String clmc=null;
		String cjjsjstr=null;
		String fgsdjstr=null;
		String gdjstr=null;
		String ckmc=null;
		String sfrkstr=null;

		fgsmc=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		clmc=outStr[i][2].trim();

		cjjsjstr=outStr[i][3].trim();
		fgsdjstr=outStr[i][4].trim();
		gdjstr=outStr[i][5].trim();
		ckmc=outStr[i][6].trim();
		sfrkstr=outStr[i][7].trim();


		if (fgsmc.equals(""))
		{
			out.println("<BR>！！！行号["+row+"]错误，分公司不能为空");
			return;
		}
		if (clbm.equals(""))
		{
			out.println("<BR>！！！行号["+row+"]错误，材料编码不能为空");
			return;
		}


		String fgsbh=null;
		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+fgsmc+"' and dwlx='F0'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			fgsbh = rs.getString("dwbh");			    
		}
		else{
			rs.close();
			ps.close();

			out.println("<BR>！！！行号["+row+"]错误，不存在的[分公司]：【"+fgsmc+"】");
			return;
		}
		rs.close();
		ps.close();


		//与厂家结算价
		double cjjsj=0;
		if (cjjsjstr!=null && !cjjsjstr.trim().equals(""))
		{
			try{
				cjjsj=Double.parseDouble(cjjsjstr.trim());
			}
			catch (Exception e) {
				out.print("行号["+row+"]错误！[与厂家结算价]非数字：" + cjjsjstr);
				return;
			}
		}
		//分公司材料单价
		double fgsdj=0;
		if (fgsdjstr!=null && !fgsdjstr.trim().equals(""))
		{
			try{
				fgsdj=Double.parseDouble(fgsdjstr.trim());
			}
			catch (Exception e) {
				out.print("行号["+row+"]错误！[分公司材料单价]非数字：" + fgsdjstr);
				return;
			}
		}
		//工队价
		double gdj=0;
		if (gdjstr!=null && !gdjstr.trim().equals(""))
		{
			try{
				gdj=Double.parseDouble(gdjstr.trim());
			}
			catch (Exception e) {
				out.print("行号["+row+"]错误！[工队价]非数字：" + gdjstr);
				return;
			}
		}



		//是否入库
		String sfrk="N";
		if (sfrkstr!=null && !sfrkstr.equals(""))
		{
			if (sfrkstr.equals("是"))
			{
				sfrk="Y";
			}
			else if (sfrkstr.equals("否"))
			{
				sfrk="N";
			}
			else{
				out.println("<BR>！！！行号["+row+"]错误，[是否入库]只能是【是】或【否】："+sfrkstr);
				return;
			}
		}

		sql=" select count(*)" ;
		sql+=" from cl_jgmx " ;
		sql+=" where dwbh='"+fgsbh+"' and clbm='"+clbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			bgcolor="#FF0000";
		}
		else{
			bgcolor="#FFFFFF";
		}
%> 
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%></td>
      <td><%=fgsmc%> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
      </td>
      
      <td><%=clbm%>
        <input name="clbm" type="hidden" value="<%=clbm%>" >
      </td>
       <td><%=clmc%> 
      </td>
     <td><%=cjjsj%>
        <input name="cjjsj" type="hidden" value="<%=cjjsj%>" >
      </td>
      <td><%=fgsdj%>
        <input name="fgsdj" type="hidden" value="<%=fgsdj%>" >
      </td>
	  <td ><%=gdj%>
        <input name="gdj" type="hidden" value="<%=gdj%>" >
      </td>
      <td><%=ckmc%>
        <input name="ckmc" type="hidden" value="<%=ckmc%>" >
      </td>
	  <td><%=sfrkstr%>
        <input name="sfrk" type="hidden" value="<%=sfrk%>" >
      </td>

    </tr>
    <%
	}

	rwe=null;
}
catch (Exception e) {
	out.print("行号["+row+"]出错：" + e);
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
      <td colspan="45"> 
        <input type="button"  value="存盘" name="bc" onClick="f_do(editform)">
        <input type="button"  value="重新存盘" name="bc2" onClick="bc.disabled=false">
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
