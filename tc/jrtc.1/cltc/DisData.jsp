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

String tcmc=null;
String jgwzbm=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
String ydjStr=null;
String tcdjStr=null;
String sjzjStr=null;
String jsjStr=null;
String bz=null;

double ydj=0;
double tcdj=0;
double sjzj=0;
double jsj=0;

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
    <p>导入套餐标准工程项目</p>
    <p><font color="#FF0000"><b>请注意：</b></font> <b>地区</b><font color="#FF0000"><b>[<%=dqmc%>]
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">

  <table width="160%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="4%">套餐名称</td>
	  <td width="4%">房间位置</td>
      <td width="9%">产品名称</td>
      <td width="9%">型号</td>
      <td width="9%">规格</td>
      <td width="6%">品牌</td>
      <td width="11%">供应商名称</td>
      <td width="3%">计量单位</td>
      <td width="4%">原单价</td>
      <td width="4%">套餐单价</td>
      <td width="4%">升级折价</td>
      <td width="4%">结算价</td>
      <td width="19%">备注</td>
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
		if (len<7)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		tcmc=outStr[i][0].trim();
		jgwzbm=outStr[i][1].trim();
		cpmc=outStr[i][2].trim();
		xh=outStr[i][3].trim();
		gg=outStr[i][4].trim();
		ppmc=outStr[i][5].trim();
		gysmc=outStr[i][6].trim();
		jldw=outStr[i][7].trim();
		ydjStr=outStr[i][8].trim();
		tcdjStr=outStr[i][9].trim();
		sjzjStr=outStr[i][10].trim();
		jsjStr=outStr[i][11].trim();
		bz=outStr[i][12].trim();


		if (cpmc.equals(""))
		{
			out.println("行号["+row+"]错误！[产品名称]为空");
			return;
		}


		int count=0;
		sql=" select count(*)" ;
		sql+=" from bdm_jgwzbm " ;
		sql+=" where jgwzmc='"+jgwzbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("行号["+row+"]错误！不存在的[房间位置]："+jgwzbm);
//			return;
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

		sql=" select tcmc" ;
		sql+=" from bj_cltcmc " ;
		sql+=" where dqbm='"+dqbm+"' and tcmc='"+tcmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			tcmc = rs.getString("tcmc");			    
		}
		else{
			out.println("<BR>行号["+row+"]错误！不存在的[套餐名称]："+tcmc);
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

		if (ydjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[原单价]不能为空");
//			return;
		}
		else{
			try{
				ydj=Double.parseDouble(ydjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[原单价:"+ydjStr+"]不是数字:"+e);
//				return;
			}
		}
		if (tcdjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[套餐单价]不能为空");
//			return;
		}
		else{
			try{
				tcdj=Double.parseDouble(tcdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[套餐单价:"+tcdjStr+"]不是数字:"+e);
//				return;
			}
		}
		if (sjzjStr.equals(""))
		{
			out.println("<BR>行号["+row+"]错误！[升级折价]不能为空");
//			return;
		}
		else{
			try{
				sjzj=Double.parseDouble(sjzjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>行号["+row+"]错误！[升级折价:"+sjzjStr+"]不是数字:"+e);
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


	  %> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=tcmc%>
        <input name="tcmc" type="hidden" value="<%=tcmc%>">
      </td>
      <td><%=jgwzbm%>
        <input name="jgwzbm" type="hidden" value="<%=jgwzbm%>">
      </td>
      <td><%=cpmc%>
        <input name="cpmc" type="hidden" value="<%=cpmc%>">
      </td>
      <td><%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td><%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=ppmc%>
        <input name="ppmc" type="hidden" value="<%=ppmc%>" >
      </td>
      <td><%=gysmc%>
        <input name="gysmc" type="hidden" value="<%=gysmc%>" >
      </td>
      <td><%=jldw%>
        <input name="jldw" type="hidden" value="<%=jldw%>" >
      </td>
      <td><%=ydjStr%>
        <input name="ydj" type="hidden" value="<%=ydj%>" >
      </td>
      <td><%=tcdjStr%>
        <input name="tcdj" type="hidden" value="<%=tcdj%>" >
      </td>
      <td><%=sjzjStr%>
        <input name="sjzj" type="hidden" value="<%=sjzj%>" >
      </td>
      <td><%=jsjStr%>
        <input name="jsj" type="hidden" value="<%=jsj%>" >
      </td>
      <td><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
