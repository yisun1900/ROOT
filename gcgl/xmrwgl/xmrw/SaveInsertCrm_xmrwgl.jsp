<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String[] rwbm=request.getParameterValues("rwbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	if (rwbm!=null)
	{
		for (int i=0;i<rwbm.length ;i++ )
		{
			int count=0;
			ls_sql="select count(*)";
			ls_sql+=" from  crm_xmrwgl";
			ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count==0)
			{
				ls_sql =" insert into crm_xmrwgl (khbh,rwbm,rwmc,rwflbm,zdjkrw,xgytg,gytgts,sjcpxx,sjcpfl,bjjbbm,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfxtx,sfyxhxgq,sfyxfc,sfxys,ysxm,sfwlcb,zyrwbm,rwxh,gznr,jdbz,lrr,lrsj,lrbm,sfxrw,sfzdyrw )  ";
				ls_sql+=" select                     ?,rwbm,rwmc,rwflbm,zdjkrw,xgytg,gytgts,sjcpxx,sjcpfl,bjjbbm,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,'N'  ,sfyxhxgq,sfyxfc,sfxys,ysxm,sfwlcb,zyrwbm,rwxh,gznr,bz  ,?,SYSDATE,?,'N','N' ";
				ls_sql+=" from dm_bzrwbm ";
				ls_sql+=" where rwbm='"+rwbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,lrr);
				ps.setString(3,lrbm);
				ps.executeUpdate();
				ps.close();

				ls_sql =" insert into crm_xmrwljgx (khbh,rwbm,qzrwbm)  ";
				ls_sql+=" select                       ?,rwbm,qzrwbm ";
				ls_sql+=" from dm_bzrwljgx ";
				ls_sql+=" where rwbm='"+rwbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.executeUpdate();
				ps.close();

				ls_sql =" insert into crm_xmrwcpfl (khbh,rwbm,cpflbm)  ";
				ls_sql+=" select                      ?,rwbm,cpflbm ";
				ls_sql+=" from dm_bzrwcpfl ";
				ls_sql+=" where rwbm='"+rwbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.executeUpdate();
				ps.close();

				ls_sql =" insert into crm_xmrwysxm (khbh,rwbm,gcysxmbm)  ";
				ls_sql+=" select                      ?,rwbm,gcysxmbm ";
				ls_sql+=" from dm_bzrwysxm ";
				ls_sql+=" where rwbm='"+rwbm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.executeUpdate();
				ps.close();
			}

		}

		ls_sql =" delete from crm_xmrwgl ";
		ls_sql+=" where khbh='"+khbh+"' and "+cf.arrayToNotInSQL(rwbm,"rwbm");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql =" delete from crm_xmrwljgx ";
		ls_sql+=" where khbh='"+khbh+"' and "+cf.arrayToNotInSQL(rwbm,"rwbm");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql =" delete from crm_xmrwcpfl ";
		ls_sql+=" where khbh='"+khbh+"' and "+cf.arrayToNotInSQL(rwbm,"rwbm");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql =" delete from crm_xmrwysxm ";
		ls_sql+=" where khbh='"+khbh+"' and "+cf.arrayToNotInSQL(rwbm,"rwbm");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql =" delete from crm_xmrwgl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql =" delete from crm_xmrwljgx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql =" delete from crm_xmrwcpfl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql =" delete from crm_xmrwysxm ";
		ls_sql+=" where khbh='"+khbh+"' ";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>