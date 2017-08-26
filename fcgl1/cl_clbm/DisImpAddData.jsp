<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>增加新的辅材编码</title>

</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">

<%

ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String dwbh = null;


String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;



String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String cldj=null;

String lrjsfs=null;
String lrbfb=null;
String cldlmc=null;
String bz=null;
String lrr=null;

String lrsj=null;
String paixu=null;

String lx=null;
String wxr=null;

String dwmc="";
String dqbm="";

String gdj=null;
String cbj=null;
String ppmc=null;
String xmzl=null;
int count=0;
int k=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dwbh =up.getParameter("dwbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\fcgl\\cl_cljg\\impdata\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dwmc" ;
	sql+=" from sq_dwxx " ;
	sql+=" where dwbh='"+dwbh+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dwmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	
	%> 
<form method="post" action="SaveImpAddData.jsp" name="editform" target="_blank">
  <div align="center">增加新的辅材报价（分公司：<%=dwmc%>）</div>
<input name="dwbh" type="hidden" value="<%=dwbh%>" >
  <table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="3%">行号</td>
      <td width="5%">材料编码</td>
	  <td width="9%">材料名称</td>
      <td width="8%">材料规格</td>
	  
      <td width="4%">计量单位</td>
      <td width="5%">利润计算方式</td>
      <td width="5%">利润百分比</td>
      <td width="5%">材料大类名称</td>
      <td width="5%">备注</td>
      <td width="5%">录入人</td>
      <td width="3%">录入时间</td>
      <td width="7%">排序</td>
	  <td width="5%">类型</td>
      <td width="3%">维护人</td>
	  <td width="5%">工队价</td>
      <td width="3%">成本价</td>
	   <td width="5%">品牌名称</td>
      <td width="3%">项目种类</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
		k=i;
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}


		clbm=outStr[i][0].trim();
		clmc=outStr[i][1].trim();
		clgg=outStr[i][2].trim();
		//cldj=outStr[i][3].trim();
		jldwmc=outStr[i][3].trim();
		lrjsfs=outStr[i][4].trim();
		lrbfb=outStr[i][5].trim();
		cldlmc=outStr[i][6].trim();
		bz=outStr[i][7].trim();
		lrr=outStr[i][8].trim();

		lrsj=outStr[i][9].trim();
		paixu=outStr[i][10].trim();

		lx=outStr[i][11].trim();
		wxr=outStr[i][12].trim();

		gdj=outStr[i][13].trim();
		cbj=outStr[i][14].trim();

		ppmc=outStr[i][15].trim();
		xmzl=outStr[i][16].trim();
		if (clbm.equals(""))
		{
			out.println("<BR>！！！序号["+i+"]错误，[材料编码]不能为空");
			return;
		}

		

		
		
		
		
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
     
      <td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
      <td><%=clmc%>
	   <input name="clmc" type="hidden" value="<%=clmc%>">
      </td>
      <td><%=clgg%>
	   <input name="clgg" type="hidden" value="<%=clgg%>">
      </td>
	 
      <td><%=jldwmc%>
	   <input name="jldwmc" type="hidden" value="<%=jldwmc%>">
      </td>
       <td><%=lrjsfs%>
	   <input name="lrjsfs" type="hidden" value="<%=lrjsfs%>">
      </td> 
	  <td><%=lrbfb%>
	   <input name="lrbfb" type="hidden" value="<%=lrbfb%>">
      </td>
	   <td><%=cldlmc%>
	   <input name="cldlmc" type="hidden" value="<%=cldlmc%>">
      </td>
	   <td><%=bz%>
	   <input name="bz" type="hidden" value="<%=bz%>">
      </td>
	   <td><%=lrr%>
	   <input name="lrr" type="hidden" value="<%=lrr%>">
      </td>
	   <td><%=lrsj%>
	   <input name="lrsj" type="hidden" value="<%=lrsj%>">
      </td>
	  <td><%=paixu%>
	   <input name="paixu" type="hidden" value="<%=paixu%>">
      </td>
	  <td><%=lx%>
	   <input name="lx" type="hidden" value="<%=lx%>">
      </td> 
	  <td><%=wxr%>
	   <input name="wxr" type="hidden" value="<%=wxr%>">
      </td>
		<td><%=gdj%>
	   <input name="gdj" type="hidden" value="<%=gdj%>">
      </td> 
	  <td><%=cbj%>
	   <input name="cbj" type="hidden" value="<%=cbj%>">
      </td>
	  	<td><%=ppmc%>
	   <input name="ppmc" type="hidden" value="<%=ppmc%>">
      </td> 
	  <td><%=xmzl%>
	   <input name="xmzl" type="hidden" value="<%=xmzl%>">
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("序号["+k+"]出错：" + e);
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
        <input type="button"  value="存盘" name="bc" onClick="f_do(editform)">
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
	return true;
}
//-->
</SCRIPT>
