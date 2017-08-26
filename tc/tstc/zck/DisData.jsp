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

String bjjbmc = null;
String bjjbbm = null;
String dqbm = null;

String dqmc=null;

String[][] outStr=null; 
String bgcolor=null;
String mark=null;

String cpbm=null;
String nbbm=null;
String cldl=null;
String clxl=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String xdjldw=null;
String xdbStr=null;
String shStr=null;
String sfxclxs=null;
String sfxclxsStr=null;
String jsjStr=null;
String khxsdjStr=null;
String sjj1Str=null;
String sjj2Str=null;
String sjj3Str=null;
String sjj4Str=null;
String sjj5Str=null;
String sgddjStr=null;
String lx=null;
String lxStr=null;
String cxxmbm=null;
String lbxmbm=null;
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String xuhao=null;


double xdb=0;
double sh=0;
double jsj=0;
double khxsdj=0;
double sgddj=0;
double sjj1=0;
double sjj2=0;
double sjj3=0;
double sjj4=0;
double sjj5=0;

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
    <p>导入套餐主材库</p>
    <p><font color="#FF0000"><b>请注意：</b></font>><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	<P>注意：不要重复导入</b></font></p>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="200%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%">产品编码</td>
      <td width="4%">内部编码</td>
      <td width="4%">产品大类</td>
	  <td width="4%">产品小类</td>
      <td width="4%">产品名称</td>
      <td width="4%">型号</td>
      <td width="4%">规格</td>
	  <td width="6%">品牌</td>
	  <td width="6%">供应商</td>
	  <td width="3%">计量单位</td>
	  <td width="3%">下单计量单位</td>
	  <td width="3%">下单比</td>
	  <td width="3%">损耗</td>
	  <td width="3%">是否需处理小数</td>

	  <td width="5%">礼包项目编码</td>
	  <td width="5%">促销项目编码</td>
	  <td width="4%">是否有效</td>
	  <td width="5%">有效开始时间</td>
	  <td width="5%">有效结束时间</td>
	  <td width="4%">排序序号</td>

	  <td width="3%">类型</td>
	  <td width="3%">所属标准套餐</td>
	  <td width="3%">结算价</td>
	  <td width="3%">客户销售单价</td>
      <td width="3%">施工队单价</td>
      <td width="3%">升级价1</td>
      <td width="3%">升级价2</td>
      <td width="3%">升级价3</td>
      <td width="3%">升级价4</td>
      <td width="3%">升级价5</td>
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

		cpbm=outStr[i][0].trim();
		nbbm=outStr[i][1].trim();
		cldl=outStr[i][2].trim();
		clxl=outStr[i][3].trim();
		cpmc=outStr[i][4].trim();
		xh=outStr[i][5].trim();
		gg=outStr[i][6].trim();
		ppmc=outStr[i][7].trim();
		gysmc=outStr[i][8].trim();
		jldw=outStr[i][9].trim();
		xdjldw=outStr[i][10].trim();
		xdbStr=outStr[i][11].trim();
		shStr=outStr[i][12].trim();
		sfxclxsStr=outStr[i][13].trim();

		cxxmbm=outStr[i][14].trim();
		lbxmbm=outStr[i][15].trim();
		sfyxStr=outStr[i][16].trim();
		yxkssj=outStr[i][17].trim();
		yxjzsj=outStr[i][18].trim();
		xuhao=outStr[i][19].trim();
		lxStr=outStr[i][20].trim();
		bjjbmc=outStr[i][21].trim();

		jsjStr=outStr[i][22].trim();
		khxsdjStr=outStr[i][23].trim();
		sgddjStr=outStr[i][24].trim();

		sjj1Str=outStr[i][25].trim();
		sjj2Str=outStr[i][26].trim();
		sjj3Str=outStr[i][27].trim();
		sjj4Str=outStr[i][28].trim();
		sjj5Str=outStr[i][29].trim();

		mark="";

		if (cpmc.equals(""))
		{
			out.println("产品名称为空，下面数据被放弃");
			return;
		}

		sql=" select cldlmc" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cldl = rs.getString("cldlmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[产品大类]："+cldl);
