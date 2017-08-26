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
String[][] outStr=null; 
String bgcolor=null;

String fgsmc=null;
String fgsbh=null;

String yy_cxzjzk_qnpjStr=null;
String yy_cxzjzk_bzzsStr=null;
String yy_cxzpzq_qnpjStr=null;
String yy_cxzpzq_bzzsStr=null;
String yy_cxgcfx_qnpjStr=null;
String yy_cxgcfx_bzzsStr=null;
String yy_cxrlhj_qnpjStr=null;
String yy_cxrlhj_bzzsStr=null;

double yy_cxzjzk_qnpj=0;
double yy_cxzjzk_bzzs=0;
double yy_cxzpzq_qnpj=0;
double yy_cxzpzq_bzzs=0;
double yy_cxgcfx_qnpj=0;
double yy_cxgcfx_bzzs=0;
double yy_cxrlhj_qnpj=0;
double yy_cxrlhj_bzzs=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;

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
	
	
	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">

  
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
 <tr >
<td height="26" colspan="13" align="center" >促销折扣指标录入表（周期数：<%=zqs%>）</td>
</tr>
<tr>
    <td  height="28" align="center" width="147">上周日期</td>
    <td colspan="4" align="center"><%=date_ss%>至<%=date_se%></td>
    <td align="center" >本周日期</td>
    <td colspan="4"  align="center" ><%=date_bs%>至<%=date_be%></td>
    </tr>
<tr>
</table> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%" rowspan="2">所属分公司</td>
  <td colspan="2">直接折扣</td>
  <td colspan="2">赠品赠券</td>
  <td colspan="2">工程返现</td>
  <td colspan="2">让利合计</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
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
		if (len<9)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}


		fgsmc=outStr[i][0].trim();
		yy_cxzjzk_qnpjStr=outStr[i][1].trim();
		yy_cxzjzk_bzzsStr=outStr[i][2].trim();
		yy_cxzpzq_qnpjStr=outStr[i][3].trim();
		yy_cxzpzq_bzzsStr=outStr[i][4].trim();
		yy_cxgcfx_qnpjStr=outStr[i][5].trim();

		yy_cxgcfx_bzzsStr=outStr[i][6].trim();
		yy_cxrlhj_qnpjStr=outStr[i][7].trim();
		yy_cxrlhj_bzzsStr=outStr[i][8].trim();


		fgsbh="";
		ls_sql="select dwbh";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwmc='"+fgsmc+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=cf.fillNull(rs.getString("dwbh"));
		}
		rs.close();
		ps.close();

		if (fgsbh==null || fgsbh.equals(""))
		{
			out.println("<BR>错误！分公司不存在："+fgsmc);
			return;
		}

		try{
			yy_cxzjzk_qnpj=Double.parseDouble(yy_cxzjzk_qnpjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[直接折扣去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxzjzk_bzzs=Double.parseDouble(yy_cxzjzk_bzzsStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[直接折扣本周指数(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxzpzq_qnpj=Double.parseDouble(yy_cxzpzq_qnpjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[赠品赠券去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxzpzq_bzzs=Double.parseDouble(yy_cxzpzq_bzzsStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[赠品赠券本周指数(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxgcfx_qnpj=Double.parseDouble(yy_cxgcfx_qnpjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[工程返现去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxgcfx_bzzs=Double.parseDouble(yy_cxgcfx_bzzsStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[工程返现本周指数(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxrlhj_qnpj=Double.parseDouble(yy_cxrlhj_qnpjStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[让利合计去年平均(%)]不是数字:"+e);
			return;
		}

		try{
			yy_cxrlhj_bzzs=Double.parseDouble(yy_cxrlhj_bzzsStr.trim());
		}
		catch (Exception e){
			
			out.println("<BR>"+fgsmc+"[让利合计本周指数(%)]不是数字:"+e);
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=fgsmc%> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">      </td>
      <td><%=yy_cxzjzk_qnpj%> 
        <input name="yy_cxzjzk_qnpj" type="hidden" value="<%=yy_cxzjzk_qnpj%>">      </td>
      <td> <%=yy_cxzjzk_bzzs%>
        <input name="yy_cxzjzk_bzzs" type="hidden" value="<%=yy_cxzjzk_bzzs%>" >      </td>
      <td> <%=yy_cxzpzq_qnpj%>
        <input name="yy_cxzpzq_qnpj" type="hidden" value="<%=yy_cxzpzq_qnpj%>" >      </td>
      <td><%=yy_cxzpzq_bzzs%> 
        <input name="yy_cxzpzq_bzzs" type="hidden" value="<%=yy_cxzpzq_bzzs%>">      </td>
	  <td align="center"> <%=yy_cxgcfx_qnpj%>
        <input name="yy_cxgcfx_qnpj" type="hidden" value="<%=yy_cxgcfx_qnpj%>" >      </td>

	  <td align="center"> <%=yy_cxgcfx_bzzs%>
        <input name="yy_cxgcfx_bzzs" type="hidden" value="<%=yy_cxgcfx_bzzs%>" >      </td>
      <td> <%=yy_cxrlhj_qnpj%>
        <input name="yy_cxrlhj_qnpj" type="hidden" value="<%=yy_cxrlhj_qnpj%>" >      </td>
      <td> <%=yy_cxrlhj_bzzs%>
        <input name="yy_cxrlhj_bzzs" type="hidden" value="<%=yy_cxrlhj_bzzs%>" >      </td>
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
