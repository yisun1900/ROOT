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

String ssfgs=(String)session.getAttribute("ssfgs");
String lrbm=(String)session.getAttribute("dwbh");

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;
String[][] outStr=null; 
String bgcolor=null;

String ygmc=null;//员工名称

double jjbqntq =0;//去年同期月度主材产值
double jjbbyjh=0;//本月计划
double jjbylj=0;//本月累计
double jjbdmbylj=0;//所属店面本月累计工程产值
double jjbszjh=0;//上周计划
double jjbszwc=0;//上周完成
double jjbbzyj=0;//本周预计

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;

String bmmc=null;//部门名称
String bmrs=null;//部门人数

int zqs=0;
String date_ss=null;//上周开始时间
String date_se=null;//上周结束时间
String date_bs=null;//本周开始时间
String date_be=null;//本周结束时间

int row=0;

try 
{
	conn=cf.getConnection();    //得到连接

	//查询日期
	ls_sql="SELECT zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" order by yy_rqsd_bzs desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zqs=rs.getInt("zqs");
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();

  		
    //查询所属所属部门
	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bmmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();
	
	//查询部门人数
	ls_sql="SELECT count(*) rs";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and  dwbh='"+lrbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		bmrs=rs.getString("rs");
	}
	rs.close();
	ps.close();

	
	
	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">

  
 <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">

  <tr>
    <td height="25" colspan="13" align="center">家居部周录入表（周期数：<%=zqs%>）
	<input type="hidden" name="yy_jjb_lrr" value="<%=yhdlm%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">		</td>
  </tr>
  <tr>
    <td  height="28" align="center">上周日期</td>
    <td colspan="3" align="center"><%=date_ss%>至<%=date_se%></td>
    <td align="center">本周日期</td>
    <td colspan="4"  align="center"><%=date_bs%>至<%=date_be%></td>
    </tr>
  <tr>
    <td height="28" align="center">部门名称</td>
    <td align="center"><%=bmmc%></td>
    <td colspan="2" align="center">家装顾问人数</td>
    <td align="center"><%=bmrs%></td>
    <td colspan="3" align="center">单位：个</td>
    </tr>
  
  <tr align="center">
    <td width="121" height="20" >姓名</td>
    <td width="106" >去年同期月度主材产值</td>
    <td width="118" >本月计划</td>
    <td width="118" >本月累计</td>
    <td width="118">所属店面本月累计工程产值</td>
    <td width="118" >上周计划</td>
    <td width="118" >上周完成</td>
    <td width="124" >本周预计</td>
    </tr>

<%
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

	
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xmbhStr=new String[outStr.length-1];

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
		if (len!=8)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}


		ygmc=outStr[i][0].trim();//员工名称
		
		try{
			jjbqntq=Double.parseDouble( outStr[i][1].trim() );
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]去年同期月度主材产值:"+outStr[i][1]+"不是整数:"+e);
			return;
		}
		try{
			jjbbyjh=Double.parseDouble( outStr[i][2].trim() );
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]本月计划:"+outStr[i][2]+"不是整数:"+e);
			return;
		}
		try{
			jjbylj=Double.parseDouble( outStr[i][3].trim() );//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]本月累计:"+outStr[i][3]+"不是整数:"+e);
			return;
		}
		try{
			jjbdmbylj=Double.parseDouble( outStr[i][4].trim() );//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]所属店面本月累计工程产值:"+outStr[i][4]+"不是整数:"+e);
			return;
		}
		try{
			jjbszjh=Double.parseDouble( outStr[i][5].trim() );//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]上周计划:"+outStr[i][5]+"不是整数:"+e);
			return;
		}
		try{
			jjbszwc=Double.parseDouble(outStr[i][6].trim());//
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]上周完成:"+outStr[i][6]+"不是整数:"+e);
			return;
		}
		try{
			jjbbzyj=Double.parseDouble(outStr[i][7].trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]本周预计:"+outStr[i][7]+"不是整数:"+e);
			return;
		}

		
		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=ygmc%> 
        <input name="ygmc" type="hidden" value="<%=ygmc%>">      </td>
      <td><%=jjbqntq%> 
        <input name="jjbqntq" type="hidden" value="<%=jjbqntq%>">      </td>
      <td> <%=jjbbyjh%>
        <input name="jjbbyjh" type="hidden" value="<%=jjbbyjh%>" >      </td>
      <td> <%=jjbylj%>
        <input name="jjbylj" type="hidden" value="<%=jjbylj%>" >      </td>
      <td><%=jjbdmbylj%> 
        <input name="jjbdmbylj" type="hidden" value="<%=jjbdmbylj%>">      </td>
	  <td > <%=jjbszjh%>
        <input name="jjbszjh" type="hidden" value="<%=jjbszjh%>" >      </td>

	  <td > <%=jjbszwc%>
        <input name="jjbszwc" type="hidden" value="<%=jjbszwc%>" >      </td>
      <td> <%=jjbbzyj%>
        <input name="jjbbzyj" type="hidden" value="<%=jjbbzyj%>" >      </td>
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
  	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
	<input type="hidden" name="ssbm" value="<%=lrbm%>">
	<input type="hidden" name="zqs" value="<%=zqs%>">
      <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
    共导入项目数：<%=row%>    </tr>
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
