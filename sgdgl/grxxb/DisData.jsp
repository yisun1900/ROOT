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
String fgsmc=null;


String[][] outStr=null; 
String bgcolor=null;

String sgd=null;
String sgdmc=null;
String bzmc=null;

String xm=null;
String xb=null;
String jg=null;
String csrq=null;
String gz=null;
String rzsj=null;
String dj=null;
String lx=null;
String sfzh=null;
String dh=null;
String zz=null;
String jjlxr=null;
String jjlxrdh=null;
String jjlxrdz=null;
String pxsm=null;
String sgzbh=null;
String yhk=null;
String _sfqdlwpqht=null;
String sfqdlwpqht=null;
String _sfkstg=null;
String sfkstg=null;

String mark=null;


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

	sql=" select dwmc" ;
	sql+=" from sq_dwxx " ;
	sql+=" where dwbh='"+ssfgs+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		fgsmc = rs.getString("dwmc");			    
	}
	rs.close();
	ps.close();


	%> 
<form method="post" action="SaveLoadData.jsp" name="editform" target="_blank">
<div align="center">
    <p>导入工人</p>
    <p><font color="#FF0000">[<%=fgsmc%>]
	<BR>若已存在，则进行替换，否则进行增加</b></font></p>
  </div>
	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="170%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

	<tr bgcolor="#CCCCCC" align="center"> 
      <td width="4%"><font color="#CC0000">*</font>所属施工队</td>
      <td width="4%">班长名称</td>
	  <td width="4%"><font color="#CC0000">*</font>姓名</td>
	  <td width="3%">性别</td>
	  <td width="4%">籍贯</td>
	  <td width="5%">出生日期</td>
	  <td width="4%"><font color="#CC0000">*</font>工种</td>
	  <td width="5%">入职时间</td>
	  <td width="4%">等级</td>

	  <td width="5%"><font color="#CC0000">*</font>类型</td>
      <td width="9%"><font color="#CC0000">*</font>身份证号</td>

      <td width="10%"><font color="#CC0000">*</font>电话</td>
      <td width="6%"><font color="#CC0000">*</font>住址</td>
      <td width="4%"><font color="#CC0000">*</font>紧急联系人</td>
      <td width="6%"><font color="#CC0000">*</font>联系人电话</td>
      <td width="8%"><font color="#CC0000">*</font>紧急联系人地址</td>
       <td width="10%"><font color="#CC0000">*</font>培训说明</td>
       <td width="5%">上岗证编号</td>
	   <td width="10%"><font color="#CC0000">*</font>银行卡</td>
       <td width="5%">是否签订劳务派遣合同</td>
		  <td width="5%">是否通过考试</td>

    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readJxlExecel(filename); 

	String[] sgdjbbmStr=new String[outStr.length-1];

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][2].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}
		row++;

		sgdmc=outStr[i][0].trim();
		bzmc  =outStr[i][1].trim();

		xm=outStr[i][2].trim();
		xb=outStr[i][3].trim();

		jg=outStr[i][4].trim();

		csrq=outStr[i][5].trim();

		gz=outStr[i][6].trim();
		rzsj=outStr[i][7].trim();

		dj=outStr[i][8].trim();
		lx=outStr[i][9].trim();

		sfzh=outStr[i][10].trim();
		dh=outStr[i][11].trim();

		zz=outStr[i][12].trim();
		jjlxr=outStr[i][13].trim();
		jjlxrdh=outStr[i][14].trim();
		jjlxrdz=outStr[i][15].trim();
		pxsm=outStr[i][16].trim();
		sgzbh=outStr[i][17].trim();
		yhk=outStr[i][18].trim();
		_sfqdlwpqht=outStr[i][19].trim();
		_sfkstg=outStr[i][20].trim();



		mark="";

		if (xm.equals(""))
		{
			out.println("！！！行号["+row+"]错误，[姓名]为空");
			return;
		}

		sql=" select sgd" ;
		sql+=" from sq_sgd " ;
		sql+=" where sgdmc='"+sgdmc+"' and ssfgs='"+ssfgs+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgd = rs.getString("sgd");			    
		}
		else{
			out.println("！！！不存在的[施工队]："+sgdmc);
			return;
		}
		rs.close();
		ps.close();

