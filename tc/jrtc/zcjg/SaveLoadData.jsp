<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjjbbm = request.getParameter("bjjbbm");
String dqbm = request.getParameter("dqbm");

String[] tccpdlbm =request.getParameterValues("tccpdlbm");
String[] tccplbbm =request.getParameterValues("tccplbbm");
String[] tcsjflbm =request.getParameterValues("tcsjflbm");
String[] sku =request.getParameterValues("sku");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldw =request.getParameterValues("jldw");
String[] xdjldw =request.getParameterValues("xdjldw");
String[] xdb =request.getParameterValues("xdb");
String[] dj =request.getParameterValues("dj");
String[] tccldj =request.getParameterValues("tccldj");
String[] sfkgdj =request.getParameterValues("sfkgdj");
String[] jsj =request.getParameterValues("jsj");
String[] sh =request.getParameterValues("sh");
String[] sfcscp =request.getParameterValues("sfcscp");
String[] xuhao =request.getParameterValues("xuhao");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] sfxclxs =request.getParameterValues("sfxclxs");
String[] sfyx =request.getParameterValues("sfyx");
String[] yxkssj =request.getParameterValues("yxkssj");
String[] yxjzsj =request.getParameterValues("yxjzsj");
String[] cllx =request.getParameterValues("cllx");

String ls=null;
double tlgbzjj=0;
ls=request.getParameter("tlgbzjj");
try{
	if (!(ls.equals("")))  tlgbzjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[tlgbzjj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[涂料改壁纸价格]类型转换发生意外:"+e);
	return;
}

//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	int count=0;
	sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	sql+=" from  bj_tczcbj";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<cpmc.length ;i++ )
	{
		if (xdb[i].equals("0") || xdb[i].equals("0.0"))
		{
			conn.rollback();
			out.println("错误！下单比不能为0");
			return;
		}

		if (tccplbbm[i].equals("64"))//墙漆改壁纸
		{
			if (Double.parseDouble(dj[i])!=tlgbzjj)
			{
				conn.rollback();
				out.println("错误！涂料改壁纸价格不正确，【套餐价格表】设置为："+tlgbzjj);
				return;
			}

			if (Double.parseDouble(tccldj[i])!=tlgbzjj)
			{
				conn.rollback();
				out.println("错误！涂料改壁纸价格不正确，【套餐价格表】设置为："+tlgbzjj);
				return;
			}
		}

		count++;

		String cpbm=null;
		cpbm="TC"+cf.addZero(count,11);

		sql="insert into bj_tczcbj ( dqbm,bjjbbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,xh,gg    ";
		sql+=" ,jldw,xdjldw,xdb,dj,tccldj,sfkgdj,jsj,sh,sfcscp,ppmc,gysmc,xuhao,sfxclxs   ,lrr,lrsj,sfyx,yxkssj,yxjzsj,cllx ) ";
		sql+=" values('"+dqbm+"','"+bjjbbm+"','"+cpbm+"','"+sku[i]+"','"+tccpdlbm[i]+"','"+tccplbbm[i]+"','"+tcsjflbm[i]+"','"+cf.GB2Uni(cpmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(jldw[i])+"','"+cf.GB2Uni(xdjldw[i])+"','"+xdb[i]+"','"+dj[i]+"','"+tccldj[i]+"','"+sfkgdj[i]+"','"+jsj[i]+"','"+sh[i]+"','"+sfcscp[i]+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(gysmc[i])+"','"+xuhao[i]+"','"+sfxclxs[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE,'"+sfyx[i]+"',TO_DATE('"+yxkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+yxjzsj[i]+"','YYYY-MM-DD'),'"+cllx[i]+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
