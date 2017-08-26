<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>


<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String tccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));


String bjjbbm=null;
String ssfgs=null;
String dqbm=null;
String cldlmc=null;

double sjjmsl=0;//实际减免数量
double sjsl=0;//实际数量
String txxx="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bjjb,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjb"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();



	ls_sql="select sjjmsl,sjsl";
	ls_sql+=" FROM tc_csrjkhczjmj";
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");
	}
	rs.close();
	ps.close();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">

<div align="center">录入常用套餐外项目（独立收费）</div>

<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="3%">序号</td>
	<td  width="4%"><span class="STYLE2">数量</span></td>
	<td  width="5%"><span class="STYLE2">单价</span></td>
	<td  width="6%"><span class="STYLE2">结构位置</span></td>
	<td  width="9%"><span class="STYLE2">配套说明</span></td>
	<td  width="4%">类型</td>
	<td  width="5%">编组名称</td>
	<td  width="8%">产品名称</td>
	<td  width="7%">品牌</td>
	<td  width="8%">型号</td>
	<td  width="8%">规格</td>
	<td  width="13%">备注</td>
	<td  width="4%">计量单位</td>
	<td  width="6%">产品类别</td>
	<td  width="5%">报价级别</td>
</tr>
<%
	String sxh=null;
	String bjjbmc=null;
	String sl=null;
	String ptcpsm=null;
	String clxlmc=null;
	String jgwzbm=null;

	String bzmc=null;
	String cpmc=null;
	String cpbm=null;
	String nbbm=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	String ppmc=null;
	double dj=0;
	String bz=null;
	String lx=null;
	String zp=null;

	ls_sql="SELECT DECODE(tc_csrjkhzcqd.lx,'1','标配','2','升级','3','独立收费') lx,tc_csrjkhzcqd.bz,tc_csrjkhzcqd.dj,tc_csrjkhzcqd.sxh,bjjbmc,tc_csrjkhzcqd.sl,tc_csrjkhzcqd.jgwzbm,tc_csrjkhzcqd.ptcpsm,tc_csrjkhzcqd.bzmc,tc_csrjkhzcqd.cpbm,tc_csrjkhzcqd.cpmc,tc_csrjkhzcqd.ppmc,tc_csrjkhzcqd.xh,tc_csrjkhzcqd.gg,tc_csrjkhzcqd.jldw,clxlmc ";
	ls_sql+=" FROM bdm_bjjbbm,tc_csrjkhzcqd,jxc_clxlbm  ";
    ls_sql+=" where tc_csrjkhzcqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjkhzcqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tc_csrjkhzcqd.khbh='"+khbh+"' and tc_csrjkhzcqd.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" order by tc_csrjkhzcqd.ppmc,tc_csrjkhzcqd.cpmc,tc_csrjkhzcqd.sxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lx=cf.fillHtml(rs.getString("lx"));
		bz=cf.fillHtml(rs.getString("bz"));
		jgwzbm=cf.fillHtml(rs.getString("jgwzbm"));
		dj=rs.getDouble("dj");
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=cf.fillNull(rs.getString("sl"));
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		bzmc=cf.fillHtml(rs.getString("bzmc"));
		cpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		clxlmc=cf.fillHtml(rs.getString("clxlmc"));

		%>
		<tr bgcolor="#FFFFFF" align='center'>
		  <td>
			<A HREF="DeleteBj_khzcxmTwzc.jsp?khbh=<%=khbh%>&sxh=<%=sxh%>" target="_blank">删除</A>
			<A HREF="EditBj_khzcxmTwzc.jsp?khbh=<%=khbh%>&sxh=<%=sxh%>" target="_blank">修改</A>
		  </td>
		  <td><%=sxh%></td>
		  <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=jgwzbm%></td>
		  <td><%=ptcpsm%></td>
		  <td><%=lx%></td>
		  <td><%=bzmc%></td>
		  <td><%=cpmc%></td>
		  <td><%=ppmc%></td>
		  <td><%=xh%></td>
		  <td><%=gg%></td>
		  <td><%=bz%></td>
		  <td><%=jldw%></td>
		  <td><%=clxlmc%></td>
		  <td><%=bjjbmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">客户编号</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">报价级别</span></td> 
  <td width="32%">
	<select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">产品大类</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">产品小类</span></td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"'",tccplbbm);
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">实际数量</span></td>
  <td><%=sjsl%></td>
  <td align="right"><span class="STYLE4">实际减免数量</span></td>
  <td><%=sjjmsl%></td>
</tr>


    <tr align="center"> 
      <td colspan="4">&nbsp;</td>
    </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">编组名称</td>
	<td  width="6%">内部编码</td>
	<td  width="8%">品牌</td>
	<td  width="8%">产品名称</td>
	<td  width="11%">型号</td>
	<td  width="11%">规格</td>
	<td  width="6%">单位</td>
	<td  width="7%">分类</td>
	<td  width="7%">收费</td>
	<td  width="15%">备注</td>
	<td  width="11%">照片</td>
</tr>


<%
//	String bzmc=null;

