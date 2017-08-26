<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
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
double zk=0;
double zqdj=0;
double sl=0;
double qye=0;
double zqqye=0;
String gycl=null;

double zcf=0;
double cldj=0;
double shf=0;
double ysf=0;
double jxdj=0;
double qtf=0;
double rgdj=0;

double xjqye=0;
double xjzqqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allzqqye=0;
double allsl=0;
double allzj=0;
double allzqzj=0;

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

Reader is=null;
BufferedReader br=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs";
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

/*
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	//输入:  lx 9：检查全部；1：检查单价；2：检查名称；3：检查工艺材料简介；4：检查报价级别
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

	int bxx=dzbj.getBxxm(conn,khbh,"yz");
	if (bxx!=9999)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("提醒！税金等必选项目没有选择：<%=bxx%>");
		//-->
		</SCRIPT>
		<%
	}
*/
%>
<body >

<div align="center"> </div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" height="35"><b><font size="5">检查电子报价错误</font></b></td>
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
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="3%">序号</td>
    <td  width="5%" >项目编号</td>
    <td  width="12%" >项目名称</td>
    <td  width="3%" >计量单位</td>

    <td  width="3%" >数量</td>

	<td  width="4%" >折前单价</td>
	<td  width="3%" >折扣</td>
	<td  width="4%" >折后单价</td>
	<td  width="5%" >折前金额</td>
	<td  width="5%" >折后金额</td>

	<td  width="4%" >主料</td>
	<td  width="4%" >辅料</td>
	<td  width="4%" >人工</td>
	<td  width="4%" >损耗</td>
	
	<td  width="4%" >运输</td>
	<td  width="4%" >机械</td>
	<td  width="4%" >其他</td>
	<td  width="4%" >七项合价</td>
	<td  width="125%" >错误说明</td>


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
		xjzqqye=0;

		double xjzcf=0;
		double xjfcf=0;
		double xjrgf=0;
		double xjshf=0;
		double xjysf=0;
		double xjjxf=0;
		double xjqtf=0;
		
		ls_sql="SELECT sum(bj_gclmx.sl) sl,ROUND(sum(bj_gclmx.sl*bj_bjxmmx.dj),2) as je,ROUND(sum(bj_gclmx.sl*bj_bjxmmx.zqdj),2) as zqje";
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
			xjzqqye=rs.getDouble("zqje");
		}
		rs.close();
		ps.close();

		allsl+=xjsl;
		allqye+=xjqye;
		allzqqye+=xjzqqye;

		allsl=cf.round(allsl,2);
		allqye=cf.round(allqye,2);
		allzqqye=cf.round(allzqqye,2);
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="19"> 
			  <b><font size="3">结构位置：<%=jgwzmc%></font></b>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_bjxmmx.xh xh,bj_bjxmmx.xmbh,xmmc,jldwmc,bj_bjxmmx.zqdj,bj_bjxmmx.zk,bj_bjxmmx.dj,bj_gclmx.sl,ROUND(bj_gclmx.sl*bj_bjxmmx.dj,2) as je,ROUND(bj_gclmx.sl*bj_bjxmmx.zqdj,2) as zqje,gycl,bj_bjxmmx.flmcgg,bj_bjxmmx.bz,bj_bjxmmx.zcf,bj_bjxmmx.cldj,bj_bjxmmx.shf,bj_bjxmmx.qtf,bj_bjxmmx.ysf,bj_bjxmmx.rgdj,bj_bjxmmx.jxdj";
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
			zqdj=rs.getDouble("zqdj");
			zk=rs.getDouble("zk");
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			zqqye=rs.getDouble("zqje");

			zcf=rs.getDouble("zcf");
			cldj=rs.getDouble("cldj");
			shf=rs.getDouble("shf");
			qtf=rs.getDouble("qtf");
			rgdj=rs.getDouble("rgdj");
			ysf=rs.getDouble("ysf");
			jxdj=rs.getDouble("jxdj");

			double hbdj=cf.round(zcf+cldj+shf+qtf+rgdj+ysf+jxdj,2);

			String error="&nbsp;";
			String bgcolor="";
			if (hbdj!=zqdj)
			{
				bgcolor="#FFFF00";
				error="七项合价["+hbdj+"]与折前单价["+zqdj+"]不一致";
			}
			else{
				bgcolor="#FFFFFF";
			}

			xjzcf+=cf.round(zcf*sl,2);
			xjfcf+=cf.round(cldj*sl,2);
			xjrgf+=cf.round(rgdj*sl,2);
			xjshf+=cf.round(shf*sl,2);
			xjysf+=cf.round(ysf*sl,2);
			xjjxf+=cf.round(jxdj*sl,2);
		    xjqtf+=cf.round(qtf*sl,2);

			xjzcf=cf.round(xjzcf,2);
			xjfcf=cf.round(xjfcf,2);
			xjrgf=cf.round(xjrgf,2);
			xjshf=cf.round(xjshf,2);
			xjysf=cf.round(xjysf,2);
			xjjxf=cf.round(xjjxf,2);
		    xjqtf=cf.round(xjqtf,2);

			allzcf+=cf.round(zcf*sl,2);
			allfcf+=cf.round(cldj*sl,2);
			allrgf+=cf.round(rgdj*sl,2);
			allshf+=cf.round(shf*sl,2);
			allysf+=cf.round(ysf*sl,2);
			alljxf+=cf.round(jxdj*sl,2);
		    allqtf+=cf.round(qtf*sl,2);

			allzcf=cf.round(allzcf,2);
			allfcf=cf.round(allfcf,2);
			allrgf=cf.round(allrgf,2);
			allshf=cf.round(allshf,2);
			allysf=cf.round(allysf,2);
			alljxf=cf.round(alljxf,2);
		    allqtf=cf.round(allqtf,2);

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)"> 
				<td ><%=row%></td>
				<td><%=xmbh%></td>
				<td><%=xmmc%></td>
				<td><%=jldwmc%></td>
				<td><%=cf.formatDouble(sl)%></td>

				<td> <%=zqdj%> </td>
				<td> <%=zk%> </td>
				<td> <%=dj%> </td>

				<td> <%=zqqye%> </td>
				<td> <%=qye%> </td>

				<td> <%=zcf%></td>
				<td><%=cldj%> </td>
				<td><%=rgdj%> </td>
				<td> <%=shf%> </td>
				<td> <%=ysf%> </td>
				<td> <%=jxdj%> </td>
				<td> <%=qtf%> </td>
				<td> <%=hbdj%> </td>
				<td align="left"> <%=error%> </td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();

 
		double hbxj=cf.round(xjzcf+xjfcf+xjrgf+xjshf+xjysf+xjjxf+xjqtf,2);

		String error="&nbsp;";
		String bgcolor="";
		if (hbxj!=xjzqqye)
		{
			bgcolor="#FFFF00";
			error="七项合价["+hbxj+"]与折前小计["+xjzqqye+"]不一致";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		  <tr bgcolor="<%=bgcolor%>" align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)"> 
			<td colspan="3"><b><font size="3">[<%=jgwzmc%>]小计</font></b></td>
			<td>&nbsp;</td>
			<td><%=xjsl%></td>

			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>

			<td> <%=xjzqqye%> </td>
			<td> <%=xjqye%> </td>

			<td> <%=xjzcf%></td>
			<td><%=xjfcf%> </td>
			<td><%=xjrgf%> </td>
			<td> <%=xjshf%> </td>
			<td> <%=xjysf%> </td>
			<td> <%=xjjxf%> </td>
			<td> <%=xjqtf%> </td>
			<td> <%=hbxj%> </td>
			<td align="left"> <%=error%> </td>
		  </tr>

		<%
	
	}
	rs1.close();
	ps1.close();

	double hbxj=cf.round(allzcf+allfcf+allrgf+allshf+allysf+alljxf+allqtf,2);

	String error="&nbsp;";
	String bgcolor="";
	if (hbxj!=allzqqye)
	{
		bgcolor="#FFFF00";
		error="七项合价["+hbxj+"]与折前总计["+allzqqye+"]不一致";
	}
	else{
		bgcolor="#FFFFFF";
	}

	%> 

  <tr bgcolor="<%=bgcolor%>" align="center"  onclick="onclickTr(this)"> 
	<td colspan="3"><b><font size="3">工程直接费总计</font></b></td>
	<td>&nbsp;</td>
	<td><%=allsl%></td>

	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>

	<td> <%=allzqqye%> </td>
	<td> <%=allqye%> </td>

	<td> <%=allzcf%></td>
	<td><%=allfcf%> </td>
	<td><%=allrgf%> </td>
	<td> <%=allshf%> </td>
	<td> <%=allysf%> </td>
	<td> <%=alljxf%> </td>
	<td> <%=allqtf%> </td>
	<td> <%=hbxj%> </td>
	<td align="left"> <%=error%> </td>
  </tr>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="13" align="center"><b><i><font size="3">综合取费</font></i></b></td>
  </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="4%">序号</td>
    <td width="12%">项目编码：名称</td>
    <td width="14%">收费类型：收费百分比</td>
    <td width="6%">折前收费金额</td>
    <td width="4%">折扣率</td>
    <td width="6%">折后收费金额</td>
    <td width="5%">是否必选项</td>
    <td width="5%">记入签约额</td>
    <td width="5%">记入税金</td>
    <td width="5%">记入管理费</td>
    <td width="5%">是否可打折</td>
    <td width="5%">可打最低折扣</td>
    <td width="24%">备注</td>
  </tr>
  <%  
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

	double allzqsfje=0;
	double allsfje=0;

	ls_sql="SELECT sfxmbm,sfxmmc,DECODE(sflx,'1','直接费百分比','2','固定金额(可改)','3','税金(百分比)','4','固定金额(不可改)','5','管理费(百分比)') sflx,sfbfb,sfje,bz,DECODE(sfbxx,'1','必选','2','非必选') sfbxx,DECODE(sfjrqye,'1','记入','2','不记入') sfjrqye,DECODE(jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(jrglfbz,'1','记入','2','不记入') jrglfbz,zqsfje,dxzkl,DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
    ls_sql+=" and sfxmlx not in('4','7','8')";
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

		allzqsfje+=zqsfje;
		allsfje+=sfje;
		temp++;

		%> 
		  <tr bgcolor="#FFFFFF" align="center"  height="31" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)"> 
			<td><%=temp%></td>
			<td><%=sfxmbm%>：<%=sfxmmc%></td>
			<td><%=sflx%>：<%=sfbfb%>%</td>
			<td><%=zqsfje%></td>
			<td><%=dxzkl%></td>
			<td><%=sfje%></td>
			<td><%=sfbxx%></td>
			<td><%=sfjrqye%></td>
			<td><%=jrsjbz%></td>
			<td><%=jrglfbz%></td>
			<td><%=sfkdz%></td>
			<td><%=zdzk%></td>
			<td align="left" ><%=bz%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;
	allzqzj=allzqsfje+allzqqye;

%> 
  <tr bgcolor="#FFFFFF" align="center"> 
	<td  colspan="3">综合取费合计</td>
	<td><%=cf.formatDouble(allzqsfje,"#########.##")%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allsfje,"#########.##")%></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="13"><b><font size="3">
	折前总计：<%=cf.formatDouble(allzqzj,"#########.##")%>元
	&nbsp;&nbsp;&nbsp;
	折后总计：<%=cf.formatDouble(allzj,"#########.##")%>元</font></b></td>
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
	out.print("发生意外: " + ls_sql);
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


<script>
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
 
</script> 


