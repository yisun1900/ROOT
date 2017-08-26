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


String[][] outStr=null; 
String bgcolor=null;

String cldlbm=null;
String clxlbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String jldwbm=null;
String bzjldwbm=null;
String bzggStr=null;
String djzlStr=null;
String clcdStr=null;
String clkdStr=null;
String clgdStr=null;
String cgzqStr=null;
String bzqStr=null;
String bztxqStr=null;
String ppmc=null;
String cglb=null;
String cglbstr=null;
String bz=null;
String cbjstr=null;
String dfgsjgstr=null;
String dgzjgstr=null;
String xsfsstr=null;
String xsfs=null;
String zxqdlstr=null;
String sfcy=null;
String sfcystr=null;
String gysmc=null;
String sxsj=null;

String mark=null;

double djzl=0;
double clcd=0;
double clkd=0;
double clgd=0;

int bzgg=0;
int cgzq=0;
int bzq=0;
int bztxq=0;

double cbj=0;
double dfgsjg=0;
double dgzjg=0;
double zxqdl=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;
String dqbm = null;
String dqmc = null;

int row=0;

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

	sql=" select dqmc" ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;//0：主材；1：辅材
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveLoadYxtjData.jsp" name="editform" target="_blank">
<div align="center">预先调整价格（地区：<%=dqmc%>）</div>
  <table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%">材料大类</td>
      <td width="9%">材料小类</td>
	  <td width="4%">内部编码</td>
      <td width="9%">材料名称</td>
      <td width="4%">型号</td>
      <td width="4%">规格</td>
      <td width="2%">计量单位</td>
      <td width="3%">成本价</td>
      <td width="3%">对分公司价</td>
      <td width="3%">对工长价</td>
      <td width="4%">新价格生效时间</td>
    </tr>
	
	
	<%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] nbbmStr=new String[outStr.length-1];

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
		if (len<10)
		{
			out.println("错误！请下载新版Excel模板");
			return;
		}

		cldlbm=outStr[i][0].trim();
		clxlbm=outStr[i][1].trim();
		nbbm=outStr[i][2].trim();
		clmc=outStr[i][3].trim();


		xh=outStr[i][4].trim();
		gg=outStr[i][5].trim();
		jldwbm=outStr[i][6].trim();

		cbjstr=outStr[i][7].trim();
		dfgsjgstr=outStr[i][8].trim();
		dgzjgstr=outStr[i][9].trim();
		sxsj=outStr[i][10].trim();
		mark="";

		if (nbbm.equals(""))
		{
			out.println("！！！行号["+row+"]错误，内部编码为空");
			return;
		}


		int count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_clbm,jxc_cljgb " ;
		sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.nbbm='"+nbbm+"' and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clbm.cllb='1'" ;//0：主材；1：辅材
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
			out.println("！！！错误，内部编码["+nbbm+"]不存在");
			return;
		}

		count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_cldlbm " ;
		sql+=" where cldlmc='"+cldlbm+"' and cldllb in('2','3')" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("！！！内部编码["+nbbm+"]错误，不存在的[材料大类]："+cldlbm);
			return;
		}

		sql=" select count(*)" ;
		sql+=" from jxc_clxlbm " ;
		sql+=" where clxlmc='"+clxlbm+"' and cldlmc='"+cldlbm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			out.println("！！！内部编码["+nbbm+"]错误，不存在的[材料小类]："+clxlbm);
			return;
		}



		if (jldwbm.equals(""))
		{
			out.println("！！！内部编码["+nbbm+"]错误，[计量单位]为空");
			return;
		}
		else{
			sql=" select count(*)" ;
			sql+=" from jdm_jldwbm " ;
			sql+=" where jldwmc='"+jldwbm+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				count = rs.getInt(1);			    
			}
			rs.close();
			ps.close();

			if (count<1)
			{
				out.println("！！！内部编码["+nbbm+"]错误，不存在的[计量单位]："+jldwbm);
				return;
			}
		}


	

		if (cbjstr.equals(""))
		{
			cbj=0;
		}
		else{
			try{
				cbj=Double.parseDouble(cbjstr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[成本价:"+cbjstr+"]不是数字:"+e);
				return;
			}
		}
		if (cbj==0)
		{
			out.println("<P>内部编码["+nbbm+"]提醒，成本价为0");
		}



		if (dfgsjgstr.equals(""))
		{
			dfgsjg=0;
		}
		else{
			try{
				dfgsjg=Double.parseDouble(dfgsjgstr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[对分公司价:"+dfgsjgstr+"]不是数字:"+e);
				return;
			}
		}
		if (dgzjgstr.equals(""))
		{
			dgzjg=0;
		}
		else{
			try{
				dgzjg=Double.parseDouble(dgzjgstr.trim());
			}
			catch (Exception e){
				out.println("<BR>！！！内部编码["+nbbm+"]错误，[对工长价:"+dgzjgstr+"]不是数字:"+e);
				return;
			}
		}
		if (dgzjg==0)
		{
			out.println("<P>内部编码["+nbbm+"]提醒，对工长价为0");
		}



		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=cldlbm%>
        <input name="cldlbm" type="hidden" value="<%=cldlbm%>">
      </td>
      <td><%=clxlbm%>
        <input name="clxlbm" type="hidden" value="<%=clxlbm%>">
      </td>
      <td> <%=nbbm%><%=mark%>
        <input name="nbbm" type="hidden" value="<%=nbbm%>" >
      </td>
	  <td align="center"> <%=clmc%>
        <input name="clmc" type="hidden" value="<%=clmc%>" >
      </td>
	  <td align="center"> <%=xh%>
        <input name="xh" type="hidden" value="<%=xh%>" >
      </td>
      <td> <%=gg%>
        <input name="gg" type="hidden" value="<%=gg%>" >
      </td>
      <td><%=jldwbm%>
        <input name="jldwbm" type="hidden" value="<%=jldwbm%>" >
      </td>
      <td ><%=cbj%>
        <input name="cbj" type="hidden" value="<%=cbj%>" >
      </td>
      <td ><%=dfgsjg%>
        <input name="dfgsjg" type="hidden" value="<%=dfgsjg%>" >
      </td>
      <td ><%=dgzjg%>
        <input name="dgzjg" type="hidden" value="<%=dgzjg%>" >
      </td>
      <td ><%=sxsj%>
        <input name="sxsj" type="hidden" value="<%=sxsj%>" >
      </td>
    </tr>
    <%
	}


}
catch (Exception e) {
	out.print("<P>操作失败，Exception:" + e);
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
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      需导入项目数：<%=row%>
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
