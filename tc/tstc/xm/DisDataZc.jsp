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

String bjjbbm = null;
String bjjbmc = null;
String dqbm = null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;

String tccpdlbm=null;
String cldlmc=null;
String tccplbbm=null;
String clxlmc=null;
String tcsjflbm=null;
String tcsjflmc=null;
String sfbxx=null;
String sfbxxStr=null;
String sfyxsj=null;
String sfyxsjStr=null;
String sfyqxtpp=null;
String sfyqxtppStr=null;
String jldw=null;
String bzslStr=null;
String sfxzsl=null;
String sfxzslStr=null;

String sfkjmStr=null;
String sfkjm=null;
String yxjmzdslStr=null;
String jmdjStr=null;
String sfkghStr=null;
String sfkgh=null;
String khzdslStr=null;
String ghzjStr=null;

double yxjmzdsl=0;
double jmdj=0;
double khzdsl=0;
double ghzj=0;


double bzsl=0;


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
	bjjbbm =up.getParameter("bjjbbm");

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

	sql=" select bjjbmc" ;
	sql+=" from bdm_bjjbbm " ;
	sql+=" where bjjbbm='"+bjjbbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		bjjbmc = rs.getString("bjjbmc");			    
	}
	rs.close();
	ps.close();
	%> 
<form method="post" action="SaveLoadDataZc.jsp" name="editform" target="_blank">
<div align="center">
    <p>套餐标准主材项目</p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>报价级别</b><font color="#FF0000"><b>[<%=bjjbmc%>]</b></font><b>；</b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">


  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="9%">产品大类</td>
	<td  width="9%">产品小类</td>
	<td  width="9%">套餐升级分类</td>
	<td  width="5%">是否必选项</td>
	<td  width="5%">升级是否收费</td>
	<td  width="5%">是否要求相同品牌</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">标准数量</td>
	<td  width="7%">是否限制数量</td>
	<td  width="6%">是否可减免</td>
	<td  width="6%">允许减免最大数量</td>
	<td  width="6%">减免单价</td>
	<td  width="6%">是否可更换</td>
	<td  width="6%">可换最大数量</td>
	<td  width="6%">更换折价</td>
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

		cldlmc=outStr[i][0].trim();
		clxlmc=outStr[i][1].trim();
		tcsjflmc=outStr[i][2].trim();
		sfbxxStr=outStr[i][3].trim();
		sfyxsjStr=outStr[i][4].trim();
		sfyqxtppStr=outStr[i][5].trim();
		jldw=outStr[i][6].trim();
		sfxzslStr=outStr[i][7].trim();
		bzslStr=outStr[i][8].trim();

		sfkjmStr=outStr[i][9].trim();
		yxjmzdslStr=outStr[i][10].trim();
		jmdjStr=outStr[i][11].trim();
		sfkghStr=outStr[i][12].trim();
		khzdslStr=outStr[i][13].trim();
		ghzjStr=outStr[i][14].trim();


		sql=" select cldlbm" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tccpdlbm = rs.getString("cldlbm");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[产品大类]："+cldlmc);
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
			out.println("行号["+row+"]错误！不存在的[产品小类]："+clxlmc);
			return;
		}
		rs.close();
		ps.close();

		if (!tcsjflmc.equals(""))
		{
			sql=" select tcsjflbm" ;
			sql+=" from bdm_tcsjflbm " ;
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


		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			jldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("行号["+row+"]错误！不存在的[计量单位]："+jldw);
			return;
		}
		rs.close();
		ps.close();




		if (sfxzslStr.equals("超量需加价"))
		{
			sfxzsl="1";
		}
		else if (sfxzslStr.equals("不可超量"))
		{
			sfxzsl="2";
		}
		else if (sfxzslStr.equals("无数量限制"))
		{
			sfxzsl="3";
		}
		else{
			out.println("行号["+row+"]错误！[是否限制数量]只能为【超量需加价；不可超量；无数量限制】，目前为["+sfxzslStr+"]");
			return;
		}




		bzsl=0;
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

			if (bzsl==0 )
			{
				out.println("行号["+row+"]错误！[是否限制数量]为【超量需加价】，标准数量不能为0");
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

		}
		else{
			if (!bzslStr.equals("") && !bzslStr.equals("0"))
			{
				out.println("<BR>行号["+row+"]提醒！[是否限制数量]为【不控制】，【标准数量】应为空，导入为："+bzslStr);
			}
		}

		if (sfkjmStr.equals("可减免"))//1：不可减免；2：可减免
		{
			sfkjm="2";

			if (yxjmzdslStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[允许减免最大数量]不能为空");
				return;
			}
			else{
				try{
					yxjmzdsl=Double.parseDouble(yxjmzdslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[允许减免最大数量:"+yxjmzdslStr+"]不是数字:"+e);
					return;
				}
			}

			if (jmdjStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[减免单价]不能为空");
				return;
			}
			else{
				try{
					jmdj=Double.parseDouble(jmdjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[减免单价:"+jmdjStr+"]不是数字:"+e);
					return;
				}
			}
		}
		else
		{
			sfkjm="1";
			sfkjmStr="不可减免";
			yxjmzdsl=0;
			jmdj=0;
		}


		if (sfkghStr.equals("可换"))//1：不可换；2：可换
		{
			sfkgh="2";

			if (khzdslStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[可换最大数量]不能为空");
				return;
			}
			else{
				try{
					khzdsl=Double.parseDouble(khzdslStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[可换最大数量:"+khzdslStr+"]不是数字:"+e);
					return;
				}
			}

			if (ghzjStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[更换折价]不能为空");
				return;
			}
			else{
				try{
					ghzj=Double.parseDouble(ghzjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[更换折价:"+ghzjStr+"]不是数字:"+e);
					return;
				}
			}
		}
		else
		{
			sfkgh="1";
			sfkghStr="不可换";
			khzdsl=0;
			ghzj=0;
		}

		
		if (bzsl==0)
		{
			bzslStr="";
		}
		if (jmdj==0)
		{
			jmdjStr="";
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=cldlmc%>
        <input name="tccpdlbm" type="hidden" value="<%=tccpdlbm%>">
      </td>
      <td><%=clxlmc%>
        <input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
      </td>
      </td>
      <td><%=tcsjflmc%>
        <input name="tcsjflbm" type="hidden" value="<%=tcsjflbm%>" >
      </td>
      <td><%=sfbxxStr%>
        <input name="sfbxx" type="hidden" value="<%=sfbxx%>" >
      </td>
      <td><%=sfyxsjStr%>
        <input name="sfyxsj" type="hidden" value="<%=sfyxsj%>" >
      </td>
      <td><%=sfyqxtppStr%>
        <input name="sfyqxtpp" type="hidden" value="<%=sfyqxtpp%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td><%=bzslStr%>
        <input name="bzsl" type="hidden" value="<%=bzsl%>" >
      </td>
      <td><%=sfxzslStr%>
        <input name="sfxzsl" type="hidden" value="<%=sfxzsl%>" >
      </td>
      <td><%=sfkjmStr%>
        <input name="sfkjm" type="hidden" value="<%=sfkjm%>" >
      </td>
      <td><%=yxjmzdslStr%>
        <input name="yxjmzdsl" type="hidden" value="<%=yxjmzdsl%>" >
      </td>
      <td><%=jmdjStr%>
        <input name="jmdj" type="hidden" value="<%=jmdj%>" >
      </td>
      <td><%=sfkghStr%>
        <input name="sfkgh" type="hidden" value="<%=sfkgh%>" >
      </td>
      <td><%=khzdslStr%>
        <input name="khzdsl" type="hidden" value="<%=khzdsl%>" >
      </td>
      <td><%=ghzjStr%>
        <input name="ghzj" type="hidden" value="<%=ghzj%>" >
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
