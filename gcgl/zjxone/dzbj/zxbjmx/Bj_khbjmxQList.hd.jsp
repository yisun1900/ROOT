<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();
//pageObj.setType("EXCEL",response);

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
double xjxmje=0;
double allzcje=0;
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
String bjjbmc=null;
String dqbm="";
double zcbjje=0;
double hbqye=0;


try {
	conn=cf.getConnection();
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc";
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
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(je)";
	ls_sql+=" FROM bj_zcbjmxq";
	ls_sql+=" where  khbh='"+khbh+"' and zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcbjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//获取电子报价金额
	zjqye=dzbj.getZjxQAllBjje(conn,khbh,zjxxh,"yz")+zcbjje;
    hbqye=dzbj.getZjxQBjje(conn,khbh,zjxxh,"yz","3");

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> </div>
<table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC"  bgcolor="#FFFFFF" style='FONT-SIZE: 12px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" rowspan="3" ><img src="/images/tubiao.jpg" ></td>
    <td colspan="3" rowspan="4">&nbsp;</td>
    <td rowspan="2">公司(总部)地址：深圳市华侨城汉唐大厦六楼 </td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td  width="49%">电话：0755-26948699 &nbsp;&nbsp;&nbsp; 0755-26948389 </td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" >http://www.szhaida.com</td>
    <td  width="49%">传真：0755-26948608 </td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7"  align="center"> <b><font size="5">（<%=bjjbmc%>）预算书</font></b> 
    </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC"  bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" > 客户姓名：<%=khxm%></td>
    <td colspan="3">设 计 师：<%=sjs%></td>
    <td  width="49%">金额总计：<%=cf.formatDouble(zjqye,"#########.##")%>元
	；主材：<%=cf.formatDouble(zcbjje,"#########.##")%>元
	；环保：<%=cf.formatDouble(hbqye,"#########.##")%>元</td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="3" >联系方式：<%=lxfs%></td>
    <td colspan="4">工程地点：<%=fwdz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td  width="4%"  align="center">序号</td>
    <td  width="8%" align="center">项目编号</td>
    <td  width="18%" align="center">项目名称</td>
    <td  align="center">单价:元/单位</td>
    <td  width="5%" align="center">数量</td>
    <td  width="8%" align="center">金额（元）</td>
    <td  width="49%" align="center">工艺做法及材料说明</td>
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
		
		//输出标题
		%> 
  <tr bordercolor="#FFFFFF" bgcolor="#FFFFFF"> 
    <td colspan="7"> 
      <div align="center"><b><i><font size="3">结构位置：<%=jgwzmc%></font></i></b></div>
    </td>
  </tr>
  <%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxq.xh xh,trim(bj_bjxmmxq.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxq.dj,bj_gclmxq.sl,bj_gclmxq.sl*bj_bjxmmxq.dj as je,gycl";
		ls_sql+=" FROM bj_bjxmmxq,jdm_jldwbm,bj_gclmxq,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxq.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxq.khbh='"+khbh+"' and bj_gclmxq.jgwzbm='"+jgwzmc+"' and bj_bjxmmxq.zjxxh='"+zjxxh+"' and bj_gclmxq.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxq.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2','3')";
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


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;
			xjxmje+=qye;


			row++;
			//输出每行数据
			%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td width="4%" align="center"><%=row%></td>
    <td width="8%" align="center"><%=xmbh%></td>
    <td width="18%" align="center"><%=xmmc%></td>
    <td align="center"><%=dj%>/<%=jldwmc%></td>
    <td width="5%" align="center"><%=cf.formatDouble(sl)%></td>
    <td width="8%" align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
    <td width="49%" align="left"><%=gycl%></td>
  </tr>
  <%
		}
		ps.close();
		rs.close();

		//输出小计
		%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7" align="right"><b><i><font size="3"><%=oldjgwzmc%>小计：<%=cf.formatDouble(xjqye,"#########.##")%>元&nbsp;</font></i></b></td>
  </tr>
  <%
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7" align="right"><i><b><font size="3">直接费合计：<%=cf.formatDouble(xjxmje,"#########.##")%>元</font></b></i></td>
  </tr>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
      <td colspan="7"> 
      <div align="center"><b><i><font size="3">综合取费</font></i></b></div>
    </td>
  </tr>
  <%  
	double sfje=0;
	double allsfje=0;

	String sfxmmc=null;
	String bz=null;
	ls_sql="SELECT sfxmmc,sfje,bz";
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
		sfje=rs.getDouble("sfje");

		allsfje+=sfje;

		%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td  width="4%" align="center">&nbsp;</td>
    <td  width="8%" align="center">&nbsp;</td>
    <td  width="18%" align="center"><%=sfxmmc%></td>
    <td align="center">&nbsp;</td>
    <td  width="5%" align="center">&nbsp;</td>
    <td  width="8%" align="center"><%=cf.formatDouble(sfje,"#########.##")%></td>
    <td  width="49%"><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
%> 
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="7" align="right"><i><b><font size="3">综合取费合计：<%=cf.formatDouble(allsfje,"#########.##")%>元</font></b></i></td>
  </tr>

<%
	if (zcbjje>0)
	{
		%>
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
			  <td colspan="7"> 
			  <div align="center"><b><i><font size="3">主材报价</font></i></b></div>
			</td>
		  </tr>
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF" align="center"> 
			<td  width="4%" >序号</td>
			<td colspan="2"  width="26%" align="center">主材名称</td>
			<td align="center">单价:元/单位</td>
			<td  width="5%" align="center">数量</td>
			<td  width="8%" align="center">金额</td>
			<td  width="49%">备注</td>
		  </tr>
		  <%  
			double zcje=0;

			String zcmc=null;
			String jldwbm=null;
			row=0;
			ls_sql="SELECT zcmc,jldwbm,dj,sl,je,bz";
			ls_sql+=" FROM bj_zcbjmxq  ";
			ls_sql+=" where bj_zcbjmxq.khbh='"+khbh+"' and bj_zcbjmxq.zjxxh='"+zjxxh+"'";
			ls_sql+=" order by bj_zcbjmxq.xh";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				zcmc=cf.fillHtml(rs.getString("zcmc"));
				jldwbm=cf.fillHtml(rs.getString("jldwbm"));
				dj=rs.getDouble("dj");
				sl=rs.getDouble("sl");
				zcje=rs.getDouble("je");
				bz=cf.fillHtml(rs.getString("bz"));

				allzcje+=zcje;

				row++;

				%> 
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
			<td  width="4%" align="center"><%=row%></td>
			<td colspan="2"  width="26%" align="center"><%=zcmc%></td>
			<td align="center"><%=dj%>/<%=jldwbm%></td>
			<td  width="5%" align="center"><%=sl%></td>
			<td  width="8%" align="center"><%=cf.formatDouble(zcje,"#########.##")%></td>
			<td  width="49%"><%=bz%></td>
		  </tr>
		  <%
			}
			rs.close();
			ps.close();
		%> 
		  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
			<td colspan="7" align="right"><i><b><font size="3">主材报价合计：<%=cf.formatDouble(allzcje,"#########.##")%>元</font></b></i></td>
		  </tr>
		<%
	}

	allzj=allzcje+allsfje+xjxmje;
%>


  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
	<td colspan="7" align="right"><i><b><font size="3">总 计：<%=cf.formatDouble(allzj,"#########.##")%>元</font></b></i></td>
  </tr>


</table>
<table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC"  bgcolor="#FFFFFF" style='FONT-SIZE: 12px'>
  <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF"> 
    <td colspan="5" height="39">甲方签字：</td>
    <td colspan="2" height="39">乙方签字：</td>
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