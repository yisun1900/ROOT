<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>

<style>
@media print{
	INPUT {display:none}
}
</style>

</head>


<%
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
double cldj=0;
double rgdj=0;
double sl=0;
double qye=0;
String gycl=null;
String bjbz=null;
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
String dh=null;
String sjhth=null;
String hxbm=null;
String fwmj=null;
Reader is=null;
BufferedReader br=null;


try {
	conn=cf.getConnection();
	//ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,ssfgs,sq_yhxx.dh dh";
	//ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    //ls_sql+=" where khbh='"+khbh+"'";
	//ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.sjsgh=sq_yhxx.bianhao(+)";
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,sjhth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,hxbm,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_zxkhxx.sjsgh=sq_yhxx.bianhao(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		dh=cf.fillHtml(rs.getString("dh"));
		sjhth=rs.getString("sjhth");
		hxbm=cf.fillHtml(rs.getString("hxbm"));
		fwmj=cf.fillHtml(rs.getString("fwmj"));
	}
	rs.close();
	ps.close();

	oracle.sql.CLOB  clob=null;

	ls_sql="select dzbjbz";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
	}
	rs.close();
	ps.close();

	dzbjbz="";

	if(clob!=null){
		is=clob.getCharacterStream();
		br=new BufferedReader(is);
		String s=br.readLine();
		while(s!=null)
		{
			dzbjbz+=s+",";
			s=br.readLine();
		}

		br.close();
		is.close();
	}

	if (dzbjbz==null)
	{
		dzbjbz="";
	}
	if (dzbjbz.length()>1)
	{
		dzbjbz=dzbjbz.substring(0,dzbjbz.length()-1);
	}
	else{
		dzbjbz="";
	}


	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//输入:  lx 9：检查全部；1：检查单价；2：检查名称；3：检查工艺材料简介；4：检查报价级别；5：检查必选项目；6：检查不存在项目；7：检查关联项目
	String retStr=dzbj.checkBjjb(conn,khbh,9);
	if (!retStr.equals("0"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
			alert("电子报价检查错误！\r\n<%=retStr%>");
		//-->
		</SCRIPT>
		<%
	}

%>
<body >
<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0" style='FONT-SIZE: 14px'>

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr>
	<td>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
    <td align="center">&nbsp;</td>
   <!--  <td align="right">http://www.jrchina.com</td> -->
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="5">家装饰工程有限公司</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="3">住宅室内装饰装修工程预算报价书（各部位）</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" >工程名称：<%=khxm%>《<%=fwdz%>》家装工程</td>
	<td align="center">建筑面积：<%=fwmj%>㎡</td>
    <td align="left">业主名称：<%=khxm%></td>
	<td  colspan="3">设计师：<%=sjs%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="3%" align="center" rowspan="2">序号</td>
    <td  width="9%" align="center" rowspan="2">项目编号</td>
    <td  width="15%" align="center" rowspan="2">项目名称</td>
	<td  width="5%" align="center" rowspan="2">数量</td>
    <td  width="3%" align="center" rowspan="2">单位</td>
    <td  width="10%" align="center" colspan="2">单价</td>
    <td  width="8%" align="center" rowspan="2">金额（元）</td>
    <td  width="49%" align="center" rowspan="2">备注</td>
  </tr>
  <tr bgcolor="#CCCCCC">
  <td  width="5%" align="center" >材料</td>
  <td  width="5%" align="center">人工费</td>
  </tr>
</table>

  </td></tr>
</THEAD>
<TBODY>
<tr>
<td>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

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
		rs.close();
		ps.close();

		allsl+=xjsl;
		allqye+=xjqye;
		
		//输出标题
		%> 
		
		<%

		//输出项目明细
		ls_sql="SELECT  bj_bjxmmx.xh xh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,bj_bjxmmx.xmmc,jldwmc,bj_bjxmmx.cldj,bj_bjxmmx.rgdj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je,bj_bjxmmx.gycl,bj_bjxmmx.bz";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_bjxmmx.xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			cldj=rs.getDouble("cldj");
			rgdj=rs.getDouble("rgdj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  <% //if(row%8==0) out.print("style=\"page-break-after:always;\" ");%>> 
				<td width="3%" align="center"><%=row%></td>
				<td width="9%" align="center"><%=xmbh%></td>
				<td width="15%" align="center"><%=xmmc%></td>
				<td width="5%" align="center"><%=cf.formatDouble(sl)%></td>
				<td width="3%" align="center"><%=jldwmc%></td>
				<td width="5%" align="center"><%=cf.formatDouble(cldj,"#########.##")%></td>
				<td width="5%" align="center"><%=cf.formatDouble(rgdj,"#########.##")%></td>
				<td width="8%" align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td width="49%" align="left"><%=bjbz%></td>
			  </tr>
			
			<%
		}
		rs.close();
		ps.close();
		%>
	    <tr bgcolor="#FFFFFF" <% //if("客厅".equals(jgwzmc)) out.print("style=\"page-break-after:always;\" ");%>> 
			<td colspan="3" > 
			  <div align="center"><b><i><font size="3"><%=jgwzmc%> </font></i></b></div></td>
			  <td colspan="4" align="center"><b><i><font size="3">
				小计</font></i></b></div></td>
			<td align="right"><b><i><font size="3"><%=cf.formatDouble(xjqye,"#########.##")%></font></i></b></td>
			<td></td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();
%> 
   <tr bgcolor="#FFFFFF" align="center"  height="31">
  <td align="center">1</td>
    <td align="left" colspan="6"><b><i><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工程直接费：</font></i></b></td>
	<td align="right"><%=cf.formatDouble(allqye,"#########.##")%>&nbsp;&nbsp;</td>
	<td> </td>
  </tr>
  <%  
	double allsfje=0;
	int temp=1;

	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	double sfbfb=0;
	double sfje=0;
	int temp1=1;
	String k="";
	String bz=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	double zqsfje=0;
	double dxzkl=0;
	String sfkdz=null;
	double zdzk=0;
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金','4','固定金额(不可改)','5','管理费','6','主材费百分比','7','工程加主材费百分比') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sflx=cf.fillHtml(rs.getString("sflx"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		bz=cf.fillHtml(rs.getString("bz"));
		sfbxx=cf.fillHtml(rs.getString("sfbxx"));
		sfjrqye=cf.fillHtml(rs.getString("sfjrqye"));
		jrsjbz=cf.fillHtml(rs.getString("jrsjbz"));
		jrglfbz=cf.fillHtml(rs.getString("jrglfbz"));
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		sfkdz=cf.fillHtml(rs.getString("sfkdz"));
		zdzk=rs.getDouble("zdzk");

		allsfje+=zqsfje;
		
		temp++;
		k=k+"+"+"("+temp+")";


		%> 
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td ><%=temp%></td>
			<td colspan="6" align="left"><b><i><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sfxmmc%>：</font></i></b></td>
			<td align="right"><%=cf.formatDouble(zqsfje,"#########.##")%>&nbsp;&nbsp;</td>
			<td align="left" colspan="3"><%=bz%></td>
			
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7"><i><b><font size="3">(1)<%=k%>：</font></b></i></td>
	<td><i><b><font size="3"><%=cf.formatDouble(allzj,"#########.##")%></font></b></i></td>
	<td></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#FFFFFF"> 
    <td colspan="11" ><%=dzbjbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" height="42">甲方签字：</td>
    <td colspan="6" height="42">乙方签字：</td>
  </tr>
 
</table>

</td></tr>
</TBODY>

</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		br.close();
		is.close();

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






