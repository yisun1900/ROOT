<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zgcljlh=request.getParameterValues("zgcljlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	rwjh.Rwjh rwjh=new rwjh.Rwjh();

	conn.setAutoCommit(false);
	
	for (int i=0;i<zgcljlh.length ;i++ )
	{
		String ysjlh=null;
		ls_sql="select ysjlh";
		ls_sql+=" from crm_yszgcljl";
		ls_sql+=" where zgcljlh='"+zgcljlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ysjlh=cf.fillNull(rs.getString("ysjlh"));
		}
		else{
			rs.close();
			ps.close();

			conn.rollback();
			out.println("错误！整改处理记录号不存在："+zgcljlh[i]);
			return;
		}
		rs.close();
		ps.close();


		String getclbz=null;
		ls_sql="select clbz";
		ls_sql+=" from crm_heysjl";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getclbz=cf.fillNull(rs.getString("clbz"));
		}
		rs.close();
		ps.close();

		if (!getclbz.equals("3") && !getclbz.equals("4"))//1:未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
		{
			conn.rollback();
			out.println("错误！状态不正确");
			return;
		}


		ls_sql="delete from crm_yszgcljl ";
		ls_sql+=" where zgcljlh='"+zgcljlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String maxzgcljlh=null;
		ls_sql="select max(zgcljlh)";
		ls_sql+=" from crm_yszgcljl";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			maxzgcljlh=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		String setclbz=null;
		int zgclsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from crm_yszgcljl";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ls_sql+=" and lx='整改处理'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zgclsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (zgclsl>0)
		{
			setclbz="3";

			String getclr=null;
			java.sql.Date getclsj=null;
			String getclsm=null;
			ls_sql="select clr,clsj,clsm";
			ls_sql+=" from crm_yszgcljl";
			ls_sql+=" where zgcljlh='"+maxzgcljlh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getclr=cf.fillNull(rs.getString("clr"));
				getclsj=rs.getDate("clsj");
				getclsm=cf.fillNull(rs.getString("clsm"));
			}
			rs.close();
			ps.close();

			ls_sql="update crm_heysjl set clbz='"+setclbz+"',zgcljlh=?,cljg=null,jjr=?,jjsj=?,jjsm=? ";//1:未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
			ls_sql+=" where ysjlh='"+ysjlh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,maxzgcljlh);
			ps.setString(2,getclr);
			ps.setDate(3,getclsj);
			ps.setString(4,getclsm);
			ps.executeUpdate();
			ps.close();
		}
		else{
			setclbz="2";

			ls_sql="update crm_heysjl set clbz='"+setclbz+"',zgcljlh=?,cljg=null,jjr=null,jjsj=null,jjsm=null ";//1:未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
			ls_sql+=" where ysjlh='"+ysjlh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,maxzgcljlh);
			ps.executeUpdate();
			ps.close();
		}

		//更新验收状态
		rwjh.updateYsxmZt(conn,ysjlh);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>