<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String psph=null;
String shr=null;
String shsm=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
psph=cf.GB2Uni(request.getParameter("psph"));

double fkje=0;
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[返款金额]类型转换发生意外:"+e);
	return;
}
double yf=0;
ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[运费]类型转换发生意外:"+e);
	return;
}
double qtsf=0;
ls=request.getParameter("qtsf");
try{
	if (!(ls.equals("")))  qtsf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtsf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它收费]类型转换发生意外:"+e);
	return;
}



shr=cf.GB2Uni(request.getParameter("shr"));
java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
shsm=cf.GB2Uni(request.getParameter("shsm"));
String shjl=cf.GB2Uni(request.getParameter("shjl"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	String fgsbh=null;
	String yshjl="";
	ls_sql=" SELECT psdzt,fgsbh,shjl ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx ";
    ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh and jxc_clpsd.psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		yshjl=cf.fillNull(rs.getString("shjl"));
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql=" SELECT dqbm";
	ls_sql+=" FROM sq_dwxx ";
    ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("2") && !psdzt.equals("6") && !psdzt.equals("7"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	{
		out.print("错误！材料单["+psph+"]未审核");
		return;
	}

	String setpsdzt=null;
	if (shjl.equals("Y"))//Y：同意；N：作废；M：驳回重新修改
	{
		setpsdzt="2";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	}
	else if (shjl.equals("N"))//Y：同意；N：作废；M：驳回重新修改
	{
		setpsdzt="7";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	}
	else{
		setpsdzt="6";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	}


	conn.setAutoCommit(false);

	ls_sql="update jxc_clpsd set psdzt='"+setpsdzt+"',shjl=?,fkje=?,yf=?,qtsf=?,shr=?,shsj=?,shsm=?";
	ls_sql+=" where psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shjl);
	ps.setDouble(2,fkje);
	ps.setDouble(3,yf);
	ps.setDouble(4,qtsf);
	ps.setString(5,shr);
	ps.setDate(6,shsj);
	ps.setString(7,shsm);
	ps.executeUpdate();
	ps.close();

	//修改：材料价格表（jxc_cljgb）.订货数量
	if (yshjl.equals("Y"))
	{
		String clbm=null;
		String clmc=null;
		String nbbm=null;
		String xsfs=null;
		double sqpssl=0;
		double pssl=0;
		ls_sql=" select clbm,clmc,nbbm,sqpssl,pssl,xsfs ";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where psph='"+psph+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=cf.fillNull(rs.getString("clbm"));
			clmc=cf.fillNull(rs.getString("clmc"));
			nbbm=cf.fillNull(rs.getString("nbbm"));
			sqpssl=rs.getDouble("sqpssl");
			pssl=rs.getDouble("pssl");
			xsfs=cf.fillNull(rs.getString("xsfs"));

			if (!xsfs.equals("1"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
			{
				ls_sql="update jxc_cljgb set dhsl=dhsl-"+pssl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();
	}

	if (shjl.equals("Y"))
	{
		//修改：材料价格表（jxc_cljgb）.订货数量
		String clbm=null;
		String clmc=null;
		String nbbm=null;
		String xsfs=null;
		double pssl=0;
		ls_sql=" select clbm,clmc,nbbm,pssl,xsfs ";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where psph='"+psph+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			clbm=cf.fillNull(rs.getString("clbm"));
			clmc=cf.fillNull(rs.getString("clmc"));
			nbbm=cf.fillNull(rs.getString("nbbm"));
			pssl=rs.getDouble("pssl");
			xsfs=cf.fillNull(rs.getString("xsfs"));

			if (!xsfs.equals("1"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
			{
				ls_sql="update jxc_cljgb set dhsl=dhsl+"+pssl;
				ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>