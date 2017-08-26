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

String dqbm = null;

String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;
String mark=null;

String bjjbbm = null;
String bjjbmc=null;
String kbcpbm=null;
String kbwlbm=null;

String cpdl=null;
String cpxl=null;
String cpbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
String xdbStr=null;
String jsjStr=null;
String lsjStr=null;
String sjjStr=null;
String cllxStr=null;
String cllx=null;
String cptz=null;
String czlx=null;
String cpks=null;
String cplx=null;

String shStr=null;
String xuhao=null;
String ppmc=null;
String gysmc=null;
String sfxclxs=null;
String sfxclxsStr=null;
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String sfkgdjStr=null;
String sfkgdj=null;


double xdb=0;
double jsj=0;
double lsj=0;
double sjj=0;
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

	dqbm =up.getParameter("dqbm");

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
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    导入套餐主材报价
    <p><font color="#FF0000"><b>请注意：</b></font><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	，注意：不要重复导入</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="280%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">报价级别</td>
      <td width="3%">科宝产品编码</td>
      <td width="3%">科宝物料编码</td>
      <td width="4%">品牌</td>
      <td width="8%">供应商</td>
      <td width="4%">产品大类</td>
      <td width="4%">产品小类</td>
	  <td width="3%">产品编码</td>
      <td width="6%">产品名称</td>
      <td width="5%">型号</td>
      <td width="5%">规格</td>
      <td width="7%">产品特征</td>
      <td width="5%">材质类型</td>
      <td width="5%">产品款式</td>
      <td width="4%">产品类型</td>
	  <td width="2%">报价计量单位</td>
	  <td width="2%">下单计量单位</td>
	  <td width="2%">下单比</td>
	  <td width="2%">损耗（%）</td>
	  <td width="2%">是否需处理小数</td>
	  <td width="2%">结算价</td>
	  <td width="2%">零售价</td>
	  <td width="2%">包内价</td>
	  <td width="2%">材料类型</td>
	<td  width="2%">是否有效</td>
	<td  width="3%">有效开始时间</td>
	<td  width="3%">有效结束时间</td>
      <td width="2%">排序</td>
      <td width="2%">是否可改单价</td>
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
		if (len<22)
		{
			out.println("错误！请下载新版Excel模板"+len);
			return;
		}

		bjjbmc=outStr[i][0].trim();
		kbcpbm=outStr[i][1].trim();
		kbwlbm=outStr[i][2].trim();
		ppmc=outStr[i][3].trim();
		gysmc=outStr[i][4].trim();
		cpdl=outStr[i][5].trim();
		cpxl=outStr[i][6].trim();
		cpbm=outStr[i][7].trim();
		cpmc=outStr[i][8].trim();
		xh=outStr[i][9].trim();
		gg=outStr[i][10].trim();


		cptz=outStr[i][11].trim();
		czlx=outStr[i][12].trim();
		cpks=outStr[i][13].trim();
		cplx=outStr[i][14].trim();
		jldw=outStr[i][15].trim();
		xdjldw=outStr[i][16].trim();
		xdbStr=outStr[i][17].trim();
		shStr=outStr[i][18].trim();
		sfxclxsStr=outStr[i][19].trim();
		jsjStr=outStr[i][20].trim();

		lsjStr=outStr[i][21].trim();
		sjjStr=outStr[i][22].trim();
		cllxStr=outStr[i][23].trim();
		sfyxStr=outStr[i][24].trim();
		yxkssj=outStr[i][25].trim();
		yxjzsj=outStr[i][26].trim();
		xuhao=outStr[i][27].trim();
		sfkgdjStr=outStr[i][28].trim();

		mark="";

		if (cpmc.equals(""))
		{
			out.println("产品名称为空，下面数据被放弃");
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
			out.println("错误！报价级别不存在");
			return;
		}
		rs.close();
		ps.close();



		sql=" select cldlmc" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cpdl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cpdl = rs.getString("cldlmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[产品大类]："+cpdl);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select clxlmc" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where cldlmc='"+cpdl+"' and clxlmc='"+cpxl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cpxl = rs.getString("clxlmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[产品小类名称]:"+cpxl);
//			return;
		}
		rs.close();
		ps.close();


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


		jsj=0;
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

		lsj=0;
		if (lsjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[零售价]不能为空");
//			return;
		}
		else{
			try{
				lsj=Double.parseDouble(lsjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[零售价:"+lsjStr+"]不是数字:"+e);
//				return;
			}
		}

		sjj=0;
		if (sjjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[包内价]不能为空");
//			return;
		}
		else{
			try{
				sjj=Double.parseDouble(sjjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[包内价:"+sjjStr+"]不是数字:"+e);
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
			out.println("<BR>行号["+row+"]错误！[是否需处理小数]只能为【向上取整；向下取整；4舍5入；不处理】，目前为["+sfxclxsStr+"]");
//			return;
		}

		if (sfyxStr.equals("停止销售"))//1：正在销售；2：停止销售；3：阶段销售；4：售前核实
		{
			sfyx="2";
		}
		else if (sfyxStr.equals("阶段销售"))
		{
			sfyx="3";
		}
		else if (sfyxStr.equals("售前核实"))
		{
			sfyx="4";
		}
		else{
			sfyx="1";
			sfyxStr="正在销售";
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

		if (cllxStr.equals("包内产品"))
		{
			cllx="1";
		}
		else if (cllxStr.equals("包外产品"))
		{
			cllx="2";
		}
		else{
			out.println("<BR>行号["+row+"]错误！[材料类型]只能为【包内产品；包外产品】，目前为["+cllxStr+"]");
//			return;
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
			sfkgdjStr="否";
			sfkgdj="N";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td ><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td ><%=kbcpbm%>
        <input name="kbcpbm" type="hidden" value="<%=kbcpbm%>" >
      </td>
      <td ><%=kbwlbm%>
        <input name="kbwlbm" type="hidden" value="<%=kbwlbm%>" >
      </td>
      <td ><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
      </td>
      <td><%=cpdl%>
        <input name="cpdl" type="hidden" value="<%=cpdl%>">
      </td>
      <td><%=cpxl%>
        <input name="cpxl" type="hidden" value="<%=cpxl%>">
      </td>
      <td> <%=cpbm%>
        <input name="cpbm" type="hidden" value="<%=cpbm%>" >
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
      <td><%=cptz%>
        <input name="cptz" type="hidden" value="<%=cptz%>" >
      </td>
      <td><%=czlx%>
        <input name="czlx" type="hidden" value="<%=czlx%>" >
      </td>
      <td><%=cpks%>
        <input name="cpks" type="hidden" value="<%=cpks%>" >
      </td>
      <td><%=cplx%>
        <input name="cplx" type="hidden" value="<%=cplx%>" >
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
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td><%=lsj%>
        <input name="lsj" type="hidden" value="<%=lsj%>" >
      </td>
      <td><%=sjj%>
        <input name="sjj" type="hidden" value="<%=sjj%>" >
      </td>
      <td><%=cllxStr%>
        <input name="cllx" type="hidden" value="<%=cllx%>" >
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
      <td ><%=sfkgdjStr%>
        <input name="sfkgdj" type="hidden" value="<%=sfkgdj%>" >
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
