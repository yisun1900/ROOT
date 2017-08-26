<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String[] oldjgwzbm=request.getParameterValues("oldjgwzbm");
String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] fjmj=request.getParameterValues("fjmj");
String[] fjg=request.getParameterValues("fjg");
String[] zdyxmmj=request.getParameterValues("zdyxmmj");
String[] zdybzmj=request.getParameterValues("zdybzmj");
String[] xuhao=request.getParameterValues("xuhao");
String[] bz=request.getParameterValues("bz");
String[] fjzcxq=request.getParameterValues("fjzcxq");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	conn.setAutoCommit(false);

	//清空序号
	ls_sql="update bj_fjxxh set xuhao=-1 where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<oldjgwzbm.length ; i++)
	{
		try{
			Double.parseDouble(fjmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！房间面积["+cf.GB2Uni(fjmj[i])+"]不是数字");
			return;
		}
		try{
			Double.parseDouble(fjg[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！房间高["+cf.GB2Uni(fjg[i])+"]不是数字");
			return;
		}
		try{
			Double.parseDouble(zdyxmmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！自定义木作面积["+cf.GB2Uni(zdyxmmj[i])+"]不是数字");
			return;
		}
		try{
			Double.parseDouble(zdybzmj[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！自定义壁纸面积["+cf.GB2Uni(zdybzmj[i])+"]不是数字");
			return;
		}

		try{
			Integer.parseInt(xuhao[i]);
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>["+cf.GB2Uni(oldjgwzbm[i])+"]错误！房间顺序号["+cf.GB2Uni(xuhao[i])+"]不是数字");
			return;
		}

		
		if (jgwzbm[i].trim().equals(""))
		{
			conn.rollback();
			out.println("错误！房间名称["+cf.GB2Uni(oldjgwzbm[i])+"]被改为空值");
			return;
		}
		if (xuhao[i].trim().equals(""))
		{
			conn.rollback();
			out.println("错误！房间顺序号不能为空值");
			return;
		}

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_fjxxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and jgwzbm!='"+cf.GB2Uni(oldjgwzbm[i])+"' and jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);

		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("房间顺序号["+xuhao[i]+"]错误！房间名称["+cf.GB2Uni(jgwzbm[i])+"]已存在");
			return;
		}

		ls_sql="update bj_fjxxh set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"',fjzcxq='"+cf.GB2Uni(fjzcxq[i])+"',bz='"+cf.GB2Uni(bz[i])+"',fjmj="+fjmj[i]+",fjg="+fjg[i]+",zdyxmmj="+zdyxmmj[i]+",zdybzmj="+zdybzmj[i]+",xuhao="+xuhao[i]+" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update bj_gclmxh set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"' where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		if (!cf.GB2Uni(jgwzbm[i]).equals(cf.GB2Uni(oldjgwzbm[i])))
		{
			ls_sql="update bj_khzcxmxjh set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
			ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="update bj_khzcxmh set jgwzbm='"+cf.GB2Uni(jgwzbm[i])+"'";
			ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+cf.GB2Uni(oldjgwzbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
*/
	}

	//调整序号
	int pxxh=0;
	String lsjgwzbm=null;
	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsjgwzbm=rs.getString(1);

		pxxh++;

		ls_sql="update bj_fjxxh set xuhao="+pxxh+" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and jgwzbm='"+lsjgwzbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


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
	out.print("存盘失败,发生意外: " + e);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>