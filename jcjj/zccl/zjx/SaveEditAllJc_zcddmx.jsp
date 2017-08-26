<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String[] zcysbm=request.getParameterValues("zcysbm");
String[] zcpzwzbm=request.getParameterValues("zcpzwzbm");
String[] dpzkStr=request.getParameterValues("dpzk");
String[] djStr=request.getParameterValues("dj");
String[] slStr=request.getParameterValues("sl");
String[] zqjeStr=request.getParameterValues("zqje");
String[] jeStr=request.getParameterValues("je");
String[] ycfStr=request.getParameterValues("ycf");
String[] qtfy=request.getParameterValues("qtfy");
String[] qtfyjeStr=request.getParameterValues("qtfyje");
String[] cxhdbz=request.getParameterValues("cxhdbz");
String[] cxhdblStr=request.getParameterValues("cxhdbl");
String[] cxhdjeStr=request.getParameterValues("cxhdje");
String[] cbjeStr=request.getParameterValues("cbje");
String[] bz=request.getParameterValues("bz");
String[] sfzp=request.getParameterValues("sfzp");
String[] zsdjStr=request.getParameterValues("zsdj");

String[] zjslStr=request.getParameterValues("zjsl");
String[] zqzjjeStr=request.getParameterValues("zqzjje");
String[] zjjeStr=request.getParameterValues("zjje");
String[] zjycfStr=request.getParameterValues("zjycf");
String[] zjqtfyStr=request.getParameterValues("zjqtfy");
String[] zjcxhdjeStr=request.getParameterValues("zjcxhdje");
String[] zjcbjeStr=request.getParameterValues("zjcbje");
String[] bz1=request.getParameterValues("bz1");


String zjxbh=request.getParameter("zjxbh");
String ddbh=request.getParameter("ddbh");
String[] bcxh=request.getParameterValues("bcxh");
String[] bcxh1=request.getParameterValues("bcxh1");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	conn.setAutoCommit(false);
	
	if (bcxh1!=null)
	{
		for (int i=0;i<bcxh1.length ;i++ )
		{
			double zjsl=0;
			double zqzjje=0;
			double zjje=0;
			zjsl=Double.parseDouble(zjslStr[i]);
			zqzjje=Double.parseDouble(zqzjjeStr[i]);
			zjje=Double.parseDouble(zjjeStr[i]);

			double zjycf=0;
			double zjqtfy=0;
			double zjcxhdje=0;
			double zjcbje=0;
			if (!zjycfStr[i].equals(""))
			{
				zjycf=Double.parseDouble(zjycfStr[i]);
			}
			if (!zjqtfyStr[i].equals(""))
			{
				zjqtfy=Double.parseDouble(zjqtfyStr[i]);
			}
			if (!zjcxhdjeStr[i].equals(""))
			{
				zjcxhdje=Double.parseDouble(zjcxhdjeStr[i]);
			}
			if (!zjcbjeStr[i].equals(""))
			{
				zjcbje=Double.parseDouble(zjcbjeStr[i]);
			}

			ls_sql="update jc_zczjxmx set zjsl="+zjsl+",zqzjje="+zqzjje+",zjje="+zjje+",zjycf="+zjycf+",zjqtfy="+zjqtfy+",zjcxhdje="+zjcxhdje+",zjcbje="+zjcbje+",bz='"+cf.GB2Uni(bz1[i])+"'";
			ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+bcxh1[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	
	if (bcxh!=null)
	{
		for (int i=0;i<bcxh.length ;i++ )
		{
			double sl=0;
			double dpzk=0;
			double dj=0;
			double zqje=0;
			double je=0;
			double ycf=0;
			double qtfyje=0;
			double cxhdbl=0;
			double cxhdje=0;
			double cbje=0;
			double zsdj=0;


			sl=Double.parseDouble(slStr[i]);
			dpzk=Double.parseDouble(dpzkStr[i]);
			dj=Double.parseDouble(djStr[i]);
			zqje=Double.parseDouble(zqjeStr[i]);
			je=Double.parseDouble(jeStr[i]);
			cbje=Double.parseDouble(cbjeStr[i]);
			zsdj=Double.parseDouble(zsdjStr[i]);

			if (!ycfStr[i].equals(""))
			{
				ycf=Double.parseDouble(ycfStr[i]);
			}
			if (!qtfyjeStr[i].equals(""))
			{
				qtfyje=Double.parseDouble(qtfyjeStr[i]);
			}
			if (!cxhdblStr[i].equals(""))
			{
				cxhdbl=Double.parseDouble(cxhdblStr[i]);
			}
			if (!cxhdjeStr[i].equals(""))
			{
				cxhdje=Double.parseDouble(cxhdjeStr[i]);
			}

			
			ls_sql="update jc_zcddmx set dpzk="+dpzk+",dj="+dj+",qtfy='"+qtfy[i]+"',cxhdbz='"+cxhdbz[i]+"',cxhdbl="+cxhdbl;
			ls_sql+=" ,zcpzwzbm='"+cf.GB2Uni(zcpzwzbm[i])+"',zcysbm='"+cf.GB2Uni(zcysbm[i])+"',bz='"+cf.GB2Uni(bz[i])+"',sfzp='"+cf.GB2Uni(sfzp[i])+"',zsdj="+zsdj;
			ls_sql+=" where xh="+bcxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			double yjjrbl=0;
			ls_sql =" select yjjrbl";
			ls_sql+=" from jc_zcddmx";
			ls_sql+=" where xh="+bcxh[i];
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yjjrbl=rs.getDouble("yjjrbl");
			}
			rs.close();
			ps.close();

			double zjyjjrje=cf.round(je*yjjrbl/100,2);

			ls_sql="update jc_zczjxmx set zjsl="+sl+",zqzjje="+zqje+",zjje="+je+",zjycf="+ycf+",zjqtfy="+qtfyje+",zjcxhdje="+cxhdje+",zjcbje="+cbje+",bz='"+cf.GB2Uni(bz[i])+"',zjyjjrje="+zjyjjrje;
			ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+bcxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		
		}
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