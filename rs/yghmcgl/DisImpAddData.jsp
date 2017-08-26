<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>增加新的员工资料</title>

</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">

<%

ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;



String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String fgsmc=null;
String fgsbh = null;
String dwmc=null;
String dwbh = null;
String bianhao=null;
String yhmc=null;
String xbmc=null;
String xb=null;
String sfzh=null;
String xzzwbm=null;
String zwbm=null;
String bjjb=null;
String bjjbbm=null;
String bgdh=null;
String nxdh=null;
String wxdh=null;
String dh=null;
String email=null;
String csrq=null;
String rzsj=null;
String hjszd=null;
String xlbm=null;
String xlmc=null;
String zy=null;

String ls=null;

String dqbm="";



int count=0;
int k=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\rs\\impdata\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();
	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">增加新的员工资料</div>
  <table width="180%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="6%">所属公司</td>
	  <td width="8%">所属部门</td>
      <td width="4%">工号</td>
      <td width="4%">姓名</td>
	  <td width="3%">性别</td>
      <td width="9%">身份证号</td>
      <td width="5%">职位</td>
      <td width="4%">报价级别</td>
      <td width="8%">外线</td>
      <td width="8%">内线</td>
      <td width="8%">移动电话</td>
	  <td width="8%">邮箱</td>
	  <td width="4%">出生日期</td>
	  <td width="4%">入职日期</td>
	  <td width="6%">户籍所在地</td>
	  <td width="5%">文化程度</td>
	  <td width="10%">所学专业</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
		k=i;
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

		int len=outStr[i].length;
		if (len<17)
		{
			out.println("错误！请下载新的Excel模板:"+len);
			return;
		}


		fgsmc=outStr[i][0].trim();
		dwmc=outStr[i][1].trim();

		bianhao=outStr[i][2].trim();
		yhmc=outStr[i][3].trim();
		xbmc=outStr[i][4].trim();
		sfzh=outStr[i][5].trim();
		xzzwbm=outStr[i][6].trim();

		bjjb=outStr[i][7].trim();
		wxdh=outStr[i][8].trim();
		nxdh=outStr[i][9].trim();
		dh=outStr[i][10].trim();
		email=outStr[i][11].trim();
		csrq=outStr[i][12].trim();
		rzsj=outStr[i][13].trim();
		hjszd=outStr[i][14].trim();
		xlmc=outStr[i][15].trim();
		zy=outStr[i][16].trim();


		if (!csrq.equals(""))
		{
			java.sql.Date.valueOf(csrq);
		}
		if (!rzsj.equals(""))
		{
			java.sql.Date.valueOf(rzsj);
		}

		if (yhmc.equals(""))
		{
			out.println("<BR>！！！序号["+i+"]错误，[姓名]不能为空");
			return;
		}

		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+fgsmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			fgsbh = rs.getString(1);			    
		}
		else{
			rs.close();
			ps.close();
			out.println("<BR>！！！序号["+i+"]错误，[所属公司]不存在:"+fgsmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+dwmc+"' and ssfgs='"+fgsbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			dwbh = rs.getString(1);			    
		}
		else{
			rs.close();
			ps.close();
			out.println("<BR>！！！序号["+i+"]错误，[所属部门]不存在:"+dwmc);
			return;
		}
		rs.close();
		ps.close();

		xb="";
		if (!xbmc.equals(""))
		{
			if (xbmc.equals("男"))
			{
				xb="M";
			}
			else if (xbmc.equals("女"))
			{
				xb="W";
			}
			else{
				out.println("<BR>！！！序号["+i+"]错误，[性别]只能是男、女："+xbmc);
				return;
			}
		}

		sql=" select gzbm" ;
		sql+=" from dm_xzzwbm " ;
		sql+=" where xzzwmc='"+xzzwbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			zwbm = rs.getString(1);			    
		}
		else{
			rs.close();
			ps.close();
			out.println("<BR>！！！序号["+i+"]错误，[职位]不存在："+xzzwbm);
			return;
		}
		rs.close();
		ps.close();

		bjjbbm="";
		if (!bjjb.equals(""))
		{
			sql=" select bjjbbm" ;
			sql+=" from bdm_bjjbbm " ;
			sql+=" where bjjbmc='"+bjjb+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				bjjbbm = rs.getString(1);			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>！！！序号["+i+"]错误，[报价级别]不存在："+bjjb);
				return;
			}
			rs.close();
			ps.close();
		}

		xlbm="";
		if (!xlmc.equals(""))
		{
			sql=" select xlbm" ;
			sql+=" from dm_xlbm " ;
			sql+=" where xueli='"+xlmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				xlbm = rs.getString(1);			    
			}
			else{
				rs.close();
				ps.close();
				out.println("<BR>！！！序号["+i+"]错误，[文化程度]不存在："+xlmc);
				return;
			}
			rs.close();
			ps.close();
		}
%> 

	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fgsmc%> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
      </td>
      <td><%=dwmc%> 
        <input name="dwbh" type="hidden" value="<%=dwbh%>">
      </td>
      <td><%=bianhao%> 
        <input name="bianhao" type="hidden" value="<%=bianhao%>">
      </td>
      <td><%=yhmc%> 
        <input name="yhmc" type="hidden" value="<%=yhmc%>">
      </td>
      <td><%=xbmc%>
	   <input name="xb" type="hidden" value="<%=xb%>">
      </td>
     
 
      <td><%=sfzh%>
	   <input name="sfzh" type="hidden" value="<%=sfzh%>">
      </td>
       <td><%=xzzwbm%>
	   <input name="xzzwbm" type="hidden" value="<%=xzzwbm%>">
	   <input name="zwbm" type="hidden" value="<%=zwbm%>">
      </td> 
	  <td><%=bjjb%>
	   <input name="bjjb" type="hidden" value="<%=bjjb%>">
	   <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>">
      </td>
	  <td><%=nxdh%>
	   <input name="nxdh" type="hidden" value="<%=nxdh%>">
      </td>
	  <td><%=wxdh%>
	   <input name="wxdh" type="hidden" value="<%=wxdh%>">
      </td>
		
	   <td><%=dh%>
	   <input name="dh" type="hidden" value="<%=dh%>">
      </td>
	   <td><%=email%>
	   <input name="email" type="hidden" value="<%=email%>">
      </td>
	  <td><%=csrq%>
	   <input name="csrq" type="hidden" value="<%=csrq%>">
      </td>
	  <td><%=rzsj%>
	   <input name="rzsj" type="hidden" value="<%=rzsj%>">
      </td>
	  <td><%=hjszd%>
	   <input name="hjszd" type="hidden" value="<%=hjszd%>">
      </td>
	  <td><%=xlmc%>
	   <input name="xlbm" type="hidden" value="<%=xlbm%>">
      </td>
	  <td><%=zy%>
	   <input name="zy" type="hidden" value="<%=zy%>">
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("序号["+k+"]出错：" + e);
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
