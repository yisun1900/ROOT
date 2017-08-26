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


String[][] outStr=null; 
String bgcolor=null;

String dqbm=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;


String scph=null;
String scrqStr=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String jldwbm=null;
String kcslStr=null;
String rkjStr=null;
String kcjeStr=null;


String mark=null;

double kcsl=0;
double rkj=0;
double kcje=0;
double allkcsl=0;
double allkcje=0;
java.sql.Date scrq=null;

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


	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();


	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">导入主材库存</div>
  <table width="170%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">所在地区</td>
      <td width="7%">材料编码</td>
	  <td width="6%">内部编码</td>
      <td width="15%">材料名称</td>
      <td width="11%">型号</td>
      <td width="12%">规格</td>
	  <td width="5%">生产批号</td>
	  <td width="6%">生产日期</td>
	  <td width="5%">所在仓库</td>
	  <td width="5%">所在货架</td>
	  <td width="5%">所在货位</td>

      <td width="4%">计量单位</td>
	  <td width="5%">库存数量</td>
	  <td width="5%">入库价</td>
	  <td width="6%">库存金额</td>

    </tr>
	

	<%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] nbbmStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
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
		row++;

		int len=outStr[i].length;
		if (len<15)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		dqbm=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		nbbm=outStr[i][2].trim();
		clmc=outStr[i][3].trim();
		xh=outStr[i][4].trim();
		gg=outStr[i][5].trim();
		scph=outStr[i][6].trim();
		scrqStr=outStr[i][7].trim();
		ckbh=outStr[i][8].trim();
		hjbh=outStr[i][9].trim();
		hwbh=outStr[i][10].trim();
		jldwbm=outStr[i][11].trim();
		kcslStr=outStr[i][12].trim();
		rkjStr=outStr[i][13].trim();
		kcjeStr=outStr[i][14].trim();
 

		mark="";

		if (nbbm.equals(""))
		{
			out.println("！！！行号["+row+"]错误，[内部编码]为空");
			return;
		}

		sql=" select clbm" ;
		sql+=" from jxc_clbm " ;
		sql+=" where nbbm='"+nbbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			clbm = rs.getString(1);			    
		}
		rs.close();
		ps.close();



		int count=0;
		sql=" select count(*)" ;
		sql+=" from dm_dqbm " ;
		sql+=" where dqbm='"+dqbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("！！！材料编码["+clbm+"]错误，不存在的[地区编码]："+dqbm);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_cljgb " ;
		sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("<BR>错误！在材料价格表中，材料编码["+clbm+"]不存在");
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_ckmc " ;
		sql+=" where ckbh='"+ckbh+"' and dqbm='"+dqbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("！！！材料编码["+clbm+"]错误，不存在的[仓库编号]："+ckbh);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_hjmc " ;
		sql+=" where ckbh='"+ckbh+"' and hjbh='"+hjbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("！！！材料编码["+clbm+"]错误，不存在的[货架编号]："+hjbh);
			return;
		}

		if (!hwbh.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jxc_hwmc " ;
			sql+=" where hwbh='"+hwbh+"' and hjbh='"+hjbh+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.println("！！！材料编码["+clbm+"]错误，不存在的[所在货位]："+hwbh);
				return;
			}
		}


		if (jldwbm.equals(""))
		{
			out.println("！！！材料编码["+clbm+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.println("！！！材料编码["+clbm+"]错误，不存在的[计量单位]："+jldwbm);
				return;
			}
		}

		
		



		if (kcslStr.equals(""))
		{
			out.println("<BR>！！！材料编码["+clbm+"]错误，[库存数量]不能为空");
			return;
		}
		else{
			try{
				kcsl=Double.parseDouble(kcslStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！材料编码["+clbm+"]错误，[库存数量:"+kcslStr+"]不是数字:"+e);
				return;
			}
		}

		if (rkjStr.equals(""))
		{
			out.println("<BR>！！！材料编码["+clbm+"]错误，[入库价]不能为空");
			return;
		}
		else{
			try{
				rkj=Double.parseDouble(rkjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！材料编码["+clbm+"]错误，[入库价:"+rkjStr+"]不是数字:"+e);
				return;
			}
		}

		if (kcjeStr.equals(""))
		{
			out.println("<BR>！！！材料编码["+clbm+"]错误，[库存金额]不能为空");
			return;
		}
		else{
			try{
				kcje=Double.parseDouble(kcjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！材料编码["+clbm+"]错误，[库存金额:"+kcjeStr+"]不是数字:"+e);
				return;
			}
		}

		scrq=null;
		if (scrqStr!=null && !scrqStr.trim().equals(""))
		{
			try{
				scrq=java.sql.Date.valueOf(scrqStr.trim());
			}
			catch (Exception e) {
				out.print("<BR>！！！材料编码["+clbm+"]错误，[生产日期]非日期：" + scrqStr);
				return;
			}
		}
		else{
			out.println("<BR>！！！材料编码["+clbm+"]错误，[生产日期]不能为空");
			return;
		}

		if (scph==null || scph.trim().equals(""))
		{
			out.println("<BR>！！！材料编码["+clbm+"]错误，[生产批号]不能为空");
			return;
		}

		allkcsl+=kcsl;
		allkcje+=kcje;

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=dqbm%>
        <input name="dqbm" type="hidden" value="<%=dqbm%>">
      </td>
      <td><%=clbm%>
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
      <td><%=nbbm%></td>
	  <td> <%=clmc%></td>
	  <td> <%=xh%></td>
      <td> <%=gg%></td>

      <td> <%=scph%>
        <input name="scph" type="hidden" value="<%=scph%>" >
      </td>
      <td> <%=scrq%>
        <input name="scrq" type="hidden" value="<%=scrq%>" >
      </td>
      <td ><%=ckbh%>
        <input name="ckbh" type="hidden" value="<%=ckbh%>" >
      </td>
      <td ><%=hjbh%>
        <input name="hjbh" type="hidden" value="<%=hjbh%>" >
      </td>
      <td ><%=hwbh%>
        <input name="hwbh" type="hidden" value="<%=hwbh%>" >
      </td>


      <td><%=jldwbm%></td>
      <td><%=kcsl%>
        <input name="kcsl" type="hidden" value="<%=kcsl%>" >
      </td>
      <td> <%=rkj%>
        <input name="rkj" type="hidden" value="<%=rkj%>" >
      </td>
      <td> <%=kcje%>
        <input name="kcje" type="hidden" value="<%=kcje%>" >
      </td>
    </tr>
    <%
	}


}
catch (Exception e) {
	out.print("<P>操作失败，Exception:" + e);
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
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td colspan="3">小 记</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=allkcsl%>
      </td>
      <td>&nbsp;</td>
      <td> <%=allkcje%>
      </td>
    </tr>

	<tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      需导入项目数：<%=row%>
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
