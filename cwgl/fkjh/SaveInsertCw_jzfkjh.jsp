<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String[] fkcs=request.getParameterValues("fkcs");
String[] yfkbl=request.getParameterValues("yfkbl");
String[] yfksj=request.getParameterValues("yfksj");
String[] yfkjestr=request.getParameterValues("yfkje");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from cw_jzfkjh where khbh='"+khbh+"' and fklxbm='11'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<fkcs.length ; i++)
	{
		if (yfksj[i].equals(""))
		{
			continue;
		}

		double yfkje=0;

		if (!yfkjestr[i].equals(""))
		{
			try{
				yfkje=Double.parseDouble(yfkjestr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>付款期数["+fkcs[i]+"]错误！应付款金额["+yfkjestr[i]+"]不是数字");
				return;
			}

		}
		String fkjhxh="";
		int count=0;
		ls_sql="select NVL(max(substr(fkjhxh,8,4)),0)";
		ls_sql+=" from  cw_jzfkjh";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		fkjhxh=khbh+cf.addZero(count+1,4);

		ls_sql="insert into cw_jzfkjh(fkjhxh,khbh,fklxbm,fkcs,yfksj,yfkbl,yfkje,fkzt,lrr,lrsj,lrbm,bz) values('"+fkjhxh+"','"+khbh+"','11',"+fkcs[i]+",TO_DATE('"+yfksj[i]+"','YYYY-MM-DD'),'"+yfkbl[i]+"','"+yfkjestr[i]+"','N','"+lrr+"',SYSDATE,'"+lrbm+"','"+cf.GB2Uni(bz[i])+"')";
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>