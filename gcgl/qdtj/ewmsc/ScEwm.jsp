<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,java.net.URLEncoder' %>
<%@ page import="com.tools.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");
String pathEwm = request.getRealPath("")+"\\yblimg\\ewm\\khewm\\";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	
//	conn.setAutoCommit(false);

	for(int i = 0; i<khbh.length; i++)
	{
		
	
		
	
	
	
	/*************************生成二维码****************************/
	String lrr = session.getAttribute("yhmc").toString();
	String lrrBm = session.getAttribute("dwbh").toString();
	String lrrFgs = session.getAttribute("ssfgs").toString();	
	
	String khxm = "";
	
	int ewmscbz = 0;  //二维码生成标志 0，未生成
	ls_sql = " select count(*) ";
	ls_sql += " from app_ewmscmx ";
	ls_sql += " where khbh='"+khbh[i]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ewmscbz = rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	ls_sql = "select khxm from crm_zxkhxx ";
	ls_sql += " where khbh='"+khbh[i]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm = rs.getString("khxm");
	}
	rs.close();
	ps.close();

	if(ewmscbz<1)
	{
		String fileName = khxm+khbh[i];
	//	String fileName = khxm;
    		
    
    	
		//fileName = EwmSc.fileTest(pathEwm,fileName);		
    
    	String reMess = EwmSc.makeEwm(khbh[i],fileName,pathEwm,800,800);
    	if(reMess.startsWith("1"))
		{
			String zxdmStr = "";
			String ssfgsStr = "";
			String ewmkkbz = "N";
							
			ls_sql = "select zxdm,ssfgs from crm_zxkhxx ";
			ls_sql += " where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zxdmStr = rs.getString("zxdm");
				ssfgsStr = rs.getString("ssfgs");
			}
			rs.close();
			ps.close();
			
			/*
			//查询客户二维码可看标志
			ls_sql = "select ewmkkbz ";	
			ls_sql += " from sq_dwxx ";
			ls_sql += " where dwbh ='"+ssfgsStr+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
//			System.out.println("ls_sql"+ls_sql);
			if(rs.next())
			{				
				ewmkkbz = rs.getString("ewmkkbz");
				if("".equals(ewmkkbz) || ewmkkbz == null)
				{
					ewmkkbz = "N";
				}
			}
			rs.close();
			ps.close();
			
			*/
			ewmkkbz = "Y";
			
			ls_sql = "insert into app_ewmscmx ";
			ls_sql += " (khbh,khxm,zxdm,ssfgs,yhmc,     scrbm,scrfgs,scsj,ewmmc,ewmkkbz,qysj) values ";
			ls_sql += " (?, ?, ?, ?, ?,                 ?, ?, sysdate, ?, ?, ?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh[i]);
			ps.setString(2,khxm);
			ps.setString(3,zxdmStr);
			ps.setString(4,ssfgsStr);
			ps.setString(5,lrr);
			ps.setString(6,lrrBm);
			ps.setString(7,lrrFgs);
			
			ps.setString(8,fileName);
			ps.setString(9,ewmkkbz);
			
			if("N".equals(ewmkkbz))
			{
				ps.setString(10,"");
			}else{
				ps.setDate(10,java.sql.Date.valueOf(cf.today()));
			}
			
			
			ps.executeUpdate();
			ps.close();
		
		}
		
		
		
	
	}else{
		String fileName = khxm+khbh[i];
		ls_sql = " select ewmmc ";
		ls_sql += " from app_ewmscmx ";
		ls_sql += " where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fileName = rs.getString("ewmmc");
		}
		rs.close();
		ps.close();
		
		String reMess = EwmSc.makeEwm(khbh[i],fileName,pathEwm,800,800);
		
		
	
	}
	
	/*********************************二维码生成完成*******************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	}
//	conn.commit();
	
	
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
//	conn.rollback();
	out.print("<br>ls_sql--> " + ls_sql);
	out.print("<br>Exception: " + e);
	return;
}
finally 
{
//	conn.setAutoCommit(true);
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

