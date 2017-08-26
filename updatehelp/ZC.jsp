<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="alter table jc_zcdd add (fgsbh char(5) null,qddm char(5) null,jzsjs VARCHAR2(20) null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcdd set ";
	ls_sql+="fgsbh=(select fgsbh from crm_khxx where jc_zcdd.khbh=crm_khxx.khbh)";
	ls_sql+=",qddm=(select dwbh from crm_khxx where jc_zcdd.khbh=crm_khxx.khbh)";
	ls_sql+=",jzsjs=(select sjs from crm_khxx where jc_zcdd.khbh=crm_khxx.khbh)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="alter table jc_zcdd modify (fgsbh char(5) not null,qddm char(5) not null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//////////////////////////
	
	ls_sql="alter table jc_zcddmx add (fgsbh char(5) null,qddm char(5) null,jzsjs VARCHAR2(20) null,khbh char(20) null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcddmx set ";
	ls_sql+="khbh=(select khbh from jc_zcdd where jc_zcddmx.ddbh=jc_zcdd.ddbh)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcddmx set ";
	ls_sql+="fgsbh=(select fgsbh from crm_khxx where jc_zcddmx.khbh=crm_khxx.khbh)";
	ls_sql+=",qddm=(select dwbh from crm_khxx where jc_zcddmx.khbh=crm_khxx.khbh)";
	ls_sql+=",jzsjs=(select sjs from crm_khxx where jc_zcddmx.khbh=crm_khxx.khbh)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="alter table jc_zcddmx modify (fgsbh char(5) not null,qddm char(5) not null,khbh char(20) not null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//////////////////////////

	ls_sql="alter table jc_zczjx add (zcdlbm VARCHAR2(50) null,zcxlbm VARCHAR2(50) null,ppbm VARCHAR2(50) null,gys VARCHAR2(50) null,ppmc VARCHAR2(50) null,clgw VARCHAR2(20) null,ztjjgw VARCHAR2(20) null,xmzy VARCHAR2(20) null,jjsjs VARCHAR2(20) null,zjxfssj date null,fgsbh char(5) null,qddm char(5) null,jzsjs VARCHAR2(20) null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zczjx set zcdlbm=(select zcdlbm from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",zcxlbm=(select zcxlbm from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",ppbm=(select ppbm from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",gys=(select gys from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",ppmc=(select ppmc from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",clgw=(select clgw from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",ztjjgw=(select ztjjgw from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",xmzy=(select xmzy from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";
	ls_sql+=",jjsjs=(select jjsjs from jc_zcdd where jc_zcdd.ddbh=jc_zczjx.ddbh)";

	ls_sql+=",fgsbh=(select fgsbh from crm_khxx where jc_zczjx.khbh=crm_khxx.khbh)";
	ls_sql+=",qddm=(select dwbh from crm_khxx where jc_zczjx.khbh=crm_khxx.khbh)";
	ls_sql+=",jzsjs=(select sjs from crm_khxx where jc_zczjx.khbh=crm_khxx.khbh)";
	ls_sql+=", zjxfssj=lrsj";
	
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="alter table jc_zczjx modify (zcdlbm VARCHAR2(50) not null,zcxlbm VARCHAR2(50) not null,ppbm VARCHAR2(50) not null,gys VARCHAR2(50) not null,ppmc VARCHAR2(50) not null,zjxfssj date not null,fgsbh char(5) not null,qddm char(5) not null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zczjx set clzt='99'";
	ls_sql+=" where ddbh in(select ddbh from jc_zcdd where clzt='99')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>