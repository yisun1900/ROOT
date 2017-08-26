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
String ls_sql=null;

String xmbh=null;
String xmmc=null;
String jldwmc=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String bjjb=null;

double zjqye=0;

try {
	conn=cf.getConnection();

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
<div align="center"> <b>施工队预结算明细</b> 
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

<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >序号</td>
    <td  width="4%" >类型</td>
    <td  width="7%" >项目编号</td>
    <td  width="14%" >项目名称</td>
    <td  width="4%" >单位</td>
    <td  width="5%" >数量</td>
    <td  width="5%" >对外单价</td>
    <td  width="6%" >对外金额</td>
    <td  width="5%" >基价单价</td>
    <td  width="6%" >基价金额</td>
    <td  width="5%" >毛利率</td>
    <td  width="6%" >毛利金额</td>
    <td  width="5%" bgcolor="#CCFFFF" ><font color="#000000">结算比例系数</font></td>
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
	double clfbfb =0;
	String xsclfbfb="";//电子报价中无工料分析，默认材料费百分比
	String bjlx=null;
	String bjlxmc=null;

	double xjdwbjje=0;
	double xjcbje=0;
	double xjmll=0;
	double xjmle=0;
	double xjnbjsje=0;
	double xjgsmll=0;
	double xjgsmlr=0;

	//输出项目明细
	ls_sql="SELECT xmbh,xh,xmmc,jldwmc,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,DECODE(bjlx,'1','标准','2','自定义') bjlxmc";
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
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dwbjdj");
		dwbjje=rs.getDouble("dwbjje");
		cbdj=rs.getDouble("cbdj");
		cbje=rs.getDouble("cbje");
		mll=rs.getDouble("mll");
		mle=rs.getDouble("mle");
		jsblxs=rs.getDouble("jsblxs");
		nbjsdj=rs.getDouble("nbjsdj");
		nbjsje=rs.getDouble("nbjsje");
		gsmll=rs.getDouble("gsmll");
		gsmlr=rs.getDouble("gsmlr");
		clfbfb=rs.getDouble("clfbfb");
		bjlx=rs.getString("bjlx");
		bjlxmc=rs.getString("bjlxmc");

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			xsclfbfb="&nbsp;";
		}
		else{
			xsclfbfb=clfbfb+"%";
		}


		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		
		//输出每行数据
		%> 
  <tr bgcolor="#FFFFFF" align="center"> 
    <td ><%=xh%></td>
    <td ><%=bjlxmc%></td>
    <td ><%=xmbh%> </td>
    <td ><%=xmmc%> </td>
    <td ><%=jldwmc%> </td>
    <td ><%=sl%> </td>
    <td ><%=dj%> </td>
    <td ><%=dwbjje%> </td>
    <td><%=cbdj%> </td>
    <td><%=cbje%> </td>
    <td><%=mll%>% </td>
    <td><%=mle%> </td>
    <td bgcolor="#CCFFFF"><font color="#000000"><%=jsblxs%>% </font></td>
    <td><%=nbjsdj%></td>
    <td><%=nbjsje%></td>
    <td><%=gsmll%>%</td>
    <td><%=gsmlr%></td>
  </tr>
  <%

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
    <td >&nbsp;</td>
    <td ><%=xjdwbjje%></td>
    <td >&nbsp;</td>
    <td><%=xjcbje%></td>
    <td><%=xjmll%>%</td>
    <td><%=xjmle%></td>
    <td bgcolor="#CCFFFF" >&nbsp;</td>
    <td >&nbsp;</td>
    <td><%=xjnbjsje%></td>
    <td><%=xjgsmll%>%</td>
    <td><%=xjgsmlr%></td>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

