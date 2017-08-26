<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
	
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>

	<style type="text/css">
		body{ color: #333; font: 13px 'Lucida Grande', Verdana, sans-serif;	}
	</style>
<style>
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
#div0{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div110{padding:1px;margin:0px;border:0px solid #BBE9FF;background:#9FC8DF}
#div1{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#F5FBFF}
#div222{padding:5px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;}onmouseout=function(){this.style.backgroundColor=#9FC8DF;}
#div2{width:20px;height:22px;padding:0px;margin:0px;cursor :pointer;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div2222{width:20px;height:22px;padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div3{padding:3px;margin:0px;border:0px solid #BBE9FF;background:#FFFFFF}
#div10{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div4{padding:30px;margin:0px;border:0px solid #BBE9FF;background:#FFFFFF}
#table1{border:1px solid #BBE9FF;background:#FFFFFF }
</style>
<%
String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String dlygbh=ygbh;
String wheretzbh=cf.GB2Uni(request.getParameter("tzbh"));
String whereys=cf.GB2Uni(request.getParameter("ys"));
String ftygbh=null;
String htygbh=null;
String bkbh=null;
String bkmc=null;
String ftr=null;
String ftzt=null;
String ftsj=null;
String fjmc=null;
String fjym=null;
String ftnr="";
String zhhfr=null;
String zhhfsj=null;
String tzbh=null;
String sfyxhf=null;
String ftzhxgsj=null;
String ftftsj=null;
String grsm=null;
String ltnc=null;
String lttx=null;
String xsftzt=null;
int ftsl=0;
int htsl=0;
int hfcs=0;
int djcs=0;
int dqys=1;
int mysl=20;//每页显示数量
int htys=0;//回贴的页数
int yyy;
oracle.sql.CLOB clob1;
char ac[] = new char[299];
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	//更新帖子的查看数
	ls_sql="update nblt_ftgl set djcs=djcs+1 ";
	ls_sql+=" where tzbh='"+wheretzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select a.yhmc ftr,ftzt,hfcs,djcs,ftsj,fjmc,b.yhmc zhhfr,zhhfsj,tzbh,nblt_ftgl.bkbh bkbh,ftnr,fjym,sfyxhf,ftr ftygbh,ftsj ftftsj,zhxgsj ftzhxgsj,bkmc,ltnc,grsm,lttx,ftsl,htsl ";
	ls_sql+=" from  nblt_ftgl,sq_yhxx a,sq_yhxx b,nblt_bkgl,nblt_grzl";
	ls_sql+=" where nblt_grzl.ltid=nblt_ftgl.ftr and a.ygbh=nblt_ftgl.ftr and b.ygbh=nblt_ftgl.zhhfr and nblt_ftgl.bkbh=nblt_bkgl.bkbh and tzbh='"+wheretzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bkmc=cf.fillNull(rs.getString("bkmc"));
		ftftsj=cf.fillNull(rs.getString("ftftsj"));
		ftzhxgsj=cf.fillNull(rs.getString("ftzhxgsj"));

		ftr=cf.fillNull(rs.getString("ftr"));
		ftzt=cf.fillNull(rs.getString("ftzt"));
		tzbh=cf.fillNull(rs.getString("tzbh"));
		sfyxhf=cf.fillNull(rs.getString("sfyxhf"));

		ftsj=cf.fillNull(rs.getString("ftsj"));
		fjmc=cf.fillNull(rs.getString("fjmc"));
		fjym=cf.fillNull(rs.getString("fjym"));
		zhhfr=cf.fillNull(rs.getString("zhhfr"));
		zhhfsj=cf.fillNull(rs.getString("zhhfsj"));
		hfcs=rs.getInt("hfcs");
		djcs=rs.getInt("djcs");
		bkbh=cf.fillNull(rs.getString("bkbh"));
		clob1 = (oracle.sql.CLOB)rs.getObject("ftnr");
		Reader reader = clob1.getCharacterStream();
		while((yyy = reader.read(ac, 0, 299)) != -1)
		ftnr+= new String(ac, 0, yyy); //这就是取出来的大文本
//		ftnr=cf.fillNull(rs.getString("ftnr"));
		ftygbh=cf.fillNull(rs.getString("ftygbh"));

		ftsl=rs.getInt("ftsl");
		htsl=rs.getInt("htsl");
		grsm=cf.fillNull(rs.getString("grsm"));
		ltnc=cf.fillNull(rs.getString("ltnc"));
		lttx=cf.fillNull(rs.getString("lttx"));
	}
	rs.close();
	ps.close();	
	if (ftzt.length()>16)
	{
		xsftzt=ftzt.substring(0,16)+"...";
	}
	else
	{xsftzt=ftzt;}
	
	//计算回贴的页数
	htys=hfcs/mysl;
	if (hfcs%mysl>0)
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
	wheresql=" and lch<="+dqys+"*"+mysl+" and lch>("+dqys+"-1)*"+mysl+" ";


	
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
<center>
<form method="post" action="" name="insertform" target="">
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
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
<DIV id="div2222" align="center" style="float: left"><b>&nbsp;<%=hfcs%>&nbsp;</b></div>
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
		out.print("<DIV id=\"div2\"  onClick=\"f_tz(insertform,'"+mmk+"')\" title=\"跳转到 "+mmk+" 页\" align=\"center\"  style=\"float: left\"><b>"+mmk+"</b></div>");
		}
	}
	
}
%>
<input size=3 type="text" value="" name="rddqys" title="输入页数 回车">
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<%
if (dqys==1)
{
	%>
	</td><tr></table>
	
		
<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
<tr>
    <td colspan="2" bgcolor="#BBE9FF">
	<table style="word-break:break-all;word-wrap:break-word" width="100%" bgcolor="#F5FBFF" >
		<tr>
		<td width="90%">
		<span style="FONT-SIZE:12">&nbsp;&nbsp;<a href="ktz.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">首页</a>&nbsp;&nbsp;||&nbsp;&nbsp;<a href="zktz.jsp?bkbh=<%=bkbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>"><%=bkmc%></a>&nbsp;&nbsp;||&nbsp;&nbsp;<%=xsftzt%></span>
		</td>
		 <td width="10%" align="right">
		 <a href="newtz.jsp?bkbh=<%=bkbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>" onFocus=this.blur()><img src="image/newtopic.gif" border=0></a> 
		</td> 
		</tr>
</table>
</td>
  </tr>

  <tr>
    <td colspan="2" bgcolor="#FFFFFF">
	<div id="div10">
		<span style="FONT-SIZE:14" title="<%=ftzt%>"><b>主题：[<%=xsftzt%>]</b></span>
</DIV>
</td>
  </tr>
  <tr>
    <td width="200px" rowspan="3"  align="left" valign="top" bgcolor="#F5FBFF">
	<span style="FONT-SIZE:12">&nbsp;</span>
	<br><span style="FONT-SIZE:12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>昵称：<%=ltnc%></b></span>
	<br><span style="FONT-SIZE:12">&nbsp;</span>
	<DIV width="150px">
	<%
	  if (lttx!=null && !(lttx.equals("")))
		{
	  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"/nblt/grzlgl/lttx/"+lttx+".gif\">");
		 }
	  %>
	</DIV>
	<br><span style="FONT-SIZE:12">&nbsp;</span>
	<br><span style="FONT-SIZE:12">&nbsp;&nbsp;&nbsp;个人说明：<%=grsm%></span>
	</td>
    <td bgcolor="#FFFFFF"><div id="div3">
	<table style="word-break:break-all;word-wrap:break-word" width="95%">
	<tr>
	<td align="left"><span style="FONT-SIZE:12">发表于：<%=ftsj%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/nbyj/hltyj.jsp?whereyjzt=Re:<%=ftzt%>[来自论坛发帖]&wherefjrid=<%=ftygbh%>,&wherefjr=<%=ftr%>,&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>" title="给<%=ltnc%>发送系统内邮件">系统内邮件</a></span></td>
	<td align="right"><span style="FONT-SIZE:12" >楼主</span></td>
	</tr>
	</table>
	</DIV></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF">
	<div id="div4"><span style="FONT-SIZE:12"><%=ftnr%></span></DIV>
	<%
	//附件
	if (fjym!=null && !(fjym.equals("")))
	{out.print("附件：<a href =\"download.jsp?filepath="+strAbsPath+"\\fj\\&filename="+fjmc+"&fjym="+fjym+"\" target=\"_back\"><span style=\"FONT-SIZE:12\">"+fjym+"</span></a>");}
	//显示修改
	if (ftzhxgsj!=null && !(ftzhxgsj.equals(ftftsj)))
	{out.print("<span style=\"FONT-SIZE:12\"><br><I>[本贴最后编辑时间："+ftzhxgsj+"]</I></span>");}
		%>
	</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" align="right"><div id="div3"><span style="FONT-SIZE:12">
	<%
	if (ftygbh!=null && ftygbh.equals(dlygbh))
	{
		out.print("<a href=\"editft.jsp?tzbh="+tzbh+"&yhdlm="+yhdlm+"&ygbh="+ygbh+"\">编辑</a>");
	}
	%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></DIV></td>
  </tr>
