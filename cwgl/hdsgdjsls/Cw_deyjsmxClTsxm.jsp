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

int row=1;

String dqbm=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwbm=null;
String jldwmc=null;
String gycl=null;

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
String bjlx=null;
String bjlxmc=null;

double clfbfb=0;//电子报价中无工料分析，默认材料费百分比
String xsclfbfb="";//电子报价中无工料分析，默认材料费百分比
double zjqye=0;

double allcbje=0;
double jsblxs=0;

double xjdwbjje=0;
double xjcbje=0;
double xjmll=0;
double xjmle=0;
double xjnbjsje=0;
double xjgsmll=0;
double xjgsmlr=0;

try {
	conn=cf.getConnection();

	//取：自定义项目成本百分比
	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='clfbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clfbfb=rs.getDouble("csz");
	}
	else{
		out.println("错误！在表sq_xtcsb中无默认材料费百分比");
	}
	rs.close();
	ps.close();

	//取客户信息
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


	//取材料成本，用于计算【默认结算比例】，需考虑有【工料分析】和【无工料分析】＋＋＋＋＋＋＋开始
	//有工料分析
	ls_sql="SELECT sum(bj_gclmx.sl*bj_khglfxb.xhl*bj_khglfxb.dj) je";
	ls_sql+=" FROM bj_khglfxb,bj_gclmx  ";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_khglfxb.khbh=bj_gclmx.khbh and bj_khglfxb.dqbm=bj_gclmx.dqbm and bj_khglfxb.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje=rs.getDouble("je");
	}
	rs.close();
	ps.close();

	//无工料分析
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj) je";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx  ";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_gclmx.xmbh not in(select xmbh from bj_khglfxb where bj_khglfxb.khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje+=rs.getDouble("je")*clfbfb/100;
	}
	rs.close();
	ps.close();

	//默认结算比例
	ls_sql="select jsbl";
	ls_sql+=" from  cw_dejsglfl";
	ls_sql+=" where  qsz<="+allcbje+" and "+allcbje+"<jzz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsblxs=rs.getDouble("jsbl");
	}
	rs.close();
	ps.close();
	//取材料成本，用于计算【默认结算比例】，需考虑有【工料分析】和【无工料分析】==========完成


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>施工队预结算-->处理特殊项目</b> 
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
      <td colspan="19" > 
		<input type=button value='确定－－结算比例系数' onClick="cf_submit(listform)">
      </td>
    </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >序号</td>
    <td  width="4%" >类型</td>
    <td  width="3%" >处理标志</td>
    <td  width="3%" >处理</td>
    <td  width="6%" >项目编号</td>
    <td  width="14%" >项目名称</td>
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
	int i=0;

	double dj=0;
	double sl=0;
	double dwbjje=0;

	//设标记，为了把多于项目删除
	ls_sql="update cw_deyjsmx set mark='0'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	String xclbz="";

	//输出项目明细
	ls_sql="SELECT bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,bj_bjxmmx.jldwbm,jldwmc,bj_bjxmmx.dj,sum(bj_gclmx.sl) sl,sum(bj_gclmx.sl*bj_bjxmmx.dj) as je";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx  ";
	ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"' and bj_gclmx.sl*bj_bjxmmx.dj>0";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" group by bj_bjxmmx.xmpx,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.bjlx,bj_bjxmmx.xmmc,bj_bjxmmx.jldwbm,jldwmc,bj_bjxmmx.dj";
	ls_sql+=" order by bj_bjxmmx.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dqbm=rs.getString("dqbm");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		bjlx=rs.getString("bjlx");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		dwbjje=rs.getDouble("je");


		//初始化
		cbdj=0;
		cbje=0;
		mll=0;
		mle=0;
		nbjsdj=0;
		nbjsje=0;
		gsmll=0;
		gsmlr=0;

		//判断工程量是否为0，无工程量项目舍掉
		if (sl<=0)
		{
			continue;
		}

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			xclbz="";//N：未处理；Y：已处理
			xsclfbfb="";
		}
		else{
			xsclfbfb=clfbfb+"";
			xclbz="N";//N：未处理；Y：已处理
		}

		ls_sql="SELECT sum(xhl*dj)";
		ls_sql+=" FROM bj_khglfxb  ";
		ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.dqbm='"+dqbm+"' and bj_khglfxb.xmbh='"+xmbh+"' ";
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


		//如果已有该项目，取出：结算比例系数、处理标志
		ls_sql="SELECT jsblxs,xclbz";
		ls_sql+=" FROM cw_deyjsmx  ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jsblxs=rs1.getDouble(1);
			xclbz=cf.fillNull(rs1.getString(2));

			rs1.close();
			ps1.close();

			//删除
			ls_sql="delete from cw_deyjsmx ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs1.close();
		ps1.close();

		nbjsdj=cbdj*(1+jsblxs/100);//成本单价*(1+结算比例系数)
		nbjsdj=cf.doubleTrim(nbjsdj);

		nbjsje=nbjsdj*sl;//内部结算单价*工程数量
		nbjsje=cf.doubleTrim(nbjsje);

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
		gsmll=cf.doubleTrim(gsmll);

		gsmlr=dwbjje-nbjsje;//公司毛利率*对外报价金额
		gsmlr=cf.doubleTrim(gsmlr);


		//插入表：定额结算明细（cw_deyjsmx）
		ls_sql="insert into cw_deyjsmx (khbh,xh,xmbh,xmmc,jldwbm,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,xclbz,mark)";
		ls_sql+=" values('"+khbh+"',"+row+",'"+xmbh+"','"+xmmc+"','"+jldwbm+"',"+sl+","+dj+","+dwbjje+","+cbdj+","+cbje+","+mll+","+mle+","+jsblxs+","+nbjsdj+","+nbjsje+","+gsmll+","+gsmlr+","+clfbfb+",'"+bjlx+"','"+xclbz+"','1') ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		row++;
	}
	rs.close();
	ps.close();

	//显示数据
	row=1;
	ls_sql="SELECT bjlx,xmbh,xmmc,cw_deyjsmx.jldwbm,jldwmc,sl,dwbjdj,dwbjje,clfbfb,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,DECODE(xclbz,'N','未处理','Y','处理') xclbz";
	ls_sql+=" FROM cw_deyjsmx,jdm_jldwbm";
	ls_sql+=" where cw_deyjsmx.jldwbm=jdm_jldwbm.jldwbm and khbh='"+khbh+"'";
	ls_sql+=" order by xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjlx=rs.getString("bjlx");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");//工程量
		dj=rs.getDouble("dwbjdj");//对外单价
		dwbjje=rs.getDouble("dwbjje");//对外金额
		clfbfb=rs.getDouble("clfbfb");
		cbdj=rs.getDouble("cbdj");
		cbje=rs.getDouble("cbje");
		mll=rs.getDouble("mll");
		mle=rs.getDouble("mle");
		jsblxs=rs.getDouble("jsblxs");
		nbjsdj=rs.getDouble("nbjsdj");
		nbjsje=rs.getDouble("nbjsje");
		gsmll=rs.getDouble("gsmll");
		gsmlr=rs.getDouble("gsmlr");
		xclbz=rs.getString("xclbz");

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			bjlxmc="标准";
		}
		else{
			bjlxmc="自定义";
		}
		
		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		String clstr="";
		if (xclbz==null)
		{
			xclbz="&nbsp;";
			clstr="&nbsp;";
		}
		else{
			clstr="<A HREF='InsertYjsBj_jzglfxb.jsp?khbh="+khbh+"&xmbh="+xmbh+"' target='_blank'>修改</A>";
		}
		
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%></td>
			<td ><%=xclbz%></td>
			<td ><%=clstr%></td>
			<td ><%=xmbh%></td>
			<td ><%=xmmc%></td>
			<td ><%=jldwmc%></td>
			<td ><%=sl%></td>
			<td ><%=dj%></td>
			<td ><%=dwbjje%></td>
			<td><%=cbdj%></td>
			<td><%=cbje%></td>
			<td><%=mll%>%</td>
			<td><%=mle%></td>
			<td><%=jsblxs%>%</td>
			<td><%=nbjsdj%></td>
			<td><%=nbjsje%></td>
			<td><%=gsmll%>%</td>
			<td><%=gsmlr%></td>
		  </tr>
		<%
		row++;

	}
	rs.close();
	ps.close();

	if (xjdwbjje==0)
	{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=0;//（对外报价金额－成本金额）/报价金额
		xjgsmll=0;//（对外报价金额－内部结算金额）/对外报价金额
	}
	else{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//（对外报价金额－成本金额）/报价金额
		xjmll=cf.doubleTrim(xjmll);
		xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
		xjgsmll=cf.doubleTrim(xjgsmll);
	}
