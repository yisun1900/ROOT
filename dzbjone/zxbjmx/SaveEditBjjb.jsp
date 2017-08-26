<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");

String dqbm=cf.executeQuery("select sq_dwxx.dqbm from crm_zxkhxx,sq_dwxx where crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'");
if (dqbm==null || dqbm.equals(""))
{
	out.println("错误！无地区编码");
	return;
}

String[] wybh=request.getParameterValues("wybh");
String[] xmbh=request.getParameterValues("xmbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<wybh.length ;i++ )
	{
		String bjjb=request.getParameter("bjjb"+wybh[i].trim());

		if (bjjb==null || bjjb.equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！项目编号为["+xmbh[i]+"]的[报价级别]为空");
			return;
		}

		double dj=0;
		String gycl=null;
		if (bjjb.equals("A"))
		{
			ls_sql="SELECT abj,agycl";
			ls_sql+=" FROM bj_jzbjb";
			ls_sql+=" where wybh='"+wybh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				dj=rs.getDouble(1);
				gycl=rs.getString(2);
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>存盘失败！不存在的项目编号["+xmbh[i]+"]");
				return;
			}
			rs.close();
			ps.close();
		}
		else if (bjjb.equals("B"))
		{
			ls_sql="SELECT bbj,bgycl";
			ls_sql+=" FROM bj_jzbjb";
			ls_sql+=" where wybh='"+wybh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				dj=rs.getDouble(1);
				gycl=rs.getString(2);
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>存盘失败！不存在的项目编号["+xmbh[i]+"]");
				return;
			}
			rs.close();
			ps.close();
		}
		else if (bjjb.equals("C"))
		{
			ls_sql="SELECT cbj,cgycl";
			ls_sql+=" FROM bj_jzbjb";
			ls_sql+=" where wybh='"+wybh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				dj=rs.getDouble(1);
				gycl=rs.getString(2);
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>存盘失败！不存在的项目编号["+xmbh[i]+"]");
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			conn.rollback();
			out.println("<BR>存盘失败！报价级别错误");
			return;
		}

		ls_sql="update bj_bjxmmx set bjjb=?,dj=?,gycl=?";
		ls_sql+=" where khbh='"+khbh+"'  and wybh='"+wybh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,bjjb);
		ps.setDouble(2,dj);
		ps.setString(3,gycl);
		ps.executeUpdate();
		ps.close();
	}


	//初始化
	dzbj.Tzk tzk=new dzbj.Tzk();
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");

	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>