<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sbbljlh = request.getParameterValues("sbbljlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	for (int i=0;i<sbbljlh.length ;i++ )
	{
		String ygbh="";
		String ysbbljlh="";
		String lx="";
		ls_sql="select ygbh,ysbbljlh,lx";
		ls_sql+=" from  rs_sbbljl";
		ls_sql+=" where  sbbljlh='"+sbbljlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ygbh=cf.fillNull(rs.getString("ygbh"));
			ysbbljlh=cf.fillNull(rs.getString("ysbbljlh"));
			lx=cf.fillNull(rs.getString("lx"));
		}
		else{
			conn.rollback();
			out.println("错误！『社保办理记录号』不存在："+sbbljlh[i]);
			return;
		}
		rs.close();
		ps.close();

		String getsbbljlh="";
		ls_sql="select sbbljlh";
		ls_sql+=" from  rs_ygsbxx";
		ls_sql+=" where ygbh="+ygbh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			getsbbljlh=cf.fillNull(rs.getString("sbbljlh"));
		}
		rs.close();
		ps.close();

		if (!getsbbljlh.equals(sbbljlh[i]))
		{
			conn.rollback();
			out.println("错误！『社保办理记录号』已改变为："+getsbbljlh);
			return;
		}

		ls_sql="delete from rs_sbbljl";
		ls_sql+=" where  sbbljlh='"+sbbljlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (!ysbbljlh.equals(""))
		{
			String shbxh=null;
			java.sql.Date sbblsj=null;
			String ylbx=null;
			String jylbx=null;
			String sybx=null;
			String gsby=null;
			String syx=null;
			String jbxdd=null;
			double sbzrjs=0;
			double sbzcjs=0;
			java.sql.Date bxtjsj=null;
			java.sql.Date bxzcsj=null;
			double yjsxe=0;
			double gsjbfe=0;
			double grjbfe=0;
			String sfjgjj=null;
			double gsjgjj=0;
			double grjgjj=0;
			double jndbtc=0;

			ls_sql="select ygbh,shbxh,sbblsj,ylbx,jylbx,sybx,gsby,syx,jbxdd,sbzrjs,sbzcjs,bxtjsj,bxzcsj,yjsxe,gsjbfe,grjbfe,sfjgjj,gsjgjj,grjgjj,jndbtc";
			ls_sql+=" from  rs_sbbljl";
			ls_sql+=" where  sbbljlh='"+ysbbljlh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ygbh=cf.fillNull(rs.getString("ygbh"));
				shbxh=cf.fillNull(rs.getString("shbxh"));
				sbblsj=rs.getDate("sbblsj");
				ylbx=cf.fillNull(rs.getString("ylbx"));
				jylbx=cf.fillNull(rs.getString("jylbx"));
				sybx=cf.fillNull(rs.getString("sybx"));
				gsby=cf.fillNull(rs.getString("gsby"));
				syx=cf.fillNull(rs.getString("syx"));
				jbxdd=cf.fillNull(rs.getString("jbxdd"));
				sbzrjs=rs.getDouble("sbzrjs");
				sbzcjs=rs.getDouble("sbzcjs");
				bxtjsj=rs.getDate("bxtjsj");
				bxzcsj=rs.getDate("bxzcsj");
				yjsxe=rs.getDouble("yjsxe");
				gsjbfe=rs.getDouble("gsjbfe");
				grjbfe=rs.getDouble("grjbfe");
				sfjgjj=cf.fillNull(rs.getString("sfjgjj"));
				gsjgjj=rs.getDouble("gsjgjj");
				grjgjj=rs.getDouble("grjgjj");
				jndbtc=rs.getDouble("jndbtc");
			}
			rs.close();
			ps.close();
			
			String sfcjbx="";//Y：参保；N：未办理；T：停保；Z：转出

			if (lx.equals("2"))//1：办理；2：变更；3：停保；4：转出
			{
				sfcjbx="Y";

				ls_sql="update rs_ygsbxx set shbxh=?,sbblsj=?,ylbx=?,jylbx=?,sybx=?,gsby=?,syx=?,jbxdd=?,yjsxe=?,gsjbfe=?  ,grjbfe=?,sfjgjj=?,gsjgjj=?,grjgjj=?,sbbljlh=?,sfcjbx=?,jndbtc=?";
				ls_sql+=" where ygbh='"+ygbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,shbxh);
				ps.setDate(2,sbblsj);
				ps.setString(3,ylbx);
				ps.setString(4,jylbx);
				ps.setString(5,sybx);
				ps.setString(6,gsby);
				ps.setString(7,syx);
				ps.setString(8,jbxdd);
				ps.setDouble(9,yjsxe);
				ps.setDouble(10,gsjbfe);

				ps.setDouble(11,grjbfe);
				ps.setString(12,sfjgjj);
				ps.setDouble(13,gsjgjj);
				ps.setDouble(14,grjgjj);
				ps.setString(15,ysbbljlh);
				ps.setString(16,sfcjbx);
				ps.setDouble(17,jndbtc);
				ps.executeUpdate();
				ps.close();
			}
			else if (lx.equals("3"))
			{
				sfcjbx="Y";

				ls_sql="update rs_ygsbxx set bxtjsj=?,sfcjbx=?,sbbljlh=?";
				ls_sql+=" where ygbh='"+ygbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,bxtjsj);
				ps.setString(2,sfcjbx);
				ps.setString(3,ysbbljlh);
				ps.executeUpdate();
				ps.close();
			}
			else if (lx.equals("4"))
			{
				sfcjbx="Y";

				ls_sql="update rs_ygsbxx set bxzcsj=?,sfcjbx=?,sbbljlh=?";
				ls_sql+=" where ygbh='"+ygbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,bxzcsj);
				ps.setString(2,sfcjbx);
				ps.setString(3,ysbbljlh);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			ls_sql="update rs_ygsbxx set sfcjbx='Y'";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		
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
	out.print("<BR>出错:" + e);
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