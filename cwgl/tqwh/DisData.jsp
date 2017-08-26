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

String ssfgs = null;
String dwmc=null;

String[][] outStr=null; 
String bgcolor=null;


String khxm=null;
String hth=null;
String xmflbm=null;
String fklxmc=null;
String fkcsmc=null;
String fkcs=null;

String gysbh=null;
String ddbh=null;

String fkjestr=null;
double fkje=0;
String sksj=null;
String skr=null;
String skdw=null;
String dwbh=null;
String bz=null;

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

	ssfgs =up.getParameter("ssfgs");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();


	sql=" select dwmc " ;
	sql+=" from sq_dwxx " ;
	sql+=" where dwbh='"+ssfgs+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dwmc = rs.getString("dwmc");			    
	}
	rs.close();
	ps.close();


	%> 


	<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入电子报价 </p>
    <p>导入电子报价 </p>
    <p><font color="#FF0000"><b>请注意：</b></font><b>分公司</b><font color="#FF0000"><b>[<%=dwmc%>]</b></font></p>
  </div>
	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td width="6%">客户姓名</td>
		<td width="7%">合同号</td>
		<td width="7%">收款类型</td>
		<td width="7%">家装款期数</td>
		<td width="10%">主材款品牌</td>
		<td width="8%">主材款订单编号</td>
		<td width="8%">收款金额</td>
		<td width="8%">收款时间</td>
		<td width="6%">收款人</td>
		<td width="10%">收款部门</td>
		<td width="20%">备注</td>
    </tr>
    <%
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

		if (outStr[i][0].equals(""))
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


	
		
		khxm=outStr[i][0].trim();
		hth=outStr[i][1].trim();
		fklxmc=outStr[i][2].trim();
		fkcsmc=outStr[i][3].trim();
		gysbh=outStr[i][4].trim();
		ddbh=outStr[i][5].trim();

		fkjestr=outStr[i][6].trim();
		sksj=outStr[i][7].trim();
		skr=outStr[i][8].trim();
		skdw=outStr[i][9].trim();
		bz=outStr[i][10].trim();


		if (khxm.equals(""))
		{
			out.println("<BR>！！！行号["+row+"]错误，客户姓名为空");
//			return;
		}


		String khbh="";
		String getkhxm="";
		if (hth.equals(""))
		{
			int count=0;
			sql=" select count(*)" ;
			sql+=" from crm_zxkhxx " ;
			sql+=" where khxm='"+khxm+"'" ;
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
				out.println("！！！客户姓名["+khxm+"]错误，客户姓名不存在");
	//			return;
			}
			else if (count>1)
			{
				out.println("！！！客户姓名["+khxm+"]错误，相同客户姓名有多个，无法导入");
	//			return;
			}

			sql=" select khbh" ;
			sql+=" from crm_zxkhxx " ;
			sql+=" where khxm='"+khxm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				khbh = rs.getString("khbh");			    
			}
			rs.close();
			ps.close();

		}
		else{
			sql=" select khbh,khxm" ;
			sql+=" from crm_khxx " ;
			sql+=" where hth='"+hth+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				khbh = rs.getString("khbh");			    
				getkhxm = rs.getString("khxm");			    
			}
			rs.close();
			ps.close();

			if (khbh.equals(""))
			{
				out.println("！！！客户姓名["+khxm+"]错误，合同号不存在");
	//			return;
			}
			else{
				if (!getkhxm.equals(khxm))
				{
					out.println("<BR>！！！客户姓名["+khxm+"]错误，客户姓名不正确，正确为:"+getkhxm);
		//			return;
				}
			}
		}


		String fklxbm="";
		if (fklxmc.equals(""))
		{
		}
		else if (fklxmc.equals("订金转家装款"))
		{
			fklxbm="aaaaa";
		}
		else{
			sql=" select fklxbm" ;
			sql+=" from cw_fklxbm " ;
			sql+=" where fklxmc='"+fklxmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				fklxbm = rs.getString("fklxbm");			    
			}
			rs.close();
			ps.close();

			if (fklxbm.equals(""))
			{
				out.println("<BR>！！！客户姓名["+khxm+"]错误，不存在的[收款类型]："+fklxmc);
	//			return;
			}
		}

		fkcs="";
		if (!fkcsmc.equals(""))
		{
			sql=" select fkcs" ;
			sql+=" from cw_fkcs " ;
			sql+=" where fkcsmc='"+fkcsmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				fkcs = rs.getString("fkcs");			    
			}
			rs.close();
			ps.close();

			if (fkcs.equals(""))
			{
				out.println("<BR>！！！客户姓名["+khxm+"]错误，不存在的[家装款期数]："+fkcsmc);
	//			return;
			}
		}


		int count=0;
		if (!gysbh.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jxc_ppxx " ;
			sql+=" where ppmc='"+gysbh+"'" ;
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
				out.println("<BR>提醒！客户姓名["+khxm+"]，不存在的[主材款品牌]："+gysbh);
			}
		}

		if (!ddbh.equals(""))
		{
			sql=" select count(*)" ;
			sql+=" from jc_zcdd " ;
			sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"'" ;
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
				out.println("<BR>提醒！客户姓名["+khxm+"]，不存在的[主材款订单编号]："+ddbh);
			}
		}

		if (fkjestr.equals(""))
		{
			fkje=0;
			out.println("<BR>！！！客户姓名["+khxm+"]错误，[收款金额:"+fkjestr+"]不是数字");
		}
		else{
			try{
				fkje=Double.parseDouble(fkjestr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！客户姓名["+khxm+"]错误，[收款金额:"+fkjestr+"]不是数字");
//				return;
			}
		}

		if (sksj.equals(""))
		{
				out.println("<BR>！！！客户姓名["+khxm+"]错误，[收款时间]为空");
		}
		else{
			try{
				java.sql.Date.valueOf(sksj);
			}
			catch (Exception e){
				out.println("<BR>！！！客户姓名["+khxm+"]错误，[收款时间:"+sksj+"]格式不正确，应该为:YYYY-MM-DD");
	//			return;
			}
		}


		dwbh="";
		sql=" select dwbh" ;
		sql+=" from sq_dwxx " ;
		sql+=" where dwmc='"+skdw+"' and ssfgs='"+ssfgs+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			dwbh = cf.fillNull(rs.getString("dwbh"));			    
		}
		rs.close();
		ps.close();

		if (dwbh.equals(""))
		{
			out.println("<BR>！！！客户姓名["+khxm+"]错误，收款部门不存在:"+skdw);
//			return;
		}

		if (fklxbm.equals("11"))
		{
			if (fkcs.equals(""))
			{
				out.println("<BR>！！！客户姓名["+khxm+"]错误，收[家装款]无[家装款期数]");
			}
		}
		else if (fklxbm.equals("23"))
		{
			if (gysbh.equals(""))
			{
				out.println("<BR>！！！客户姓名["+khxm+"]错误，收[主材款]无[收款品牌]");
			}
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=khxm%> 
        <input name="khbh" type="hidden" value="<%=khbh.trim()%>">
      </td>
      <td><%=hth%> 
         <input name="hth" type="hidden" value="<%=hth.trim()%>">
     </td>
      <td><%=fklxmc%> 
        <input name="fklxbm" type="hidden" value="<%=fklxbm%>">
      </td>
      <td><%=fkcsmc%> 
        <input name="fkcs" type="hidden" value="<%=fkcs%>">
      </td>
      <td><%=gysbh%> 
        <input name="gysbh" type="hidden" value="<%=gysbh%>">
      </td>
      <td><%=ddbh%> 
        <input name="ddbh" type="hidden" value="<%=ddbh%>">
      </td>
      <td> <%=fkjestr%>
        <input name="fkje" type="hidden" value="<%=fkje%>" >
      </td>
	  <td> <%=sksj%>
        <input name="sksj" type="hidden" value="<%=sksj%>" >
      </td>
	  <td> <%=skr%>
        <input name="skr" type="hidden" value="<%=skr%>" >
      </td>
	  <td> <%=skdw%>
        <input name="skdw" type="hidden" value="<%=dwbh%>" >
      </td>
      <td> <%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
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
