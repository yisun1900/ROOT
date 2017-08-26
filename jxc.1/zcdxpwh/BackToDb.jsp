<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String bfsjstr=cf.GB2Uni(request.getParameter("bfsj"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	java.sql.Timestamp bfsj=java.sql.Timestamp.valueOf(bfsjstr);

	ls_sql="delete from  jc_zcjgb ";
	ls_sql+=" where dqbm=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into jc_zcjgb(clbm,clmc,cldlbm,clxlbm,ppmc,sftjcp,cllbbm,xh,gg,clysbm,jldwbm,lsj,xsj,cbj,jsbl,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,gysmc,ppmc,zp,dqbm,lrr,lrsj,lrbm,bz) ";
	ls_sql+=" select clbm,clmc,cldlbm,clxlbm,ppmc,sftjcp,cllbbm,xh,gg,clysbm,jldwbm,lsj,xsj,cbj,jsbl,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,gysmc,ppmc,zp,dqbm,lrr,lrsj,lrbm,bz";
	ls_sql+=" from  jc_zcjgb1";
	ls_sql+=" where bfsj=? and dqbm=?";
//	out.println(bfsj);
	ps= conn.prepareStatement(ls_sql);
	ps.setTimestamp(1,bfsj);
	ps.setString(2,dqbm);
	int row=ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("还原成功！共还原数据[<%=row%>]条");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>