//			return;
		}
		rs.close();
		ps.close();

		sql=" select clxlmc" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where cldlmc='"+cldl+"' and clxlmc='"+clxl+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			clxl = rs.getString("clxlmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[产品小类]:"+clxl);
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
			out.println("<BR>行号["+row+"]错误！不存在的[计量单位]："+jldw);
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
			out.println("<BR>行号["+row+"]错误！不存在的[报价级别]："+bjjbmc);
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
		if (khxsdjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[客户销售单价]不能为空");
//			return;
		}
		else{
			try{
				khxsdj=Double.parseDouble(khxsdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[客户销售单价:"+khxsdjStr+"]不是数字:"+e);
//				return;
			}
		}
		if (sjj1Str.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级价1]不能为空");
//			return;
		}
		else{
			try{
				sjj1=Double.parseDouble(sjj1Str.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级价1:"+sjj1Str+"]不是数字:"+e);
//				return;
			}
		}
		if (sjj2Str.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级价2]不能为空");
//			return;
		}
		else{
			try{
				sjj2=Double.parseDouble(sjj2Str.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级价2:"+sjj2Str+"]不是数字:"+e);
//				return;
			}
		}
		if (sjj3Str.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级价3]不能为空");
//			return;
		}
		else{
			try{
				sjj3=Double.parseDouble(sjj3Str.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级价3:"+sjj3Str+"]不是数字:"+e);
//				return;
			}
		}
		if (sjj4Str.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级价4]不能为空");
//			return;
		}
		else{
			try{
				sjj4=Double.parseDouble(sjj4Str.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级价4:"+sjj4Str+"]不是数字:"+e);
//				return;
			}
		}
		if (sjj5Str.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级价5]不能为空");
//			return;
		}
		else{
			try{
				sjj5=Double.parseDouble(sjj5Str.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级价5:"+sjj5Str+"]不是数字:"+e);
//				return;
			}
		}
		if (sgddjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[施工队单价]不能为空");
//			return;
		}
		else{
			try{
				sgddj=Double.parseDouble(sgddjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[施工队单价:"+sgddjStr+"]不是数字:"+e);
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

		if (lxStr.equals("套餐项"))//1：标准套餐项；2：促销项；3：礼包项
		{
			lx="1";
		}
		else if (lxStr.equals("套餐外"))//1：标准套餐项；2：促销项；3：礼包项
		{
			lx="4";
		}
		else if (lxStr.equals("促销项"))
		{
			lx="2";
		}
		else{
			lx="3";
			lxStr="礼包项";
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


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
	  <td> <%=cpbm%>
        <input name="cpbm" type="hidden" value="<%=cpbm%>" >
      </td>
	  <td> <%=nbbm%>
        <input name="nbbm" type="hidden" value="<%=nbbm%>" >
      </td>
      <td><%=cldl%>
        <input name="cldl" type="hidden" value="<%=cldl%>">
      </td>
      <td><%=clxl%>
        <input name="clxl" type="hidden" value="<%=clxl%>">
      </td>
      <td> <%=cpmc%>
        <input name="cpmc" type="hidden" value="<%=cpmc%>" >
      </td>
      <td ><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td ><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td ><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
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
	  <td ><%=cxxmbm%>
        <input name="cxxmbm" type="hidden" value="<%=cxxmbm%>" >
      </td>
	  <td ><%=lbxmbm%>
        <input name="lbxmbm" type="hidden" value="<%=lbxmbm%>" >
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
      <td ><%=lxStr%>
        <input name="lx" type="hidden" value="<%=lx%>" >
      </td>
      <td ><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td><%=jsj%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td><%=khxsdj%>
        <input name="khxsdj" type="hidden" value="<%=khxsdj%>" >
      </td>
	  <td><%=sgddj%>
        <input name="sgddj" type="hidden" value="<%=sgddj%>" >
      </td>
	  <td><%=sjj1%>
        <input name="sjj1" type="hidden" value="<%=sjj1%>" >
      </td>
	  <td><%=sjj2%>
        <input name="sjj2" type="hidden" value="<%=sjj2%>" >
      </td>
	  <td><%=sjj3%>
        <input name="sjj3" type="hidden" value="<%=sjj3%>" >
      </td>
	  <td><%=sjj4%>
        <input name="sjj4" type="hidden" value="<%=sjj4%>" >
      </td>
	  <td><%=sjj5%>
        <input name="sjj5" type="hidden" value="<%=sjj5%>" >
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
