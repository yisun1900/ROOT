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
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String flmcgg=null;
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
String fwmj=null;

Reader is=null;
BufferedReader br=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
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
		ssfgs=rs.getString("ssfgs");
		fwmj=cf.fillNull(rs.getString("fwmj"));
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


	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	//输入:  lx 9：检查全部；1：检查单价；2：检查名称；3：检查工艺材料简介；4：检查报价级别；5：检查必选项目；6：检查不存在项目；7：检查关联项目
	String retStr=dzbj.checkBjjb(conn,khbh,9);
	if (!retStr.equals("0"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
//			alert("电子报价检查错误！\r\n<%=retStr%>");
		//-->
		</SCRIPT>
		<%
	}

%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="8" ><img src="/images/tubiao.jpg" width="80%"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >工程负责人：</td>
    <td >设 计 师：<%=sjs%></td>
	<td >制单日期：<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="8"  >客户地址：<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="7" >客户电话：<%=lxfs%></td>
	<td >建筑面积：<%=fwmj%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="6%" align="center">序号</td>
    <td  width="18%" align="center">项目名称</td>
    <td  width="7%" align="center">单位</td>
    <td  width="6%" align="center">数量</td>
	<td  width="7%" align="center">单价</td>
    <td  width="8%" align="center">金额（元）</td>
    <td  width="48%" align="center" >工艺做法及材料说明</td>
  </tr>
</table>

</td></tr>
</THEAD>

<TBODY>
<tr><td>


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
		
	
		//输出标题
		%> 
		  <tr bgcolor="#CCCCCC"> 
			<td colspan="7"> 
			  <div align="left"><%=jgwzmc%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				</div>			</td>
		  </tr>
		<%

		//输出工程项目明细
		ls_sql="SELECT bj_bjxmmx.xh xh,trim(bj_bjxmmx.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmx.dj,bj_gclmx.sl,bj_gclmx.sl*bj_bjxmmx.dj as je,gycl,bj_bjxmmx.flmcgg,bj_bjxmmx.bz";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_gclmx.fjnxh,bj_bjxmmx.xh";
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
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			xjsl+=sl;
			xjqye+=qye;

			allsl+=sl;
			allqye+=qye;

			
			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td width="6%" align="center"><%=row%></td>
			
				<td width="18%" align="center"><%=xmmc%></td>
				<td width="7%" align="center"><%=jldwmc%></td>
				<td width="6%" align="center"><%=cf.formatDouble(sl)%></td>
				<td width="7%" align="center"><%=dj%></td>
				<td width="8%" align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td width="48%" align="left" ><%=gycl%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		//输出主材项目明细
		String zcmc=null;
		String jldwbm=null;
		String ppmc=null;
		String xinghao=null;
		double zcdj=0;
		double zcsl=0;
		double zcje=0;
		double ycf=0;
		double qtfyje=0;
		ls_sql="SELECT zcmc,jldwbm,ppmc,xinghao,dj,sum(sl) sl,sum(je) je,sum(ycf) ycf,sum(qtfyje) qtfyje";
		ls_sql+=" FROM jc_zcddmx ";
//		ls_sql+=" where khbh='"+khbh+"' and zcpzwzbm='"+jgwzmc+"'";
		ls_sql+=" group by zcmc,jldwbm,ppmc,xinghao,dj";
		ls_sql+=" order by zcmc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			zcmc=cf.fillHtml(rs.getString("zcmc"));
		    jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		    ppmc=cf.fillHtml(rs.getString("ppmc"));
		    xinghao=cf.fillHtml(rs.getString("xinghao"));

			zcdj=rs.getDouble("dj");
			zcsl=rs.getDouble("sl");
			zcje=rs.getDouble("je");
			ycf=rs.getDouble("ycf");
			qtfyje=rs.getDouble("qtfyje");

			xjsl+=zcsl;
			xjqye+=zcje;

			allsl+=zcsl;
			allqye+=zcje;


			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td width="6%" align="center"><%=row%></td>
			
				<td width="18%" align="center"><%=zcmc%></td>
				<td width="7%" align="center"><%=jldwbm%></td>
				<td width="6%" align="center"><%=cf.formatDouble(sl)%></td>
				<td width="7%" align="center"><%=dj%></td>
				<td width="8%" align="center"><%=cf.formatDouble(zcje,"#########.##")%></td>
				<td width="48%" align="left" ><%=ppmc%>,<%=xinghao%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();


		%> 
		
	 <tr bgcolor="#FFFFFF"> 
			<td colspan="7"> 
			 
			小计：<%=cf.formatDouble(xjqye,"#########.##")%>元		</td>
		  </tr> <%
	}
	
	rs1.close();
	ps1.close();
