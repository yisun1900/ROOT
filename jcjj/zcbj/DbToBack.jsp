<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql =" select count(distinct bfsj)";
	ls_sql+=" from jc_zcjgb1";
	ls_sql+=" where dqbm=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//保留三个备份版本
	if (count>2)
	{
		java.sql.Timestamp bfsj=null;
		ls_sql =" select min(bfsj)";
		ls_sql+=" from jc_zcjgb1";
		ls_sql+=" where dqbm=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dqbm);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bfsj=rs.getTimestamp(1);
		}
		rs.close();
		ps.close();

		ls_sql="delete from  jc_zcjgb1 ";
		ls_sql+=" where bfsj=? and dqbm=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setTimestamp(1,bfsj);
		ps.setString(2,dqbm);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="insert into jc_zcjgb1(bfsj,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,sftjcp,zclbbm,xh,gg,zcysbm,jldwbm,lsj,yhj,cbj,jsbl,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,gys,ppmc,zp,dqbm,lrr,lrsj,lrbm,bz ) ";
	ls_sql+=" select SYSDATE,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,sftjcp,zclbbm,xh,gg,zcysbm,jldwbm,lsj,yhj,cbj,jsbl,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,sfbhpj,pjts,sfyh,cpjb,fgsx,cpsm,cd,gys,ppmc,zp,dqbm,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where dqbm='"+dqbm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	int row=ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("备份成功！共备份数据[<%=row%>]条");
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