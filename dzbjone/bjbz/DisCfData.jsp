<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入数据 </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String bjbbh = null;
String bjjbbm = null;
String dqbm = null;

String bjjbmc=null;
String dqmc=null;
String jzbzmc=null;

String[][] outStr=null; 
String bgcolor=null;

String fxmbh=null;
String fxmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String xmbh=null;
String xmmc=null;
String smbm=null;
String jldwbm=null;
String bj=null;
String clbj=null;
String zcf=null;
String rgbj=null;
String ysf=null;
String jxbj=null;
String shf=null;
String qtf=null;
String oldbj=null;
String mark=null;
String gycl=null;
String flmcgg=null;
String bz=null;

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

	bjbbh =up.getParameter("bjbbh");
	bjjbbm =up.getParameter("bjjbbm");
	dqbm =up.getParameter("dqbm");

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
<form method="post" action="SaveLoadCfData.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入拆分报价 </p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>报价级别</b><font color="#FF0000"><b>[<%=bjjbmc%>]；</b></font><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	<BR>若项目已存在，则进行替换，否则进行增加</b></font></p>
  </div>
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="200%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="4%"><font color="#CC0000">父项目编号*</font></td>
      <td width="9%">父项目名称</td>
      <td width="5%">项目大类</td>
      <td width="5%">项目小类</td>
	  <td width="4%"><font color="#CC0000">子项目编号*</font></td>
      <td width="9%">子项目名称</td>
      <td width="4%">饰面</td>
      <td width="3%">计量单位</td>
	  <td width="4%"><font color="#CC0000">工程预算价*</font></td>
	  <td width="3%"><font color="#CC0000">辅材费*</font></td>
	  <td width="3%"><font color="#CC0000">主材费*</font></td>
	  <td width="3%"><font color="#CC0000">人工费*</font></td>
	  <td width="3%"><font color="#CC0000">运输费*</font></td>
	  <td width="3%"><font color="#CC0000">机械费*</font></td>
	  <td width="3%"><font color="#CC0000">损耗费*</font></td>
	  <td width="3%"><font color="#CC0000">其它费*</font></td>
      <td width="12%">工艺做法及材料说明</td>
      <td width="12%">辅料名称规格</td>
      <td width="8%">备注</td>

	</tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

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

		if (outStr[i][0].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}

		fxmbh=outStr[i][0].trim();
		fxmmc=outStr[i][1].trim();
		xmdlbm=outStr[i][2].trim();
		xmxlbm=outStr[i][3].trim();
		xmbh=outStr[i][4].trim();
		xmmc=outStr[i][5].trim();
		smbm=outStr[i][6].trim();
		jldwbm=outStr[i][7].trim();
		bj=outStr[i][8].trim();
		clbj=outStr[i][9].trim();
		zcf=outStr[i][10].trim();
		rgbj=outStr[i][11].trim();
		ysf=outStr[i][12].trim();
		jxbj=outStr[i][13].trim();
		shf=outStr[i][14].trim();
		qtf=outStr[i][15].trim();
		gycl=outStr[i][16].trim();
		flmcgg=outStr[i][17].trim();
		bz=outStr[i][18].trim();

		oldbj="";
		mark="";

		if (xmbh.equals(""))
		{
			out.println("！！！行号["+row+"]错误，项目编号为空");
			return;
		}

		sql=" select bj" ;
		sql+=" from bj_jzbjcfb " ;
		sql+=" where dqbm='"+dqbm+"' and fxmbh='"+fxmbh+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			oldbj = rs.getDouble("bj")+"";

			if (!oldbj.equals(bj))
			{
				oldbj="<BR><font color=\"#FF0000\">（原"+oldbj+"）</font>";
			}
			else{
				oldbj="";
			}

			mark="<BR><font color=\"#FF0000\">（已存在）</font>";
		}
		rs.close();
		ps.close();


		sql=" select xmdlbm" ;
		sql+=" from bdm_xmdlbm " ;
		sql+=" where xmdlmc='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmdlbm = rs.getString("xmdlbm");			    
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，不存在的[项目大类]："+xmdlbm);
			return;
		}
		rs.close();
		ps.close();

		sql=" select xmxlbm" ;
		sql+=" from bdm_xmxlbm " ;
		sql+=" where xmxlmc='"+xmxlbm+"' and xmdlbm='"+xmdlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xmxlbm = rs.getString("xmxlbm");			    
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，不存在的[项目小类]："+xmxlbm);
			return;
		}
		rs.close();
		ps.close();


		if (!smbm.equals(""))
		{
			sql=" select smbm" ;
			sql+=" from bdm_smbm " ;
			sql+=" where smmc='"+smbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				smbm = rs.getString("smbm");			    
			}
			else{
				out.println("！！！项目编号["+xmbh+"]错误，不存在的[饰面]："+smbm);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jldwbm.equals(""))
		{
			out.println("！！！项目编号["+xmbh+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select jldwbm" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("jldwbm");			    
			}
			else{
				out.println("！！！项目编号["+xmbh+"]错误，不存在的[计量单位]："+jldwbm);
				return;
			}
			rs.close();
			ps.close();
		}


		if (bj.equals(""))
		{
			out.println("！！！项目编号["+xmbh+"]错误，[工程预算价]为空");
			return;
		}

		Double.parseDouble(bj);

		if (clbj.equals(""))
		{
			out.println("！！！项目编号["+xmbh+"]错误，[材料费]为空");
			return;
		}
		Double.parseDouble(clbj);

		if (clbj.equals(""))
		{
			out.println("！！！项目编号["+xmbh+"]错误，[材料费]为空");
			return;
		}

		Double.parseDouble(clbj);

		if (rgbj.equals(""))
		{
			out.println("！！！项目编号["+xmbh+"]错误，[人工费]为空");
			return;
		}

		Double.parseDouble(rgbj);

		if (jxbj.equals(""))
		{
			out.println("！！！项目编号["+xmbh+"]错误，[机械费]为空");
			return;
		}

		Double.parseDouble(jxbj);

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fxmbh%> 
        <input name="fxmbh" type="hidden" value="<%=fxmbh%>">
      </td>
      <td><%=fxmmc%> 
        <input name="fxmmc" type="hidden" value="<%=fxmmc%>">
      </td>
      </td>
      <td><%=outStr[i][2]%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=outStr[i][3]%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td> <%=outStr[i][4]%><%=mark%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
	  <td align="center"> <%=outStr[i][5]%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
      <td> <%=outStr[i][6]%>
        <input name="smbm" type="hidden" value="<%=smbm%>" >
      </td>
      <td> <%=outStr[i][7]%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td> <%=outStr[i][8]%><%=oldbj%>
        <input name="bj" type="hidden" value="<%=bj%>" >
      </td>
      <td> <%=clbj%>
        <input name="clbj" type="hidden" value="<%=clbj%>" >
      </td>
      <td> <%=zcf%>
        <input name="zcf" type="hidden" value="<%=zcf%>" >
      </td>
      <td> <%=rgbj%>
        <input name="rgbj" type="hidden" value="<%=rgbj%>" >
      </td>
      <td> <%=ysf%>
        <input name="ysf" type="hidden" value="<%=ysf%>" >
      </td>
      <td> <%=jxbj%>
			<input name="jxbj" type="hidden" value="<%=jxbj%>" >
      </td>
      <td> <%=shf%>
			<input name="shf" type="hidden" value="<%=shf%>" >
      </td>
      <td> <%=qtf%>
			<input name="qtf" type="hidden" value="<%=qtf%>" >
      </td>
      <td align="left"> <%=gycl%>
        <input name="gycl" type="hidden" value="<%=gycl%>" >
      </td>
      <td align="left"> <%=flmcgg%>
        <input name="flmcgg" type="hidden" value="<%=flmcgg%>" >
      </td>
      <td align="left"> <%=bz%>
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
