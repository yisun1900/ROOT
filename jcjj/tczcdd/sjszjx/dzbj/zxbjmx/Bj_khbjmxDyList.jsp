<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

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

Reader is=null;
BufferedReader br=null;


try {
	conn=cf.getConnection();


	
	String ysshbz="";
	String bjdysq="";
	int bjdycs=0;
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,ysshbz,bjdysq,bjdycs";
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
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//是否启用预算审核  B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印授权  0：未授权；1：可导出；2：可打印
		bjdycs=rs.getInt("bjdycs");//报价打印次数
	}
	rs.close();
	ps.close();


	//检查[预算审核]：是否允许打印＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String sfqyyssh="";
	String getbjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//是否启用预算审核  Y：启用；N：不启用
		getbjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印是否需授权  1：不需授权；2：只需一次授权；3：每次打印都需授权
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y"))//是否启用预算审核  Y：启用；N：不启用
	{
		if (!ysshbz.equals("Y"))//B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		{
			out.println("错误！[预算审核]未通过，不能打印报价");
			return;
		}
	}
	//检查[预算审核]：是否允许打印＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝开始

	//检查[打印授权]：是否可打印报价＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String sfkdybj="";
	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//是否可打印报价  Y：需授权打印；N：不需授权打印；M：不能打印
	}
	rs.close();
	ps.close();

	if (sfkdybj.equals("M"))//M：不能打印
	{
		out.println("错误！您无权打印报价");
		return;
	}
	else if (sfkdybj.equals("Y"))//Y：需授权打印
	{
		if (getbjdysq.equals("2"))//2：只需一次授权
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0：未授权；1：可导出；2：可打印
			{
				out.println("错误！您需授权才能打印报价，目前未授权");
				return;
			}
		}
		else if (getbjdysq.equals("3"))//3：每次打印都需授权
		{
			if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0：未授权；1：可导出；2：可打印
			{
				out.println("错误！您需授权才能打印报价，目前未授权");
				return;
			}
			else{
				if (bjdycs>=2)
				{
					out.println("错误！每次授权只能打印两次，目前已超过限制："+bjdycs+"，需重新授权");
					return;
				}
			}
		}
		else{
			out.println("错误！需授权才能打印报价，在【电子报价参数－维护 】模块，参数【报价打印是否需授权】设置不正确");
			return;
		}
	}
	//检查[打印授权]：是否允许打印＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//检查：合同净值＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double gethtjz=dzbj.getHtjz(conn,khbh,"yz");//合同净值＝折后合同总额（含增减项）－赠送净值－赠送代金券－税金（折后）

	if (gethtjz<0)
	{
		out.println("错误！合同净值为负值："+gethtjz);
		return;
	}
	//检查：合同净值＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//检查：最低折扣＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String kzdzfs="";
	double zdmll=0;
	double zkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zkl=rs.getDouble("zkl");//最低折扣
		zdmll=rs.getDouble("zdmll");//签单最低毛利率
	}
	rs.close();
	ps.close();

	if (kzdzfs.equals("1"))//1：控制毛利率；2：控制折扣
	{
		double getsgcbj=dzbj.getSgcbj(conn,khbh,"yz");//施工成本价
		//毛利率＝（合同净值－成本价）÷合同净值
		double getmll=cf.round((gethtjz-getsgcbj)*100/gethtjz,2);

		//是否有成功的调整折扣记录
		int tzkcount=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_tzzkjl";
		ls_sql+=" where khbh='"+khbh+"' and clzt in('2','4')";//1：未改折扣；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tzkcount=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (tzkcount==0)//无调整折扣记录，检查设计师最低毛利率，是否符合要求
		{
			if (getmll<zdmll || getmll>100)
			{
				out.println("错误！毛利率超过允许权限");
				return;
			}
		}
	}
	//检查：最低折扣＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束



	
	//增加：电子报价打印日志＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String ip=request.getRemoteHost();
	String yhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into bj_bjdyrz (khbh,dysj,yhdlm,yhmc,ip ) ";
	ls_sql+=" values ( ?,SYSDATE,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,cf.GB2Uni(yhdlm));
	ps.setString(3,yhmc);
	ps.setString(4,ip);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set bjdycs=NVL(bjdycs,0)+1 ";//记录次数
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//增加：电子报价打印日志＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束



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

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
    <td align="center">&nbsp;</td>
    <td align="right">http://www.jrchina.com</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" height="35"><b><font size="5">预算书</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >设 计 师：<%=sjs%></td>
    <td >联系方式：<%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >工程地点：<%=fwdz%></td>
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
		rs.close();
		ps.close();

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
		rs.close();
		ps.close();
	
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

		%> 
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td><%=temp%></td>
			<td colspan="2"><%=sfxmmc%></td>
			<td colspan="2">&nbsp;</td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
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
    <td colspan="7" ><%=dzbjbz%></td>
  </tr>
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






