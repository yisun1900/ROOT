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
String tccldjStr=null;
String sfkgdjStr=null;
String sfkgdj=null;

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
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String cllx=null;


double xdb=0;
double dj=0;
double tccldj=0;
double jsj=0;
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

	String bjbbh=null;
	sql="select bjbbh";
	sql+=" from  bj_dzbjbb";
	sql+=" where dqbm='"+dqbm+"' and sfzybb='2'";//2：当前版
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
	}
	rs.close();
	ps.close();

	double tlgbzjj=0;//涂料改为壁纸加价
	sql="select tlgbzjj";
	sql+=" from  bj_tcjgb";
	sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tlgbzjj=rs.getDouble("tlgbzjj");
	}
	rs.close();
	ps.close();
	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    导入套餐主材报价
    <p><font color="#FF0000"><b>请注意：</b></font>报价级别<font color="#FF0000"><b>[<%=bjjbmc%>]；</b></font><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	，注意：不要重复导入</b></font>
  </div>
	<input type="hidden" name="bjjbbm" value="<%=bjjbbm%>">
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
	<input type="hidden" name="tlgbzjj" value="<%=tlgbzjj%>">

  <table width="200%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="5%">品牌</td>
      <td width="9%">供应商</td>
      <td width="5%">产品大类</td>
      <td width="4%">产品类别</td>
      <td width="4%">套餐升级分类</td>
	  <td width="5%">产品编码</td>
      <td width="3%">是否超市产品</td>
      <td width="4%">SKU号</td>
      <td width="7%">产品名称</td>
      <td width="6%">型号</td>
      <td width="6%">规格</td>
	  <td width="3%">报价计量单位</td>
	  <td width="3%">下单计量单位</td>
	  <td width="3%">下单比</td>
	  <td width="3%">损耗（%）</td>
	  <td width="3%">是否需处理小数</td>
	  <td width="3%">套餐内单价</td>
	  <td width="3%">套餐超量单价</td>
	  <td width="3%">是否可改单价</td>
	  <td width="4%">结算价</td>
	<td  width="3%">是否有效</td>
	<td  width="4%">有效开始时间</td>
	<td  width="4%">有效结束时间</td>
      <td width="3%">排序</td>
      <td width="3%">材料类型</td>
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
		if (len<25)
		{
			out.println("错误！请下载新版Excel模板"+len);
			return;
		}

		ppmc=outStr[i][0].trim();
		gysmc=outStr[i][1].trim();
		cldlmc=outStr[i][2].trim();
		clxlmc=outStr[i][3].trim();
		tcsjflmc=outStr[i][4].trim();
		cpbm=outStr[i][5].trim();
		sfcscpStr=outStr[i][6].trim();
		sku=outStr[i][7].trim();
		cpmc=outStr[i][8].trim();
		xh=outStr[i][9].trim();
		gg=outStr[i][10].trim();
		jldw=outStr[i][11].trim();
		xdjldw=outStr[i][12].trim();
		xdbStr=outStr[i][13].trim();
		shStr=outStr[i][14].trim();
		sfxclxsStr=outStr[i][15].trim();
		djStr=outStr[i][16].trim();
		tccldjStr=outStr[i][17].trim();
		sfkgdjStr=outStr[i][18].trim();
		jsjStr=outStr[i][19].trim();

		sfyxStr=outStr[i][20].trim();
		yxkssj=outStr[i][21].trim();
		yxjzsj=outStr[i][22].trim();
		xuhao=outStr[i][23].trim();
		cllx=outStr[i][24].trim();

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

		if (xdb==0)
		{
			out.println("<BR>行号["+row+"]错误！[下单比]不能为0");
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
			out.println("<BR>行号["+row+"]错误！[套餐内单价]不能为空");
//			return;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[套餐内单价:"+djStr+"]不是数字:"+e);
//				return;
			}
		}

		if (tccldjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[套餐超量单价]不能为空");
//			return;
		}
		else{
			try{
				tccldj=Double.parseDouble(tccldjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[套餐超量单价:"+tccldjStr+"]不是数字:"+e);
//				return;
			}
		}


		if (tccplbbm.equals("64"))//墙漆改壁纸
		{
			if (dj!=tlgbzjj)
			{
				out.println("<BR>行号["+row+"]错误！涂料改壁纸价格不正确，导入价:"+dj+"，【版本:"+bjbbh+"】【套餐价格表】设置为："+tlgbzjj);
			}

			if (tccldj!=tlgbzjj)
			{
				out.println("<BR>行号["+row+"]错误！涂料改壁纸价格不正确，导入价:"+tccldj+"，【版本:"+bjbbh+"】【套餐价格表】设置为："+tlgbzjj);
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

		if (jsj==0)
		{
			out.println("<BR>行号["+row+"]提醒！[结算价]为0");
		}


		if (sfkgdjStr.equals("可改"))
		{
			sfkgdj="Y";
		}
		else if (sfkgdjStr.equals("否"))
		{
			sfkgdj="N";
		}
		else{
			out.println("行号["+row+"]错误！[是否可改单价]只能为【可改、否】，目前为["+sfkgdjStr+"]");
//			return;
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

		if (sfyxStr.equals("无效"))//1：永远有效；2：无效；3：阶段有效
		{
			sfyx="2";
		}
		else if (sfyxStr.equals("阶段有效"))
		{
			sfyx="3";
		}
		else{
			sfyx="1";
			sfyxStr="永远有效";
		}

		if (sfyx.equals("3"))
		{
			if (yxkssj.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[有效开始时间]不能为空");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(yxkssj.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[有效开始时间:"+yxkssj+"]不是日期:"+e);
					return;
				}
			}

			if (yxjzsj.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[有效结束时间]不能为空");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(yxjzsj.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[有效结束时间:"+yxjzsj+"]不是日期:"+e);
					return;
				}
			}

		}
		else{
			yxkssj="";
			yxjzsj="";
		}

		if (cllx.equals(""))
		{
			out.println("<BR>行号["+row+"]提醒！[材料类型]为空，默认旧材料");
			cllx="1";
		}
		else if (!cllx.equals("1") && !cllx.equals("2"))
		{
			out.println("<BR>行号["+row+"]提醒！[材料类型]只能是1或2:"+cllx);
			cllx="1";
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
      </td>
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
      <td><%=tccldjStr%>
        <input name="tccldj" type="hidden" value="<%=tccldj%>" >
      </td>
      <td><%=sfkgdjStr%>
        <input name="sfkgdj" type="hidden" value="<%=sfkgdj%>" >
      </td>
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td ><%=sfyxStr%>
        <input name="sfyx" type="hidden" value="<%=sfyx%>" >
      </td>
      <td ><%=yxkssj%>
        <input name="yxkssj" type="hidden" value="<%=yxkssj%>" >
      </td>
      <td ><%=yxjzsj%>
        <input name="yxjzsj" type="hidden" value="<%=yxjzsj%>" >
      </td>
      <td ><%=xuhao%>
        <input name="xuhao" type="hidden" value="<%=xuhao%>" >
      </td>
      <td ><%=cllx%>
        <input name="cllx" type="hidden" value="<%=cllx%>" >
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
