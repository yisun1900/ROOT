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

String bjbbh = null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String bjjbbm = null;
String bjjbmc=null;
String hxbm=null;
String hxmc=null;
String jgwzbm=null;
String tccplbbm=null;
String clxlmc=null;
String bzslStr=null;
String sfxzsl=null;
String sfxzslStr=null;
String ccbfjjStr=null;
String sfbxx=null;
String sfbxxStr=null;
String sfyxsj=null;
String sfyxsjStr=null;
String tcsjflbm=null;
String tcsjflmc=null;
String sfyqxtpp=null;
String sfyqxtppStr=null;


double bzsl=0;
double ccbfjj=0;

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
<form method="post" action="SaveLoadDataZc.jsp" name="editform" target="_blank">
<div align="center">
    <p>套餐标准主材项目</p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>版本号</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>；</b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">


  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="9%">报价级别</td>
	<td  width="9%">户型</td>
	<td  width="10%">结构位置</td>
	<td  width="16%">产品类别</td>
	<td  width="6%">是否限制数量</td>
	<td  width="8%">标准数量</td>
	<td  width="8%">超出部分加价</td>
	<td  width="6%">是否必选项</td>
	<td  width="6%">升级是否收费</td>
	<td  width="16%">套餐升级分类</td>
	<td  width="6%">是否要求相同品牌</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

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
		if (len<8)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		bjjbmc=outStr[i][0].trim();
		hxmc=outStr[i][1].trim();
		jgwzbm=outStr[i][2].trim();
		clxlmc=outStr[i][3].trim();
		sfxzslStr=outStr[i][4].trim();
		bzslStr=outStr[i][5].trim();
		ccbfjjStr=outStr[i][6].trim();
		sfbxxStr=outStr[i][7].trim();
		sfyxsjStr=outStr[i][8].trim();
		tcsjflmc=outStr[i][9].trim();
		sfyqxtppStr=outStr[i][10].trim();


		if (jgwzbm.equals(""))
		{
			out.println("行号["+row+"]错误！项目编号为空");
			return;
		}

		sql=" select bjjbbm" ;
		sql+=" from bdm_bjjbbm " ;
		sql+=" where bjjbmc='"+bjjbmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			bjjbbm = rs.getString("bjjbbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[报价级别]："+bjjbmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select hxbm" ;
		sql+=" from dm_hxbm " ;
		sql+=" where hxmc='"+hxmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			hxbm = rs.getString("hxbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[户型]："+hxmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select jgwzmc" ;
		sql+=" from bdm_jgwzbm " ;
		sql+=" where jgwzmc='"+jgwzbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jgwzbm = rs.getString("jgwzmc");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[结构位置]："+jgwzbm);
			return;
		}
		rs.close();
		ps.close();

		sql=" select clxlbm" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tccplbbm = rs.getString("clxlbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[产品类别]："+clxlmc);
			return;
		}
		rs.close();
		ps.close();


		if (sfxzslStr.equals("可增项"))
		{
			sfxzsl="1";
		}
		else if (sfxzslStr.equals("不可增项"))
		{
			sfxzsl="2";
		}
		else if (sfxzslStr.equals("不控制"))
		{
			sfxzsl="3";
		}
		else{
			out.println("行号["+row+"]错误！[是否限制数量]只能为【可增项；不可增项；不控制】，目前为["+sfxzslStr+"]");
			return;
		}


		bzsl=0;
		ccbfjj=0;
		if (sfxzsl.equals("1"))
		{
			if (bzslStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[标准数量]不能为空");
				return;
			}
			else{
				try{
					bzsl=Double.parseDouble(bzslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[标准数量:"+bzslStr+"]不是数字:"+e);
					return;
				}
			}

			if (ccbfjjStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[超出加价]不能为空");
				return;
			}
			else{
				try{
					ccbfjj=Double.parseDouble(ccbfjjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[超出加价:"+ccbfjjStr+"]不是数字:"+e);
					return;
				}
			}

			if (bzsl==0 || ccbfjj==0)
			{
				out.println("行号["+row+"]错误！[是否限制数量]为【可增项】，标准数量、超出加价都不能为0");
				return;
			}
		}
		else if (sfxzsl.equals("2"))
		{
			if (bzslStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[标准数量]不能为空");
				return;
			}
			else{
				try{
					bzsl=Double.parseDouble(bzslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[标准数量:"+bzslStr+"]不是数字:"+e);
					return;
				}
			}

			if (bzsl==0)
			{
				out.println("行号["+row+"]错误！[是否限制数量]为【不可增项】，标准数量不能为0");
				return;
			}

			if (!ccbfjjStr.equals("") && !ccbfjjStr.equals("0"))
			{
				out.println("<BR>行号["+row+"]提醒！[是否限制数量]为【不可增项】，【超出部分加价】应为空，导入为："+ccbfjjStr);
			}
		}
		else{
			if (!bzslStr.equals("") && !bzslStr.equals("0"))
			{
				out.println("<BR>行号["+row+"]提醒！[是否限制数量]为【不控制】，【标准数量】应为空，导入为："+bzslStr);
			}
			if (!ccbfjjStr.equals("") && !ccbfjjStr.equals("0"))
			{
				out.println("<BR>行号["+row+"]提醒！[是否限制数量]为【不控制】，【超出部分加价】应为空，导入为："+ccbfjjStr);
			}
		}
		

		if (bzsl==0)
		{
			bzslStr="";
		}
		if (ccbfjj==0)
		{
			ccbfjjStr="";
		}


		if (sfbxxStr.equals("是"))
		{
			sfbxx="Y";
		}
		else if (sfbxxStr.equals("否"))
		{
			sfbxx="N";
		}
		else{
			out.println("行号["+row+"]错误！[是否必选项]只能为【是、否】，目前为["+sfbxxStr+"]");
			return;
		}


		if (sfyxsjStr.equals("是"))
		{
			sfyxsj="Y";
		}
		else if (sfyxsjStr.equals("否"))
		{
			sfyxsj="N";
		}
		else{
			out.println("行号["+row+"]错误！[升级是否收费]只能为【是、否】，目前为["+sfyxsjStr+"]");
			return;
		}

		if (!tcsjflmc.equals(""))
		{
			sql=" select tcsjflbm" ;
			sql+=" from bj_tcsjflbm " ;
			sql+=" where tcsjflmc='"+tcsjflmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				tcsjflbm = rs.getString("tcsjflbm");			    
			}
			else{
				out.println("行号["+row+"]错误！不存在的[套餐升级分类]："+tcsjflmc);
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			tcsjflbm="";
			tcsjflmc="";
		}

		if (sfyqxtppStr.equals("是"))
		{
			sfyqxtpp="Y";
		}
		else if (sfyqxtppStr.equals("否"))
		{
			sfyqxtpp="N";
		}
		else{
			out.println("行号["+row+"]错误！[是否要求相同品牌]只能为【是、否】，目前为["+sfyqxtppStr+"]");
			return;
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=hxmc%>
        <input name="hxbm" type="hidden" value="<%=hxbm%>">
      </td>
      <td><%=jgwzbm%>
        <input name="jgwzbm" type="hidden" value="<%=jgwzbm%>">
      </td>
      <td><%=clxlmc%>
        <input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
      </td>
      </td>
      <td><%=sfxzslStr%>
        <input name="sfxzsl" type="hidden" value="<%=sfxzsl%>" >
      </td>
      <td><%=bzslStr%>
        <input name="bzsl" type="hidden" value="<%=bzsl%>" >
      </td>
      <td><%=ccbfjjStr%>
        <input name="ccbfjj" type="hidden" value="<%=ccbfjj%>" >
      </td>
      <td><%=sfbxxStr%>
        <input name="sfbxx" type="hidden" value="<%=sfbxx%>" >
      </td>
      <td><%=sfyxsjStr%>
        <input name="sfyxsj" type="hidden" value="<%=sfyxsj%>" >
      </td>
      <td><%=tcsjflmc%>
        <input name="tcsjflbm" type="hidden" value="<%=tcsjflbm%>" >
      </td>
      <td><%=sfyqxtppStr%>
        <input name="sfyqxtpp" type="hidden" value="<%=sfyqxtpp%>" >
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
        <input type="button" name="bc" value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输" onClick="bc.disabled=false">
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
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
