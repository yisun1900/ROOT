<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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

String xmbh=null;
String xmmc=null;
String jldwbm=null;
String jldwmc=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String bjjb=null;

double zjqye=0;

double xjdwbjje=0;
double xjcbje=0;
double xjmll=0;
double xjmle=0;
double xjnbjsje=0;
double xjgsmll=0;
double xjgsmlr=0;

int row=1;

try {
	conn=cf.getConnection();

	int wclsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cw_deyjsmx";
    ls_sql+=" where khbh='"+khbh+"' and xclbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wclsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (wclsl>0)
	{
		out.println("错误！有未处理的【自定义项目、特殊项目】");
		return;
	}

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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

	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	zjqye=dzbj.getBjje(conn,khbh,"hd");


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>调整结算比例系数</b> 
  <hr>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>客户姓名：<%=khxm%></td>
    <td>联系方式：<%=lxfs%> </td>
    <td>金额总计：<%=cf.formatDouble(zjqye,"#########.##")%>元</td>
  </tr>
  <tr> 
    <td>工程地点：<%=fwdz%></td>
    <td>设 计 师：<%=sjs%></td>
    <td>工程等级：<%=bjjb%></td>
  </tr>
</table>

<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
		  <input type=button value='保存预结算' onClick="cf_submit(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		【结算比例系数】调整为：<input type="text" name="tzjsblxs" value="" size="8" maxlength="12" >%
		<input type="button" value='开始调整' onClick="f_tzjsbl(listform)" >
      </td>
  </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >序号</td>
    <td  width="4%" >类型</td>
    <td  width="6%" >项目编号</td>
    <td  width="17%" >项目名称</td>
    <td  width="4%" >单位</td>
    <td  width="5%" >数量</td>
    <td  width="5%" >对外单价</td>
    <td  width="6%" >对外金额</td>
    <td  width="5%" >基价单价</td>
    <td  width="6%" >基价金额</td>
    <td  width="5%" >毛利率</td>
    <td  width="6%" >毛利金额</td>
    <td  width="5%" >结算比例系数</td>
    <td  width="5%" >内部结算单价</td>
    <td  width="6%" >内部结算金额</td>
    <td  width="5%" >公司毛利率</td>
    <td  width="6%" >公司毛利润</td>
  </tr>

<%
	int xh=0;

	double dj=0;
	double sl=0;
	double dwbjje=0;

	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	double jsblxs =0;

	String bjlx=null;
	String bjlxmc=null;
	String xclbz="";

	//输出项目明细
	ls_sql="SELECT xmbh,xh,xmmc,cw_deyjsmx.jldwbm,jldwmc,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,DECODE(xclbz,'N','未处理','Y','处理') xclbz ";
	ls_sql+=" from cw_deyjsmx,jdm_jldwbm ";
	ls_sql+=" where cw_deyjsmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and cw_deyjsmx.khbh='"+khbh+"'";
	ls_sql+=" order by bjlx desc,cw_deyjsmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xh=rs.getInt("xh");
		xmmc=rs.getString("xmmc");
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dwbjdj");
		dwbjje=rs.getDouble("dwbjje");

		jsblxs=rs.getDouble("jsblxs");

		bjlx=rs.getString("bjlx");

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			bjlxmc="标准";
		}
		else{
			bjlxmc="自定义";
		}

		ls_sql="SELECT sum(xhl*dj)";
		ls_sql+=" FROM bj_khglfxb  ";
		ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cbdj=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();



		cbdj=cf.doubleTrim(cbdj,2);

		cbje=sl*cbdj;//工程量*成本单价
		cbje=cf.doubleTrim(cbje);

		mll=(dwbjje-cbje)/dwbjje*100;//（对外报价金额－成本金额）/报价金额
		mll=cf.doubleTrim(mll);

		mle=dwbjje-cbje;//毛利率*对外报价金额
		mle=cf.doubleTrim(mle);


		nbjsdj=cbdj*(1+jsblxs/100);//成本单价*(1+结算比例系数)
		nbjsdj=cf.doubleTrim(nbjsdj);

		nbjsje=nbjsdj*sl;//内部结算单价*工程数量
		nbjsje=cf.doubleTrim(nbjsje);

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
		gsmll=cf.doubleTrim(gsmll);

		gsmlr=dwbjje-nbjsje;//公司毛利率*对外报价金额
		gsmlr=cf.doubleTrim(gsmlr);




		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;


	
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%>
				<input type="hidden" name="bjlx" value="<%=bjlx%>" >
			</td>
			<td ><A HREF="ViewCw_glfx_xm.jsp?khbh=<%=khbh%>&xmbh=<%=xmbh%>" target="_blank"><%=xmbh%></A>
				<input type="hidden" name="xmbh" value="<%=xmbh%>" >
			</td>
			<td ><%=xmmc%>
				<input type="hidden" name="xmmc" value="<%=xmmc%>" >
			</td>
			<td ><%=jldwmc%>
				<input type="hidden" name="jldwbm" value="<%=jldwbm%>" >
			</td>
			<td ><%=sl%>
				<input type="hidden" name="sl" value="<%=sl%>" >
			</td>
			<td ><%=dj%>
				<input type="hidden" name="dj" value="<%=dj%>" >
			</td>
			<td ><%=dwbjje%>
				<input type="hidden" name="dwbjje" value="<%=dwbjje%>" >
			</td>
			<td>
				<input type="text" name="cbdj" size="8" value="<%=cbdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="cbje" size="10" value="<%=cbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="mll" size="6" value="<%=mll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="mle" size="10" value="<%=mle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="jsblxs" size="6" value="<%=jsblxs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_tzxs(listform,<%=(row-1)%>)">
				%
			</td>
			<td>
				<input type="text" name="nbjsdj" size="8" value="<%=nbjsdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="nbjsje" size="10" value="<%=nbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="gsmll" size="6" value="<%=gsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="gsmlr" size="10" value="<%=gsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
		  </tr>
		
		
		<%

		row++;
	}
	rs.close();
	ps.close();

	if (xjdwbjje==0)
	{
		out.println("无数据");
		return;
	}

	xjdwbjje=cf.doubleTrim(xjdwbjje);
	xjcbje=cf.doubleTrim(xjcbje);
	xjmle=cf.doubleTrim(xjmle);
	xjnbjsje=cf.doubleTrim(xjnbjsje);
	xjgsmlr=cf.doubleTrim(xjgsmlr);

	xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//（对外报价金额－成本金额）/报价金额
	xjmll=cf.doubleTrim(xjmll);
	xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
	xjgsmll=cf.doubleTrim(xjgsmll);