%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">合计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=xjcbje%></td>
	<td><%=xjmll%>%</td>
	<td><%=xjmle%></td>
	<td >&nbsp;</td>
	<td><%=xjnbjsje%></td>
	<td><%=xjgsmll%>%</td>
	<td><%=xjgsmlr%></td>
    </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="19" > 
		  <input type=button value='确定－－结算比例系数' onClick="cf_submit(listform)" >
      </td>
    </tr>
</table>
</form>
</body>
</html>

<%
	//删除不用项目
	ls_sql="delete from cw_dejsmx";
	ls_sql+=" where khbh='"+khbh+"' and mark='0'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
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
function cf_submit(FormName)
{
	FormName.action="Cw_deyjsmxList.jsp";
	FormName.submit();
	return true;
} 

//修改：自定义项目成本百分比
function f_jsjg(FormName,xh)
{
	var cbdj=0;//基价单价=对外单价*自定义项目成本百分比
	cbdj=FormName.dj[xh].value*FormName.clfbfb[xh].value/100.0;
	cbdj=round(cbdj,2);
	FormName.cbdj[xh].value=cbdj;

	var cbje=0;//基价金额=基价单价*数量
	cbje=FormName.sl[xh].value*FormName.cbdj[xh].value;
	cbje=round(cbje,2);
	FormName.cbje[xh].value=cbje;

	var mll=0;//毛利率=（对外报价金额－基价金额）*100/对外报价金额
	mll=(FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	mll=round(mll,2);
	FormName.mll[xh].value=mll;

	var mle=0;//毛利金额=毛利率*对外报价金额
	mle=FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0;
	mle=round(mle,2);
	FormName.mle[xh].value=mle;

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

