<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
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
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
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


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

%>
<body leftmargin=0 topmargin=0  oncontextmenu='return false' ondragstart='return false' onselectstart ='return false' onselect='document.selection.empty()' oncopy='document.selection.empty()' onbeforecopy='return false' onmouseup='document.selection.empty()'>


<noscript> 
<iframe src="*.htm"></iframe> 
</noscript>



<div align="center">
  <table width="100%" border="0">
    <tr> 
      <td width="48%"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025"></span><br></td>
      <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;http://www.yz-china.com</td>
    </tr>
    <tr> 
      <td colspan="3" > <div align="center"> 
          <hr>
          <b><font size="5">增减前情况</font></b></div></td>
    </tr>
  </table>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>客户姓名：<%=khxm%></td>
    <td>联系方式：<%=lxfs%></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>工程地点：<%=fwdz%></td>
    <td>设 计 师：<%=sjs%></td>
    <td>工程等级：<%=bjjb%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">序号</td>
    <td  width="8%" align="center">项目编号</td>
    <td  width="15%" align="center">项目名称</td>
    <td  width="6%" align="center">单位</td>
    <td  width="8%" align="center">单价（元）</td>
    <td  width="6%" align="center">数量</td>
    <td  width="8%" align="center">金额（元）</td>
    <td  width="45%" align="center">工艺做法及材料说明</td>
  </tr>

<%
	int i=0;
	ls_sql="SELECT bj_fjxxq.jgwzbm";
	ls_sql+=" FROM bj_fjxxq ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxxq.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmxq.sl) sl,sum(bj_gclmxq.sl*bj_bjxmmxq.dj) as je";
		ls_sql+=" FROM bj_bjxmmxq,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.khbh='"+khbh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
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
			<td colspan="8"> 
			  <div align="right"><b><i><font size="3">结构位置：<%=jgwzmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				小计：<%=cf.formatDouble(xjqye,"#########.##")%>元</font></i></b></div>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,trim(bj_bjxmmxq.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxq.khbh=bj_gclmxq.khbh and bj_bjxmmxq.dqbm=bj_gclmxq.dqbm and bj_bjxmmxq.xmbh=bj_gclmxq.xmbh";
		ls_sql+=" order by bj_bjxmmxq.xmpx";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="8%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="6%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
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
    <td align="right" colspan="8"><i><b><font size="3">直接费合计：<%=cf.formatDouble(allqye,"#########.##")%>元</font></b></i></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"> 
      <div align="center"><b><i><font size="3">综合取费</font></i></b></div>
    </td>
  </tr>
  <%  
	double zqsfje=0;
	double allzqsfje=0;
	int temp=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,zqsfje,bz";
	ls_sql+=" FROM bj_sfxmmxq  ";
    ls_sql+=" where bj_sfxmmxq.zjxxh='"+zjxxh+"' and bj_sfxmmxq.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmxq.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		zqsfje=rs.getDouble("zqsfje");

		allzqsfje+=zqsfje;
		temp++;

		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td align="center" width="11%" ><%=temp%></td>
			<td align="center" width="15%" ><%=sfxmmc%></td>
			<td align="center" width="21%" >&nbsp;</td>
			<td align="center" width="8%"><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" width="45%"><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	allzj=allzqsfje+allqye;

%> 
  <tr bgcolor="#FFFFFF" align="right"> 
    <td colspan="5"><i><b><i><font size="3">综合取费</font></i><font size="3">合计：<%=cf.formatDouble(allzqsfje,"#########.##")%>元&nbsp;&nbsp;&nbsp;&nbsp;</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="5"><i><b><font size="3">总 计：<%=cf.formatDouble(allzj,"#########.##")%>元</font></b></i></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr> 
    <td height="33">&nbsp;&nbsp;&nbsp;甲方签字：</td>
    <td height="33">乙方签字：</td>
  </tr>

</table>
<br>
<table border="0" width="100%" cellspacing="0"  style='FONT-SIZE: 12px'>
  <tr> 
    <td colspan="5" align="left" valign="top"><p> &nbsp;&nbsp;&nbsp;&nbsp;如果报价中出现实际面积与计算面积不符的情况，按实际施工面积为准结算，我们将非常感谢您对我们工作的支持！</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;家居产品部分报价说明：</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;1、此电子报价内容为产品标准尺寸的统一报价，所有异型或非标产品价格另有计价标准。</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;2、报价中不含配件、电器等的价格，如橱柜中不含：装饰板、封管板、防水铝箔、电器、水盆、拉篮、龙头、挂件等；家具不含：铰链、拉手、衣镜等；木门不含：铰链、拉手等。</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;3、详细报价见单项报价表格。</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;4、物业管理费，无任何名目，任何形式由甲方负担。</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;5、物业押金，无任何形式，名目，由甲方负责交纳。</p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;6、水电费由甲方负责，乙方施工中所用的水电费用由甲方支付。</p>
      </td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
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

<script  LANGUAGE="javascript">
<!--

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





