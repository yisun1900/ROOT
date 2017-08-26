<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<title>调整项目顺序</title>
</head>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >

<%

String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmbhmc=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double cldj=0;
double rgdj=0;
double dj=0;
double sl=0;
double clf=0;
double rgf=0;
String gycl=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;


try {
	conn=cf.getConnection();

%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#FFFFFF" align="center">
	  <td colspan="15" >
	  <input name="button" type=button onClick="f_do(listform)" value='保存' >
	</tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="7%">房间内序号</td>
    <td  width="5%">项目序号</td>
    <td  width="11%">项目编号</td>
    <td  width="32%">项目名称</td>
    <td  width="7%">材料单价</td>
    <td  width="7%">人工单价</td>
    <td  width="7%">单位</td>
    <td  width="7%">数量</td>
    <td  width="9%">材料费</td>
    <td  width="8%">人工费</td>
  </tr>
  <%
	int i=0;
	ls_sql="SELECT bj_fjxxh.jgwzbm";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh  ";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjsl=rs.getDouble("sl");
			xjqye=rs.getDouble("je");
		}
		ps.close();
		rs.close();

		allsl+=xjsl;
		allqye+=xjqye;
		
		//输出标题
		%> 
  <tr bgcolor="#FFFFFF"> 
    <td colspan="10"> 
      <div align="right"><b><i><font size="3">结构位置：<%=jgwzmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        小计：<%=cf.formatDouble(xjqye,"#########.##")%>元</font></i></b></div>
    </td>
  </tr>
  <%
		//输出房间项目明细
		int fjnxh=0;
		int xmpx=0;
		ls_sql="SELECT bj_bjxmmxh.xh,bj_bjxmmxh.xmpx,bj_bjxmmxh.xmbh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','增') xmbhmc,xmmc,jldwmc,bj_bjxmmxh.cldj,bj_bjxmmxh.rgdj,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.cldj as clf,bj_gclmxh.sl*bj_bjxmmxh.rgdj as rgf";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xmpx,bj_bjxmmxh.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xmpx=rs.getInt("xmpx");
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmbhmc=cf.fillHtml(rs.getString("xmbhmc"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			cldj=rs.getDouble("cldj");
			rgdj=rs.getDouble("rgdj");
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			clf=rs.getDouble("clf");
			rgf=rs.getDouble("rgf");

			row++;
			fjnxh++;
			//输出每行数据
			%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td>
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
				<input name="jgwzbm" type="hidden" value="<%=jgwzmc%>">

				<input type="text" name="fjnxh" value="<%=fjnxh%>" size="5" maxlength="5" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(fjnxh[<%=row%>])">
			</td>
			<td><%=xmpx%></td>
			<td align="left"><%=xmbhmc%></td>
			<td align="left"><%=xmmc%></td>
			<td><%=cldj%></td>
			<td><%=rgdj%></td>
			<td><%=jldwmc%></td>
			<td><%=cf.formatDouble(sl)%></td>
			<td><%=cf.formatDouble(clf,"#########.##")%></td>
			<td><%=cf.formatDouble(rgf,"#########.##")%></td>
		  </tr>
		  <%
		}
		ps.close();
		rs.close();
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="10"><i><b><font size="3">直接费合计：<%=cf.formatDouble(allqye,"#########.##")%>元</font></b></i></td>
  </tr>
	<tr bgcolor="#FFFFFF" align="center">
	  <td colspan="15" >
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
	  <input name="button" type=button onClick="f_do(listform)" value='保存' >
	</tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>




<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(formName)
{
	formName.action="SaveTzFjXhBjxm.jsp";
	formName.submit();
	return true;
} 
function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</script>



