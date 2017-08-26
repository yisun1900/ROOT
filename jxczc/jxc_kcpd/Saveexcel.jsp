<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String pdph=request.getParameter("pdph");
String dqbm=request.getParameter("dqbm");
String ckbh=request.getParameter("ckbh");

String[] xuhao =request.getParameterValues("xuhao");

String[] clbm =request.getParameterValues("clbm");
String[] hjbh =request.getParameterValues("hjbh");
String[] scph =request.getParameterValues("scph");
String[] scrqStr =request.getParameterValues("scrq");

String[] ykcslStr =request.getParameterValues("ykcsl");
String[] sjslStr =request.getParameterValues("sjsl");

//////////////////////////////////////////////////////  

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接
	

	conn.setAutoCommit(false);

	ls_sql="delete from jxc_kcpdmx ";
	ls_sql+=" where pdph="+pdph;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close(); 

	for (i=0;i<xuhao.length ;i++ )
	{

		//查询材料基本信息
		String clmc=null;
		String xh=null;
		String gg=null;
		String nbbm=null;
		String ppmc=null;
		ls_sql="select clmc,xh,gg,nbbm,ppmc ";
		ls_sql+=" from  jxc_clbm ";
		ls_sql+=" where clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clmc=cf.fillNull(rs.getString("clmc"));
			xh=cf.fillNull(rs.getString("xh"));
			gg=cf.fillNull(rs.getString("gg"));
			nbbm=cf.fillNull(rs.getString("nbbm"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
		}
 		rs.close();
		ps.close();

		double ykcsl=0;
		ykcsl=Double.parseDouble(ykcslStr[i]);
		double sjsl=0;
		sjsl=Double.parseDouble(sjslStr[i]);

		java.sql.Date scrq=null;
		scrq=java.sql.Date.valueOf(scrqStr[i].trim());

		String pdjg=null;//1：盘盈；2：盘亏；3：盘平
		if (ykcsl<sjsl)
		{
			pdjg="1";
		}
		else if (ykcsl>sjsl)
		{
			pdjg="2";
		}
		else
		{
			pdjg="3";
		}


//将盘点结果写入数据库
		ls_sql="insert into jxc_kcpdmx ( pdph,pdxh,dqbm,ckbh,hjbh,clbm,clmc,xh,gg,ppmc,nbbm,scph,scrq  ,kczcpsl,pdzcpsl,zcppdcyl,pdjg  ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?    ,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,pdph);
		ps.setInt(2,i+1);
		ps.setString(3,dqbm);
		ps.setString(4,ckbh);
		ps.setString(5,hjbh[i]);
		ps.setString(6,clbm[i]);
		ps.setString(7,clmc);
		ps.setString(8,xh);
		ps.setString(9,gg);
		ps.setString(10,ppmc);
		ps.setString(11,nbbm);
		ps.setString(12,cf.GB2Uni(scph[i]));
		ps.setDate(13,scrq);

		ps.setDouble(14,ykcsl);
		ps.setDouble(15,sjsl);
		ps.setDouble(16,sjsl-ykcsl);
		ps.setString(17,pdjg);
		ps.executeUpdate();
		ps.close(); 
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("存盘成功！！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + xuhao[i]);
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
