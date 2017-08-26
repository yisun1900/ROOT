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
<style>
@media print{
	INPUT {display:none}
}
</style>

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
double qtf=0;
double rgdj=0;

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




	dzbj.Dzbj dzbj=new dzbj.Dzbj();

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

<!--<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>
-->
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

 <tr bgcolor="#FFFFFF"> 
 <td colspan="4" align="right" style='FONT-SIZE: 24px' ><B>城市人家装饰公司</B> &nbsp;</td>
 <td colspan="4" align="left" style='FONT-SIZE: 20px' > &nbsp;<B>工程（预）结算表</B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="8"    height="10"></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" >客户姓名：<%=khxm%></td>
    <td colspan="2" >联系电话：<%=lxfs%></td>
    <td colspan="4" >工程地址：<%=fwdz%></td>
</tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="8"    height="10"></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td  width="3%" align="center">序号</td>
    <td  width="13%" align="center">项目名称</td>
    <td  width="7%" align="center">单位</td>
    <td  width="6%" align="center">数量</td>
	
	
  
    <td  width="28%" align="center" >工艺做法及材料说明</td>
  </tr>
</table>

<!--</td></tr>
</THEAD>-->

<TBODY>
<tr><td>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

	
	
<%
	int i=0;

	ls_sql="SELECT bj_fjxxh.jgwzbm,DECODE(xuhao,'1','一','2','二','3','三','4','四','5','五','6','六','7','七','8','八','9','九','10','十','11','十一','12','十二') xuhao";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"'";
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
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
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
			<td colspan="8"> 
			  <div align="left"><%=jgwzmc%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				</div>			</td>
			  
		  </tr>
		  
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmxh.xh xh,trim(bj_bjxmmxh.xmbh)||DECODE(bjlx,'1','','2','增') xmbh,xmmc,jldwmc,bj_bjxmmxh.dj,bj_gclmxh.sl,bj_gclmxh.sl*bj_bjxmmxh.dj as je,gycl,bj_bjxmmxh.flmcgg,bj_bjxmmxh.bz,bj_bjxmmxh.zcf,bj_bjxmmxh.cldj,bj_bjxmmxh.shf,bj_bjxmmxh.qtf,bj_bjxmmxh.rgdj";
		ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh,bdm_xmdlbm  ";
		ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" order by bj_gclmxh.fjnxh,bj_bjxmmxh.xh";
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
			
			zcf=rs.getDouble("zcf");
			cldj=rs.getDouble("cldj");
			shf=rs.getDouble("shf");
			qtf=rs.getDouble("qtf");
			rgdj=rs.getDouble("rgdj");
			
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td width="3%" align="center"><%=row%></td>
			
				<td width="13%" align="center"><%=xmmc%></td>
				<td width="7%" align="center"><%=jldwmc%></td>
				<td width="6%" align="center"><%=cf.formatDouble(sl)%></td>
				
		
				
				<td width="28%" align="left" ><%=gycl%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();
			%> 
		
	 <%--<tr bgcolor="#FFFFFF"> 
			<td colspan="9"> 
			 
			小计：<%=cf.formatDouble(xjqye,"#########.##")%>元		</td>
		  </tr>--%> <%
	}
	
	rs1.close();
	ps1.close();
%> 
  		



 
  
	


 
  
  <tr bgcolor="#FFFFFF"> 
    <td align="left" colspan="11">工程总价：<%=cf.formatDouble(allzj,"#########.##")%>元</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
  <td colspan="1"  width="6%" height="42">温馨提示</td>
  <td colspan="6" ><%=dzbjbz%></td>
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




