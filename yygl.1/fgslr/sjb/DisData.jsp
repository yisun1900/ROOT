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

String yy_sjbdj_sydjcbStr=null;
String yy_sjbdj_byjhStr=null;
String yy_sjbdj_byljStr=null;
String yy_sjbdj_szjhStr=null;
String yy_sjbdj_szwcStr=null;
String yy_sjbdj_bzyjStr=null;
String yy_sjbdj_bztdjStr=null;
String yy_sjbdj_byljtdjStr=null;
String yy_sjbsjf_byjhStr=null;
String yy_sjbsjf_byljStr=null;
String yy_sjbsjf_szjhStr=null;
String yy_sjbsjf_szwcStr=null;
String yy_sjbsjf_bzyjStr=null;
String yy_sjbgccz_byjhStr=null;
String yy_sjbgccz_byljStr=null;
String yy_sjbgccz_szjhStr=null;
String yy_sjbgccz_szwcStr=null;
String yy_sjbgccz_bzyjStr=null;
String yy_sjbzccz_byjhStr=null;
String yy_sjbzccz_byljStr=null;
String yy_sjbzccz_szjhStr=null;
String yy_sjbzccz_szwcStr=null;
String yy_sjbzccz_bzyjStr=null;

int yy_sjbdj_sydjcb=0;
int yy_sjbdj_byjh=0;
int yy_sjbdj_bylj=0;
int yy_sjbdj_szjh=0;
int yy_sjbdj_szwc=0;
int yy_sjbdj_bzyj=0;
int yy_sjbdj_bztdj=0;
int yy_sjbdj_byljtdj=0;
double yy_sjbsjf_byjh=0;
double yy_sjbsjf_bylj=0;
double yy_sjbsjf_szjh=0;
double yy_sjbsjf_szwc=0;
double yy_sjbsjf_bzyj=0;
double yy_sjbgccz_byjh=0;
double yy_sjbgccz_bylj=0;
double yy_sjbgccz_szjh=0;
double yy_sjbgccz_szwc=0;
double yy_sjbgccz_bzyj=0;
double yy_sjbzccz_byjh=0;
double yy_sjbzccz_bylj=0;
double yy_sjbzccz_szjh=0;
double yy_sjbzccz_szwc=0;
double yy_sjbzccz_bzyj=0;


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
    <td height="25" colspan="14" align="center">设计部录入表（周期数：<%=zqs%>）
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
    <td colspan="2" align="center">设计师人数</td>
    <td width="74" align="center"><%=bmrs%></td>
    <td width="86">&nbsp;</td>
    <td width="95">&nbsp;</td>
    <td width="80">&nbsp;</td>
	 <td width="80">&nbsp;</td>
	  <td width="80">&nbsp;</td>
  </tr>
