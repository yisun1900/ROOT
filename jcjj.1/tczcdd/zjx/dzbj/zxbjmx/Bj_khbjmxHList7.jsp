<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<!--<style>
@media print{
	INPUT {display:none}
}
</style>
-->
</head>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

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
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;

double zcf=0;
double cldj=0;
double shf=0;
double ysf=0;
double jxdj=0;
double qtf=0;
double rgdj=0;
double bj=0;

String  xuhao=null;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

double allzcf=0;
double allfcf=0;
double allrgf=0;
double allshf=0;
double allysf=0;
double alljxf=0;
double allqtf=0;

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
String  zxdm=null;
Reader is=null;
BufferedReader br=null;


try {
	conn=cf.getConnection();

	
    String ysshbz="";
	String bjdysq="";
	int bjdycs=0;
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,ysshbz,bjdysq,bjdycs,zxdm";
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
		zxdm=cf.fillNull(rs.getString("zxdm"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//是否启用预算审核  B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印授权  0：未授权；1：可导出；2：可打印
		bjdycs=rs.getInt("bjdycs");//报价打印次数
	}
	rs.close();
	ps.close();
	
	
	String sjsdh="";
	//设计师电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('23','04') and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
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
/*
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
	}*/
	//检查[打印授权]：是否允许打印＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//检查：合同净值＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double gethdzsjz=0;
	ls_sql="SELECT sum(zsjz)";
	ls_sql+=" FROM crm_khzsxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gethdzsjz=rs.getDouble(1);//活动赠送净值
	}
	rs.close();
	ps.close();

	double getqye=dzbj.getZhBjje(conn,khbh,"sxyd");//获取『折后』电子报价金额，直接费＋其它收费，不包括【不记入业绩】项目
	double getguanlif=dzbj.getZhGlfJe(conn,khbh,"yz");//获取折后『管理费金额』

	double gethtjz=dzbj.getHtjz(conn,khbh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券

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
		kzdzfs=rs.getString("kzdzfs");
		zkl=rs.getDouble("zkl");//最低折扣
		zdmll=rs.getDouble("zdmll");//签单最低毛利率
	}
	rs.close();
	ps.close();

	if (kzdzfs.equals("1"))//1：控制毛利率；2：控制折扣
	{
		double getsgcbj=dzbj.getCbj(conn,khbh,"yz");//施工成本价
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


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

 <tr bgcolor="#FFFFFF"> 
 <td colspan="4" align="right" style='FONT-SIZE: 24px' ><B>城市人家装饰公司</B> &nbsp;</td>
 <td colspan="4" align="left" style='FONT-SIZE: 20px' > &nbsp;<B>增减项后明细</B></td>
 
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"    height="10"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" >客户姓名：<%=khxm%></td>
    <td colspan="2" >客户电话：<%=lxfs%></td>
	<td colspan="2" >设计师电话：<%=sjsdh%></td>
    <td colspan="2" >工程地址：<%=fwdz%></td>
</tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="8"    height="10"></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="3%" align="center">序号</td>
    <td  width="10%" align="center">项目名称</td>
    <td  width="5%" align="center">单位</td>
    <td  width="4%" align="center">数量</td>
	
	<td  width="5%" align="center">主料</td>
	<td  width="5%" align="center">辅料</td>
	<td  width="5%" align="center">人工</td>
	<td  width="5%" align="center">损耗</td>
	
	<td  width="5%" align="center">运输</td>
	<td  width="5%" align="center">机械</td>
	<td  width="5%" align="center">其他</td>
	<td  width="5%" align="center">合价</td>
  
    <td  width="28%" align="center" >工艺做法及材料说明</td>
  </tr>
</table>

</td></tr>
</THEAD>

<TBODY>
<tr><td>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

	
	
<%
	int i=0;

	ls_sql="SELECT bj_fjxxh.jgwzbm,DECODE(xuhao,'1','一','2','二','3','三','4','四','5','五','6','六','7','七','8','八','9','九','10','十','11','十一','12','十二') xuhao";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");
        xuhao=rs1.getString("xuhao");
	
		xjsl=0;
		xjqye=0;
		
		ls_sql="SELECT sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
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
		  <tr bgcolor="#CCCCCC"> 
		  <td colspan="1"> 
			  <div align="center"><%=xuhao%></div>			</td>
			<td colspan="12"> 
			  <div align="left"><%=jgwzmc%>:<%=xjqye%></div>			</td>
			  
		  </tr>
		  
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,gycl,bj_bjxmmxh.flmcgg,bj_bjxmmxh.bz,bj_bjxmmxh.zcf,bj_bjxmmxh.cldj,bj_bjxmmxh.shf,bj_bjxmmxh.qtf,bj_bjxmmxh.ysf,bj_bjxmmxh.rgdj,bj_bjxmmxh.jxdj";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xh";
		//out.println(ls_sql);
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
			
			zcf=rs.getDouble("zcf");
			cldj=rs.getDouble("cldj");
			shf=rs.getDouble("shf");
			qtf=rs.getDouble("qtf");
			rgdj=rs.getDouble("rgdj");
			ysf=rs.getDouble("ysf");
			jxdj=rs.getDouble("jxdj");
			//bj=rs.getDouble("bj");
			
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			allzcf+=zcf*sl;
			allfcf+=cldj*sl;
			allrgf+=rgdj*sl;
			allshf+=shf*sl;
			allysf+=ysf*sl;
			alljxf+=jxdj*sl;
		    allqtf+=qtf*sl;
    

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td width="3%" align="center"><%=row%></td>
			
				<td width="10%" align="center"><%=xmmc%></td>
				<td width="5%" align="center"><%=jldwmc%></td>
				<td width="4%" align="center"><%=cf.formatDouble(sl)%></td>
				
				<td width="5%" align="center"> <%=zcf%>&nbsp;</td>
				<td width="5%" align="center"><%=cldj%> &nbsp;</td>
				<td width="5%" align="center"><%=rgdj%> &nbsp;</td>
				<td width="5%" align="center"> <%=shf%> &nbsp;</td>
				
				<td width="5%" align="center"> <%=ysf%> &nbsp;</td>
				<td width="5%" align="center"> <%=jxdj%> &nbsp;</td>
				<td width="5%" align="center"> <%=qtf%> &nbsp;</td>
				<td width="5%" align="center"> <%=cf.formatDouble(qye,"#########.##")%> &nbsp;</td>
				<td width="28%" align="left" ><%=gycl%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();
		
	}
	
	rs1.close();
	ps1.close();
	
	    
%> 
  		
 <tr bgcolor="#FFFFFF" align="center"  height="25"> 
    
	<td colspan="2">小计：</td>
	<td colspan="2">&nbsp;</td>
	<td >&nbsp;<%=cf.formatDouble(allzcf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allfcf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allrgf,"#########.##")%></td>
    <td >&nbsp;<%=cf.formatDouble(allshf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allysf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(alljxf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allqtf,"#########.##")%></td>
	<td >&nbsp;<%=cf.formatDouble(allzcf+allfcf+allrgf+allshf+allysf+alljxf+allqtf,"#########.##")%></td>
	<td >&nbsp; </td>
  </tr>

  <tr bgcolor="#FFFFFF" align="center"  height="25"> 
    
	<td colspan="2">工程造价：</td>
	<td colspan="2">&nbsp;</td>
	
 
	<td align="right"  colspan="8" >&nbsp; </td>
	<td >&nbsp; <%=cf.formatDouble(allqye,"#########.##")%>元</td>
  </tr>
  <%  
	double allsfje1=0;
	int temp1=0;

	String sfxmbm1=null;
	String sfxmmc1=null;
	String sflx1=null;
	double sfbfb1=0;
	double sfje1=0;
	double zqsfje1=0;
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and bj_sfxmmxh.khbh='"+khbh+"' and  sfxmlx='5'";//5：工程管理费
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm1=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc1=cf.fillHtml(rs.getString("sfxmmc"));
		sflx1=cf.fillHtml(rs.getString("sflx"));
		sfbfb1=rs.getDouble("sfbfb");
		sfje1=rs.getDouble("sfje");
		zqsfje1=rs.getDouble("zqsfje");
		allsfje1+=sfje1;
		temp1++;

		%> 
	
  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
    
	<td colspan="2"><%=sfxmmc1%>：</td>
	<td colspan="2"><%=cf.formatDouble(sfje1,"#########.##")%>元</td>
	
 		<%
	}
	rs.close();
	ps.close();
	
	%>
	<td align="right"  colspan="8" >&nbsp; </td>
	<td align="left"  >&nbsp; </td>
  </tr>

	

    <tr bgcolor="#CCCCCC"> 
			<td colspan="13"> 
			  <div align="left">其他&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				</div>			</td>
			  
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
	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and bj_sfxmmxh.khbh='"+khbh+"' and  sfxmlx not in('6','5')";
    ls_sql+=" order by bj_sfxmmxh.sfxmbm";
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

		allsfje+=sfje;
		temp++;



	
		%> 
	
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
	
			<td colspan="2"><%=sfxmmc%></td>
		
			<td >项</td>
			<td >1</td>
			<td colspan="2"><%=cf.formatDouble(sfje,"#########.##")%>元</td>	
			<td align="left" colspan="6" >&nbsp;</td>
			<td align="left"  >&nbsp;<%=bz%></td>
		  </tr>
		  
		  
		<%
	}
	rs.close();
	ps.close();
	%>
	<tr bgcolor="#FFFFFF" align="center"  height="25"> 
    
	<td colspan="2">小计：</td>
	<td colspan="2">&nbsp;</td>
	<td colspan="5">&nbsp;</td>
 
	<td   colspan="3" >&nbsp;<%=cf.formatDouble(allsfje,"#########.##")%>元 </td>
	<td align="left"  >&nbsp; </td>
  </tr>
	
          <%  
	double allsfje2=0;
	int temp2=0;

	String sfxmbm2=null;
	String sfxmmc2=null;
	String sflx2=null;
	double sfbfb2=0;
	double sfje2=0;
	String bz2=null;
	double zqsfje2=0;
	int count=0;
    ls_sql="select count(*)";
	ls_sql+=" from  bj_sfxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfxmlx='6' ";//6：工程税金
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)//有税金
	{
		ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','工程直接费百分比','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
		ls_sql+=" FROM bj_sfxmmxh  ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and bj_sfxmmxh.khbh='"+khbh+"' and sfxmlx='6'";
		ls_sql+=" order by bj_sfxmmxh.sfxmbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			sfxmbm2=cf.fillHtml(rs.getString("sfxmbm"));
			sfxmmc2=cf.fillHtml(rs.getString("sfxmmc"));
			sflx2=cf.fillHtml(rs.getString("sflx"));
			sfbfb2=rs.getDouble("sfbfb");
			sfje2=rs.getDouble("sfje");
			bz2=cf.fillHtml(rs.getString("bz"));
			zqsfje2=rs.getDouble("zqsfje");
		 
		 
			allsfje2+=sfje2;
			temp1++;
		
			%> 
			  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
				
				<td colspan="2">税金</td>
				<td >项</td>
				<td >1</td>
				<td  colspan="2" >&nbsp; <%=cf.formatDouble(sfje2,"#########.##")%>元</td>
				<td align="left" colspan="6" >&nbsp;</td>
				<td align="left"  >&nbsp;<%=bz2%> </td>
			  </tr> 
			<%
		}

		rs.close();
		ps.close();
	}
	else//无税金显示空行
	{ 
		%> 
		<tr bgcolor="#FFFFFF" align="center"  height="31"> 
		<td colspan="2">税金</td>
		<td >项</td>
		<td >1</td>
		<td  colspan="2" >&nbsp; 0</td>
		<td align="left" colspan="6" >&nbsp;</td>
		<td align="left"  >&nbsp; </td>
		</tr>
	   <% 
	}

	//allqye:工程费
	//allsfje:其它费
	//allsfje1:管理费
	//allsfje2:税金
  
	
	allzj=allqye+allsfje+allsfje1+allsfje2;
   	
	
	
%> 
  
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="14">工程总价：<%=cf.formatDouble(allzj,"#########.##")%>元</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
  <td align="cenetr" width="2%" >注意事项</td>
  <td colspan="6"  ><%=dzbjbz%></td>
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