%> 
  		


  	 <tr bgcolor="#FFFFFF" align="center"  height="31"> 
    
	<td colspan="2">直接工程款：</td>
	<td colspan="2"><%=cf.formatDouble(allqye,"#########.##")%>元</td>
	
 
	<td align="right"  colspan="2" >管理费：</td>
	<td align="left"  >10%</td>
  </tr>
  <%  
	double allsfje=0;
	int temp=0;

	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	double sfbfb=0;
	double sfje=0;
	String bz=null;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	double zqsfje=0;
	double dxzkl=0;
	String sfkdz=null;
	double zdzk=0;
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比','2','固定金额(可改)','3','税金','4','固定金额(不可改)','5','管理费','6','主材费百分比','7','工程加主材费百分比') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
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

		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
	
			<td colspan="2"><%=sfxmmc%>：</td>
		
			<td colspan="2"><%=cf.formatDouble(zqsfje,"#########.##")%>元</td>
				
			<td align="left" colspan="2" >&nbsp;</td>
			<td align="left"  >&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 
  
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="7">总 计：<%=cf.formatDouble(allzj,"#########.##")%>元</td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
  <td colspan="7" height="42"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
  <td colspan="7" height="42">1、此报价不含物业管理处所收任何费用包括装修押金，物业管理处所收任何费均由甲方承担。							
							
  <br>2、公司概不承认任何人的口头承诺；						
  <br>3、所有工程款包括增减项款客户必须交到公司财务部，若客户交给与财务无关人员所造成直接经济损失或间接损失公司概不负责；							
							
  <br>4、美巢公司建议甲方沙灰墙应做贴布处理，如果甲方执意不做贴布处理的，其后果由甲方完全负责，公司不负任何责任。							
							
  <br>5、美巢公司建议甲方厨卫必须做防水处理，如果甲方执意不做防水处理的，其后果由甲方完全负责，美巢公司不负任何责任。							
							
  <br>6、施工中如有增减项目，则按实际施工项目结算工程款，由于客户原因造成的减项，针对净减项收取10%的减项管理费。							
							
  <br>7、水电工程因无法预算，以现场实际施工的数量为准结算。							
  <br>8、客户装修房屋的任何构件（非我方施工主体）如可能影响我方施工，无论是拆卸、改造或是用其他办法处理而造成的工程延期，业主自行承担费用。							
							
  <br>9、此预算在施工图尚未出之前仅供甲方参考或作为双方签定施工合同的参考依据，乙方保留依据施工图纸所用材料和加工件复杂系数修定项目单价的权力，施工图纸经甲方签字后，以此修改的工程预算报价为双方签定合同的附件，此预算与合同具有同等的法律效率。							
							
							
  <br>10、本预算不包拉手、把手、门锁、抽屉锁、工艺玻璃、洁具、灯具、墙地砖、石材、木地板、开关、插座、空开及漏电保护开关等。							
							
  <br>11、安装工程项目以最后实际数量为准。							
  <br>12、本预算及备注作为合同的附件，与合同具有同等的法律效力。
  							
  <br><br><br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp甲方签字（盖章）：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp乙方签字（盖章）：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							
  <br><br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp日&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp日&nbsp&nbsp&nbsp&nbsp

</td>
					

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






