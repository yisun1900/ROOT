<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<style>
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
#div0{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div1{padding:5px;margin:0px;border:1px solid #BBE9FF;background:#F5FBFF}
#div22{font-size:12px;width:20px;height:22px;padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div2{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div3{padding:50px;margin:10px;border:1px solid #BBE9FF;background:#FFFFFF}
#div4{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFD9}
#div110{padding:1px;margin:0px;border:0px solid #BBE9FF;background:#9FC8DF}

</style>
<%
String dlygbh=(String)session.getAttribute("ygbh");
String wherebkbh=cf.GB2Uni(request.getParameter("bkbh"));
String whereys=cf.GB2Uni(request.getParameter("ys"));
int dqys=0;
int tzs=0;
int htys=0;
int mysl=10;
String bkmc=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select bkmc,tzs ";
	ls_sql+=" from  nblt_bkgl";
	ls_sql+=" where (1=1) and bkbh='"+wherebkbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bkmc=cf.fillNull(rs.getString("bkmc"));
		tzs=rs.getInt("tzs");
	}
	rs.close();
	ps.close();
	//计算发贴的页数
	htys=tzs/mysl;
	if (tzs%mysl>0)
	{htys++;}
	if (htys<=0)
	{htys=1;}
	//分页
	try
	{
		dqys=Integer.parseInt(whereys);//如果调价序号为空则初始化成1
	}
	catch(Exception e)
	{
		dqys=1;
	}
	if (dqys<=0)
	{
		dqys=1;
	}
	if (dqys>htys)
	{
		dqys=1;
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body onkeydown="f_srtz(insertform)">
<form method="post" action="" name="insertform" target="">
<input name="bkbh" value="<%=wherebkbh%>" type="hidden">
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<table width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
	<tr>
	<td>
	<div id="div110">
	<table><tr>
	<td width="500px"><span style="FONT-SIZE:14">[优铂利论坛系统]</span></td>
	<td><span style="FONT-SIZE:12">我的：&nbsp;<a href="/nblt/fwlt/mytz.jsp">[贴子]</a>&nbsp;||&nbsp;<a href="/nblt/fwlt/myhf.jsp">[回复]</a>&nbsp;||&nbsp;<a href="/nblt/grzlgl/editgrzl.jsp">[资料]</a></span></td>
	</tr></table>
	</div>
	</td>
	</tr>
</table>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<!-- <table width="98%"><tr><td align="left">
<DIV id="div22" align="center" style="float: left"><b>&nbsp;<%=tzs%>&nbsp;</b></div>
<DIV id="div22" align="center" style="float: left"><b>&nbsp;<%=dqys%>/<%=htys%>&nbsp;</b></div>


<%
int mmk=0;
for (int y=0;y<htys;y++)
{
	mmk=y+dqys;
	if (y<10 && mmk<=htys)//如果页数太多  跳出循环
	{
	out.print("<DIV id=\"div22\"  onClick=\"f_tz(insertform,'"+mmk+"')\" title="+mmk+" align=\"center\"  style=\"float: left\"><b>"+mmk+"</b></div>");
	}
	
}
%>
<input size=3 type="text" value="" name="rddqys"> -->
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div id="div1" >
		<table width="90%">
		<tr>
		<td width="90%">
		<span style="FONT-SIZE:12">&nbsp;&nbsp;<a href="ktz.jsp">首页</a></span>
		</td>
		 <td width="10%" align="right">
		 &nbsp; 
		</td> 
		</tr>
</table></DIV>
<div id="div4">
	<table>
	<tr>
	<td width="70%">
	<span style="FONT-SIZE:12">&nbsp;&nbsp;主题</span>
	</td>
	<td width="100px" align="center">
	<span style="FONT-SIZE:12">作者</span>
	</td>
	<td width="100px" align="center">
	<span style="FONT-SIZE:12">回复/查看</span>
	</td>
	<td width="100px" align="center">
	<span style="FONT-SIZE:12">最后回复</span>
	</td>
	</tr>
</table>
</DIV>
<%

String ftr=null;
String ftzt=null;
String ftsj=null;
String fjmc=null;
String fjym=null;
String fznr=null;
String zhhfr=null;
String zhhfsj=null;
String tzbh=null;
String sfzd=null;
int hfcs=0;
int djcs=0;
int qddys=0;
try {
	conn=cf.getConnection();
	ls_sql="select a.ltnc ftr,ftzt,hfcs,djcs,to_char(ftsj,'YYYY-MM-DD') ftsj,fjmc,b.ltnc zhhfr,to_char(zhhfsj,'YYYY-MM-DD') zhhfsj,tzbh,zhhfsj px,DECODE(sfzd,'Y','<font color=red>[置顶]</font>','N','[普通]') sfzd ";
	ls_sql+=" from  nblt_ftgl,nblt_grzl a,nblt_grzl b";
	ls_sql+=" where a.ltid=nblt_ftgl.ftr and b.ltid=nblt_ftgl.zhhfr and tzbh in (select tzbh from nblt_hfgl where hfr="+dlygbh+" ) ";
	ls_sql+=" order by sfzd,px desc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		qddys++;
		ftr=cf.fillNull(rs.getString("ftr"));
		ftzt=cf.fillNull(rs.getString("ftzt"));
		tzbh=cf.fillNull(rs.getString("tzbh"));
		sfzd=cf.fillNull(rs.getString("sfzd"));

		ftsj=cf.fillNull(rs.getString("ftsj"));
		fjmc=cf.fillNull(rs.getString("fjmc"));
		zhhfr=cf.fillNull(rs.getString("zhhfr"));
		zhhfsj=cf.fillNull(rs.getString("zhhfsj"));
		hfcs=rs.getInt("hfcs");
		djcs=rs.getInt("djcs");
		//通过这种龌龊的方式分页
//		if (qddys<(dqys-1)*mysl)
//		{
//			continue;
//		}
//		if (qddys>dqys*mysl)
//		{
//			break;
//		}
		%>
		<div id="div2">
		<table>
		<tr>
		<td width="70%">
		<span style="FONT-SIZE:14"><%=sfzd%>&nbsp;<a href="cktz.jsp?tzbh=<%=tzbh%>"><%=ftzt%></a></span>
		</td>
		<td width="100px" align="center">
		<span style="FONT-SIZE:12"><%=ftr%><br><%=ftsj%></span>
		</td>
		<td width="100px" align="center">
		<span style="FONT-SIZE:12"><%=hfcs%>/<%=djcs%></span>
		</td>
		<td  width="100px" align="center">
		<span style="FONT-SIZE:12"><%=zhhfr%><br><%=zhhfsj%></span>
		</td>
		</tr>
		</table>
		</DIV>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<div id="div4">
<table>
	<tr>
	<td width="70%">
	<span style="FONT-SIZE:12">&nbsp;&nbsp;主题</span>
	</td>
	<td width="100px" align="center">
	<span style="FONT-SIZE:12">作者</span>
	</td>
	<td width="100px" align="center">
	<span style="FONT-SIZE:12">回复/查看</span>
	</td>
	<td width="100px" align="center">
	<span style="FONT-SIZE:12">最后回复</span>
	</td>
	</tr>
</table>
</DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>

<!-- <table width="98%"><tr><td align="left">
<DIV id="div22" align="center" style="float: left"><b>&nbsp;<%=tzs%>&nbsp;</b></div>
<DIV id="div22" align="center" style="float: left"><b>&nbsp;<%=dqys%>/<%=htys%>&nbsp;</b></div>


<%
int mmk2=0;
for (int y2=0;y2<htys;y2++)
{
	mmk2=y2+dqys;
	if (y2<10 && mmk2<=htys)//如果页数太多  跳出循环
	{
	out.print("<DIV id=\"div22\"  onClick=\"f_tz(insertform,'"+mmk2+"')\" title="+mmk2+" align=\"center\"  style=\"float: left\"><b>"+mmk2+"</b></div>");
	}
	
}
%>
<input size=3 type="text" value="" name="rddqys2"> -->
<DIV height="4px">&nbsp;</DIV>
</form>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_tz(FormName,djys)//参数FormName:Form的名称
{
//	alert(djys+<%=tzbh%>);
	FormName.action="zktz.jsp?ys="+djys;
	FormName.submit();
	return true;
}
function f_srtz(FormName)//参数FormName:Form的名称
{
	if (event.keyCode==13)
	{
		if (FormName.rddqys.value=="")
		{
			FormName.action="zktz.jsp?ys="+FormName.rddqys2.value;
		}
		else
		{
			FormName.action="zktz.jsp?ys="+FormName.rddqys.value;
		}
	FormName.submit();
	return true;
	}
}
//-->
</SCRIPT>