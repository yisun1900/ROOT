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
#div22{font-size:12px;width:20px;height:22px;cursor :pointer;padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div2222{font-size:12px;width:20px;height:22px;padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div2{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div3{padding:50px;margin:10px;border:1px solid #BBE9FF;background:#FFFFFF}
#div4{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFD9}
#div110{padding:1px;margin:0px;border:0px solid #BBE9FF;background:#9FC8DF}

</style>

<%
String wherebkbh=cf.GB2Uni(request.getParameter("bkbh"));
String whereys=cf.GB2Uni(request.getParameter("ys"));
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=(String)session.getAttribute("yhdlm");
int dqys=0;
int tzs=0;
int htys=0;
int mysl=100;
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
<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
	<tr>
	<td>
	<div id="div110">
	<table style="word-break:break-all;word-wrap:break-word"><tr>
	<td width="500px"><select name="ssfw" id="ssfwid">
	<option value=""></option>
	<option value="1">主题</option>
	<option value="2">内容</option>
	<option value="3">回复</option>
	</select>
	<input name="ssnr" id="ssnrid" value="" type="text" size="20">
		<input type="button" name="tttr" value=" 搜 索 " onClick="f_ss(insertform)"  class=butt title="搜索贴子">
</td>
	<td><span style="FONT-SIZE:12">我的：&nbsp;<a href="/nblt/fwlt/mytz.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>" >[贴子]</a>&nbsp;||&nbsp;<a href="/nblt/fwlt/myhf.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">[回复]</a>&nbsp;||&nbsp;<a href="/nblt/grzlgl/xsgrzl.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">[资料]</a></span></td>
	</tr></table>
	</div>
	</td>
	</tr>
</table>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<table width="98%"><tr><td align="left">
<DIV id="div2222" align="center" style="float: left"><b>&nbsp;<%=tzs%>&nbsp;</b></div>
<DIV id="div2222" align="center" style="float: left"><b>&nbsp;<%=dqys%>/<%=htys%>&nbsp;</b></div>


<%
int mmk=0;
int kkhtys=0;
for (int y=0;y<htys+4;y++)
{
//	if ()
	mmk=y+dqys-4;
	if (y<10 && mmk<=htys)//如果页数太多  跳出循环
	{
		if(mmk>0)
		{
		out.print("<DIV id=\"div22\"  onClick=\"f_tz(insertform,'"+mmk+"')\" title=\"跳转到 "+mmk+" 页\" align=\"center\"  style=\"float: left\"><b>"+mmk+"</b></div>");
		}
	}
	
}
%>
<input size=3 type="text" value="" name="rddqys"  title="输入页数 回车">
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div id="div1" align="center" width="100%">
		<table style="word-break:break-all;word-wrap:break-word" width="98.6%">
		<tr>
		<td width="90%">
		<span style="FONT-SIZE:12">&nbsp;&nbsp;<a href="ktz.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">首页</a>&nbsp;&nbsp;||&nbsp;&nbsp;<%=bkmc%></span>
		</td>
		 <td width="10%" align="right">
		 <a href="newtz.jsp?bkbh=<%=wherebkbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>" onFocus=this.blur()><img src="image/newtopic.gif" border=0></a> 
		</td> 
		</tr>
