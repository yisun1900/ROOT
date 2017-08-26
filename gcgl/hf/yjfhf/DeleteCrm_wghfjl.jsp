<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlh = request.getParameterValues("hfjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;
String hflxbm="24";//11：定期回访；12：上门回访；13：随机回访;21：材料进场回访；22：隐蔽工程回访；23：中期回访；24：完工回访；25：例行回访；26：随机回访；31：完工后关怀回访;41：投诉报修回访

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<hfjlh.length ;i++ )
	{
		String yxmjfzt="";
		String getwtclzt="";
		String khbh="";
		ls_sql="select yxmjfzt,wtclzt,khbh";
		ls_sql+=" from crm_wghfjl";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yxmjfzt=cf.fillNull(rs.getString("yxmjfzt"));
			getwtclzt=cf.fillNull(rs.getString("wtclzt"));
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();

		if (!getwtclzt.equals("") && !getwtclzt.equals("1"))
		{
			conn.rollback();
			out.println("错误！已开始处理不能再改变状态:"+hfjlh[i]);
			return;
		}

		String gethfjlh="";
		ls_sql="select hfjlh";
		ls_sql+=" from crm_wghfjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ls_sql+=" order by hfjlh desc ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gethfjlh=cf.fillNull(rs.getString("hfjlh"));
		}
		rs.close();
		ps.close();

		if (!gethfjlh.equals(hfjlh[i]))
		{
			conn.rollback();
			out.println("错误！只能删除最新的回访记录："+gethfjlh);
			return;
		}


		String getxmjfzt="";
		ls_sql="select xmjfzt";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
		}
		rs.close();
		ps.close();

		if (!getxmjfzt.equals("X") && !getxmjfzt.equals("Y") && !getxmjfzt.equals("N"))
		{
			conn.rollback();
			out.println("错误！状态不正确:"+hfjlh[i]);
			return;
		}


		ls_sql="delete from crm_wghfjl  ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_wghfwtbm ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from crm_wghfcljl ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

			
		ls_sql="delete from hf_khhfjg ";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_khhfbmyyy ";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_khwtda ";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_wtbcsm ";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//N：未交付；S：预交付；Y：回访成功；X：回访失败；C：失败已处理；W：项目交付
		ls_sql="update crm_khxx set xmjfzt=? ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yxmjfzt);
		ps.executeUpdate();
		ps.close();
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
	out.print("<BR>存盘失败,发生意外: " + e);
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