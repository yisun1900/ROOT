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

String ygmc=null;

String byjhStr=null;
String byljStr=null;
String szjhStr=null;
String szwcStr=null;
String bzyjStr=null;

String byjhdjStr=null;
String byljdjStr=null;
String szjhdjStr=null;
String szwcdjStr=null;
String bzjhdjStr=null;

int byjh=0;
int bylj=0;
int szjh=0;
int szwc=0;
int bzyj=0;

int byjhdj=0;
int byljdj=0;
int szjhdj=0;
int szwcdj=0;
int bzjhdj=0;

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
    <td height="25" colspan="14" align="center">市场部录入表（周期数：<%=zqs%>）
	  </td>
  </tr>
  <tr>
    <td width="88" height="28" align="center">上周日期</td>
    <td colspan="3"><%=date_ss%>至<%=date_se%></td>
    <td width="86" align="center">本周日期</td>
    <td colspan="3"><%=date_bs%>至<%=date_be%></td>
    <td colspan="3">单位：个</td>
    </tr>
  <tr>
    <td height="28" align="center">部门名称</td>
    <td colspan="2" align="center"><%=bmmc%></td>
    <td colspan="2" align="center">家装顾问人数</td>
    <td width="74" align="center"><%=bmrs%></td>
    <td width="86">&nbsp;</td>
    <td width="95">&nbsp;</td>
    <td width="80">&nbsp;</td>
	 <td width="80">&nbsp;</td>
	  <td width="80">&nbsp;</td>
  </tr>
</table> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center">
      <td  width="6%" rowspan="2">员工姓名</td>
      <td colspan="5">目标客户数量</td>
      <td colspan="5">收取定金数量</td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="5%">本月计划</td>
	<td  width="5%">本月累计</td>
	<td  width="5%">上周计划</td>
	<td  width="5%">上周完成</td>
	<td  width="5%">本周预计</td>
	<td  width="5%">本月计划</td>
	<td  width="5%">本月累计</td>
	<td  width="5%">上周计划</td>
	<td  width="5%">上周完成</td>
	<td  width="5%">本周预计</td>
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

	for (int i=2;i<outStr.length ;i++ )
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
		if (len<11)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}


		ygmc=outStr[i][0].trim();
		byjhStr=outStr[i][1].trim();
		byljStr=outStr[i][2].trim();
		szjhStr=outStr[i][3].trim();
		szwcStr=outStr[i][4].trim();
		bzyjStr=outStr[i][5].trim();

		byjhdjStr=outStr[i][6].trim();
		byljdjStr=outStr[i][7].trim();
		szjhdjStr=outStr[i][8].trim();
		szwcdjStr=outStr[i][9].trim();
		bzjhdjStr=outStr[i][10].trim();


		try{
			byjh=Integer.parseInt(byjhStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]目标客户数量本月计划:"+byjhStr+"不是整数:"+e);
			return;
		}

		try{
			bylj=Integer.parseInt(byljStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]目标客户数量本月累计:"+byljStr+"不是整数:"+e);
			return;
		}

		try{
			szjh=Integer.parseInt(szjhStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]目标客户数量上周计划:"+szjhStr+"不是整数:"+e);
			return;
		}

		try{
			szwc=Integer.parseInt(szwcStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]目标客户数量上周完成:"+szwcStr+"不是整数:"+e);
			return;
		}

		try{
			bzyj=Integer.parseInt(bzyjStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]目标客户数量本周预计:"+bzyjStr+"不是整数:"+e);
			return;
		}



		try{
			byjhdj=Integer.parseInt(byjhdjStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]收取定金本月计划:"+byjhdjStr+"不是整数:"+e);
			return;
		}

		try{
			byljdj=Integer.parseInt(byljdjStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]收取定金本月累计:"+byljdjStr+"不是整数:"+e);
			return;
		}

		try{
			szjhdj=Integer.parseInt(szjhdjStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]收取定金上周计划:"+szjhdjStr+"不是整数:"+e);
			return;
		}

		try{
			szwcdj=Integer.parseInt(szwcdjStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]收取定金上周完成:"+szwcdjStr+"不是整数:"+e);
			return;
		}

		try{
			bzjhdj=Integer.parseInt(bzjhdjStr.trim());
		}
		catch (Exception e){
			out.println("<BR>["+ygmc+"]收取定金本周预计:"+bzjhdjStr+"不是整数:"+e);
			return;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=ygmc%> 
        <input name="ygmc" type="hidden" value="<%=ygmc%>">      </td>
      <td><%=byjh%> 
        <input name="byjh" type="hidden" value="<%=byjh%>">      </td>
      <td> <%=bylj%>
        <input name="bylj" type="hidden" value="<%=bylj%>" >      </td>
      <td> <%=szjh%>
        <input name="szjh" type="hidden" value="<%=szjh%>" >      </td>
      <td><%=szwc%> 
        <input name="szwc" type="hidden" value="<%=szwc%>">      </td>
	  <td align="center"> <%=bzyj%>
        <input name="bzyj" type="hidden" value="<%=bzyj%>" >      </td>

	  <td align="center"> <%=byjhdj%>
        <input name="byjhdj" type="hidden" value="<%=byjhdj%>" >      </td>
      <td> <%=byljdj%>
        <input name="byljdj" type="hidden" value="<%=byljdj%>" >      </td>
      <td> <%=szjhdj%>
        <input name="szjhdj" type="hidden" value="<%=szjhdj%>" >      </td>
      <td> <%=szwcdj%>
        <input name="szwcdj" type="hidden" value="<%=szwcdj%>" >      </td>
      <td> <%=bzjhdj%>
        <input name="bzjhdj" type="hidden" value="<%=bzjhdj%>" >      </td>
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
