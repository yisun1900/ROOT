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

String ssfgs = null;
String fgsmc=null;


String[][] outStr=null; 
String bgcolor=null;

String sgd=null;
String sgdmc=null;
String duihao=null;
String sgdjbbm=null;
String sgdjbmc=null;

String sgdlx=null;
String sgdlxdtr=null;
String sfzhm=null;
String dz=null;
String dh=null;
String email=null;
String hjszd=null;

String jjlxr=null;
String lxrdh=null;
String jjlxrdz=null;

String sfqldht=null;
String sfqldhtstr=null;
String zbj=null;
String bzs=null;

String tdbz=null;
String tdbzstr=null;

String tdkssj=null;
String tdzzsj=null;
String cxbz=null;
String cxbzstr=null;
String kjdsm=null;

String bz=null;

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
 导入施工队<font color="#FF0000">[<%=fgsmc%>]
	<BR>若已存在，则进行替换，否则进行增加</b></font>

  </div>
	<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="270%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

	<tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%"><font color="#CC0000">*</font>施工队编号(5位)</td>
      <td width="3%"><font color="#CC0000">*</font>施工队名称</td>
      <td width="2%">队号</td>
	  <td width="3%">级别</td>
      <td width="3%">施工队类型</td>
      <td width="6%">身份证号</td>
      <td width="8%"><font color="#CC0000">*</font>住址</td>
	  <td width="6%">电话</td>
      <td width="5%">E-Mail</td>
      <td width="6%">户籍所在地</td>
      <td width="3%">紧急联系人</td>
      <td width="6%">联系人电话</td>
      <td width="5%">紧急联系人地址</td>
      <td width="3%">是否签劳动合同</td>
      <td width="3%">质保金</td>
      <td width="3%">班组数</td>
      <td width="3%"><font color="#CC0000">*</font>停单标志</td>
      <td width="4%">停单开始时间</td>
      <td width="4%">停单终止时间</td>
      <td width="3%"><font color="#CC0000">*</font>撤销标志</td>
      <td width="9%">派单说明</td>
      <td width="9%">备注</td>
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

		if (outStr[i][1].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}
		row++;

		int len=outStr[i].length;

		sgd=outStr[i][0].trim();
		sgdmc  =outStr[i][1].trim();
		duihao=outStr[i][2].trim();
		sgdjbmc=outStr[i][3].trim();
		sgdlxdtr=outStr[i][4].trim();
		sfzhm=outStr[i][5].trim();
		dz=outStr[i][6].trim();
		dh=outStr[i][7].trim();
		email=outStr[i][8].trim();
		hjszd=outStr[i][9].trim();
		jjlxr=outStr[i][10].trim();

		lxrdh=outStr[i][11].trim();
		jjlxrdz=outStr[i][12].trim();
		sfqldhtstr=outStr[i][13].trim();
		zbj=outStr[i][14].trim();
		bzs=outStr[i][15].trim();
		tdbzstr=outStr[i][16].trim();
		tdkssj=outStr[i][17].trim();
		tdzzsj=outStr[i][18].trim();
		cxbzstr=outStr[i][19].trim();
		kjdsm=outStr[i][20].trim();

		bz=outStr[i][21].trim();

		if (!tdkssj.equals(""))
		{
			java.sql.Date.valueOf(tdkssj);
		}
		if (!tdzzsj.equals(""))
		{
			java.sql.Date.valueOf(tdzzsj);
		}

		mark="";

		if (sgd.equals(""))
		{
			out.println("！！！行号["+row+"]错误，[施工队编号]为空");
			return;
		}

		sql=" select sgdjbbm" ;
		sql+=" from sq_sgdjbbm " ;
		sql+=" where sgdjbmc='"+sgdjbmc+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgdjbbm = rs.getString("sgdjbbm");			    
		}
		else{
			out.println("！！！不存在的[级别]："+sgdjbmc);
			return;
		}
		rs.close();
		ps.close();

		sql=" select sgd" ;
		sql+=" from sq_sgd " ;
		sql+=" where sgdmc ='"+sgdmc +"' and ssfgs='"+ssfgs+"'" ;
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

		sgdjbbm="";
		sql=" select sgdjbbm" ;
		sql+=" from sq_sgdjbbm " ;
		sql+=" where sgdjbmc='"+sgdjbmc+"' " ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			sgdjbbm = rs.getString("sgdjbbm");
		}
		rs.close();
		ps.close();


		if (sgdlxdtr.equals("非直属队"))//S0：非直属队；S1：直属队 
		{
			sgdlx="S0";
		}
		else if (sgdlxdtr.equals("直属队"))
		{
			sgdlx="S1";
		}
		else{
			out.println("！！！施工队["+sgdmc+"]错误，[施工队类型]只能为【非直属队/直属队】，目前为["+sgdlxdtr+"]");
			return;
		}



		if (sfqldhtstr.equals("是"))
		{
			sfqldht="Y";
		}
		else if (sfqldhtstr.equals("否"))
		{
			sfqldht="N";
		}
		else{
			out.println("！！！施工队["+sgdmc+"]错误，[是否签劳动合同]只能为【是/否】，目前为["+sfqldhtstr+"]");
			return;
		}

		if (tdbzstr.equals("停单"))//Y：停单；N：不停单
		{
			tdbz="Y";
		}
		else if (tdbzstr.equals("不停单"))
		{
			tdbz="N";
		}
		else{
			out.println("！！！施工队["+sgdmc+"]错误，[停单标志]只能为【停单/不停单】，目前为["+tdbzstr+"]");
			return;
		}

		if (cxbzstr.equals("已撤销"))//Y：已撤销；N：未撤销
		{
			cxbz="Y";
		}
		else if (cxbzstr.equals("未撤销"))
		{
			cxbz="N";
		}
		else{
			out.println("！！！施工队["+sgdmc+"]错误，[撤销标志]只能为【已撤销/未撤销】，目前为["+cxbzstr+"]");
			return;
		}


		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=sgd%> 
        <input name="sgd" type="hidden" value="<%=sgd%>">
      </td>
      <td><%=sgdmc%><%=mark%> 
        <input name="sgdmc" type="hidden" value="<%=sgdmc%>">
      </td>
	  <td><%=duihao%>
        <input name="duihao" type="hidden" value="<%=duihao%>" >
      </td>
      <td><%=sgdjbmc%>
        <input name="sgdjbbm" type="hidden" value="<%=sgdjbbm%>" >
      </td>
	  <td><%=sgdlxdtr%>
        <input name="sgdlx" type="hidden" value="<%=sgdlx%>" >
      </td>
	  <td><%=sfzhm%>
        <input name="sfzhm" type="hidden" value="<%=sfzhm%>" >
      </td>
      <td> <%=dz%>
        <input name="dz" type="hidden" value="<%=dz%>" >
      </td>
      <td> <%=dh%>
        <input name="dh" type="hidden" value="<%=dh%>" >
      </td>
      <td> <%=email%> 
        <input name="email" type="hidden" value="<%=email%>" >
      </td>
      <td ><%=hjszd%>
        <input name="hjszd" type="hidden" value="<%=hjszd%>" >
      </td>
       <td ><%=jjlxr%>
        <input name="jjlxr" type="hidden" value="<%=jjlxr%>" >
      </td>
      <td ><%=lxrdh%>
        <input name="lxrdh" type="hidden" value="<%=lxrdh%>" >
      </td>
      <td ><%=jjlxrdz%>
        <input name="jjlxrdz" type="hidden" value="<%=jjlxrdz%>" >
      </td>
     <td ><%=sfqldhtstr%>
        <input name="sfqldht" type="hidden" value="<%=sfqldht%>" >
      </td>
      <td ><%=zbj%>
        <input name="zbj" type="hidden" value="<%=zbj%>" >
      </td>
      <td ><%=bzs%>
        <input name="bzs" type="hidden" value="<%=bzs%>" >
      </td>
      <td ><%=tdbzstr%>
        <input name="tdbz" type="hidden" value="<%=tdbz%>" >
      </td>
      <td ><%=tdkssj%>
        <input name="tdkssj" type="hidden" value="<%=tdkssj%>" >
      </td>
      <td ><%=tdzzsj%>
        <input name="tdzzsj" type="hidden" value="<%=tdzzsj%>" >
      </td>
      <td ><%=cxbzstr%>
        <input name="cxbz" type="hidden" value="<%=cxbz%>" >
      </td>
      <td ><%=kjdsm%>
        <input name="kjdsm" type="hidden" value="<%=kjdsm%>" >
      </td>
      <td ><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	out.print("<BR>SQL=" + sql);
	out.print("<BR>sgdmc =" + sgdmc );
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
