<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlhStr = request.getParameterValues("hfjlh");
if (hfjlhStr.length!=1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}

String hfjlh=hfjlhStr[0];


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	//回访记录号
	String khbh="";
	String oldzxhfbz="";//最新回访标志
	String oldhfszjlh="";
	String oldsfjxhf="";//设置下次回访时间
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;
	ls_sql="select khbh,zxhfbz,hfszjlh,sfjxhf,ysfxhf,yhfrq,yhflxbm";
	ls_sql+=" from  crm_hfjl ";
	ls_sql+=" where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		oldzxhfbz=cf.fillNull(rs.getString("zxhfbz"));
		oldhfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		oldsfjxhf=cf.fillNull(rs.getString("sfjxhf"));
		oldysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		oldyhfrq=rs.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs.getString("yhflxbm"));
	}
	ps.close();
	rs.close();
	if (!oldzxhfbz.equals("Y"))
	{
		out.println("错误！只能修改最新一次的回访记录");
		return;
	}

	
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_gchffkbm where clzt='Y' and hfjlh="+hfjlh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	if (count>0)
	{
		out.println("错误！有关部门已对回访做了处理，不能再删除");
		return;
	}

	//获取回访设置记录信息
	String getsfyhf="";//是否已回访 ,Y：回访；N：未回访
	String getzxszbz="";//最新设置标志  ,Y：是；N：否
	String yhfszjlh=null;
	ls_sql="SELECT sfyhf,zxszbz,yhfszjlh ";
	ls_sql+=" FROM crm_hfszjl ";
	ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfyhf=cf.fillNull(rs.getString("sfyhf"));
		getzxszbz=cf.fillNull(rs.getString("zxszbz"));
		yhfszjlh=cf.fillNull(rs.getString("yhfszjlh"));
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="delete from  crm_hfjl where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from  crm_gchffkbm where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	if (oldsfjxhf.equals("Y") || oldsfjxhf.equals("F"))//Y：设置；N：不设置；F：重新回访
	{
		if (getsfyhf.equals("N"))//客服没有实际回访
		{
			if (getzxszbz.equals("Y"))//是最新记录
			{
				//删除回访设置记录
				ls_sql="delete from crm_hfszjl ";
				ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql=" update crm_hfszjl set zxszbz='Y',sfyhf='N',zxhfsj=null,hfjlh=null";	
				ls_sql+=" where  hfszjlh='"+yhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="update crm_khxx set sfxhf=?,hfrq=?,hflxbm=? where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,oldysfxhf);
				ps.setDate(2,oldyhfrq);
				ps.setString(3,oldyhflxbm);
				ps.executeUpdate();
				ps.close();

			}
			else{//不是最新记录，删除,下一级与前一级关联,删除本级
				//取下一级
				String nexthfszjlh=null;
				ls_sql="SELECT hfszjlh ";
				ls_sql+=" FROM crm_hfszjl ";
				ls_sql+=" where  khbh='"+khbh+"' and yhfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					nexthfszjlh=cf.fillNull(rs.getString("hfszjlh"));
				}
				rs.close();
				ps.close();

				//下一级与前一级关联
				ls_sql=" update crm_hfszjl set yhfszjlh=?";	
				ls_sql+=" where hfszjlh='"+nexthfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,yhfszjlh);
				ps.executeUpdate();
				ps.close();

				//删除本级回访设置记录
				ls_sql="delete from crm_hfszjl ";
				ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql=" update crm_hfszjl set sfyhf='N',zxhfsj=null,hfjlh=null";	
				ls_sql+=" where  hfszjlh='"+yhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
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
	out.print("存盘失败,发生意外: " + e);
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