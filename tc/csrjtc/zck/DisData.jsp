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

String nbbm=null;
String tccpdlbm=null;
String cldlmc=null;
String tccplbbm=null;
String clxlmc=null;
String bzmc=null;
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

String lx=null;
String lxStr=null;
String cxxmbm=null;
String lbxmbm=null;
String sfyx=null;
String sfyxStr=null;
String yxkssj=null;
String yxjzsj=null;
String bjjbmc=null;
String sjbjjbmc=null;
String bz=null;
String zp=null;


double xdb=0;
double sh=0;

String yjsjStr=null;
String ykhxsdjStr=null;
String ysgddjStr=null;
double yjsj=0;
double ykhxsdj=0;
double ysgddj=0;

String jsjStr=null;
String khxsdjStr=null;
String sgddjStr=null;
double jsj=0;
double khxsdj=0;
double sgddj=0;

String bjjbbm=null;
String sjbjjbbm=null;
String ysjsfjStr=null;
double ysjsfj=0;
String sjsfjStr=null;
double sjsfj=0;


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
    <p><font color="#FF0000"><b>请注意：</b></font><b><b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
	<P>注意：不要重复导入</b></font></p>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="270%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">内部编码</td>
      <td width="3%">产品大类</td>
	  <td width="4%">产品小类</td>
	  <td width="3%">分组名称</td>
      <td width="5%">产品名称</td>
      <td width="5%">型号</td>
      <td width="5%">规格</td>
	  <td width="3%">品牌</td>
	  <td width="7%">供应商</td>
	  <td width="2%">计量单位</td>
	  <td width="2%">下单计量单位</td>
	  <td width="2%">下单比</td>
	  <td width="2%">损耗</td>
	  <td width="3%">是否需处理小数</td>
	  <td width="3%">原结算价</td>
	  <td width="3%">原客户销售单价</td>
      <td width="3%">原施工队单价</td>
	  <td width="3%">结算价</td>
	  <td width="3%">客户销售单价</td>
      <td width="3%">施工队单价</td>
	  <td width="3%">是否有效</td>
	  <td width="3%">有效开始时间</td>
	  <td width="3%">有效结束时间</td>
	  <td width="4%">照片名称</td>
	  <td width="8%">备注</td>
	  <td width="3%">主材级别</td>
	  <td width="3%">被升级级别</td>
	  <td width="3%">原升级收费价</td>
	  <td width="3%">升级收费价</td>
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
		if (len<29)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		nbbm=outStr[i][0].trim();
		cldlmc=outStr[i][1].trim();
		clxlmc=outStr[i][2].trim();
		bzmc=outStr[i][3].trim();
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
		yjsjStr=outStr[i][14].trim();
		ykhxsdjStr=outStr[i][15].trim();
		ysgddjStr=outStr[i][16].trim();
		jsjStr=outStr[i][17].trim();
		khxsdjStr=outStr[i][18].trim();
		sgddjStr=outStr[i][19].trim();
		sfyxStr=outStr[i][20].trim();
		yxkssj=outStr[i][21].trim();
		yxjzsj=outStr[i][22].trim();
		zp=outStr[i][23].trim();
		bz=outStr[i][24].trim();
		bjjbmc=outStr[i][25].trim();
		sjbjjbmc=outStr[i][26].trim();
		ysjsfjStr=outStr[i][27].trim();
		sjsfjStr=outStr[i][28].trim();


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
			out.println("<BR>行号["+row+"]错误！不存在的[产品小类]:"+clxlmc);
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
			sh=0;
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

		if (yjsjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[原结算价]不能为空");
//			return;
		}
		else{
			try{
				yjsj=Double.parseDouble(yjsjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[原结算价:"+yjsjStr+"]不是数字:"+e);
//				return;
			}
		}
		if (ykhxsdjStr.equals(""))
		{
			ykhxsdj=0;
			out.println("<BR>行号["+row+"]错误！[原客户销售单价]不能为空");
//			return;
		}
		else{
			try{
				ykhxsdj=Double.parseDouble(ykhxsdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[原客户销售单价:"+ykhxsdjStr+"]不是数字:"+e);
//				return;
			}
		}
		if (ysgddjStr.equals(""))
		{
			ysgddj=0;
		}
		else{
			try{
				ysgddj=Double.parseDouble(ysgddjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[原施工队单价:"+ysgddjStr+"]不是数字:"+e);
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
			khxsdj=0;
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
		if (sgddjStr.equals(""))
		{
			sgddj=0;
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
			sfxclxs="4";
//			out.println("<BR>行号["+row+"]错误！[是否需处理小数]只能为【向上取整；向下取整；4舍5入；不处理】，目前为["+sfxclxsStr+"]");
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
			out.println("<BR>行号["+row+"]错误！不存在的[主材级别]："+bjjbmc);
//			return;
		}
		rs.close();
		ps.close();



		if (!sjbjjbmc.equals(""))
		{
			sql=" select bjjbbm" ;
			sql+=" from bdm_bjjbbm " ;
			sql+=" where bjjbmc='"+sjbjjbmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				sjbjjbbm = rs.getString("bjjbbm");			    
			}
			else{
				out.println("<BR>行号["+row+"]错误！不存在的[被升级级别]："+sjbjjbmc);
	//			return;
			}
			rs.close();
			ps.close();

			if (ysjsfjStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[原升级收费价]不能为空");
	//			return;
			}
			else{
				try{
					ysjsfj=Double.parseDouble(ysjsfjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[原升级收费价:"+ysjsfjStr+"]不是数字:"+e);
	//				return;
				}
			}

			if (sjsfjStr.equals(""))
			{
				out.println("<BR>行号["+row+"]错误！[升级收费价]不能为空");
	//			return;
			}
			else{
				try{
					sjsfj=Double.parseDouble(sjsfjStr.trim());
				}
				catch (Exception e){
					out.println("<BR>行号["+row+"]错误！[升级收费价:"+sjsfjStr+"]不是数字:"+e);
	//				return;
				}
			}
		}
		else{
			sjbjjbbm="";
			sjsfj=0;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
	  <td> <%=nbbm%>
        <input name="nbbm" type="hidden" value="<%=nbbm%>" >
      </td>
      <td><%=cldlmc%>
        <input name="tccpdlbm" type="hidden" value="<%=tccpdlbm%>">
      </td>
      <td><%=clxlmc%>
        <input name="tccplbbm" type="hidden" value="<%=tccplbbm%>">
      </td>
      <td> <%=bzmc%>
        <input name="bzmc" type="hidden" value="<%=bzmc%>" >
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
      <td><%=yjsj%>
        <input name="yjsj" type="hidden" value="<%=yjsj%>" >
      </td>
      <td><%=ykhxsdj%>
        <input name="ykhxsdj" type="hidden" value="<%=ykhxsdj%>" >
      </td>
	  <td><%=ysgddj%>
        <input name="ysgddj" type="hidden" value="<%=ysgddj%>" >
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
      <td ><%=sfyxStr%>
        <input name="sfyx" type="hidden" value="<%=sfyx%>" >
      </td>
      <td ><%=yxkssj%>
        <input name="yxkssj" type="hidden" value="<%=yxkssj%>" >
      </td>
      <td ><%=yxjzsj%>
        <input name="yxjzsj" type="hidden" value="<%=yxjzsj%>" >
      </td>
      <td ><%=zp%>
        <input name="zp" type="hidden" value="<%=zp%>" >
      </td>
      <td ><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td ><%=bjjbmc%>
        <input name="bjjbbm" type="hidden" value="<%=bjjbbm%>" >
      </td>
      <td ><%=sjbjjbmc%>
        <input name="sjbjjbbm" type="hidden" value="<%=sjbjjbbm%>" >
      </td>
      <td ><%=ysjsfjStr%>
        <input name="ysjsfj" type="hidden" value="<%=ysjsfj%>" >
      </td>
      <td ><%=sjsfjStr%>
        <input name="sjsfj" type="hidden" value="<%=sjsfj%>" >
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
