<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double dj=0;
String gycl=null;
String bjlx=null;
String bjlxmc=null;
String bjjb=null;
String xuhao=null;
String jgwzbm=request.getParameter("jgwzbm");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

double xjqye=0;//总额
try {
	conn=cf.getConnection();

	ls_sql="SELECT xuhao";
	ls_sql+=" FROM bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		xuhao=rs1.getString(1);
	}
	rs1.close();
	ps1.close();

	//标准项目：公式计算
	//需要主材：直接取
	ls_sql="SELECT sum(bj_gclmx.sl*(bj_dwgclzcyl.zcf+bj_bjxmmx.fcf+bj_bjxmmx.rgf+bj_bjxmmx.jjf)*((100+bj_bjxmmx.glfbl)/100))";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bj_dwgclzcyl";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_gclmx.khbh=bj_dwgclzcyl.khbh and bj_gclmx.dqbm=bj_dwgclzcyl.dqbm and bj_gclmx.xmbh=bj_dwgclzcyl.xmbh and bj_gclmx.jgwzbm=bj_dwgclzcyl.jgwzbm";
	ls_sql+=" and bj_bjxmmx.bjlx='1'";//1:标准项目;2:自定义项目
	ls_sql+=" and bj_bjxmmx.sfxycl='1'";//1：需要；2：不需要
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_bjxmmx.bjlx='1'";//1:标准项目;2:自定义项目
	ls_sql+=" and bj_bjxmmx.sfxycl='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjqye+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//2:自定义项目
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_bjxmmx.bjlx='2'";//1:标准项目;2:自定义项目
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xjqye+=rs.getDouble(1);
	}
	rs.close();
	ps.close();
%>


<html>
<head>
<title>录入房间工程量</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px;' >
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="post" action="SaveLrFjGcl2.jsp" name="editform" >
<div align="center">录入房间工程量明细（位置：<%=jgwzbm%>）<B>(该房间总计：<%=cf.formatDouble(xjqye)%>元)</B></div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="4%">序号</td>
		<td width="8%">项目编号</td>
		<td width="19%">项目名称</td>
		<td width="6%">级别</td>
		<td width="6%">工程计量单位</td>
		<td width="6%">工程量</td>
		<td width="14%">主材名称</td>
		<td width="14%">主材规格</td>
		<td width="5%">主材计量单位</td>
		<td width="6%">主材用量</td>
		<td width="6%">主材费</td>
		<td width="6%">综合单价</td>
	</tr>
