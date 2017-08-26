<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String wheresfxmbm=cf.GB2Uni(request.getParameter("wheresfxmbm"));
String wheresdqbm=cf.GB2Uni(request.getParameter("wheresdqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfxmmc=null;
	String sflx=null;
	double gdje=0;
	String sfbxx=null;
	String sfjrqye=null;
	String jrsjbz=null;

	String jrglfbz=null;
	String bz=null;
	String sfkdz=null;
	double zdzk=0;
	String sfxmlx=null;
	String sfcysgdjs=null;
	String jldw=null;
	ls_sql="select sfxmmc,sflx,gdje,sfbxx,sfjrqye,jrsjbz,jrglfbz,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,jldw  ";
	ls_sql+=" from  bdm_sfxmbm";
	ls_sql+=" where  sfxmbm='"+wheresfxmbm+"' and dqbm='"+wheresdqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxmmc=rs.getString("sfxmmc");
		sflx=rs.getString("sflx");
		gdje=rs.getDouble("gdje");
		sfbxx=rs.getString("sfbxx");
		sfjrqye=rs.getString("sfjrqye");
		jrsjbz=rs.getString("jrsjbz");

		jrglfbz=rs.getString("jrglfbz");
		bz=rs.getString("bz");
		sfkdz=rs.getString("sfkdz");
		zdzk=rs.getDouble("zdzk");
		sfxmlx=rs.getString("sfxmlx");
		sfcysgdjs=rs.getString("sfcysgdjs");
		jldw=rs.getString("jldw");
	}
	rs.close();
	ps.close();



	conn.setAutoCommit(false);

	String khbh=null;
	ls_sql="select khbh ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where ssfgs in(select dwbh from sq_dwxx where dqbm='"+wheresdqbm+"' and cxbz='N')";
	ls_sql+=" and zxzt not in('2','3','4')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");

		ls_sql="update bj_sfxmmx set sfxmmc=?,sflx=?,sfbxx=?,sfjrqye=?,jrsjbz=?,jrglfbz=?,sfkdz=?,zdzk=?,sfxmlx=?,sfcysgdjs=?,jldw=?";
		ls_sql+=" where  sfxmbm='"+wheresfxmbm+"' and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sfxmmc);
		ps.setString(2,sflx);
		ps.setString(3,sfbxx);
		ps.setString(4,sfjrqye);
		ps.setString(5,jrsjbz);
		ps.setString(6,jrglfbz);
		ps.setString(7,sfkdz);
		ps.setDouble(8,zdzk);
		ps.setString(9,sfxmlx);
		ps.setString(10,sfcysgdjs);
		ps.setString(11,jldw);
		ps.executeUpdate();
		ps.close();

		//初始化
		dzbj.Dzbj dzbj=new dzbj.Dzbj();
		//更新其它收费项目，调整收费百分比
		dzbj.updateSfxm(conn,khbh,"yz");
		//获取电子报价金额
		double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");

		//修改：电子报价总额
		ls_sql="update crm_zxkhxx set dzbjze=? ";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
		ps.executeUpdate();
		ps.close();
	}
	rs.close();
	ps.close();


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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>