</table>
	<%
}
%>


<%
String htltnc=null;
String htlttx=null;
int htftsl=0;
int hthtsl=0;
String htgrsm=null;

int lch=0;
String hfr=null;
String hfsj=null;
String zhxgsj=null;
String hfnr=null;
String yhfnr=null;
String hfhfsj=null;
String hfzhxgsj=null;

try {
	conn=cf.getConnection();
	ls_sql="select lch,yhmc hfrmc,hfsj,zhxgsj,hfnr,yhfnr,hfsj hfhfsj,zhxgsj hfzhxgsj,ltnc,lttx,ftsl,htsl,grsm,nblt_hfgl.hfr hfr";
	ls_sql+=" from nblt_hfgl,nblt_grzl,sq_yhxx ";
	ls_sql+=" where tzbh='"+wheretzbh+"' and nblt_grzl.ltid=nblt_hfgl.hfr and sq_yhxx.ygbh=nblt_hfgl.hfr ";
	ls_sql+=wheresql;
	ls_sql+=" order by lch ";
	//ls_sql+=" order by hfsj ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hfhfsj=cf.fillNull(rs.getString("hfhfsj"));
		hfzhxgsj=cf.fillNull(rs.getString("hfzhxgsj"));

		htygbh=cf.fillNull(rs.getString("hfr"));
		hfr=cf.fillNull(rs.getString("hfrmc"));
		hfsj=cf.fillNull(rs.getString("hfsj"));
		zhxgsj=cf.fillNull(rs.getString("zhxgsj"));
		hfnr=cf.fillNull(rs.getString("hfnr"));
		yhfnr=cf.fillNull(rs.getString("yhfnr"));
		lch=rs.getInt("lch");
		htltnc=cf.fillNull(rs.getString("ltnc"));
		htlttx=cf.fillNull(rs.getString("lttx"));
		htftsl=rs.getInt("ftsl");
		hthtsl=rs.getInt("htsl");
		htgrsm=cf.fillNull(rs.getString("grsm"));

		%>
		<DIV height="4px">&nbsp;</DIV>
		<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
		  <tr>
			<td width="200PX" rowspan="3"  align="left" valign="top" bgcolor="#F5FBFF">
			<span style="FONT-SIZE:12">&nbsp;</span>
			<br><span style="FONT-SIZE:12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>昵称：<%=htltnc%></b></span>
			<br><span style="FONT-SIZE:12">&nbsp;</span>
			<DIV width="150px">
			<%
			  if (htlttx!=null && !(htlttx.equals("")))
				{
			  out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"/nblt/grzlgl/lttx/"+htlttx+".gif\">");
				 }
			  %>
			</DIV>
			<br><span style="FONT-SIZE:12">&nbsp;</span>
			<br><span style="FONT-SIZE:12">&nbsp;&nbsp;&nbsp;个人说明：<%=htgrsm%></span>
			</td>
			<td bgcolor="#FFFFFF"><div id="div3">
			<table style="word-break:break-all;word-wrap:break-word" width="95%">
			<tr>
			<td align="left"><span style="FONT-SIZE:12">回复于：<%=hfsj%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/nbyj/hltyj.jsp?whereyjzt=Re:<%=ftzt%>[来自论坛回贴]&wherefjrid=<%=htygbh%>,&wherefjr=<%=hfr%>,&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>"  title="给<%=htltnc%>发送系统内邮件">系统内邮件</a></span></td>
			<td align="right"><span style="FONT-SIZE:12" ><%=lch%>楼</span></td>
			</tr>
			</table>
			</DIV></td>
		  </tr>
		  <tr>
			<td bgcolor="#FFFFFF"><div id="div4" width="100%"><span style="FONT-SIZE:12"><%=hfnr%></span></DIV>
			<%
	//显示修改
	if (hfzhxgsj!=null && !(hfzhxgsj.equals(hfhfsj)))
	{out.print("<span style=\"FONT-SIZE:12\"><br><I>[本贴最后编辑时间："+hfzhxgsj+"]</I></span>");}
		%>
			
			</td>
		  </tr>
		  <tr>
			<td bgcolor="#FFFFFF" align="right"><div id="div3"><span style="FONT-SIZE:12">
	<%
	if (htygbh!=null && htygbh.equals(dlygbh))
	{
			out.print("<a href=\"editht.jsp?tzbh="+tzbh+"&lch="+lch+"&yhdlm="+yhdlm+"&ygbh="+ygbh+"\">编辑</a>");
		}
	%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></DIV></td>
		  </tr>
		</table>
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
<table width="98%"><tr><td align="left">
<DIV id="div2222" align="center" style="float: left"><b>&nbsp;<%=hfcs%>&nbsp;</b></div>
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
		out.print("<DIV id=\"div2\"  onClick=\"f_tz(insertform,'"+mmk2+"')\" title=\"跳转到 "+mmk2+" 页\" align=\"center\"  style=\"float: left\"><b>"+mmk2+"</b></div>");
		}
	}
	
}
%>
<input size=3 type="text" value="" name="rddqys2"  title="输入页数 回车">
<DIV height="4px">&nbsp;</DIV>
<%
if (sfyxhf!=null && sfyxhf.equals("Y"))
{
	%>
<!-- 回贴部分 -->

<DIV height="4px">&nbsp;</DIV>
<table style="word-break:break-all;word-wrap:break-word" width="100%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
  <tr>
    <td colspan="2" bgcolor="#FFFFFF">
	<div id="div0">
	<table width="100%">
	<tr width="100%">
	<td width="90%"><span style="FONT-SIZE:14" width="100%"><b>&nbsp;&nbsp;&nbsp;</b></span></td>
	<td><span style="FONT-SIZE:14"><b><a href="gjht.jsp?tzbh=<%=wheretzbh%>">高级回贴</a></b></span></td>
	</tr>
	</table>
		
</DIV>
</td>
  </tr>
  <tr>
    <td width="30%"   align="left" valign="top" bgcolor="#F5FBFF">
	<span style="FONT-SIZE:12">&nbsp;</span>
	<DIV>
	<%
		String tpmcs=null;
		for (int i=1;i<37;i++)
		{
			tpmcs=String.valueOf(i);
			tpmcs=cf.addZero(tpmcs,3);
			out.print("<img src=\"/nblt/fwlt/image/"+tpmcs+".gif\" width=\"30px\" onClick=\"f_bq(insertform,'"+tpmcs+".gif')\">&nbsp;");
			if (i%6==0)
			{out.print("<br>&nbsp;");}
		}
	%>
	</DIV>
	</td>
    <td bgcolor="#FFFFFF"><div id="div3">
	<input name="tzbh" value="<%=wheretzbh%>" type="hidden">
	<DIV><b>&nbsp;&nbsp;内容：</b><DIV><textarea name="hfnr" cols="65" rows="10" id="Description" ></textarea> 
	<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;<input type="button" name="tttr" value=" 回 复 " onClick="f_ph(insertform)"  class=butt title="快速回复">
	</DIV></td>
  </tr>
</table>
</center>
	<%
}
%>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
</form>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ph(FormName)//参数FormName:Form的名称
{
	var nnu=document.getElementById('Description').value;
//	alert(document.getElementById('Description').value);
	if (nnu==null || nnu=="") 
	{
		alert("请输入[内容]！");
		FormName.hfnr.focus();
		return false;
	}
	if (nnu.length>=500) 
	{
		alert("回复内容不能超过500字！！！");
		FormName.hfnr.focus();
		return false;
	}

	
	FormName.action="tjksht.jsp";
	FormName.submit();
	return true;

}
function f_bq(FormName,tpmc)//参数FormName:Form的名称
{
document.getElementById('Description').value+= "<img src=\"/nblt/fwlt/image/"+tpmc+"\">"; 

//	FormName.tttr.value+=tpmc;
}
function f_tz(FormName,djys)//参数FormName:Form的名称
{
//	alert(djys+<%=tzbh%>);
	FormName.action="cktz.jsp?ys="+djys+"&tzbh=<%=wheretzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
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
				FormName.action="cktz.jsp?ys="+FormName.rddqys2.value+"&tzbh=<%=wheretzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
			}
			else
			{
				FormName.action="cktz.jsp?ys="+FormName.rddqys.value+"&tzbh=<%=wheretzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
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