/*
		sql=" select bzmc" ;
		sql+=" from sq_bzxx " ;
		sql+=" where bzmc ='"+bzmc +"' and sgd='"+sgd+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
		}
		else{
			out.println("！！！不存在的[班长]："+bzmc);
			return;
		}
		rs.close();
		ps.close();
*/
		sql=" select xm" ;
		sql+=" from sq_grxxb " ;
		sql+=" where bzmc ='"+bzmc +"' and sgd='"+sgd+"' and xm='"+xm+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			mark="<BR><font color=\"#FF0000\">（已存在）</font>";
		}
		else{
			mark="";
		}
		rs.close();
		ps.close();


		if (!xb.equals("男") && !xb.equals("女"))
		{
			out.println("！！！["+xm+"]错误，[性别]只能为【是/否】，目前为["+xb+"]");
			return;
		}
		
		if("是".equals(_sfqdlwpqht)){
			sfqdlwpqht="Y";
		}
		else{
			sfqdlwpqht="N";
		}

		if("是".equals(_sfkstg)){
			sfkstg="Y";
		}
		else{
			sfkstg="N";
		}


		if (!gz.equals("木工") && !gz.equals("油漆工") && !gz.equals("瓦工") && !gz.equals("水电工") && !gz.equals("杂工"))//木工；水电工；油漆工；瓦工；杂工
		{
			out.println("！！！班长["+bzmc+"]错误，[工种]只能为【木工/水电工/油漆工/瓦工/杂工】，目前为["+gz+"]");
			return;
		}


		if (!lx.equals("临时") && !lx.equals("长期"))
		{
			out.println("<BR>！！！["+xm+"]错误，[类型]只能为【长期/临时】，目前为["+lx+"]");
//			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=sgdmc%> 
        <input name="sgd" type="hidden" value="<%=sgd%>">
      </td>
      <td><%=bzmc%> 
        <input name="bzmc" type="hidden" value="<%=bzmc%>">
      </td>
      <td><%=xm%><%=mark%>
        <input name="xm" type="hidden" value="<%=xm%>" >
      </td>
	  <td><%=xb%>
        <input name="xb" type="hidden" value="<%=xb%>" >
      </td>
	  <td><%=jg%>
        <input name="jg" type="hidden" value="<%=jg%>" >
      </td>
	  <td><%=csrq%>
        <input name="csrq" type="hidden" value="<%=csrq%>" >
      </td>
      <td> <%=gz%>
        <input name="gz" type="hidden" value="<%=gz%>" >
      </td>
      <td> <%=rzsj%>
        <input name="rzsj" type="hidden" value="<%=rzsj%>" >
      </td>
      <td> <%=dj%> 
        <input name="dj" type="hidden" value="<%=dj%>" >
      </td>
      <td ><%=lx%>
        <input name="lx" type="hidden" value="<%=lx%>" >
      </td>
      <td ><%=sfzh%>
        <input name="sfzh" type="hidden" value="<%=sfzh%>" >
      </td>
      <td ><%=dh%>
        <input name="dh" type="hidden" value="<%=dh%>" >
      </td>
      <td ><%=zz%>
        <input name="zz" type="hidden" value="<%=zz%>" >
      </td>
      <td ><%=jjlxr%>
        <input name="jjlxr" type="hidden" value="<%=jjlxr%>" >
      </td>
      <td ><%=jjlxrdh%>
        <input name="jjlxrdh" type="hidden" value="<%=jjlxrdh%>" >
      </td>
      <td ><%=jjlxrdz%>
        <input name="jjlxrdz" type="hidden" value="<%=jjlxrdz%>" >
      </td>
      <td ><%=pxsm%>
        <input name="pxsm" type="hidden" value="<%=pxsm%>" >
      </td>
      <td ><%=sgzbh%>
        <input name="sgzbh" type="hidden" value="<%=sgzbh%>" >
      </td>
	  <td ><%=yhk%>
        <input name="yhk" type="hidden" value="<%=yhk%>" >
      </td>
	  <td ><%=_sfqdlwpqht%>
        <input name="sfqdlwpqht" type="hidden" value="<%=sfqdlwpqht%>" >
      </td>
	<td ><%=_sfkstg%>
        <input name="sfkstg" type="hidden" value="<%=sfkstg%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	out.print("<BR>SQL=" + sql);
	out.print("<BR>bzmc =" + bzmc );
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
