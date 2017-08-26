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

String oldbj=null;
String mark=null;
String bj=null;
String cbenj=null;
String sgdbj=null;
String dqmc=null;
String[][] outStr=null; 
String bgcolor=null;
String bjjbbm = null;
String bjjbmc=null;
String ls=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String sfbxxstr=null;
String sfbxx=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
String gycl=null;
//********************************+++++++++++++++++++++
String clf=null;
String zcyl=null;//A级主材用量
String zcdj=null;//A级主材单价
String zcf=null;//A级主材费
String rgf=null;//A级人工费
String jjf=null;//A级机械费
String glfbl=null;//A级管理费百分比
String zcmc=null;//A级主材名称
String zcgg=null;//A级主材规格

String sfxyclstr=null;
String sfxycl=null;

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

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();



	//out.print(yhdlm);
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
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入电子报价 </p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>报价级别</b><font color="#FF0000"><b>[<%=bjjbmc%>]；</b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]</b></font></p>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="180%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%">序号</td>
	<td  width="5%">项目大类</td>
	<td  width="6%">项目小类</td>
	<td  width="5%">项目编号</td>
	<td  width="7%">项目名称</td>
	<td  width="3%">是否必选</td>
	<td  width="3%">工程量计量单位</td>
	<td  width="5%">饰面</td>
	<td  width="4%">成本价</td>
	<td  width="4%">施工队报价</td>
	<td  width="4%">客户报价</td>
	<td  width="3%">是否需要主材</td>
	<td  width="7%">主材名称</td>
	<td  width="7%">主材规格</td>
	<td  width="4%">主材费</td>
	<td  width="4%">辅材费</td>
	<td  width="3%">人工费</td>
	<td  width="3%">机械费</td>
	<td  width="3%">管理费百分比</td>
	<td  width="18%">工艺做法及材料说明</td>

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
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}

		xmdlbm=outStr[i][0].trim();
		xmxlbm=outStr[i][1].trim();
		xmbh=outStr[i][2].trim();
		xmmc=outStr[i][3].trim();
		sfbxxstr=outStr[i][4].trim();
		jldwbm=outStr[i][5].trim();
		smbm=outStr[i][6].trim();
		cbenj=outStr[i][7].trim();
		sgdbj=outStr[i][8].trim();
		bj=outStr[i][9].trim();

		sfxyclstr=outStr[i][10].trim();
		zcmc=outStr[i][11].trim();
		zcgg=outStr[i][12].trim();
		zcf=outStr[i][13].trim();
		clf=outStr[i][14].trim();
		rgf=outStr[i][15].trim();
		jjf=outStr[i][16].trim();
		glfbl=outStr[i][17].trim();
		gycl=outStr[i][18].trim();

		oldbj="";
		mark="";

		sql=" select bj" ;
		sql+=" from bj_gzbjb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'" ;
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			oldbj = rs.getString("bj");

			oldbj="<BR><font color=\"#FF0000\">（原"+oldbj+"）</font>";
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
			out.println("！！！错误，序号["+i+"]，项目编号["+xmbh+"]不存在的[项目大类]："+xmdlbm);
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
			out.println("！！！错误，序号["+i+"]，项目编号["+xmbh+"]不存在的[项目小类]："+xmxlbm);
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
				out.println("！！！错误，序号["+i+"]不存在的[饰面]："+smbm);
				return;
			}
			rs.close();
			ps.close();
		}

		if (jldwbm.equals(""))
		{
			out.println("！！！错误，序号["+i+"]，项目编号["+xmbh+"][计量单位]为空");
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
				out.println("！！！错误，序号["+i+"]，项目编号["+xmbh+"]不存在的[计量单位]："+jldwbm);
				return;
			}
			rs.close();
			ps.close();
		}


		if (bj.equals(""))
		{
			out.println("！！！错误，序号["+i+"]，项目编号["+xmbh+"][客户报价]为空");
			return;
		}

		Double.parseDouble(bj);

		if (sfbxxstr.equals("必选"))
		{
			sfbxxstr="<font color=\"#FF0000\">"+sfbxxstr+"</font>";
			sfbxx="1";
		}
		else if (sfbxxstr.equals("非必选"))
		{
			sfbxx="2";
		}
		else if (sfbxxstr.equals("不可选"))
		{
			sfbxxstr="<font color=\"#0000FF\">"+sfbxxstr+"</font>";
			sfbxx="3";
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，[是否必选项]只能为【必选、非必选、不可选】");
			return;
		}

		if (sfxyclstr.equals("需要"))
		{
			sfxycl="1";//1：需要；2：不需要
		}
		else if (sfxyclstr.equals("不需要"))
		{
			sfxycl="2";
		}
		else{
			out.println("！！！项目编号["+xmbh+"]错误，[是否需要主材]只能为【需要、不需要】");
			return;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
        <input name="xh" type="hidden" value="<%=row%>">
      </td>
      <td><%=outStr[i][0]%> 
        <input name="xmdlbm" type="hidden" value="<%=xmdlbm%>">
      </td>
      <td><%=outStr[i][1]%> 
        <input name="xmxlbm" type="hidden" value="<%=xmxlbm%>">
      </td>
      <td> <%=outStr[i][2]%><%=mark%>
        <input name="xmbh" type="hidden" value="<%=xmbh%>" >
      </td>
	  <td align="center"> <%=outStr[i][3]%>
        <input name="xmmc" type="hidden" value="<%=xmmc%>" >
      </td>
	  <td align="center"> <%=sfbxxstr%>
        <input name="sfbxx" type="hidden" value="<%=sfbxx%>" >
      </td>
      <td> <%=outStr[i][5]%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td> <%=outStr[i][6]%>
        <input name="smbm" type="hidden" value="<%=smbm%>" >
      </td>
	  <td> <%=outStr[i][7]%>
        <input name="cbenj" type="hidden" value="<%=cbenj%>" >
      </td>
	  <td> <%=outStr[i][8]%>
        <input name="sgdbj" type="hidden" value="<%=sgdbj%>" >
      </td>
      <td> <%=outStr[i][9]%><%=oldbj%>
        <input name="bj" type="hidden" value="<%=bj%>" >
      </td>
	  <td> <%=sfxyclstr%>
        <input name="sfxycl" type="hidden" value="<%=sfxycl%>" >
      </td>
      <td> <%=outStr[i][11]%>
        <input name="zcmc" type="hidden" value="<%=zcmc%>" >
      </td>
      <td> <%=outStr[i][12]%>
        <input name="zcgg" type="hidden" value="<%=zcgg%>" >
      </td>
      <td align="left"> <%=outStr[i][13]%>
        <input name="zcf" type="hidden" value="<%=zcf%>" >
      </td>
	  <td align="left"> <%=outStr[i][14]%>
        <input name="clf" type="hidden" value="<%=clf%>" >
      </td>
	  <td align="left"> <%=outStr[i][15]%>
        <input name="rgf" type="hidden" value="<%=rgf%>" >
      </td>
	  <td align="left"> <%=outStr[i][16]%>
        <input name="jjf" type="hidden" value="<%=jjf%>" >
      </td>
	  <td align="left"> <%=outStr[i][17]%>
        <input name="glfbl" type="hidden" value="<%=glfbl%>" >
      </td>
	  <td align="left"> <%=outStr[i][18]%>
        <input name="gycl" type="hidden" value="<%=gycl%>" >
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
	return true;
}
//-->
</SCRIPT>