<%
	int row=0;
	String bgcolor=null;
	String zcjldwbm="";
	String sfxycl="";
	String zcmc="";
	String zcgg="";
	double zcyl=0;
	double zcf=0;
	String zcylstr="";
	String zcfstr="";
	double fcf=0;
	double rgf=0;
	double jjf=0;
	double glfbl=0;
	ls_sql="select sfxycl,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,xh,dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwmc,dj,bjlx,DECODE(bjlx,'1','标准项目','2','自定义项目') bjlxmc,bjjbmc bjjb";
	ls_sql+=" from  bj_bjxmmx,jdm_jldwbm,bdm_bjjbbm";
	ls_sql+=" where  khbh='"+khbh+"' and bj_bjxmmx.bjjb=bdm_bjjbbm.bjjbbm(+) and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" order by xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=rs.getString("xh");
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjlx=cf.fillNull(rs.getString("bjlx"));
		bjlxmc=cf.fillNull(rs.getString("bjlxmc"));

		zcmc=cf.fillNull(rs.getString("zcmc"));
		zcgg=cf.fillNull(rs.getString("zcgg"));
		zcf=rs.getDouble("zcf");
		fcf=rs.getDouble("fcf");
		rgf=rs.getDouble("rgf");
		jjf=rs.getDouble("jjf");
		glfbl=rs.getDouble("glfbl");

		if (zcf!=0)
		{
			zcfstr=zcf+"";
		}
		else{
			zcfstr="";
		}

		double sl=0;
		String slstr="";

		ls_sql="SELECT bj_gclmx.sl";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.dqbm='"+dqbm+"' and bj_gclmx.xmbh='"+xmbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sl=rs1.getDouble("sl");
			slstr=sl+"";
		}
		rs1.close();
		ps1.close();

		zcylstr="";

		zcjldwbm="";

		ls_sql="SELECT zcmc,zcgg,zcyl,zcf,zcjldwbm";
		ls_sql+=" FROM bj_dwgclzcyl ";
		ls_sql+=" where bj_dwgclzcyl.khbh='"+khbh+"' and bj_dwgclzcyl.dqbm='"+dqbm+"' and bj_dwgclzcyl.xmbh='"+xmbh+"' and bj_dwgclzcyl.jgwzbm='"+jgwzbm+"'";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zcmc=cf.fillNull(rs1.getString("zcmc"));
			zcgg=cf.fillNull(rs1.getString("zcgg"));
			zcyl=rs1.getDouble("zcyl");
			zcf=rs1.getDouble("zcf");
			zcjldwbm=cf.fillNull(rs1.getString("zcjldwbm"));

			zcylstr=zcyl+"";
			zcfstr=zcf+"";
		}
		rs1.close();
		ps1.close();


		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			if (sfxycl.equals("1"))//1：需要；2：不需要
			{
				dj=(zcf+fcf+rgf+jjf)*(100+glfbl)/100;
			}
		}


		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=row%></td>
			<%
			String xmbhstr=xmbh;
			String xmmcstr=xmmc;
			if (slstr.equals("0") || slstr.equals("0.0"))
			{
				xmbhstr="<font color='#0000CC'><B>"+xmbh+"</B></font>";
				xmmcstr="<font color='#0000CC'><B>"+xmmc+"</B></font>";
			}
			else if (!slstr.equals(""))
			{
				xmbhstr="<font color='#FF0000'><B>"+xmbh+"</B></font>";
				xmmcstr="<font color='#FF0000'><B>"+xmmc+"</B></font>";
			}

			%>
			<td><%=xmbhstr%></td>
			<td><%=xmmcstr%></td>
			<td><%=bjjb%></td>
			<td><%=jldwbm%></td>
			<td>
				<input name="sfxycl" type="hidden" value="<%=sfxycl%>">
				<input name="dqbm" type="hidden" value="<%=dqbm%>">
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
				<input type="text" name="sl" size="6" value="<%=slstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">
			</td>
<%
			if (sfxycl.equals("1"))//1：需要；2：不需要
			{
				%>
				<td>
					<input type="text" name="zcmc" size="17" maxlength="50" value="<%=zcmc%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[<%=row%>])">
				</td>
				<td>
					<input type="text" name="zcgg" size="17" maxlength="50" value="<%=zcgg%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcgg[<%=row%>])">
				</td>
				<td>
					<select name="zcjldwbm" style="FONT-SIZE:12PX;WIDTH:52PX">
					  <option value=""></option>
					  <%
						cf.selectItem(out,"select cljldwmc c1,cljldwmc c2 from bdm_cljldwbm order by cljldwbm",zcjldwbm);
						%> 
					</select>
				</td>
				<td>
					<input type="text" name="zcyl" size="6" value="<%=zcylstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcyl[<%=row%>])">
				</td>
				<td>
					<input type="text" name="zcf" size="6" value="<%=zcfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcf[<%=row%>])">
				</td>
				<td><%=cf.formatDouble(dj)%></td>
				<%
			}
			else
			{
				%>
				<td>
					<input type="hidden" name="zcmc" >
				</td>
				<td>
					<input type="hidden" name="zcgg" >
				</td>
				<td>
					<input type="hidden" name="zcjldwbm" >
				</td>
				<td>
					<input type="hidden" name="zcyl" >
				</td>
				<td>
					<input type="hidden" name="zcf" >
				</td>
				<td>&nbsp;</td>
				<%
			}
%>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>
<tr> 
  <td colspan="7" > 
	<div align="center"> 
		<input type="hidden" name="xuhao"  value="<%=xuhao%>" >
		<input type="hidden" name="jgwzbm"  value="<%=jgwzbm%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	  <input type="reset"  value="重输">
	</div>
  </td>
</tr>
</table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.submit();
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
</SCRIPT>
