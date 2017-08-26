<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String clr=null;
clr=cf.GB2Uni(request.getParameter("clr"));
java.sql.Date clsj=null;
String clsm=cf.GB2Uni(request.getParameter("clsm"));

ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收时间]类型转换发生意外:"+e);
	return;
}
String cljg=request.getParameter("cljg");

String zgcljlh=request.getParameter("zgcljlh");
String zgjlh=request.getParameter("zgjlh");
String xjjlh=request.getParameter("xjjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getwtclbz=null;
	ls_sql="select wtclbz";
	ls_sql+=" from kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getwtclbz=cf.fillNull(rs.getString("wtclbz"));
	}
	rs.close();
	ps.close();

	if (getwtclbz.equals("Y"))//B：无整改；N：整改未接收；C：在处理；Y：已解决
	{
		out.println("错误！整改已解决");
		return;
	}

	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from kp_zggdmx";
	ls_sql+=" where zgjlh='"+zgjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("4"))//1:未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	{
		out.println("错误！状态不正确");
		return;
	}

	
	conn.setAutoCommit(false);

	ls_sql="insert into kp_zgclgdmx (zgcljlh,zgjlh,xjjlh,lx,cljg,clr,clsj,clsm)  ";
	ls_sql+=" values (?,?,?,?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,zgjlh);
	ps.setString(3,xjjlh);
	ps.setString(4,"整改验收");
	ps.setString(5,cljg);
	ps.setString(6,clr);
	ps.setString(7,clsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update kp_zggdmx set clzt='"+cljg+"',zgcljlh=?,ysr=?,yssj=SYSDATE,yssm=?  ";//1:未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
	ls_sql+=" where zgjlh='"+zgjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zgcljlh);
	ps.setString(2,clr);
	ps.setString(3,clsm);
	ps.executeUpdate();
	ps.close();

	String setwtclbz=null;
	int zgclsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from kp_zggdmx";
	ls_sql+=" where xjjlh='"+xjjlh+"' ";
	ls_sql+=" and clzt!='1'";//1:未接收
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zgclsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (zgclsl==0)
	{
		setwtclbz="N";//B：无整改；N：整改未接收；C：在处理；Y：已解决
	}
	else{
		zgclsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from kp_zggdmx";
		ls_sql+=" where xjjlh='"+xjjlh+"' ";
		ls_sql+=" and clzt!='5'";//1:未接收；2：接收；3：在处理；4：已解决；5：验收通过；6：验收未通过
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zgclsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (zgclsl==0)
		{
			setwtclbz="Y";//B：无整改；N：整改未接收；C：在处理；Y：已解决
		}
		else{
			setwtclbz="C";//B：无整改；N：整改未接收；C：在处理；Y：已解决
		}
	}

	ls_sql="update kp_xjgdjl set wtclbz='"+setwtclbz+"'";
	ls_sql+=" where xjjlh='"+xjjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	if (cljg.equals("6"))//5：验收通过；6：验收未通过
	{
		//发送短信
		ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
		String retStr=dxxt.jczgYs(conn,zgjlh,clr);//调用发送短信函数
		if (retStr.equals(""))
		{
			out.println("短信发送成功");
		}
		else{
			out.println(retStr);//将发送结果显示到页面上
		}
	}


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