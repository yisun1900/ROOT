<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");
String ddlx=cf.GB2Uni(request.getParameter("ddlx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		double oldqtycf=0;
		double zcpclf=0;
		double tjpclf=0;
		String ppbm=null;
		String ssfgs=null;
		String khbh=null;
		ls_sql=" select qtycf,zcpclf,tjpclf,ppbm,fgsbh,khbh" ;
		ls_sql+=" from jc_zcdd" ;
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			oldqtycf = rs.getDouble("qtycf");			    
			zcpclf = rs.getDouble("zcpclf");			    
			tjpclf = rs.getDouble("tjpclf");			    
			ppbm = rs.getString("ppbm");			    
			ssfgs = rs.getString("fgsbh");			    
			khbh = rs.getString("khbh");			    
		}
		rs.close();
		ps.close();


		//取：结算比例＋＋＋＋＋＋＋＋＋	
		double fdbl=0;
		double cxfdbl=0;
		double tcjrbl=0;
		double tccxjrbl=0;
		double khfdbl=0;
		double khcxfdbl=0;

		if (ddlx.equals("9") || ddlx.equals("E"))//9：代购主材、C:选配主材；E：散客
		{
			ls_sql="select jxc_ppgysdzb.fdbl,jxc_ppgysdzb.cxfdbl,jxc_ppgysdzb.tcjrbl,jxc_ppgysdzb.tccxjrbl ";
			ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
			ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
			ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
			ls_sql+=" and jxc_ppxx.pplb='1' ";
			ls_sql+=" and jxc_gysxx.cllx='1' ";
			ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
			ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				fdbl=rs.getDouble("fdbl");
				cxfdbl=rs.getDouble("cxfdbl");
				tcjrbl=rs.getDouble("tcjrbl");
				tccxjrbl=rs.getDouble("tccxjrbl");
			}
			rs.close();
			ps.close();
			
			ls_sql="select jxc_khfdbl.khfdbl,jxc_khfdbl.khcxfdbl ";
			ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
			ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
			ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
			ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				khfdbl=rs.getDouble("khfdbl");
				khcxfdbl=rs.getDouble("khcxfdbl");
			}
			rs.close();
			ps.close();
			

			if (fdbl==0)
			{
				conn.rollback();
				out.println("<BR>！！！错误，未初始化结算比例，品牌："+ppbm);
				return;
			}
		}
		else if (ddlx.equals("C"))//9：代购主材、C:选配主材；E：散客
		{
			ls_sql="select jxc_ppgysdzb.xpjsbl,jxc_ppgysdzb.xpcxjsbl,jxc_ppgysdzb.xptcjrbl,jxc_ppgysdzb.xptccxjrbl ";
			ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
			ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
			ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
			ls_sql+=" and jxc_ppxx.pplb='1' ";
			ls_sql+=" and jxc_gysxx.cllx='1' ";
			ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
			ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				fdbl=rs.getDouble("xpjsbl");
				cxfdbl=rs.getDouble("xpcxjsbl");
				tcjrbl=rs.getDouble("xptcjrbl");
				tccxjrbl=rs.getDouble("xptccxjrbl");
			}
			rs.close();
			ps.close();


			ls_sql="select jxc_khfdbl.xpkhfdbl,jxc_khfdbl.xpkhcxfdbl ";
			ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
			ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
			ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
			ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				khfdbl=rs.getDouble("xpkhfdbl");
				khcxfdbl=rs.getDouble("xpkhcxfdbl");
			}
			rs.close();
			ps.close();

			if (fdbl==0)
			{
				conn.rollback();
				out.println("<BR>！！！错误，未初始化结算比例，品牌："+ppbm);
				return;
			}

		}

		double tjpfdbl=cxfdbl;
		double tjpkhfdbl=khcxfdbl;
		double tjptcjrbl=tccxjrbl;

		double cbze=zcpclf*fdbl/100+tjpclf*tjpfdbl/100;

		//取：结算比例＝＝＝＝＝＝＝＝＝	



		if (ddlx.equals("9") || ddlx.equals("E") || ddlx.equals("C"))//9：代购主材、C:选配主材；E：散客
		{
			ls_sql="update jc_zcdd set ddlx=?,cbze=?,fdbl=?,khfdbl=?,tcjrbl=?,tjpfdbl=?,tjpkhfdbl=?,tjptcjrbl=? ";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddlx);
			ps.setDouble(2,cbze);
			ps.setDouble(3,fdbl);
			ps.setDouble(4,khfdbl);
			ps.setDouble(5,tcjrbl);
			ps.setDouble(6,tjpfdbl);
			ps.setDouble(7,tjpkhfdbl);
			ps.setDouble(8,tjptcjrbl);

			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update jc_zcdd set ddlx=? ";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddlx);

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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>