%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">合计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjcbje" size="10" value="<%=xjcbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjmll" size="6" value="<%=xjmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjmle" size="10" value="<%=xjmle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjnbjsje" size="10" value="<%=xjnbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjgsmll" size="6" value="<%=xjgsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjgsmlr" size="10" value="<%=xjgsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
    </tr>
  </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
		  <input type=button value='保存预结算' onClick="cf_submit(listform)" name="jsblxs">
      </td>
  </tr>
</table>
</form>
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function cf_submit(formName)
{
	formName.action="SaveCw_deyjsmx.jsp";
	formName.submit();
	return true;
} 


//修改：结算比例系数
function f_tzxs(FormName,xh)
{
	var nbjsdj=0;//内部结算单价=基价单价*(1+结算比例系数)
	nbjsdj=FormName.cbdj[xh].value*(1+FormName.jsblxs[xh].value/100.0);
	nbjsdj=round(nbjsdj,2);
	FormName.nbjsdj[xh].value=nbjsdj;

	var nbjsje=0;//内部结算金额=内部结算单价*工程数量
	nbjsje=FormName.nbjsdj[xh].value*FormName.sl[xh].value;
	nbjsje=round(nbjsje,2);
	FormName.nbjsje[xh].value=nbjsje;

	var gsmll=0;//公司毛利率=（对外报价金额－内部结算金额）*100/对外报价金额
	gsmll=(FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	gsmll=round(gsmll,2);
	FormName.gsmll[xh].value=gsmll;

	var gsmlr=0;//公司毛利润=公司毛利率*对外报价金额
	gsmlr=FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0;
	gsmlr=round(gsmlr,2);
	FormName.gsmlr[xh].value=gsmlr;

	f_jsxj(FormName);

} 

//重新计算小计
function f_jsxj(FormName)
{
	var xjdwbjje=<%=xjdwbjje%>;
	var xjcbje=0;
	var xjmle=0;
	var xjnbjsje=0;
	var xjgsmlr=0;
	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		xjcbje=xjcbje+FormName.cbje[i].value*1.0
		xjmle=xjmle+FormName.mle[i].value*1.0
		xjnbjsje=xjnbjsje+FormName.nbjsje[i].value*1.0
		xjgsmlr=xjgsmlr+FormName.gsmlr[i].value*1.0
	}

	xjcbje=round(xjcbje,2);
	FormName.xjcbje.value=xjcbje;
	xjmle=round(xjmle,2);
	FormName.xjmle.value=xjmle;
	xjnbjsje=round(xjnbjsje,2);
	FormName.xjnbjsje.value=xjnbjsje;
	xjgsmlr=round(xjgsmlr,2);
	FormName.xjgsmlr.value=xjgsmlr;

	var xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//（对外报价金额－成本金额）/报价金额
	xjmll=round(xjmll,2);
	FormName.xjmll.value=xjmll;
	var xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
	xjgsmll=round(xjgsmll,2);
	FormName.xjgsmll.value=xjgsmll;

} 



function f_tzjsbl(FormName)
{
	if(	javaTrim(FormName.tzjsblxs)=="") {
		alert("请输入[调整结算比例系数]！");
		FormName.tzjsblxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tzjsblxs, "调整结算比例系数"))) {
		return false;
	}

	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		FormName.jsblxs[i].value=FormName.tzjsblxs.value;
		f_tzxs(FormName,i);
	}
} 

//-->
</script>

