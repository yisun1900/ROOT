<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();
pageObj.setType("EXCEL",response);

String khbh=request.getParameter("khbh");

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
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
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
<body >

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" ><span lang=EN-US><img src="tubiao.jpg" v:shapes="_x0000_i1025"></span></td>
    <td align="center" >&nbsp;</td>
    <td align="right" >http://www.yz-china.com</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" ><b><font size="5">预算书</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >设 计 师：<%=sjs%></td>
    <td >联系方式：<%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6">工程地点：<%=fwdz%></td>
    <td align="left" >工程等级：<%=bjjb%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">序号</td>
    <td  width="8%" align="center">项目编号</td>
    <td  width="18%" align="center">项目名称</td>
    <td  width="9%" align="center">单价:元/单位</td>
    <td  width="6%" align="center">数量</td>
    <td  width="8%" align="center">金额（元）</td>
    <td  width="47%" align="center">工艺做法及材料说明</td>
  </tr>
  <%
	int i=0;
	ls_sql="SELECT bj_fjxx.jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
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
    <td colspan="7"> 
      <div align="right"><b><i><font size="3">结构位置：<%=jgwzmc%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        小计：<%=cf.formatDouble(xjqye,"#########.##")%>元</font></i></b></div>
    </td>
  </tr>
  <%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmx.xh xh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_bjxmmx.xmpx,bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
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
    <td align="center"><%=row%></td>
    <td align="center"><%=xmbh%></td>
    <td align="center"><%=xmmc%></td>
    <td align="center"><%=dj%>/<%=jldwmc%></td>
    <td align="center"><%=cf.formatDouble(sl)%></td>
    <td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
    <td align="left"><%=gycl%></td>
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
    <td align="right" colspan="7"><i><b><font size="3">直接费合计：<%=cf.formatDouble(allqye,"#########.##")%>元</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" align="center"><b><i><font size="3">综合取费</font></i></b></td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;
	int temp=0;
	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;
		temp++;

		%> 
  <tr bgcolor="#FFFFFF" align="center" > 
    <td><%=temp%></td>
    <td colspan="2"><%=sfxmmc%></td>
    <td colspan="2">&nbsp;</td>
    <td><%=cf.formatDouble(sfje,"#########.##")%></td>
    <td align="left" ><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="7"><i><b><font size="3">综合取费合计：<%=cf.formatDouble(allsfje,"#########.##")%>元</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="7"><i><b><font size="3">总 计：<%=cf.formatDouble(allzj,"#########.##")%>元</font></b></i></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="42">甲方签字：</td>
    <td colspan="2" height="42">乙方签字：</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >如果报价中出现实际面积与计算面积不符的情况，按实际施工面积为准结算，我们将非常感谢您对我们工作的支持！</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >家居产品部分报价说明：</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" > 
      <p>1、此电子报价内容为产品标准尺寸的统一报价，所有异型或非标产品价格另有计价标准。</p>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" > 
      <p>2、报价中不含配件、电器等的价格，如橱柜中不含：装饰板、封管板、防水铝箔、电器、水盆、拉篮、龙头、挂件等；家具不含：铰链、拉手、衣镜等；木门不含：铰链、拉手等。</p>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >3、详细报价见单项报价表格。</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >4、物业管理费，无任何名目，任何形式由甲方负担。</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >5、物业押金，无任何形式，名目，由甲方负责交纳。</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >6、水电费由甲方负责，乙方施工中所用的水电费用由甲方支付。</td>
  </tr>
</table>
<br>
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






