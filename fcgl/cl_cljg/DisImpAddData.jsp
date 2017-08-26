<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>增加新的辅材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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


String xuhao=null;
String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String xjgsxsj=null;

String xcj=null;
String xcjjsj=null;
String xfgsdj=null;
String xgdj=null;


String sfrkstr=null;
String sfrk=null;
String ckmc=null;

String sfycxstr=null;
String sfycx=null;
String cxkssj=null;
String cxjzsj=null;
String cxcj=null;
String cxcjjsj=null;
String cxfgsdj=null;
String cxgdj=null;

String dwmc="";
String dqbm="";

int count=0;

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
      <td width="3%">导入序号</td>
      <td width="5%">材料编码</td>
	  <td width="9%">材料名称</td>
      <td width="8%">材料规格</td>
      <td width="4%">计量单位</td>
      <td width="5%">新价格生效时间</td>
      <td width="5%">厂价</td>
      <td width="5%">与厂家结算价</td>
      <td width="5%">分公司材料单价</td>
      <td width="5%">工队价</td>
      <td width="3%">是否入库</td>
      <td width="7%">仓库名称</td>
      <td width="3%">是否有促销</td>
      <td width="5%">促销开始时间</td>
      <td width="5%">促销结束时间</td>
      <td width="5%">促销期厂价</td>
      <td width="5%">促销期与厂家结算价</td>
      <td width="5%">促销期分公司材料单价</td>
      <td width="5%">促销期工队价</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
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


		xuhao=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		clmc=outStr[i][2].trim();
		clgg=outStr[i][3].trim();
		jldwmc=outStr[i][4].trim();
		xjgsxsj=outStr[i][5].trim();
		xcj=outStr[i][6].trim();
		xcjjsj=outStr[i][7].trim();
		xfgsdj=outStr[i][8].trim();
		xgdj=outStr[i][9].trim();

		sfrkstr=outStr[i][10].trim();
		ckmc=outStr[i][11].trim();

		sfycxstr=outStr[i][12].trim();
		cxkssj=outStr[i][13].trim();

		cxjzsj=outStr[i][14].trim();
		cxcj=outStr[i][15].trim();
		cxcjjsj=outStr[i][16].trim();
		cxfgsdj=outStr[i][17].trim();
		cxgdj=outStr[i][18].trim();

		if (clbm.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[材料编码]不能为空");
			return;
		}

		sql=" select count(*)" ;
		sql+=" from cl_clbm " ;
		sql+=" where clbm='"+clbm+"'" ;
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
			out.println("<BR>！！！序号["+xuhao+"]错误，不存在的[材料编码]："+clbm);
			return;
		}

		//新价格生效时间
		if (xjgsxsj==null || xjgsxsj.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[新价格生效时间]为空");
			return;
		}
		else{
			try{
				java.sql.Date.valueOf(xjgsxsj.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[新价格生效时间]非日期：" + xjgsxsj);
				return;
			}
		}

		//厂价
		if (xcj==null || xcj.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[厂价]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(xcj.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[厂价]非数字：" + xcj);
				return;
			}
		}
		//与厂家结算价
		if (xcjjsj==null || xcjjsj.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[与厂家结算价]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(xcjjsj.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[与厂家结算价]非数字：" + xcjjsj);
				return;
			}
		}
		//新分公司材料单价
		if (xfgsdj==null || xfgsdj.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[新分公司材料单价]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(xfgsdj.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[新分公司材料单价]非数字：" + xfgsdj);
				return;
			}
		}
		//新工队价
		if (xgdj==null || xgdj.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[新工队价]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(xgdj.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[新工队价]非数字：" + xgdj);
				return;
			}
		}

		//是否入库
		sfrk="N";
		if (sfrkstr!=null && !sfrkstr.equals(""))
		{
			if (sfrkstr.equals("是"))
			{
				sfrk="Y";
			}
			else if (sfrkstr.equals("否"))
			{
				sfrk="N";
			}
			else{
				out.println("<BR>！！！序号["+xuhao+"]错误，[是否入库]只能是【是】或【否】："+sfycxstr);
				return;
			}
		}
		//仓库名称
		if (ckmc==null || ckmc.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[仓库名称]不能为空");
			return;
		}

		//是否有促销
		sfycx="N";
		if (sfycxstr!=null && !sfycxstr.equals(""))
		{
			if (sfycxstr.equals("有促销"))
			{
				sfycx="Y";
			}
			else if (sfycxstr.equals("无"))
			{
				sfycx="N";
			}
			else{
				out.println("<BR>！！！序号["+xuhao+"]错误，[是否有促销]只能是【有促销】或【无】："+sfycxstr);
				return;
			}
		}
		if (sfycx.equals("Y"))
		{
			//促销开始时间
			if (cxkssj==null || cxkssj.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！[促销开始时间]为空");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(cxkssj.trim());
				}
				catch (Exception e) {
					out.print("序号["+xuhao+"]出错！[促销开始时间]非日期：" + cxkssj);
					return;
				}
			}
			//促销结束时间
			if (cxjzsj==null || cxjzsj.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！[促销结束时间]为空");
				return;
			}
			else{
				try{
					java.sql.Date.valueOf(cxjzsj.trim());
				}
				catch (Exception e) {
					out.print("序号["+xuhao+"]出错！[促销结束时间]非日期：" + cxjzsj);
					return;
				}
			}

			//促销期厂价
			if (cxcj==null || cxcj.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！[促销期厂价]不能为空");
				return;
			}
			else{
				try{
					Double.parseDouble(cxcj.trim());
				}
				catch (Exception e) {
					out.print("序号["+xuhao+"]出错！[促销期厂价]非数字：" + cxcj);
					return;
				}
			}
			//促销期与厂家结算价
			if (cxcjjsj==null || cxcjjsj.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！[促销期与厂家结算价]不能为空");
				return;
			}
			else{
				try{
					Double.parseDouble(cxcjjsj.trim());
				}
				catch (Exception e) {
					out.print("序号["+xuhao+"]出错！[促销期与厂家结算价]非数字：" + cxcjjsj);
					return;
				}
			}
			//促销期分公司材料单价
			if (cxfgsdj==null || cxfgsdj.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！[促销期分公司材料单价]不能为空");
				return;
			}
			else{
				try{
					Double.parseDouble(cxfgsdj.trim());
				}
				catch (Exception e) {
					out.print("序号["+xuhao+"]出错！[促销期分公司材料单价]非数字：" + cxfgsdj);
					return;
				}
			}
			//促销期工队价
			if (cxgdj==null || cxgdj.trim().equals(""))
			{
				out.print("序号["+xuhao+"]出错！[促销期工队价]不能为空");
				return;
			}
			else{
				try{
					Double.parseDouble(cxgdj.trim());
				}
				catch (Exception e) {
					out.print("序号["+xuhao+"]出错！[促销期工队价]非数字：" + cxgdj);
					return;
				}
			}
		}
		else{
			cxkssj="";
			cxjzsj="";
			cxcj="";
			cxcjjsj="";
			cxfgsdj="";
			cxgdj="";
		}
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=xuhao%> 
        <input name="xuhao" type="hidden" value="<%=xuhao%>">
      </td>
      <td><%=clbm%> 
        <input name="clbm" type="hidden" value="<%=clbm%>">
      </td>
      <td><%=clmc%>
      </td>
      <td><%=clgg%>
      </td>
      <td><%=jldwmc%>
      </td>
      <td><%=xjgsxsj%>
        <input name="xjgsxsj" type="hidden" value="<%=xjgsxsj%>" >
      </td>
	  <td ><%=xcj%>
        <input name="xcj" type="hidden" value="<%=xcj%>" >
      </td>
      <td><%=xcjjsj%>
        <input name="xcjjsj" type="hidden" value="<%=xcjjsj%>" >
      </td>
	  <td><%=xfgsdj%>
        <input name="xfgsdj" type="hidden" value="<%=xfgsdj%>" >
      </td>
      <td><%=xgdj%>
        <input name="xgdj" type="hidden" value="<%=xgdj%>" >
      </td>
      <td><%=sfrkstr%>
        <input name="sfrk" type="hidden" value="<%=sfrk%>" >
      </td>
      <td><%=ckmc%>
        <input name="ckmc" type="hidden" value="<%=ckmc%>" >
      </td>
      <td><%=sfycxstr%>
        <input name="sfycx" type="hidden" value="<%=sfycx%>" >
      </td>
      <td><%=cxkssj%>
        <input name="cxkssj" type="hidden" value="<%=cxkssj%>" >
      </td>
      <td><%=cxjzsj%>
        <input name="cxjzsj" type="hidden" value="<%=cxjzsj%>" >
      </td>
      <td><%=cxcj%>
        <input name="cxcj" type="hidden" value="<%=cxcj%>" >
      </td>
      <td><%=cxcjjsj%>
        <input name="cxcjjsj" type="hidden" value="<%=cxcjjsj%>" >
      </td>
      <td><%=cxfgsdj%>
        <input name="cxfgsdj" type="hidden" value="<%=cxfgsdj%>" >
      </td>
      <td><%=cxgdj%>
        <input name="cxgdj" type="hidden" value="<%=cxgdj%>" >
      </td>
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
