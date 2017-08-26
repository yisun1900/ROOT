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

String bjbbh = null;
String bjjbbm = null;
String dqbm=null;
String dqmc=null;
String wybh=null;
String xmbh=null;
String xmmc=null;

String getbjjbbm=null;
String bjjbmc=null;
String glflbm=null;
String glflmc=null;
String wlbm=null;
String glmc=null;
String pp=null;
String xh=null;
String gg=null;
String xl=null;
String jldwbm=null;
String jldwmc=null;
String xhlstr=null;
double xhl=0;
String djstr=null;
double dj=0;
String jqsflstr=null;
double jqsfl=0;
String bsflstr=null;
double bsfl=0;
String tvocsflstr=null;
double tvocsfl=0;
String wlllbz=null;
String wlllbzmc=null;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	bjjbbm =up.getParameter("bjjbbm");
	dqbm =up.getParameter("dqbm");
	bjbbh =up.getParameter("bjbbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select bjjbmc" ;
	sql+=" from bdm_bjjbbm " ;
	sql+=" where bjjbbm='"+bjjbbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		bjjbmc = rs.getString("bjjbmc");			    
	}
	else{
		out.println("错误！报价级别不存在");
		return;
	}
	rs.close();
	ps.close();

	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveDisGlfx.jsp" name="editform" target="_blank">
<div align="center">
    导入工料分析
    <p><font color="#FF0000"><b>请注意：</b></font><b>版本号</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>；报价级别</b><font color="#FF0000"><b>[<%=bjjbmc%>]；</b></font><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	<BR>系统自动把旧数据删除，用新导入的数据替换</b></font>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">
<table width="180%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="4%">项目编号</td>
		<td width="11%">项目名称</td>

		<td width="3%">工料分类</td>
		<td width="4%">需到物流领料</td>
		<td width="5%">材料编码</td>
		<td width="10%">材料名称</td>
		<td width="7%">品牌</td>
		<td width="6%">型号</td>
		<td width="6%">规格</td>
		<td width="9%">系列</td>
		<td  width="3%">甲醛释放量</td>
		<td  width="3%">苯释放量</td>
		<td  width="3%">TVOC释放量</td>
		<td width="3%">计量单位</td>
		<td width="3%">数量</td>
		<td width="3%">单价</td>
		<td width="17%" align="left">备注</td>
    </tr>
    <%
	//读文件
	outStr=cf.readTxt(filename,"\t"); 

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

		xmbh=outStr[i][0].trim();
		xmmc=outStr[i][1].trim();
		glflmc=outStr[i][2].trim();
		wlllbzmc=outStr[i][3].trim();
		wlbm=outStr[i][4].trim();
		glmc=outStr[i][5].trim();
		pp=outStr[i][6].trim();
		xh=outStr[i][7].trim();
		gg=outStr[i][8].trim();
		xl=outStr[i][9].trim();
		jqsflstr=outStr[i][10].trim();
		bsflstr=outStr[i][11].trim();
		tvocsflstr=outStr[i][12].trim();
		jldwmc=outStr[i][13].trim();
		xhlstr=outStr[i][14].trim();
		djstr=outStr[i][15].trim();
		bz=outStr[i][16].trim();

//		wlbm="0";




		String yxmmc="";
		if (xmbh.equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[项目编号]为空");
			return;
		}
		else{
			sql=" select xmmc" ;
			sql+=" from bj_jzbjb " ;
			sql+=" where xmbh='"+xmbh.trim()+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				yxmmc = rs.getString("xmmc");			    
			}
			else{
				out.println("！！！序号["+row+"]项目编号["+xmbh+"]错误，不存在的[项目编号]："+xmbh);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xmmc.equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[项目名称]为空");
			return;
		}
		else{
			if (!yxmmc.trim().equals(xmmc.trim()))
			{
				out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]警告，[项目名称]与标准不一致，标准名称：["+yxmmc+"]");
			}
		}
		if (glmc.equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[工料名称]为空");
			return;
		}


		if (glflmc.equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[工料分类]为空");
			return;
		}
		else{
			sql=" select glflbm" ;
			sql+=" from bdm_glflbm " ;
			sql+=" where glflmc='"+glflmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				glflbm = rs.getString("glflbm");			    
			}
			else{
				out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，不存在的[工料分类]："+glflmc);
				return;
			}
			rs.close();
			ps.close();

			if (glflbm.equals("1"))
			{
				if (wlllbzmc.equals("需要"))
				{
					wlllbz="Y";
				}
				else if (wlllbzmc.equals("否"))
				{
					wlllbz="N";
				}
				else{
					wlllbz="N";
				}
			}
			else{
				wlllbz="";
				wlllbzmc="";
			}
		}

		if (jldwmc.equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select jldwbm" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("jldwbm");			    
			}
			else{
				out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，不存在的[计量单位]："+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (xhlstr.trim().equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[消耗量]为空");
			return;
		}
		else{
			xhl=Double.parseDouble(xhlstr.trim());
		}

		if (djstr.trim().equals(""))
		{
//			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[单价]为空");
//			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}

		if (jqsflstr.trim().equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[甲醛释放量]为空");
			return;
		}
		else{
			jqsfl=Double.parseDouble(jqsflstr.trim());
		}

		if (bsflstr.trim().equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[苯释放量]为空");
			return;
		}
		else{
			bsfl=Double.parseDouble(bsflstr.trim());
		}

		if (tvocsflstr.trim().equals(""))
		{
			out.println("<BR>！！！序号["+row+"]项目编号["+xmbh+"]错误，[TVOC释放量]为空");
			return;
		}
		else{
			tvocsfl=Double.parseDouble(tvocsflstr.trim());
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xmbh%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
      <td><%=xmmc%>
      </td>
      <td><%=glflmc%>
        <input name="glflbm" type="hidden" value="<%=glflbm%>" >
      </td>
      <td><%=wlllbzmc%>
        <input name="wlllbz" type="hidden" value="<%=wlllbz%>" >
      </td>
      <td><%=wlbm%>
        <input name="wlbm" type="hidden" value="<%=wlbm%>" >
      </td>
      <td><%=glmc%>
        <input name="glmc" type="hidden" value="<%=glmc%>" >
      </td>
      <td><%=pp%>
        <input name="pp" type="hidden" value="<%=pp%>" >
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=xl%>
        <input name="xl" type="hidden" value="<%=xl%>" >
      </td>
      <td><%=jqsfl%>
        <input name="jqsfl" type="hidden" value="<%=jqsfl%>" >
      </td>
      <td><%=bsfl%>
        <input name="bsfl" type="hidden" value="<%=bsfl%>" >
      </td>
      <td><%=tvocsfl%>
        <input name="tvocsfl" type="hidden" value="<%=tvocsfl%>" >
      </td>
      <td><%=jldwmc%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=xhl%>
        <input name="xhl" type="hidden" value="<%=xhl%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td  align="left"><%=bz%>
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