</table> 
<table width="220%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
  <tr  align="center">
    <td rowspan="2" width="70">姓名</td>
    <td colspan="8">收取定金情况</td>
    <td colspan="5">设计费</td>
	<td colspan="5">工程产值</td>
	<td colspan="5">主材产值</td>
  </tr>
  <tr  align="center">
    <td width="45" height="20">以往(非本月)储备</td>
    <td width="70">本月计划</td>
    <td width="70">本月累计</td>
    <td width="70">上周计划</td>
    <td width="70">上周完成</td>
    <td width="79">本周预计</td>
    <td width="70">本周退定金</td>
    <td width="70">本月累计退定金</td>
    <td width="85">本月计划</td>
    <td width="85">本月累计</td>
    <td width="85">上周计划</td>
    <td width="85">上周完成</td>
    <td width="85">本周预计</td>
    <td width="85">本月计划</td>
    <td width="85">本月累计</td>
    <td width="85">上周计划</td>
    <td width="85">上周完成</td>
    <td width="85">本周预计</td>
    <td width="85">本月计划</td>
    <td width="85">本月累计</td>
    <td width="85">上周计划</td>
    <td width="85">上周完成</td>
    <td width="85">本周预计</td>
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
		if (len<24)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		ygmc=outStr[i][0].trim();

		yy_sjbdj_sydjcbStr=outStr[i][1].trim();
		yy_sjbdj_byjhStr=outStr[i][2].trim();
		yy_sjbdj_byljStr=outStr[i][3].trim();
		yy_sjbdj_szjhStr=outStr[i][4].trim();
		yy_sjbdj_szwcStr=outStr[i][5].trim();
		yy_sjbdj_bzyjStr=outStr[i][6].trim();
		yy_sjbdj_bztdjStr=outStr[i][7].trim();
		yy_sjbdj_byljtdjStr=outStr[i][8].trim();

		yy_sjbsjf_byjhStr=outStr[i][9].trim();
		yy_sjbsjf_byljStr=outStr[i][10].trim();
		yy_sjbsjf_szjhStr=outStr[i][11].trim();
		yy_sjbsjf_szwcStr=outStr[i][12].trim();
		yy_sjbsjf_bzyjStr=outStr[i][13].trim();

		yy_sjbgccz_byjhStr=outStr[i][14].trim();
		yy_sjbgccz_byljStr=outStr[i][15].trim();
		yy_sjbgccz_szjhStr=outStr[i][16].trim();
		yy_sjbgccz_szwcStr=outStr[i][17].trim();
		yy_sjbgccz_bzyjStr=outStr[i][18].trim();
		yy_sjbzccz_byjhStr=outStr[i][19].trim();
		yy_sjbzccz_byljStr=outStr[i][20].trim();
		yy_sjbzccz_szjhStr=outStr[i][21].trim();
		yy_sjbzccz_szwcStr=outStr[i][22].trim();
		yy_sjbzccz_bzyjStr=outStr[i][23].trim();

		try{
			yy_sjbdj_sydjcb=Integer.parseInt(yy_sjbdj_sydjcbStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[以往(非本月)储备]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_byjh=Integer.parseInt(yy_sjbdj_byjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[本月计划收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_bylj=Integer.parseInt(yy_sjbdj_byljStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[本月累计收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_szjh=Integer.parseInt(yy_sjbdj_szjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[上周计划收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_szwc=Integer.parseInt(yy_sjbdj_szwcStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[上周完成收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_bzyj=Integer.parseInt(yy_sjbdj_bzyjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[本周预计收取定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_bztdj=Integer.parseInt(yy_sjbdj_bztdjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[本周退定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbdj_byljtdj=Integer.parseInt(yy_sjbdj_byljtdjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[本月累计退定金]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_byjh=Double.parseDouble(yy_sjbsjf_byjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[设计费本月计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_bylj=Double.parseDouble(yy_sjbsjf_byljStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[设计费本月累计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_szjh=Double.parseDouble(yy_sjbsjf_szjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[设计费上周计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_szwc=Double.parseDouble(yy_sjbsjf_szwcStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[设计费上周完成]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbsjf_bzyj=Double.parseDouble(yy_sjbsjf_bzyjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[设计费本周预计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_byjh=Double.parseDouble(yy_sjbgccz_byjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[工程产值本月计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_bylj=Double.parseDouble(yy_sjbgccz_byljStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[工程产值本月累计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_szjh=Double.parseDouble(yy_sjbgccz_szjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[工程产值上周计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_szwc=Double.parseDouble(yy_sjbgccz_szwcStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[工程产值上周完成]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbgccz_bzyj=Double.parseDouble(yy_sjbgccz_bzyjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[工程产值本周预计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_byjh=Double.parseDouble(yy_sjbzccz_byjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[主材产值本月计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_bylj=Double.parseDouble(yy_sjbzccz_byljStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[主材产值本月累计]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_szjh=Double.parseDouble(yy_sjbzccz_szjhStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[主材产值上周计划]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_szwc=Double.parseDouble(yy_sjbzccz_szwcStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[主材产值上周完成]不是数字类型:"+e);
			return;
		}

		try{
			yy_sjbzccz_bzyj=Double.parseDouble(yy_sjbzccz_bzyjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+ygmc+"[主材产值本月预计]不是数字类型:"+e);
			return;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=ygmc%> 
        <input name="ygmc" type="hidden" value="<%=ygmc%>">      </td>
      <td><%=yy_sjbdj_sydjcb%> 
        <input name="yy_sjbdj_sydjcb" type="hidden" value="<%=yy_sjbdj_sydjcb%>">      </td>
      <td> <%=yy_sjbdj_byjh%>
        <input name="yy_sjbdj_byjh" type="hidden" value="<%=yy_sjbdj_byjh%>" >      </td>
      <td> <%=yy_sjbdj_bylj%>
        <input name="yy_sjbdj_bylj" type="hidden" value="<%=yy_sjbdj_bylj%>" >      </td>
      <td><%=yy_sjbdj_szjh%> 
        <input name="yy_sjbdj_szjh" type="hidden" value="<%=yy_sjbdj_szjh%>">      </td>
	  <td align="center"> <%=yy_sjbdj_szwc%>
        <input name="yy_sjbdj_szwc" type="hidden" value="<%=yy_sjbdj_szwc%>" >      </td>
	  <td align="center"> <%=yy_sjbdj_bzyj%>
        <input name="yy_sjbdj_bzyj" type="hidden" value="<%=yy_sjbdj_bzyj%>" >      </td>
      <td> <%=yy_sjbdj_bztdj%>
        <input name="yy_sjbdj_bztdj" type="hidden" value="<%=yy_sjbdj_bztdj%>" >      </td>
      <td> <%=yy_sjbdj_byljtdj%>
        <input name="yy_sjbdj_byljtdj" type="hidden" value="<%=yy_sjbdj_byljtdj%>" >      </td>


      <td> <%=yy_sjbsjf_byjh%>
        <input name="yy_sjbsjf_byjh" type="hidden" value="<%=yy_sjbsjf_byjh%>" >      </td>
      <td> <%=yy_sjbsjf_bylj%>
        <input name="yy_sjbsjf_bylj" type="hidden" value="<%=yy_sjbsjf_bylj%>" >      </td>
      <td> <%=yy_sjbsjf_szjh%>
        <input name="yy_sjbsjf_szjh" type="hidden" value="<%=yy_sjbsjf_szjh%>" >      </td>
      <td> <%=yy_sjbsjf_szwc%>
        <input name="yy_sjbsjf_szwc" type="hidden" value="<%=yy_sjbsjf_szwc%>" >      </td>
      <td> <%=yy_sjbsjf_bzyj%>
        <input name="yy_sjbsjf_bzyj" type="hidden" value="<%=yy_sjbsjf_bzyj%>" >      </td>

	  
      <td> <%=yy_sjbgccz_byjh%>
        <input name="yy_sjbgccz_byjh" type="hidden" value="<%=yy_sjbgccz_byjh%>" >      </td>
      <td> <%=yy_sjbgccz_bylj%>
        <input name="yy_sjbgccz_bylj" type="hidden" value="<%=yy_sjbgccz_bylj%>" >      </td>
      <td> <%=yy_sjbgccz_szjh%>
        <input name="yy_sjbgccz_szjh" type="hidden" value="<%=yy_sjbgccz_szjh%>" >      </td>
      <td> <%=yy_sjbgccz_szwc%>
        <input name="yy_sjbgccz_szwc" type="hidden" value="<%=yy_sjbgccz_szwc%>" >      </td>
	  
      <td> <%=yy_sjbgccz_bzyj%>
        <input name="yy_sjbgccz_bzyj" type="hidden" value="<%=yy_sjbgccz_bzyj%>" >      </td>
      <td> <%=yy_sjbzccz_byjh%>
        <input name="yy_sjbzccz_byjh" type="hidden" value="<%=yy_sjbzccz_byjh%>" >      </td>
      <td> <%=yy_sjbzccz_bylj%>
        <input name="yy_sjbzccz_bylj" type="hidden" value="<%=yy_sjbzccz_bylj%>" >      </td>
      <td> <%=yy_sjbzccz_szjh%>
        <input name="yy_sjbzccz_szjh" type="hidden" value="<%=yy_sjbzccz_szjh%>" >      </td>
      <td> <%=yy_sjbzccz_szwc%>
        <input name="yy_sjbzccz_szwc" type="hidden" value="<%=yy_sjbzccz_szwc%>" >      </td>
      <td> <%=yy_sjbzccz_bzyj%>
        <input name="yy_sjbzccz_bzyj" type="hidden" value="<%=yy_sjbzccz_bzyj%>" >      </td>
	  
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
