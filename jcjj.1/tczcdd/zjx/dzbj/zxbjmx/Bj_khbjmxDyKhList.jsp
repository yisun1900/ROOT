<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
//ybl.common.PageObject  pageObj=new ybl.common.PageObject();
//pageObj.setType("EXCEL",response);
//电子报价拆分项打印


String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
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
String bjjbbm=null;
String bjjb=null;
String ssfgs=null;
String dqbm=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs";
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
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		bjjb=cf.fillHtml(rs.getString("bjjbmc"));
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
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//输入:  lx 9：检查全部；1：检查单价；2：检查名称；3：检查工艺材料简介；4：检查报价级别
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
/*
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
    <td colspan="5"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025"></span></td>
    <td align="center">&nbsp;</td>
    <td align="right">http://www.yzf.com.cn</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="7" height="35"><b><font size="5">预算书</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >联系方式：<%=lxfs%></td>
    <td >设 计 师：<%=sjs%></td>
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
    <td  width="15%" align="center">项目名称</td>
    <td  width="12%" align="center">主项名称</td>
    <td  width="6%" align="center">材料费</td>
    <td  width="6%" align="center">人工费</td>
    <td  width="6%" align="center">机械费及消耗</td>
    <td  width="6%" align="center">数量</td>
    <td  width="8%" align="center">金额（元）</td>
    <td  width="29%" align="center">工艺做法及材料说明</td>
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
  <tr bgcolor="#E8E8FF"> 
    <td colspan="10"> 
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

			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm ";
			ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm and fxmbh='"+xmbh+"'";
			ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				count=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			if (count>1)//有子项
			{
				double clbj=0;
				double rgbj=0;
				double jxbj=0;
				String zxmmc="";
				ls_sql="SELECT xmbh,xmmc,jldwmc,bj,clbj,rgbj,jxbj";
				ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm ";
				ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm and fxmbh='"+xmbh+"'";
				ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					xmbh=cf.fillHtml(rs2.getString("xmbh"));
					zxmmc=cf.fillHtml(rs2.getString("xmmc"));
					jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
					dj=rs2.getDouble("bj");
					clbj=rs2.getDouble("clbj");
					rgbj=rs2.getDouble("rgbj");
					jxbj=rs2.getDouble("jxbj");

					qye=cf.round(dj*sl,2);

					row++;
					//输出每行数据
					%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=row%></td>
					<td align="center"><%=xmbh%></td>
					<td align="center"><%=zxmmc%></td>
					<td align="center" rowspan="<%=count%>"><%=xmmc%></td>
					<td align="center"><%=clbj%></td>
					<td align="center"><%=rgbj%></td>
					<td align="center"><%=jxbj%></td>
					<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
					<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
					<td align="left" rowspan="<%=count%>"><%=gycl%></td>
				  </tr>
				  <%
				}

				while (rs2.next())
				{
					xmbh=cf.fillHtml(rs2.getString("xmbh"));
					zxmmc=cf.fillHtml(rs2.getString("xmmc"));
					jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
					dj=rs2.getDouble("bj");
					clbj=rs2.getDouble("clbj");
					rgbj=rs2.getDouble("rgbj");
					jxbj=rs2.getDouble("jxbj");

					qye=cf.round(dj*sl,2);

					row++;
					//输出每行数据
					%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=row%></td>
					<td align="center"><%=xmbh%></td>
					<td align="center"><%=zxmmc%></td>
					<td align="center"><%=clbj%></td>
					<td align="center"><%=rgbj%></td>
					<td align="center"><%=jxbj%></td>
					<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
					<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				  </tr>
				  <%
				}
				rs2.close();
				ps2.close();
			}
			else if (count==1)//有子项
			{
				double clbj=0;
				double rgbj=0;
				double jxbj=0;
				String zxmmc="";
				ls_sql="SELECT xmbh,xmmc,jldwmc,bj,clbj,rgbj,jxbj";
				ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm ";
				ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm and fxmbh='"+xmbh+"'";
				ls_sql+=" and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					xmbh=cf.fillHtml(rs2.getString("xmbh"));
					zxmmc=cf.fillHtml(rs2.getString("xmmc"));
					jldwmc=cf.fillHtml(rs2.getString("jldwmc"));
					dj=rs2.getDouble("bj");
					clbj=rs2.getDouble("clbj");
					rgbj=rs2.getDouble("rgbj");
					jxbj=rs2.getDouble("jxbj");

					qye=cf.round(dj*sl,2);

					row++;
					//输出每行数据
					%> 
				  <tr bgcolor="#FFFFFF"> 
					<td align="center"><%=row%></td>
					<td align="center"><%=xmbh%></td>
					<td align="center"><%=zxmmc%></td>
					<td align="center" ><%=xmmc%></td>
					<td align="center" colspan="3"><%=dj%></td>
					<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
					<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
					<td align="left"  ><%=gycl%></td>
				  </tr>
				  <%
				}
				rs2.close();
				ps2.close();
			}
			else{
				row++;
				//输出每行数据
				%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center"><%=row%></td>
				<td align="center"><%=xmbh%></td>
				<td align="center"><%=xmmc%></td>
				<td align="center"><%=xmmc%></td>
				<td align="center" colspan="3"><%=dj%></td>
				<td align="center"><%=cf.formatDouble(sl)%><%=jldwmc%></td>
				<td align="center"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left"><%=gycl%></td>
			  </tr>
			  <%
			}

		}
		ps.close();
		rs.close();
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#E8E8FF"> 
    <td align="right" colspan="10"><i><b><font size="3">直接费合计：<%=cf.formatDouble(allqye,"#########.##")%>元</font></b></i></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="10" align="center"><b><i><font size="3">综合取费</font></i></b></td>
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
  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
    <td><%=temp%></td>
    <td colspan="2"><%=sfxmmc%></td>
    <td colspan="5">&nbsp;</td>
    <td><%=cf.formatDouble(sfje,"#########.##")%></td>
    <td align="left" ><%=bz%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();

	allzj=allsfje+allqye;

%> 
  <tr bgcolor="#E8E8FF"> 
    <td align="right" colspan="10"><i><b><font size="3">综合取费合计：<%=cf.formatDouble(allsfje,"#########.##")%>元</font></b></i></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" colspan="10"><i><b><font size="3">总 计：<%=cf.formatDouble(allzj,"#########.##")%>元</font></b></i></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 15px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="10">
<%
	if (ssfgs.equals("FTJ00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");
		out.println("物业押金和物业管理费无论任何理由都由甲方承担");
	}
	else if (ssfgs.equals("FQD00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");
		out.println("1、物业押金和物业管理费，无论任何理由都由甲方承担。<br>");
		out.println("2、此报价为预算，所有工程量按实际发生量计算。<br>");
		out.println("3、严禁拆除房屋承重结构，若出现问题乙方不承担责任。<br>");
		out.println("4、严禁设计师私自推荐主材，若出现质量问题乙方不承担任何责任。");
     }
	 else if (ssfgs.equals("FJN00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");
		out.println("1、物业押金和物业管理费，无论任何理由都由甲方承担。<br>");
		out.println("2、此报价为预算，所有工程量按实际发生量计算。<br>");
		out.println("3、严禁拆除房屋承重结构，若出现问题乙方不承担责任。<br>");
		out.println("4、严禁设计师私自推荐主材，若出现质量问题乙方不承担任何责任。");
     }
	else if (ssfgs.equals("FWS00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");
		out.println(" 1、物业押金和物业管理费，无论任何理由都由甲方承担。<br>");
		out.println("2、水路预收。明走管60元/米，墙砖暗走管70元/米。<br>");
		out.println("3、电路预收。吊顶每米22元，地面每米24元，砖墙每米30元,混泥土墙每米39元。网线每米33元，电话电视线每米33元。<br>");
		out.println("4、墙漆颜色超过三套，每套颜色增收150元。<br>");
		out.println("5、墙面相关项目所涉及门、窗洞面积一率减半计算。<br>");
		
     }
	else if (ssfgs.equals("FSJ00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");
		out.println("1、物业押金和物业管理费，无论任何理由都由甲方承担。<br>");
		out.println("2、此报价为预算，所有工程量按实际发生量计算。<br>");
		out.println("3、严禁拆除房屋承重结构，若出现问题乙方不承担责任。<br>");
		out.println("4、严禁设计师私自推荐主材，若出现质量问题乙方不承担任何责任。");
     }
	else if (ssfgs.equals("fnj00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");
		out.println("1、为维护您的利益，请不要接受任何口头承诺。<br>");
		out.println("2、若实际发生项目与报价单不符，一切以实际发生为准。<br>");
		out.println("3、此报价为基础报价不含五金.洁具.灯具.地板.地砖开关.面板等主材报价。您家的主材报价详见完整家居主材报价单。<br>");
		out.println("4、我公司无权拆改原建筑承重墙体以及建筑物承重结构.剪力结构。<br>");
		out.println("5、我公司无权拆改原建筑燃气.暖气以及配电箱。");
     }
	else if (ssfgs.equals("fwh00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");
		out.println("1、此报价不含物业管理处所收任何费用，管理处所收费用由甲方承担。<br>");
		out.println("2、施工中项目和数量如有增加或减少，则按实际施工项目结算工程款。(由于客户原因造成的减项,针对净减项收取5%的减项管理费。） <br>");
		out.println("3、水电工程数量为估算，以现场实际施工的数量为准结算。<br>");
		out.println("4、本预算不包主材，主材包括拉手、把手、门锁、门吸、抽屉锁、小五金、工艺玻璃、洁具、灯具、瓷片、石材、地板、开关、插座、空开及漏电保护开关等。<br>");
		out.println("5、本预算表为主合同的附表,是合同不可分割的一部分.<br>");
		out.println("6、此预算与合同具有同等的法律效力，不要以口头形式承诺业主，公司不承担其承诺的责任。<br>");
		out.println("7、设计费详见《设计费协议》。<br>");
     }
    else if (ssfgs.equals("FLZ00"))
	{
		out.println("<BR>");
		out.println("备注：");
		out.println("<BR>");		
		out.println("1、此报价不含物业管理处所收任何费用，管理处所收费用由甲方承担。<br>");
		out.println("2、此报价为预算，所有工程量按实际发生量计算。<br>");
		out.println("3、本预算不包主材，主材包括拉手、把手、门锁、门吸、抽屉锁、小五金、工艺玻璃、洁具、灯具、瓷片、石材、地板、开关、插座、空开及漏电保护开关等。<br>");
		out.println("4、我公司无权拆改原建筑燃气.暖气以及配电箱。");
		out.println("5、材料搬运费中若小区无电梯或电梯不允许使用的，五楼以上（含五楼）每增加一层在原报价基础上加收100元，增加费用在中期变单中反映，五楼以下按800元收。");
     } 
%>
	
	</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="42" width="50%">甲方签字：</td>
    <td colspan="3" height="42" width="50%">乙方签字：</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="22">日期：</td>
    <td colspan="3" height="22">日期：</td>
  </tr>
</table>
<br>
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>







