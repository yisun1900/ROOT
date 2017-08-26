<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

/*
	ls_sql="update bdm_sfxmbm set sgcbjbfb=0 where sfcysgdjs='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bdm_sfxmbm set cbjbfb=sgcbjbfb";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmx set sfcysgdjs='Y',cbjjsfs='2',sgcbjbfb=60 where sfxmbm='02'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmx set sgcbjbfb=0 where sfcysgdjs='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmx set cbjbfb=sgcbjbfb";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxq set sfcysgdjs='Y',cbjjsfs='2',sgcbjbfb=60 where sfxmbm='02'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxq set sgcbjbfb=0 where sfcysgdjs='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxq set cbjbfb=sgcbjbfb";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxh set sfcysgdjs='Y',cbjjsfs='2',sgcbjbfb=60 where sfxmbm='02'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxh set sgcbjbfb=0 where sfcysgdjs='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxh set cbjbfb=sgcbjbfb";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_mbsfxmmx set sfcysgdjs='Y',cbjjsfs='2',sgcbjbfb=60 where sfxmbm='02'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_mbsfxmmx set sgcbjbfb=0 where sfcysgdjs='N'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_mbsfxmmx set cbjbfb=sgcbjbfb";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

*/
eee

	String khbh="";
	double mle=0;
	double htjz=0;
	double zxmle=0;
	double zxhtjz=0;
	ls_sql="SELECT khbh,mle,htjz,zxmle,zxhtjz";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" order by khbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString(1);
		mle=rs.getDouble(2);//最新毛利额
		htjz=rs.getDouble(3);//最新毛利额
		zxmle=rs.getDouble(4);//最新毛利额
		zxhtjz=rs.getInt(5);//最新合同净值

		double zchtje=0;
		double zchtcb=0;
		ls_sql="SELECT sum(hkze),sum(cbze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and sfjrht='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zchtje=rs1.getDouble(1);//主材销售额
			zchtcb=rs1.getInt(2);//主材成本额
		}
		rs1.close();
		ps1.close();

		ls_sql="SELECT sum(zjxze),sum(zjxcbze)";
		ls_sql+=" FROM jc_zczjx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and clzt not in('00','99')";//09：合同已完成
		ls_sql+=" and sfjrht='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zchtje+=rs1.getDouble(1);//主材销售额
			zchtcb+=rs1.getInt(2);//主材成本额
		}
		rs1.close();
		ps1.close();


		double zczxje=0;
		double zczxcb=0;
		ls_sql="SELECT sum(hkze+zjhze),sum(cbze+zjxcbze)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			zczxje=rs1.getDouble(1);//主材销售额
			zczxcb=rs1.getInt(2);//主材成本额
		}
		rs1.close();
		ps1.close();

		double zchtml=0;//主材合同毛利
		if (zchtje!=0)
		{
			zchtml=cf.round((zchtje-zchtcb)*100/zchtje,2);
		}

		double khhtml=0;//客户合同毛利
		if ((zchtje+htjz)!=0)
		{
			khhtml=cf.round((zchtje-zchtcb+mle)*100/(zchtje+htjz),2);
		}

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

		ls_sql="update crm_khqye set zchtje=?,zchtcb=?,zczxje=?,zczxcb=?,zchtml=?,zczxml=?,khhtml=?,khzxml=?";
		ls_sql+=" where khbh='"+khbh+"'";
		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,zchtje);
		ps1.setDouble(2,zchtcb);
		ps1.setDouble(3,zczxje);
		ps1.setDouble(4,zczxcb);
		ps1.setDouble(5,zchtml);
		ps1.setDouble(6,zczxml);
		ps1.setDouble(7,khhtml);
		ps1.setDouble(8,khzxml);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>