<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>


<%
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称
String zcbm=request.getParameter("zcbm");
String sl=request.getParameter("sl");
String zje=request.getParameter("zje");
int xh = 0;
double zsl = 0;
double zje2 = 0;
try{
	zsl = Double.parseDouble(sl);
	zje2 = Double.parseDouble(zje);
}
catch(Exception e){
	out.print("数字格式不正确，请您确认");
	return;
}
Connection conn = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sqlString = null;
Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try{
	String xhsql = "";
	conn1=cf.getConnection();    //得到连接
	xhsql = " select NVL(max(xh),0)";
	xhsql+=" from HY_KHHDPT ";
//	xhsql+=" where khbh='"+yhbh+"' and khwjbz='N' ";
//	out.println(sql);
	ps1= conn1.prepareStatement(xhsql);
	rs1=ps1.executeQuery();
	if (rs1.next())                            
		{
			xh=rs1.getInt(1);
			xh=xh+1;
		}
	else {xh = 1;}
	}
catch(Exception e){
	out.println("Exception : "+e);
	}
finally{
		try{
			if(rs1!=null) rs1.close();
			if(ps1!=null) ps1.close();
			if(conn1!=null) cf.close(conn1);
			}
			catch(Exception e){
				if(conn1!=null) cf.close(conn1);
			}
		}
try{
	conn = cf.getConnection();

		sqlString = "insert into HY_KHHDPT(xh,khbh,zcbm,gmrq,gmsl,gmje,khwjbz,gswjbz,lrr,lrsj)";
		sqlString+= " values('"+xh+"','"+yhbh+"','"+zcbm+"','','"+zsl+"','"+zje2+"','N','N','"+lrr+"',sysdate)";
		ps=conn.prepareStatement(sqlString);  
		ps.executeUpdate();
		ps.close();
//	out.print("<BR>存盘成功");
{%>
		<script language="javascript">
		alert("存盘成功！感谢您选择松下亿达！");
//	    return;
		window.close()
		</script>
		<%}
}
catch(Exception e){
	out.println("Exception : "+e);
}
finally{
	try{
		conn.setAutoCommit(true);
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) cf.close(conn);
	}
	catch(Exception e){
		out.println("EXCEPTION: "+e);
	}
}
%>