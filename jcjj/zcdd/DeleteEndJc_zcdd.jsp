<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String fgsbh=null;
	String ddlx=null;
	String clzt=null;
	String xclbz=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		clzt="";
		ls_sql =" select khbh,fgsbh,ddlx,clzt,xclbz";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			fgsbh=rs.getString("fgsbh");
			ddlx=rs.getString("ddlx");
			clzt=rs.getString("clzt");
			xclbz=rs.getString("xclbz");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("09"))
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
			return;
		}

		String dqbm=null;
		ls_sql =" select dqbm";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dqbm=rs.getString("dqbm");
		}
		rs.close();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("！删除失败，订单["+ddbh[i]+"]已有增减项，如果要删除，请先删除增减项。");
			return;
		}

		ls_sql="update jc_zcdd set clzt='07',sxhtsfysh=null,hkze=0,wdzje=0,htcxhdje=0,cbze=0";
		ls_sql+=" ,zqclf=0,zhclf=0,ycf=0,qtf=0,zsje=0,htyjjrje=0  ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='09'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (ddlx.equals("4"))//1：系统存在品牌订单；2：系统不存在品牌订单；3：补录合同；4：有库存订单
		{
			//材料价格表（jxc_cljgb）,客户订货数量
			ls_sql="update jxc_cljgb set dhsl=dhsl-(select sl from jc_zcddmx where jc_zcddmx.zcbm=jxc_cljgb.clbm and jc_zcddmx.ddbh='"+ddbh[i]+"')";
			ls_sql+=" where dqbm='"+dqbm+"' ";
			ls_sql+=" and clbm in(select zcbm from jc_zcddmx where ddbh='"+ddbh[i]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}


		//集成订单
		ls_sql="delete from jc_jcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	
		//主材毛利计算＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double zxmle=0;
		double zxhtjz=0;
		ls_sql="SELECT zxmle,zxhtjz";
		ls_sql+=" FROM crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			zxmle=rs.getDouble(1);//最新毛利额
			zxhtjz=rs.getInt(2);//最新合同净值
		}
		rs.close();
		ps.close();

		
		double zczxje=0;
		double zczxcb=0;
		ls_sql="SELECT sum(hkze+zjhze),sum(cbze+ycf+qtf+zjxcbze+zjxycf+zjxqtf)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			zczxje=rs.getDouble(1);//主材销售额
			zczxcb=rs.getInt(2);//主材成本额
		}
		rs.close();
		ps.close();

		double sfje=0;
		ls_sql="SELECT sum(sfje)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and sfxmlx in('8','4')";//8：公司购主材税金
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		zczxje=cf.round(zczxje+sfje,2);

		double zczxml=0;//主材最新毛利
		if (zczxje!=0)
		{
			zczxml=cf.round((zczxje-zczxcb)*100/zczxje,2);
		}

		double khzxml=0;//客户最新毛利
		if ((zczxje+zxhtjz)!=0)
		{
			khzxml=cf.round((zczxje-zczxcb+zxmle)*100/(zczxje+zxhtjz),2);
		}

		ls_sql="update crm_khqye set zczxje=?,zczxcb=?,zczxml=?,khzxml=?";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,zczxje);
		ps.setDouble(2,zczxcb);
		ps.setDouble(3,zczxml);
		ps.setDouble(4,khzxml);
		ps.executeUpdate();
		ps.close();
		
		//主材毛利计算＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>