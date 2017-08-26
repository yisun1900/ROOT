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
String hflxbm="31";//11：定期回访；12：上门回访；13：随机回访;21：材料进场回访；22：隐蔽工程回访；23：中期回访；24：完工回访；25：例行回访；26：随机回访；31：完工后关怀回访;41：投诉报修回访

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<hfjlh.length ;i++ )
	{
		String getwtclzt="";
		String khbh="";
		String ysfxhf=null;
		java.sql.Date yhfrq=null;
		String yhflxbm=null;
		String hfszjlh=null;
		ls_sql="select wtclzt,khbh,ysfxhf,yhfrq,yhflxbm,hfszjlh";
		ls_sql+=" from hf_zsghfjl";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getwtclzt=cf.fillNull(rs.getString("wtclzt"));
			khbh=cf.fillNull(rs.getString("khbh"));
			ysfxhf=rs.getString("ysfxhf");
			yhfrq=rs.getDate("yhfrq");
			yhflxbm=rs.getString("yhflxbm");
			hfszjlh=rs.getString("hfszjlh");
		}
		rs.close();
		ps.close();

		if (!getwtclzt.equals("") && !getwtclzt.equals("1"))
		{
			conn.rollback();
			out.println("错误！已开始处理不能再改变状态:"+hfjlh[i]);
			return;
		}


		String gethfszjlh="";
		ls_sql="select hfszjlh";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gethfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		}
		rs.close();
		ps.close();

		String gethfjlh="";
		ls_sql="select hfjlh";
		ls_sql+=" from hf_zsghfjl";
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


		ls_sql="delete from hf_zsghfjl  ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from hf_zsghfwtbm ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsghfcljl ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

			
		ls_sql="delete from hf_zsghfjg ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsghfbmyyy ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsgwtda ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
			
		ls_sql="delete from hf_zsgwtbcsm ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (hfszjlh!=null && !hfszjlh.equals(""))//原来设置了回访信息
		{
			if (gethfszjlh.equals(hfszjlh))//由本次设置的客户回访信息，可以重新设置
			{
				ls_sql="update crm_khxx set sfxhf=?,hfrq=?,hflxbm=? where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ysfxhf);
				ps.setDate(2,yhfrq);
				ps.setString(3,yhflxbm);
				ps.executeUpdate();
				ps.close();
			}

			ls_sql="delete from hf_hfszjl ";
			ls_sql+=" where hfszjlh='"+hfszjlh+"'";
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