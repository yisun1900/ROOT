<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入橱柜明细 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;


String ddbh =null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql1=null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ddbh = up.getParameter("ddbh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\foxpro\\IMP_"+yhdlm+".DBF";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();
%>


<%
	String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
	String url = "jdbc:odbc:impcgdd";
	String user = "";
	String passwd = "";

	conn1=cf.getConnection();    //得到连接
	
	Class.forName (driver);
	conn = DriverManager.getConnection(url, user, passwd);
	
	String order_no =null;
	String cust_name =null;

	String cust_phone=null;
	String cust_addr=null;
	java.sql.Date order_date=null;
	String designer=null;
	String sale_addr=null;
	String sale_phone=null;
	java.sql.Date setup_date=null;
	String approver=null;
	String item_num=null;
	String usercode=null;
	String type=null;
	String name=null;
	String style=null;
	String side=null;
	String texture=null;
	String edge=null;
	String pull_pose=null;
	String pull_style=null;
	String desc=null;
	String manuf=null;
	String spec=null;
	double price=0;
	int qty=0;
	double total=0;
	String type_name=null;
	String note=null;

	conn.setAutoCommit(false);

/*
	long xh=0;
	ls_sql=" select NVL(max(xh),0) from jc_cgdtmx " ;
	ps1= conn1.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	if(rs1.next())
	{         
		xh = rs1.getLong(1);			    
	}
	rs1.close();
	ps1.close();
*/
	ls_sql="delete from jc_cgdtmx where ddbh='"+ddbh+"'";
	ps1= conn1.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();
	
	int count=0;
	ls_sql = "select order_no,cust_name,cust_phone,cust_addr,order_date,designer,sale_addr,sale_phone,setup_date,approver";
	ls_sql+= " ,item_num,usercode,type,name,style,side,texture,edge,pull_pose,pull_style,desc,manuf,spec,price,qty,total";
	ls_sql+= " ,type_name,note";
	ls_sql+= " from IMP_"+yhdlm;
//	out.println(ls_sql1);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();

	while(rs.next())
	{
		count++;

		order_no=cf.fillNull(rs.getString("order_no"));
		cust_name=cf.fillNull(rs.getString("cust_name"));
		cust_phone=cf.fillNull(rs.getString("cust_phone"));
		cust_addr=cf.fillNull(rs.getString("cust_addr"));
		order_date=rs.getDate("order_date");
		designer=cf.fillNull(rs.getString("designer"));
		sale_addr=cf.fillNull(rs.getString("sale_addr"));
		sale_phone=cf.fillNull(rs.getString("sale_phone"));
		setup_date=rs.getDate("setup_date");
		approver=cf.fillNull(rs.getString("approver"));
		item_num=cf.fillNull(rs.getString("item_num"));
		usercode=cf.fillNull(rs.getString("usercode"));
		type=cf.fillNull(rs.getString("type"));
		name=cf.fillNull(rs.getString("name"));
		style=cf.fillNull(rs.getString("style"));
		side=cf.fillNull(rs.getString("side"));
		texture=cf.fillNull(rs.getString("texture"));
		edge=cf.fillNull(rs.getString("edge"));
		pull_pose=cf.fillNull(rs.getString("pull_pose"));
		pull_style=cf.fillNull(rs.getString("pull_style"));
		desc=cf.fillNull(rs.getString("desc"));
		manuf=cf.fillNull(rs.getString("manuf"));
		spec=cf.fillNull(rs.getString("spec"));
		price=rs.getDouble("price");
		qty=rs.getInt("qty");
		total=rs.getDouble("total");
		type_name=cf.fillNull(rs.getString("type_name"));
		note=cf.fillNull(rs.getString("note"));

		if (!order_no.equals(ddbh))
		{
//			conn.rollback();
//			out.println("警告！订单编号不正确，导入订单号为：["+order_no+"]，实际为：["+ddbh+"]");
//			return;
		}

		ls_sql="insert into jc_cgdtmx ( ddbh,cust_name,cust_phone,cust_addr,order_date,designer,sale_addr,sale_phone,setup_date,approver,item_num,usercode,lb,name,style,side,texture,edge,pull_pose,pull_style,msxx,manuf,spec,price,qty,total,type_name,note) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps1= conn1.prepareStatement(ls_sql);
		ps1.setString(1,ddbh);
		ps1.setString(2,cust_name);
		ps1.setString(3,cust_phone);
		ps1.setString(4,cust_addr);
		ps1.setDate(5,order_date);
		ps1.setString(6,designer);
		ps1.setString(7,sale_addr);
		ps1.setString(8,sale_phone);
		ps1.setDate(9,setup_date);
		ps1.setString(10,approver);
		ps1.setString(11,item_num);
		ps1.setString(12,usercode);
		ps1.setString(13,type);
		ps1.setString(14,name);
		ps1.setString(15,style);
		ps1.setString(16,side);
		ps1.setString(17,texture);
		ps1.setString(18,edge);
		ps1.setString(19,pull_pose);
		ps1.setString(20,pull_style);
		ps1.setString(21,desc);
		ps1.setString(22,manuf);
		ps1.setString(23,spec);
		ps1.setDouble(24,price);
		ps1.setInt(25,qty);
		ps1.setDouble(26,total);
		ps1.setString(27,type_name);
		ps1.setString(28,note);
		ps1.executeUpdate();
		ps1.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("导入数据成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("操作失败，Exception:" + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn1 != null) cf.close(conn1);    //释放连接

		f.close();
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 

</body>
</html>

