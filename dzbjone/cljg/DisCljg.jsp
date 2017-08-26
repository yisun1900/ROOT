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

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String dqbm=null;
String dqmc=null;
String wlbm=null;
String glmc=null;
String cldlbm=null;
String cldlmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
String jldwmc=null;

String jswlbm=null;
String jsglmc=null;
String jsjldwbm=null;
String jsjldwmc=null;
String wljsbzstr=null;
double wljsbz=0;

String djstr=null;
double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();


	String yxdqmc=null;
	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		yxdqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveDisCljg.jsp" name="editform" target="_blank">
<div align="center">
    导入物流材料价格表
    <BR><font color="#FF0000"><b>请注意：</b></font><b>地区</b><font color="#FF0000"><b>[<%=yxdqmc%>]
	</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td rowspan="2" width="3%">序号</td>
      <td rowspan="2" width="10%">材料类别</td>
      <td rowspan="2" width="8%">物流材料编码</td>
      <td rowspan="2" width="13%">物料名称</td>
      <td rowspan="2" width="10%">型号规格</td>
      <td rowspan="2" width="16%">品牌</td>
      <td rowspan="2" width="5%">计量单位</td>
      <td rowspan="2" width="5%">单价</td>
      <td colspan="4">对应的结算材料</td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="6%">材料编码</td>
      <td width="14%">物料名称</td>
      <td width="5%">计量单位</td>
      <td width="5%">物流结算计量单位比</td>
    </tr>


	
	<%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 


	int row=0;

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

		if (outStr[i][1].equals(""))
		{
			break;
		}

		cldlmc=outStr[i][0].trim();
		wlbm=outStr[i][1].trim();
		glmc=outStr[i][2].trim();
		xhgg=outStr[i][3].trim();
		pp=outStr[i][4].trim();
		jldwmc=outStr[i][5].trim();
		djstr=outStr[i][6].trim();
		jswlbm=outStr[i][7].trim();
		jsglmc=outStr[i][8].trim();
		jsjldwmc=outStr[i][9].trim();
		wljsbzstr=outStr[i][10].trim();

		if (wljsbzstr.equals("0") || wljsbzstr.equals("0.0"))
		{
			wljsbzstr="";
		}

		sql=" select cldlbm" ;
		sql+=" from bdm_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cldlbm = rs.getString("cldlbm");			    
		}
		else{
			out.println("！！！材料编码["+wlbm+"]错误，不存在的[材料类别]："+cldlmc);
			return;
		}
		rs.close();
		ps.close();


		if (wlbm.equals(""))
		{
			out.println("！！！在材料编码["+wlbm+"]出误，[物流材料编码]为空");
			return;
		}

		if (glmc.equals(""))
		{
			out.println("！！！材料编码["+wlbm+"]错误，[物料名称]为空");
			return;
		}

		if (jldwmc.equals(""))
		{
			out.println("！！！材料编码["+wlbm+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select cljldwbm" ;
			sql+=" from bdm_cljldwbm " ;
			sql+=" where cljldwmc='"+jldwmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("cljldwbm");			    
			}
			else{
				out.println("！！！材料编码["+wlbm+"]错误，不存在的[计量单位]："+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (djstr.trim().equals(""))
		{
			out.println("！！！材料编码["+wlbm+"]错误，[单价]为空");
			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}



		wljsbz=0;
		jsjldwbm="";
		if (!jswlbm.equals(""))
		{
			String getjsjldwbm="";
			sql=" select jldwbm" ;
			sql+=" from bj_jscljgb " ;
			sql+=" where dqbm='"+dqbm+"' and wlbm='"+jswlbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				getjsjldwbm = rs.getString(1);			    
			}
			else{
				rs.close();
				ps.close();

				out.println("<BR>提醒！材料编码["+wlbm+"]出错，不存在的[结算材料编码]："+jswlbm);
				return;
			}
			rs.close();
			ps.close();


			if (jsglmc.trim().equals(""))
			{
				out.println("！！！材料编码["+wlbm+"]错误，[结算材料物料名称]为空");
				return;
			}

			if (jsjldwmc.equals(""))
			{
				out.println("！！！材料编码["+wlbm+"]错误，[结算材料计量单位]为空");
				return;
			}
			else{
				sql=" select cljldwbm" ;
				sql+=" from bdm_cljldwbm " ;
				sql+=" where cljldwmc='"+jsjldwmc.trim()+"'" ;
				ps= conn.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next())
				{         
					jsjldwbm = rs.getString("cljldwbm");			    
				}
				else{
					out.println("！！！材料编码["+wlbm+"]错误，不存在的[结算材料计量单位]："+jsjldwmc);
					return;
				}
				rs.close();
				ps.close();
			}

			if (!getjsjldwbm.equals(jsjldwbm))
			{
				out.println("！！！材料编码["+wlbm+"]错误，[结算材料计量单位]与ERP中不符");
				return;
			}

			if (wljsbzstr.trim().equals(""))
			{
				out.println("！！！材料编码["+wlbm+"]错误，[物流结算计量单位比]为空");
				return;
			}
			else{
				wljsbz=Double.parseDouble(wljsbzstr.trim());
			}
			if (wljsbz==0)
			{
				out.println("！！！材料编码["+wlbm+"]错误，[物流结算计量单位比]不能为0");
				return;
			}
		}
		else{
			if (!jsglmc.trim().equals(""))
			{
				out.println("！！！材料编码["+wlbm+"]错误，[结算材料物料名称]应为空");
				return;
			}

			if (!jsjldwmc.equals(""))
			{
				out.println("！！！材料编码["+wlbm+"]错误，[结算材料计量单位]应为空："+jsjldwmc);
				return;
			}
			if (!wljsbzstr.trim().equals(""))
			{
				out.println("！！！材料编码["+wlbm+"]错误，[物流结算计量单位比]应为空："+wljsbzstr);
				return;
			}

		}




		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=cldlmc%> 
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
      </td>
      <td><%=wlbm%> 
        <input name="wlbm" type="hidden" value="<%=wlbm%>" >
      </td>
      <td><%=glmc%> 
        <input name="glmc" type="hidden" value="<%=glmc%>" >
      </td>
      <td><%=xhgg%> 
        <input name="xhgg" type="hidden" value="<%=xhgg%>" >
      </td>
      <td><%=pp%> 
        <input name="pp" type="hidden" value="<%=pp%>" >
      </td>
      <td><%=jldwmc%> 
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=dj%> 
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=jswlbm%> 
        <input name="jswlbm" type="hidden" value="<%=jswlbm%>" >
      </td>
      <td><%=jsglmc%> 
      </td>
      <td><%=jsjldwmc%> 
        <input name="jsjldwbm" type="hidden" value="<%=jsjldwbm%>" >
      </td>
      <td><%=wljsbzstr%> 
        <input name="wljsbz" type="hidden" value="<%=wljsbzstr%>" >
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
        <input type="button"  value="存盘" onClick="f_do(editform)" name="bc">
        <input type="reset"  value="允许存盘" onClick="bc.disabled=false;">
        <input type="reset"  value="重输">
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
