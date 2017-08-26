<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String htshr=cf.GB2Uni(request.getParameter("htshr"));
String htshyj=cf.GB2Uni(request.getParameter("htshyj"));

String ls=null;
java.sql.Date htshsj=null;
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同审核时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int htshdf=0;

try {
	conn=cf.getConnection();

	String hth=null;
	double wdzgce=0;
	double zhgczjf=0;
	double qye=0;
	double guanlif=0;
	double suijin=0;
	ls_sql="select hth,wdzgce,zhgczjf,qye,guanlif,suijin";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString("hth");
		wdzgce=rs.getDouble("wdzgce");
		zhgczjf=rs.getDouble("zhgczjf");
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
	}
	rs.close();
	ps.close();

	ls_sql="select sum(bhgsl*kf)";
	ls_sql+=" from  crm_htshmx";
	ls_sql+=" where  khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		htshdf=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set htshr=?,htshsj=?,htshyj=?,htshdf=?,htshbz='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,htshr);
	ps.setDate(2,htshsj);
	ps.setString(3,htshyj);
	ps.setInt(4,htshdf);
	ps.executeUpdate();
	ps.close();


	//向松下亿达系统传递金额
	kberp.KbErp kberp=new kberp.KbErp();
	String res = kberp.setJe(hth,qye,zhgczjf,guanlif,suijin);
	if (!res.equals("yes"))
	{
		conn.rollback();
		out.println(hth+"传递松下亿达系统金额失败，系统异常："+res);
		return;
	}
	

	//触发松下亿达系统订单的状态发生改变
	String retStr = kberp.setState(hth,"AUDITED",yhmc);
	if (!retStr.equals("yes"))
	{
		conn.rollback();
		out.println(hth+"传递松下亿达系统订单状态失败，系统异常："+retStr);
		return;
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