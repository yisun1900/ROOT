<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String drkhbh=request.getParameter("drkhbh");//导入客户
String dqbm=request.getParameter("dqbm");

String khbh=request.getParameter("khbh");//被拷贝客户

if (khbh.equals(drkhbh))
{
	out.println("错误！同一个客户不能互相复制");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
int count=0;
String wybh=null;
String xmbh=null;
try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();

	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}

	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_khzcmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql ="delete from bj_khzcmx ";
	ls_sql+=" where khbh='"+drkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql ="insert into bj_khzcmx (xh,khbh,zcbm,xsxh,zcmc,zcdlbm,zcxlbm,ppbm,gys,ppmc,zclbbm,xinghao,gg,zcysbm,cz,zdxsj,zcpzwzbm,xzjg,jldwbm,zqdj,dpzk,dj,sfzp,zsdj,jgfs,jsfs,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,sxbz,sxhtyy,sftjp,fjddbh,ddmxxh,lrr,lrsj   ,bz)";
	ls_sql+="        select   ?+rownum,?   ,zcbm,xsxh,zcmc,zcdlbm,zcxlbm,ppbm,gys,ppmc,zclbbm,xinghao,gg,zcysbm,cz,zdxsj,zcpzwzbm,xzjg,jldwbm,zqdj,dpzk,dj,sfzp,zsdj,jgfs,jsfs,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,sxbz,sxhtyy,sftjp,''    ,''    ,?  ,SYSDATE,bz";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setString(2,drkhbh);
	ps.setString(3,yhmc);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("报价复制成功！");
	window.close();
	//-->
	</SCRIPT>
	<%


}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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