</table></DIV>
<div id="div4">
<table style="word-break:break-all;word-wrap:break-word" width="100%">
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
String xsftzt=null;
String sfjht=null;
int hfcs=0;
int djcs=0;
int qddys=0;
try {
	conn=cf.getConnection();
	ls_sql="select nblt_ftgl.sfjht,a.ltnc ftr,ftzt,hfcs,djcs,to_char(ftsj,'YYYY-MM-DD') ftsj,fjmc,b.ltnc zhhfr,to_char(zhhfsj,'YYYY-MM-DD') zhhfsj,tzbh,zhhfsj px,DECODE(sfzd,'Y','<font color=red>[置顶]</font>','N','[普通]') sfzd ";
	ls_sql+=" from  nblt_ftgl,nblt_grzl a,nblt_grzl b";
	ls_sql+=" where a.ltid=nblt_ftgl.ftr and b.ltid=nblt_ftgl.zhhfr and bkbh='"+wherebkbh+"' ";
	ls_sql+=" order by sfzd,sfjht desc,px desc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		qddys++;
		sfjht=cf.fillNull(rs.getString("sfjht"));
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

		String jhtStr="";
		if (sfjht.equals("Y"))//是否精华帖 Y：精华帖；N：否
		{
			jhtStr="<IMG src='image\\jh.jpg'>";
		}

		if (ftzt.length()>23)
		{
			xsftzt=ftzt.substring(0,23)+"...";
		}
		else
		{
			xsftzt=ftzt;
		}

		//通过这种龌龊的方式分页
		if (qddys<(dqys-1)*mysl)
		{
			continue;
		}
		if (qddys>dqys*mysl)
		{
			break;
		}

		%>
		<div id="div2">
		<table style="word-break:break-all;word-wrap:break-word" width="100%">
		<tr>
		<td width="70%">
		<span style="FONT-SIZE:14"><%=jhtStr%><%=sfzd%>&nbsp;<a href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>" title="<%=ftzt%>"><%=xsftzt%></a></span>
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
<table style="word-break:break-all;word-wrap:break-word" width="100%">
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

<table width="98%"><tr><td align="left">
<DIV id="div2222" align="center" style="float: left"><b>&nbsp;<%=tzs%>&nbsp;</b></div>
<DIV id="div2222" align="center" style="float: left"><b>&nbsp;<%=dqys%>/<%=htys%>&nbsp;</b></div>


<%
int mmk2=0;
int kkhtys2=0;
for (int y2=0;y2<htys+4;y2++)
{
//	if ()
	mmk2=y2+dqys-4;
	if (y2<10 && mmk2<=htys)//如果页数太多  跳出循环
	{
		if(mmk2>0)
		{
		out.print("<DIV id=\"div22\"  onClick=\"f_tz(insertform,'"+mmk2+"')\" title=\"跳转到 "+mmk2+" 页\" align=\"center\"  style=\"float: left\"><b>"+mmk2+"</b></div>");
		}
	}
	
}
%>
<input size=3 type="text" value="" name="rddqys2"  title="输入页数 回车">
<DIV height="4px">&nbsp;</DIV>
</form>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_tz(FormName,djys)//参数FormName:Form的名称
{
//	alert(djys+<%=tzbh%>);
	FormName.action="zktz.jsp?ys="+djys+"&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	FormName.submit();
	return true;
}
function f_srtz(FormName)//参数FormName:Form的名称
{
	if (FormName.rddqys.value!="" || FormName.rddqys2.value!="")
	{
	if (event.keyCode==13)
		{
			if (FormName.rddqys.value=="")
			{
				FormName.action="zktz.jsp?ys="+FormName.rddqys2.value+"&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
			}
			else
			{
				FormName.action="zktz.jsp?ys="+FormName.rddqys.value+"&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
			}
		FormName.submit();
		return true;
		}
	}
	else if (FormName.ssnr.value!="" || FormName.ssfw.value!="")
	{
		if (event.keyCode==13)
		{
		f_ss(insertform);
		}
	}
}
function f_ss(FormName)//参数FormName:Form的名称
{
	var jsssfw
	var jsssnr
	jsssfw=document.getElementById('ssfwid').value
	jsssnr=document.getElementById('ssnrid').value
	if (jsssfw==null || jsssfw=="")
	{
		alert("请选择[范围]！");
		FormName.ssfw.focus();
		return false;
	}
	if (jsssnr==null || jsssnr=="")
	{
		alert("请输入[内容]！");
		FormName.ssnr.focus();
		return false;
	}
	if (jsssfw=="3")
	{
		FormName.action="mysshf.jsp?ssfw="+jsssfw+"&ssnr="+jsssnr+"&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	}
	else
	{
		FormName.action="mysstz.jsp?ssfw="+jsssfw+"&ssnr="+jsssnr+"&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>