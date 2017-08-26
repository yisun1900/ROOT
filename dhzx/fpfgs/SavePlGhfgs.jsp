<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yssfgs=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		//客户所属分公司
		String yzxzt=null;
		String ykhfwjlh=null;
		ls_sql="select ssfgs,zxzt,khfwjlh";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yssfgs=rs.getString("ssfgs");
			yzxzt=rs.getString("zxzt");
			ykhfwjlh=rs.getString("khfwjlh");
		}
		rs.close();
		ps.close();

		String zt="";
		ls_sql="select zt";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zt=rs.getString("zt");
		}
		rs.close();
		ps.close();

		String khfwjlh=null;//操作序号
		int count=0;
		ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
		ls_sql+=" from  crm_zxkhfwjl";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		khfwjlh=khbh[i]+cf.addZero(count+1,3);


		if (yssfgs==null || !yssfgs.equals(ssfgs))//未分配
		{
			String xzxzt="0";
			//插入表：咨询客户服务记录（crm_zxkhfwjl）
			ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,czlx,xzxzt,yzxzt,lrr,lrsj,lrbm,ykhfwjlh)";
			ls_sql+=" values ( ?,?,?,'4',?,?,?,TRUNC(SYSDATE),?,?)";//4: 分配分公司
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khfwjlh);
			ps.setString(2,khbh[i]);
			ps.setString(3,ssfgs);
			ps.setString(4,xzxzt);
			ps.setString(5,yzxzt);
			ps.setString(6,yhmc);
			ps.setString(7,dwbh);
			ps.setString(8,ykhfwjlh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set ssfgs=?,zxdm=null,sjs=null,khfwjlh=?,zxzt=?";
			ls_sql+=" where khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.setString(2,khfwjlh);
			ps.setString(3,xzxzt);
			ps.executeUpdate();
			ps.close();


			ls_sql="update crm_khxx set fgsbh=?,dwbh='00000',sjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();

	//		out.println(ls_sql);

			//更新集成订单＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
			ls_sql="update jc_jcdd set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();

			ls_sql="update jc_mmydd set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_mmzjx set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_cgdd set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_cgzjx set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_jjdd set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_jjzjx set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			
			ls_sql="update jc_zcdd set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_zcddmx set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			ls_sql="update jc_zczjx set fgsbh=?,qddm='00000',jzsjs=''";
			ls_sql+=" where  khbh='"+khbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ssfgs);
			ps.executeUpdate();
			ps.close();
			//更新集成订单－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

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