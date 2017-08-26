<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
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

String dqbm=null;
String dqmc=null;
String wlllbz=null;
String wlllbzmc=null;
String wlbm=null;
String glmc=null;
String cldlbm=null;
String cldlmc=null;
String pp=null;
String xhgg=null;
String jldwbm=null;
String jldwmc=null;

String djstr=null;
double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

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


	String yxdqmc=null;
	sql=" select dqmc " ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		yxdqmc = rs.getString("dqmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveDisCljg.jsp" name="editform" target="_blank">
<div align="center">
    导入结算-材料价格表
    <BR><font color="#FF0000"><b>请注意：</b></font><b>地区</b><font color="#FF0000"><b>[<%=yxdqmc%>]
	</b></font>
  </div>
	<input type="hidden" name="dqbm" value="<%=dqbm%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="5%">需到物流领料</td>
		<td width="16%">材料类别</td>
		<td width="8%">结算物料编码</td>
		<td width="20%">物料名称</td>
		<td width="17%">型号规格</td>
		<td width="18%">品牌</td>
		<td width="8%">计量单位</td>
		<td width="8%">单价</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

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

		if (outStr[i][2].equals(""))
		{
			break;
		}

		wlllbzmc=outStr[i][0].trim();
		cldlmc=outStr[i][1].trim();
		wlbm=outStr[i][2].trim();
		glmc=outStr[i][3].trim();
		xhgg=outStr[i][4].trim();
		pp=outStr[i][5].trim();
		jldwmc=outStr[i][6].trim();
		djstr=outStr[i][7].trim();

		if (wlllbzmc.equals(""))
		{
			out.println("！！！材料编码["+wlbm+"]错误，[需到物流领料]为空");
			return;
		}
		else if (wlllbzmc.equals("需要"))
		{
			wlllbz="Y";
		}
		else if (wlllbzmc.equals("否"))
		{
			wlllbz="N";
		}
		else
		{
			out.println("！！！材料编码["+wlbm+"]错误，[需到物流领料]只能为[需要]或[否]");
			return;
		}

		sql=" select cldlbm" ;
		sql+=" from bdm_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			cldlbm = rs.getString("cldlbm");			    
		}
		else{
			out.println("！！！材料编码["+wlbm+"]错误，不存在的[材料类别]："+cldlmc);
			return;
		}
		rs.close();
		ps.close();

		
		if (jldwmc.equals(""))
		{
			out.println("！！！材料编码["+wlbm+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select cljldwbm" ;
			sql+=" from bdm_cljldwbm " ;
			sql+=" where cljldwmc='"+jldwmc.trim()+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				jldwbm = rs.getString("cljldwbm");			    
			}
			else{
				out.println("！！！材料编码["+wlbm+"]错误，不存在的[计量单位]："+jldwmc);
				return;
			}
			rs.close();
			ps.close();
		}

		if (djstr.trim().equals(""))
		{
			out.println("！！！材料编码["+wlbm+"]错误，[单价]为空");
			dj=0;
			return;
		}
		else{
			dj=Double.parseDouble(djstr.trim());
		}


		if (wlbm.equals(""))
		{
			out.println("！！！错误，[结算物料编码]为空");
			return;
		}
		if (glmc.equals(""))
		{
			out.println("！！！材料编码["+wlbm+"]错误，[工料名称]为空");
			return;
		}




		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=wlllbzmc%>
        <input name="wlllbz" type="hidden" value="<%=wlllbz%>" >
      </td>
      <td><%=cldlmc%>
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>" >
      </td>
      <td><%=wlbm%>
        <input name="wlbm" type="hidden" value="<%=wlbm%>" >
      </td>
      <td><%=glmc%>
        <input name="glmc" type="hidden" value="<%=glmc%>" >
      </td>
      <td><%=xhgg%>
        <input name="xhgg" type="hidden" value="<%=xhgg%>" >
      </td>
      <td><%=pp%>
        <input name="pp" type="hidden" value="<%=pp%>" >
      </td>
      <td><%=jldwmc%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td><%=dj%>
        <input name="dj" type="hidden" value="<%=dj%>" >
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
        <input type="button"  value="存盘" onClick="f_do(editform)" name="bc">
        <input type="reset"  value="允许存盘" onClick="bc.disabled=false;">
        <input type="reset"  value="重输">
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
