<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>领材料款－导入</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String fgsbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

int count=0;

String xuhao=null;
String hth=null;
String khxm=null;
String sjs=null;
String sgdmc=null;
String qye=null;
String sgze=null;
String dj=null;
String yck=null;
String eck=null;
String ssbl=null;
String clk=null;
String clkbl=null;
String zqbk=null;
double jkje=0;
double alljkje=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	fgsbh = up.getParameter("fgsbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\cwgl\\drdc\\impdata\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();


%> 
<form method="post" action="SaveChooseClkFile.jsp" name="editform" target="_blank">
<div align="center">领材料款－导入
<BR>（注意：数据从第6行开始，[档案号]第2列，[材料款]第3列）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="14"> 
        <input name="fgsbh" type="hidden" value="<%=fgsbh%>">
        <input type="button"  value="导入ERP" name="bc" onClick="f_do(editform)">
        <input type="button"  value="重新导入" onClick="bc.disabled=false;bc1.disabled=false;">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="5%">序号</td>
      <td width="9%" bgcolor="#FFCCFF">档案号</td>
      <td width="8%" bgcolor="#FFCCFF">材料款</td>
      <td width="7%">客户</td>
	  <td width="7%">设计师</td>
      <td width="7%">施工队长</td>
      <td width="8%">签约额</td>
      <td width="8%">施工总额</td>
      <td width="6%">定金</td>
      <td width="7%">一次款</td>
      <td width="7%">二次款</td>
      <td width="7%">实收比率</td>
      <td width="7%">材料费</td>
      <td width="7%">材料费占施工额比率</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(1001,filename); 


	int row=0;
	for (int i=5;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

/*
		if (outStr[i][0].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}
*/

		xuhao=outStr[i][0];
		hth=outStr[i][1];
		zqbk=outStr[i][2];
		khxm=outStr[i][3];
		sjs=outStr[i][4];
		sgdmc=outStr[i][5];
		qye=outStr[i][6];
		sgze=outStr[i][7];
		dj=outStr[i][8];
		yck=outStr[i][9];
		eck=outStr[i][10];
		ssbl=outStr[i][11];
		clk=outStr[i][12];

		clkbl=outStr[i][13];


		//档案号
		if (hth!=null && !hth.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from crm_khxx " ;
			sql+=" where hth='"+hth+"'" ;
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
				out.println("<BR>！！！序号["+xuhao+"]错误，不存在的[档案号]："+hth);
				return;
			}
		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[档案号]不能为空");
			return;
		}


		//领款金额
		jkje=0;
		if (zqbk!=null && !zqbk.trim().equals(""))
		{
			try{
				jkje=Double.parseDouble(zqbk.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[二期工程拨款]非数字：" + zqbk);
				return;
			}
		}

		alljkje+=jkje;
%> 

	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=xuhao%></td>
      <td bgcolor="#FFCCFF"><%=hth%> 
        <input name="hth" type="hidden" value="<%=hth%>">
      </td>
      <td bgcolor="#FFCCFF"><%=zqbk%>
        <input name="jkje" type="hidden" value="<%=jkje%>">
	  </td>
      <td><%=khxm%></td>
      <td><%=sjs%></td>
      <td><%=sgdmc%></td>
      <td><%=qye%></td>
      <td><%=sgze%></td>
      <td><%=dj%></td>
      <td><%=yck%></td>
      <td><%=eck%></td>
      <td><%=ssbl%></td>
      <td><%=clk%></td>
      <td><%=clkbl%></td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("序号["+xuhao+"]出错：" + e);
	return;
}
finally 
{
	try{
		if (f != null) f.close(); 
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
      <td colspan="2">合 计</td>
      <td><%=alljkje%></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td colspan="14"> 
        <input type="button"  value="导入ERP" name="bc1" onClick="f_do(editform)">
        <input type="button"  value="重新导入" onClick="bc.disabled=false;bc1.disabled=false;">
      </td>
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
	FormName.bc1.disabled=true;
	return true;
}
//-->
</SCRIPT>
