<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String[] xmbh=request.getParameterValues("xmbh");
String[] jsblxsstr=request.getParameterValues("jsblxs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ;i++ )
	{
		double sl=0;
		double qye=0;
		double cbdj=0;

		double jsblxs=0;

		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;

		try{
			jsblxs=java.lang.Double.parseDouble(jsblxsstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[结算比例系数]输入不正确:"+jsblxsstr[i].trim());
			return;
		}

		if (jsblxs<=0 || jsblxs>100)
		{
			conn.rollback();
			out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[结算比例系数]输入不正确:"+jsblxsstr[i].trim()+"，应在0和100之间");
			return;
		}


		ls_sql="SELECT sl,dwbjje,cbdj";
		ls_sql+=" from cw_deyjsmx,jdm_jldwbm ";
		ls_sql+=" where cw_deyjsmx.khbh='"+khbh+"' and cw_deyjsmx.xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sl=rs.getDouble("sl");
			qye=rs.getDouble("dwbjje");
			cbdj=rs.getDouble("cbdj");
		}
		rs.close();
		ps.close();

		if (sl>0)
		{
			nbjsdj=cbdj*(1+jsblxs/100);//成本单价*(1+结算比例系数)
			nbjsdj=cf.doubleTrim(nbjsdj);

			nbjsje=nbjsdj*sl;//内部结算单价*工程数量
			nbjsje=cf.doubleTrim(nbjsje);

			gsmll=(qye-nbjsje)/qye*100;//（对外报价金额－内部结算金额）/对外报价金额
			gsmll=cf.doubleTrim(gsmll);

			gsmlr=qye-nbjsje;//公司毛利率*对外报价金额
			gsmlr=cf.doubleTrim(gsmlr);
		}

		ls_sql="update cw_deyjsmx set jsblxs="+jsblxs+",nbjsdj="+nbjsdj+",nbjsje="+nbjsje+",gsmll="+gsmll+",gsmlr="+gsmlr;
		ls_sql+=" where cw_deyjsmx.khbh='"+khbh+"' and cw_deyjsmx.xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
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