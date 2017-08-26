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
String bjjbbm = null;
String dqbm = null;

String bjjbmc=null;
String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;
String mark=null;

String tccpdlbm=null;
String cldlmc=null;
String tccplbbm=null;
String clxlmc=null;
String cpbm=null;
String sku=null;
String cpmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
String xdbStr=null;
String djStr=null;
String jsjStr=null;
String jjjeStr=null;
String shStr=null;
String sfcscp=null;
String sfcscpStr=null;
String xuhao=null;
String ppmc=null;
String gysmc=null;
String sfxclxs=null;
String sfxclxsStr=null;
String tcsjflbm=null;
String tcsjflmc=null;


double xdb=0;
double dj=0;
double jsj=0;
double jjje=0;
double sh=0;

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
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入套餐主材报价</p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>版本号</b><font color="#FF0000"><b>[<%=bjbbh%>]</b></font><b>；报价级别</b><font color="#FF0000"><b>[<%=bjjbmc%>]；</b></font><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	<P>注意：不要重复导入</b></font></p>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="bjbbh" value="<%=bjbbh%>">

  <table width="180%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">产品大类</td>
      <td width="5%">产品类别</td>
      <td width="5%">套餐升级分类</td>
	  <td width="5%">产品编码</td>
      <td width="3%">是否超市产品</td>
      <td width="5%">SKU号</td>
      <td width="9%">产品名称</td>
      <td width="7%">型号</td>
      <td width="7%">规格</td>
	  <td width="3%">报价计量单位</td>
	  <td width="3%">下单计量单位</td>
	  <td width="3%">下单比</td>
	  <td width="4%">损耗（%）</td>
	  <td width="4%">是否需处理小数</td>
	  <td width="5%">单价</td>
	  <td width="5%">结算价</td>
	  <td width="5%">加价金额</td>
      <td width="4%">排序序号</td>
      <td width="8%">品牌</td>
      <td width="12%">供应商</td>
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
		if (len<20)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		cldlmc=outStr[i][0].trim();
		clxlmc=outStr[i][1].trim();
		tcsjflmc=outStr[i][2].trim();
		cpbm=outStr[i][3].trim();
		sfcscpStr=outStr[i][4].trim();
		sku=outStr[i][5].trim();
		cpmc=outStr[i][6].trim();
		xh=outStr[i][7].trim();
		gg=outStr[i][8].trim();
		jldw=outStr[i][9].trim();
		xdjldw=outStr[i][10].trim();
		xdbStr=outStr[i][11].trim();
		shStr=outStr[i][12].trim();
		sfxclxsStr=outStr[i][13].trim();
		djStr=outStr[i][14].trim();
		jsjStr=outStr[i][15].trim();
		jjjeStr=outStr[i][16].trim();
		xuhao=outStr[i][17].trim();
		ppmc=outStr[i][18].trim();
		gysmc=outStr[i][19].trim();

		mark="";

		if (cpmc.equals(""))
		{
			out.println("产品名称为空，下面数据被放弃");
			return;
		}

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
			out.println("<BR>行号["+row+"]错误！不存在的[产品大类]："+cldlmc);
//			return;
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
			out.println("<BR>行号["+row+"]错误！不存在的[产品类别名称]:"+clxlmc);
//			return;
		}
		rs.close();
		ps.close();

		if (tcsjflmc.equals(""))
		{
			tcsjflbm="";
		}
		else{
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
				out.println("<BR>行号["+row+"]错误！不存在的[套餐升级分类]："+tcsjflmc);
//				return;
			}
			rs.close();
			ps.close();
		}


		sql=" select ppmc" ;
		sql+=" from jxc_ppxx " ;
		sql+=" where ppmc='"+ppmc+"' and pplb in('1','3')" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			ppmc = rs.getString("ppmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[品牌]："+ppmc);
//			return;
		}
		rs.close();
		ps.close();


		sql=" select gysmc" ;
		sql+=" from jxc_gysxx " ;
		sql+=" where gysmc='"+gysmc+"' and jxc_gysxx.dqbm='"+dqbm+"' and jxc_gysxx.sfhz='Y' and jxc_gysxx.cllx in('1','3')" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			gysmc = rs.getString("gysmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[供应商]："+gysmc);
