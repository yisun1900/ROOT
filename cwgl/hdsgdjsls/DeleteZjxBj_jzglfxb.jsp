<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String gdjsjlh=request.getParameter("gdjsjlh");
String zjxxh=request.getParameter("zjxxh");

String[] scglbxh=request.getParameterValues("scglbxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<scglbxh.length ;i++ )
	{
		//家装工料分析表
		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"' and glbxh="+scglbxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//【基价单价】发生变化需重新计算＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	double jsblxs=0;

	double sl=0;
	double dwbjje=0;


	//从【客户工料分析表（bj_khglfxb）】取基价单价
	ls_sql="SELECT sum(xhl*dj)";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cbdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//取：结算比例系数
	ls_sql="SELECT jsblxs,sl,dwbjje";
	ls_sql+=" from cw_dejsmx ";
	ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsblxs=rs.getDouble("jsblxs");
		sl=rs.getDouble("sl");
		dwbjje=rs.getDouble("dwbjje");
	}
	rs.close();
	ps.close();


	cbdj=cf.doubleTrim(cbdj,2);//成本单价、基价单价

	cbje=sl*cbdj;//工程量*成本单价
	cbje=cf.doubleTrim(cbje);//成本金额、基价金额


	mll=(dwbjje-cbje)/dwbjje*100;//（对外报价金额－成本金额）/报价金额
	mll=cf.doubleTrim(mll);//毛利率

	mle=dwbjje-cbje;//毛利率*对外报价金额
	mle=cf.doubleTrim(mle);//毛利金额


	nbjsdj=cbdj*(1+jsblxs/100);//成本单价*(1+结算比例系数)
	nbjsdj=cf.doubleTrim(nbjsdj);//内部结算单价

	nbjsje=nbjsdj*sl;//内部结算单价*工程数量
	nbjsje=cf.doubleTrim(nbjsje);//内部结算金额

	gsmll=(dwbjje-nbjsje)/dwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
	gsmll=cf.doubleTrim(gsmll);//公司毛利率

	gsmlr=dwbjje-nbjsje;//公司毛利率*对外报价金额
	gsmlr=cf.doubleTrim(gsmlr);//公司毛利润


	ls_sql="update cw_dejsmx set xclbz='Y',cbdj=?,cbje=?,mll=?,mle=?,nbjsdj=?,nbjsje=?,gsmll=?,gsmlr=?";
	ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,cbdj);
	ps.setDouble(2,cbje);
	ps.setDouble(3,mll);
	ps.setDouble(4,mle);
	ps.setDouble(5,nbjsdj);
	ps.setDouble(6,nbjsje);
	ps.setDouble(7,gsmll);
	ps.setDouble(8,gsmlr);
	ps.executeUpdate();
	ps.close();

	//【基价单价】发生变化需重新计算===========================完成

	ls_sql="SELECT sum(nbjsje)";
	ls_sql+=" from cw_dejsmx ";
	ls_sql+=" where cw_dejsmx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nbjsje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update cw_gdjsjl set dejsje="+nbjsje;
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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