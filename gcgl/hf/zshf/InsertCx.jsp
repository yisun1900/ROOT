<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%  
String ssfgs = request.getParameter("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String hfsjzdsz="0000";
	ls_sql="SELECT hfsjzdsz";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfsjzdsz=cf.fillNull(rs.getString("hfsjzdsz"));
	}
	else{
		out.println("错误！单位信息表中，没有设置回访参数");
		return;
	}
	rs.close();
	ps.close();

	if (hfsjzdsz.length()!=4)
	{
		out.println("单位信息表中回访参数设置不正确，要求4位："+hfsjzdsz);
		return;
	}

	String onehf=hfsjzdsz.substring(0,1);
	String twohf=hfsjzdsz.substring(1,2);
	String threehf=hfsjzdsz.substring(2,3);
	String fourhf=hfsjzdsz.substring(3,4);

	String retStr="";
	retStr+="[value1]";

	if (onehf.equals("0"))
	{
		retStr+="%21+材料进场回访";
	}
	if (twohf.equals("0"))
	{
		retStr+="%22+隐蔽工程回访";
	}
	if (threehf.equals("0"))
	{
		retStr+="%23+中期回访";
	}
	if (fourhf.equals("0"))
	{
		retStr+="%24+完工回访";
	}

	out.print(retStr);  

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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