//			return;
		}
		rs.close();
		ps.close();

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
			out.println("<BR>行号["+row+"]错误！不存在的[报价计量单位]："+jldw);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select jldwmc" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+xdjldw+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			xdjldw = rs.getString("jldwmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[下单计量单位]："+xdjldw);
//			return;
		}
		rs.close();
		ps.close();



		if (xdbStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[下单比]不能为空");
//			return;
		}
		else{
			try{
				xdb=Double.parseDouble(xdbStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[下单比:"+xdbStr+"]不是数字:"+e);
//				return;
			}
		}
		if (shStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[损耗]不能为空");
//			return;
		}
		else{
			try{
				sh=Double.parseDouble(shStr.trim());
				if (sh<0 || sh>100)
				{
					out.println("<BR>行号["+row+"]错误！[损耗]只能在0到100之间："+shStr);
//					return;
				}
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[损耗:"+shStr+"]不是数字:"+e);
//				return;
			}
		}


		if (djStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[单价]不能为空");
//			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[单价:"+djStr+"]不是数字:"+e);
//				return;
			}
		}

		if (jsjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[结算价]不能为空");
//			return;
		}
		else{
			try{
				jsj=Double.parseDouble(jsjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[结算价:"+jsjStr+"]不是数字:"+e);
//				return;
			}
		}
		if (jjjeStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[加价金额]不能为空");
//			return;
		}
		else{
			try{
				jjje=Double.parseDouble(jjjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[加价金额:"+jjjeStr+"]不是数字:"+e);
//				return;
			}
		}



		if (sfcscpStr.equals("是"))
		{
			sfcscp="Y";
		}
		else if (sfcscpStr.equals("否"))
		{
			sfcscp="N";
		}
		else{
			out.println("行号["+row+"]错误！[是否超市产品]只能为【是、否】，目前为["+sfcscpStr+"]");
//			return;
		}

		if (sfcscp.equals("Y"))
		{
			if (sku.equals(""))
			{
				out.println("行号["+row+"]错误！是超市产品，必须输入SKU号");
//				return;
			}
		}
		else{
			if (!sku.equals(""))
			{
				out.println("行号["+row+"]错误！非超市产品，不需要SKU号");
//				return;
			}
		}

		if (sfxclxsStr.equals("向上取整"))
		{
			sfxclxs="1";
		}
		else if (sfxclxsStr.equals("向下取整"))
		{
			sfxclxs="2";
		}
		else if (sfxclxsStr.equals("4舍5入"))
		{
			sfxclxs="3";
		}
		else if (sfxclxsStr.equals("不处理"))
		{
			sfxclxs="4";
		}
		else{
			out.println("行号["+row+"]错误！[是否需处理小数]只能为【向上取整；向下取整；4舍5入；不处理】，目前为["+sfxclxsStr+"]");
//			return;
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=cldlmc%>
        <input name="tccpdlbm" type="hidden" value="<%=tccpdlbm%>">
      </td>
      <td><%=clxlmc%>
        <input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
      </td>
      <td> <%=tcsjflmc%>
        <input name="tcsjflbm" type="hidden" value="<%=tcsjflbm%>" >
      </td>
      <td> <%=cpbm%>
        <input name="cpbm" type="hidden" value="<%=cpbm%>" >
      </td>
      <td ><%=sfcscpStr%>
        <input name="sfcscp" type="hidden" value="<%=sfcscp%>" >
      </td>
	  <td > <%=sku%>
        <input name="sku" type="hidden" value="<%=sku%>" >
      </td>
	  <td> <%=cpmc%>
        <input name="cpmc" type="hidden" value="<%=cpmc%>" >
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td> <%=xdjldw%>
        <input name="xdjldw" type="hidden" value="<%=xdjldw%>" >
      </td>
      <td><%=xdb%>
        <input name="xdb" type="hidden" value="<%=xdb%>" >
      </td>
      <td ><%=sh%>
        <input name="sh" type="hidden" value="<%=sh%>" >
      </td>
      <td ><%=sfxclxsStr%>
        <input name="sfxclxs" type="hidden" value="<%=sfxclxs%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td><%=jjje%>
        <input name="jjje" type="hidden" value="<%=jjje%>" >
      </td>
      <td ><%=xuhao%>
        <input name="xuhao" type="hidden" value="<%=xuhao%>" >
      </td>
      <td ><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
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