//	String cpmc=null;
//	String cpbm=null;
//	String nbbm=null;
//	String xh=null;
//	String gg=null;
//	String jldw=null;
//	String ppmc=null;
	String zcbjjbbm=null;
	String zcbjjbmc=null;


	ls_sql="SELECT distinct bzmc ";
	ls_sql+=" FROM tc_csrjzck";
    ls_sql+=" where tccplbbm='"+tccplbbm+"' and  dqbm='"+dqbm+"' ";
    ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
    ls_sql+=" order by bzmc ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		bzmc=cf.fillNull(rs1.getString("bzmc"));

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM tc_csrjzck";
		ls_sql+=" where tccplbbm='"+tccplbbm+"' and  dqbm='"+dqbm+"'";
		ls_sql+=" and  bzmc='"+bzmc+"' ";
		ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT cpmc,cpbm,nbbm,xh,gg,jldw,ppmc,tc_csrjzck.bjjbbm,bjjbmc,bz,zp,khxsdj";
		ls_sql+=" FROM tc_csrjzck,bdm_bjjbbm";
		ls_sql+=" where tc_csrjzck.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
		ls_sql+=" and tccplbbm='"+tccplbbm+"' and  dqbm='"+dqbm+"'";
		ls_sql+=" and bzmc='"+bzmc+"' ";
		ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
		ls_sql+=" order by bzmc,ppmc,cpmc,xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cpmc=cf.fillNull(rs.getString("cpmc"));
			cpbm=cf.fillNull(rs.getString("cpbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=cf.fillNull(rs.getString("jldw"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			zcbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
			zcbjjbmc=cf.fillNull(rs.getString("bjjbmc"));
			bz=cf.fillHtml(rs.getString("bz"));
			zp=cf.fillNull(rs.getString("zp"));
			dj=rs.getDouble("khxsdj");

			
			if (!zp.equals(""))
			{
				zp="<img src=\"\\tc\\csrjtc\\zck\\images\\"+zp+"\" width=\"100\">";
			}
			else{
				zp="&nbsp;";
			}

			%>
			<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td rowspan="<%=count%>">
				<A HREF="SaveInsertBj_khzcxmTwzc.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&bzmc=<%=bzmc%>">选择</A>
			  </td>
			  <td rowspan="<%=count%>"><%=bzmc%></td>
			  <td><%=nbbm%></td>
			  <td><%=ppmc%></td>
			  <td><%=cpmc%></td>
			  <td><%=xh%></td>
			  <td><%=gg%></td>
			  <td><%=jldw%></td>
			  <td><%=zcbjjbmc%></td>
			  <td><%=dj%></td>
			  <td><%=bz%></td>
			  <td><%=zp%></td>
			</tr>
			<%
		}

		while (rs.next())
		{
			cpmc=cf.fillNull(rs.getString("cpmc"));
			cpbm=cf.fillNull(rs.getString("cpbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=cf.fillNull(rs.getString("jldw"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			zcbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
			zcbjjbmc=cf.fillNull(rs.getString("bjjbmc"));
			bz=cf.fillHtml(rs.getString("bz"));
			zp=cf.fillNull(rs.getString("zp"));
			dj=rs.getDouble("khxsdj");


			if (!zp.equals(""))
			{
				zp="<img src=\"\\tc\\csrjtc\\zck\\images\\"+zp+"\" width=\"100\">";
			}
			else{
				zp="&nbsp;";
			}

			%>
			<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			  <td><%=nbbm%></td>
			  <td><%=ppmc%></td>
			  <td><%=cpmc%></td>
			  <td><%=xh%></td>
			  <td><%=gg%></td>
			  <td><%=jldw%></td>
			  <td><%=zcbjjbmc%></td>
			  <td><%=dj%></td>
			  <td><%=bz%></td>
			  <td><%=zp%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}
	rs1.close();
	ps1.close();

	ls_sql="SELECT cpmc,cpbm,nbbm,xh,gg,jldw,ppmc,tc_csrjzck.bjjbbm,bjjbmc,bz,zp,khxsdj";
	ls_sql+=" FROM tc_csrjzck,bdm_bjjbbm";
	ls_sql+=" where tc_csrjzck.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and tccplbbm='"+tccplbbm+"' and  dqbm='"+dqbm+"'";
	ls_sql+=" and  bzmc is null";
	ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)) )";
	ls_sql+=" order by bzmc,ppmc,cpmc,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpmc=cf.fillNull(rs.getString("cpmc"));
		cpbm=cf.fillNull(rs.getString("cpbm"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		zcbjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		zcbjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		zp=cf.fillNull(rs.getString("zp"));
		dj=rs.getDouble("khxsdj");



		if (!zp.equals(""))
		{
			zp="<img src=\"\\tc\\csrjtc\\zck\\images\\"+zp+"\" width=\"100\">";
		}
		else{
			zp="&nbsp;";
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td>
			<A  HREF="SaveInsertBj_khzcxmTwzc.jsp?khbh=<%=khbh%>&tccpdlbm=<%=tccpdlbm%>&tccplbbm=<%=tccplbbm%>&cpbm=<%=cpbm%>">选择</A>
		  </td>
		  <td>&nbsp;</td>
		  <td><%=nbbm%></td>
		  <td><%=ppmc%></td>
		  <td><%=cpmc%></td>
		  <td><%=xh%></td>
		  <td><%=gg%></td>
		  <td><%=jldw%></td>
		  <td><%=zcbjjbmc%></td>
		  <td><%=dj%></td>
		  <td><%=bz%></td>
		  <td><%=zp%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	
	
%>
</table>

<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR><BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</form>

</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
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


