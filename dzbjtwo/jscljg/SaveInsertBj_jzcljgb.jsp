<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dqbm=request.getParameter("dqbm");
String cldlbm=request.getParameter("cldlbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xhgg=request.getParameterValues("xhgg");
String[] wlbm=request.getParameterValues("wlbm");
String[] wlllbz=request.getParameterValues("wlllbz");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


double dj=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

    
	for (int i=0;i<wlbm.length ;i++ )
	{
		int count=0;

		//未录信息
		if (wlbm[i].equals(""))
		{
			continue;
		}

		//[材料名称]是否为空
		if (glmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[材料名称]为空");
			return;
		}
		//[计量单位]是否为空
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[计量单位]为空");
			return;
		}
		
		//[单价]是否为空
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[单价]为空");
			return;
		}
		if (wlbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[结算材料编码]为空");
			return;
		}
		if (wlllbz[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[是否需到物流领料]为空");
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！材料名称为["+cf.GB2Uni(glmc[i])+"]的[单价]输入不正确:"+djstr[i].trim());
			return;
		}
		
       
        ls_sql="select count(*)";
	    ls_sql+=" from  bj_jscljgb";
	    ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   count=rs.getInt(1);
	    }
	    rs.close();
	    ps.close();
	    if (count>0)
	    {
			conn.rollback();
			out.println("错误！[结算材料编码]重复,不允许重复录入。结算材料编码："+cf.GB2Uni(wlbm[i]));
			return;
	    }
        
		//材料价格信息表
		ls_sql="insert into bj_jscljgb(dqbm,cldlbm,glmc,pp,xhgg,jldwbm,dj,lrr,lrsj,wlbm,wlllbz)";
		ls_sql+=" values('"+dqbm+"','"+cldlbm+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+dj+",'"+yhmc+"',TRUNC(SYSDATE),'"+cf.GB2Uni(wlbm[i])+"','"+cf.GB2Uni(wlllbz[i])+"')";
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