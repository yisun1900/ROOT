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



String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;


String xuhao=null;
String cldlmc=null;
String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String lx=null;
String lxstr=null;
String paixu=null;
String bz=null;


String xjgsxsj=null;

String xcj=null;
String xcjjsj=null;
String xfgsdj=null;
String xgdj=null;


String sfrkstr=null;
String sfrk=null;

String sfycxstr=null;
String sfycx=null;
String cxkssj=null;
String cxjzsj=null;
String cxcj=null;
String cxcjjsj=null;
String cxfgsdj=null;
String cxgdj=null;

String cjjsj=null;
String gdj=null;
String ckmc=null;

String dqbm="";

int count=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\fcgl\\cl_cljg\\impdata\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	
	%> 
<form method="post" action="SaveImpAddDataJg.jsp" name="editform" target="_blank">
  <div align="center">增加新的辅材报价</div>
  <table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
	  <td width="3%">行号</td>
      <td width="8%">材料大类</td>
      <td width="6%">材料编码</td>
	  <td width="16%">材料名称</td>
      <td width="9%">材料规格</td>
      <td width="6%">计量单位</td>
      <td width="6%">是否常用</td>
      <td width="14%">备注</td>
      <td width="5%">序号</td>
      <td width="5%">成本价</td>
      <td width="5%">对工长价</td>
      <td width="25%">供应商</td>
	
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


		cldlmc=outStr[i][0].trim();
		clbm=outStr[i][1].trim();
		clmc=outStr[i][2].trim();
		clgg=outStr[i][3].trim();
		jldwmc=outStr[i][4].trim();
		lxstr=outStr[i][5].trim();
		bz=outStr[i][6].trim();
		paixu=outStr[i][7].trim();
		cjjsj=outStr[i][8].trim();
		gdj=outStr[i][9].trim();
		ckmc=outStr[i][10].trim();


		if (clbm.equals(""))
		{
			out.println("<BR>！！！行号["+row+"]错误，[材料编码]不能为空");
			return;
		}

		//与厂家结算价
		if (cjjsj==null || cjjsj.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[成本价]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(cjjsj.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[成本价]非数字：" + cjjsj);
				return;
			}
		}

		//新工队价
		if (gdj==null || gdj.trim().equals(""))
		{
			out.print("序号["+xuhao+"]出错！[对工长价]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(gdj.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[对工长价]非数字：" + gdj);
				return;
			}
		}

		sql=" select count(*)" ;
		sql+=" from cl_cldlbm " ;
		sql+=" where cldlmc='"+cldlmc+"'" ;
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
			out.println("<BR>！！！行号["+row+"]错误，不存在的[材料大类]："+cldlmc);
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

		if (count>0)
		{
			out.println("<BR>！！！行号["+row+"]错误，[材料编码]已存在："+clbm);
			return;
		}


		sql=" select count(*)" ;
		sql+=" from jdm_jldwbm " ;
		sql+=" where jldwmc='"+jldwmc+"'" ;
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
			out.println("<BR>！！！行号["+row+"]错误，不存在的[计量单位]："+jldwmc);
			return;
		}

		if (lxstr.equals(""))
		{
			lx="2";
		}
		else if (lxstr.equals("常用"))
		{
			lx="1";
		}
		else if (lxstr.equals("非常用"))
		{
			lx="2";
		}
		else{
			out.println("！！！行号["+row+"]错误，[是否常用]只能为【常用、非常用】，目前为["+lxstr+"]");
			return;
		}
%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%></td>
      <td><%=cldlmc%> 
        <input name="cldlmc" type="hidden" value="<%=cldlmc%>">
      </td>
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
      <td><%=lxstr%>
        <input name="lx" type="hidden" value="<%=lx%>" >
      </td>
	  <td ><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
      <td><%=paixu%>
        <input name="paixu" type="hidden" value="<%=paixu%>" >
      </td>
      <td><%=cjjsj%>
        <input name="cjjsj" type="hidden" value="<%=cjjsj%>" >
      </td>
      <td><%=gdj%>
        <input name="gdj" type="hidden" value="<%=gdj%>" >
      </td>
      <td><%=ckmc%>
        <input name="ckmc" type="hidden" value="<%=ckmc%>" >
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
