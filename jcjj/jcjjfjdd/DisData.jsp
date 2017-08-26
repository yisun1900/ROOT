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

String khbh=null;


String[][] outStr=null; 
String bgcolor=null;

String zcpzwzbm=null;
String ppbm=null;
String zcmc=null;
String xinghao=null;
String gg=null;
String jldwbm=null;

String slStr=null;
double sl=0;
String zqdjStr=null;
double zqdj=0;
String djStr=null;
double dj=0;
String cbjStr=null;
double cbj=0;

String ycfStr=null;
double ycf=0;

String qtfyStr=null;
String qtfy=null;

String qtfyjeStr=null;
double qtfyje=0;


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

	khbh =up.getParameter("khbh");

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
<div align="center">
    <p>导入主材 </p>
  </div>
	<input type="hidden" name="khbh" value="<%=khbh%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="2%">&nbsp;</td>
	  <td width="8%">结构位置</td>
	  <td width="9%">品牌</td>
	  <td width="12%">名称</td>
	  <td width="12%">型号</td>
	  <td width="12%">规格</td>
	  <td width="5%">单位</td>
	  <td width="6%">数量</td>
	  <td width="6%">原价</td>
	  <td width="6%">单价</td>
	  <td width="6%">成本价</td>
	  <td width="6%">远程费</td>
	  <td width="5%">其它费项目</td>
	  <td width="6%">其它费</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] xinghaoStr=new String[outStr.length-1];

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
		if (len<13)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		zcpzwzbm=outStr[i][0].trim();
		ppbm=outStr[i][1].trim();
		zcmc=outStr[i][2].trim();
		xinghao=outStr[i][3].trim();

		gg=outStr[i][4].trim();
		jldwbm=outStr[i][5].trim();

		slStr=outStr[i][6].trim();
		zqdjStr=outStr[i][7].trim();
		djStr=outStr[i][8].trim();
		cbjStr=outStr[i][9].trim();

		ycfStr=outStr[i][10].trim();
		qtfyStr=outStr[i][11].trim();
		qtfyjeStr=outStr[i][12].trim();


		if (zcpzwzbm.equals("　"))
		{
			zcpzwzbm="";
		}
		if (ppbm.equals("　"))
		{
			ppbm="";
		}
		if (zcmc.equals("　"))
		{
			zcmc="";
		}
		if (xinghao.equals("　"))
		{
			xinghao="";
		}
		if (gg.equals("　"))
		{
			gg="";
		}
		if (jldwbm.equals("　"))
		{
			jldwbm="";
		}
		if (slStr.equals("　"))
		{
			slStr="";
		}
		if (zqdjStr.equals("　"))
		{
			zqdjStr="";
		}
		if (djStr.equals("　"))
		{
			djStr="";
		}
		if (cbjStr.equals("　"))
		{
			cbjStr="";
		}
		if (ycfStr.equals("　"))
		{
			ycfStr="";
		}
		if (qtfyStr.equals("　"))
		{
			qtfyStr="";
		}
		if (qtfyjeStr.equals("　"))
		{
			qtfyjeStr="";
		}



		if (zcmc.equals(""))
		{
			out.println("！！！行号["+row+"]错误，[名称]为空");
			return;
		}

		int count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_ppxx " ;
		sql+=" where ppmc='"+ppbm+"'" ;
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
			out.println("<BR>！！！行号["+row+"]错误，不存在的[品牌]："+ppbm);
//			return;
		}


		if (slStr.equals(""))
		{
			sl=0;
		}
		else{
			try{
				sl=Double.parseDouble(slStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！行号["+row+"]错误，[数量:"+slStr+"]不是数字:"+e);
//				return;
			}
		}

		if (zqdjStr.equals(""))
		{
			zqdj=0;
		}
		else{
			try{
				zqdj=Double.parseDouble(zqdjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！行号["+row+"]错误，[原价:"+djStr+"]不是数字:"+e);
//				return;
			}
		}

		if (djStr.equals(""))
		{
			dj=0;
		}
		else{
			try{
				dj=Double.parseDouble(djStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！行号["+row+"]错误，[单价:"+djStr+"]不是数字:"+e);
//				return;
			}
		}

		if (cbjStr.equals(""))
		{
			cbj=0;
		}
		else{
			try{
				cbj=Double.parseDouble(cbjStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！行号["+row+"]错误，[成本价:"+cbjStr+"]不是数字:"+e);
//				return;
			}
		}


		if (ycfStr.equals(""))
		{
			ycf=0;
		}
		else{
			try{
				ycf=Double.parseDouble(ycfStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！行号["+row+"]错误，[远程费:"+ycfStr+"]不是数字:"+e);
//				return;
			}
		}



		if (qtfyStr.equals("安装费"))
		{
			qtfy="1";
		}
		else if (qtfyStr.equals("加工费"))
		{
			qtfy="2";
		}
		else if (qtfyStr.equals("其它收费"))
		{
			qtfy="3";
		}
		else{
			qtfyStr="无";
			qtfy="W";
		}


		if (qtfyjeStr.equals(""))
		{
			qtfyje=0;
		}
		else{
			try{
				qtfyje=Double.parseDouble(qtfyjeStr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！行号["+row+"]错误，[其它费:"+qtfyjeStr+"]不是数字:"+e);
//				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%> 
      </td>
      <td><%=zcpzwzbm%> 
        <input name="zcpzwzbm" type="hidden" value="<%=zcpzwzbm%>">
      </td>
      <td><%=ppbm%> 
        <input name="ppbm" type="hidden" value="<%=ppbm%>">
      </td>
      <td><%=zcmc%> 
        <input name="zcmc" type="hidden" value="<%=zcmc%>">
      </td>
      <td> <%=xinghao%>
        <input name="xinghao" type="hidden" value="<%=xinghao%>" >
      </td>
	  <td align="center"> <%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
	  <td align="center"> <%=jldwbm%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td> <%=slStr%>
        <input name="sl" type="hidden" value="<%=sl%>" >
      </td>
      <td> <%=zqdjStr%>
        <input name="zqdj" type="hidden" value="<%=zqdj%>" >
      </td>
      <td> <%=djStr%>
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td> <%=cbjStr%>
        <input name="cbj" type="hidden" value="<%=cbj%>" >
      </td>
    <td> <%=ycfStr%>
        <input name="ycf" type="hidden" value="<%=ycf%>" >
      </td>
      <td> <%=qtfyStr%>
        <input name="qtfy" type="hidden" value="<%=qtfy%>" >
      </td>
      <td> <%=qtfyje%>
        <input name="qtfyje" type="hidden" value="<%=qtfyje%>" >
      </td>

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
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
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
	return true;
}
//-->
</SCRIPT>
