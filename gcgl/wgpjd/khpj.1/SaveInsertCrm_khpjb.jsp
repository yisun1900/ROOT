<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] pjxmstr=request.getParameterValues("pjxm");

String yjdz=null;
String yb=null;
String sjr=null;
String dh=null;
String bz=null;

yjdz=cf.GB2Uni(request.getParameter("yjdz"));
yb=cf.GB2Uni(request.getParameter("yb"));
sjr=cf.GB2Uni(request.getParameter("sjr"));
dh=cf.GB2Uni(request.getParameter("dh"));
bz=cf.GB2Uni(request.getParameter("bz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	//保单信息
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_bdxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (!sjr.equals(""))
	{
		if (count>0)
		{
			ls_sql="update crm_bdxx set yjdz=?,yb=?,sjr=?,dh=?,bz=?,lrr=?,lrsj=TRUNC(SYSDATE) ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yjdz);
			ps.setString(2,yb);
			ps.setString(3,sjr);
			ps.setString(4,dh);
			ps.setString(5,bz);
			ps.setString(6,yhmc);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into crm_bdxx ( khbh,yjdz,yb,sjr,dh,bz,lrr,lrsj ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,TRUNC(SYSDATE) ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,yjdz);
			ps.setString(3,yb);
			ps.setString(4,sjr);
			ps.setString(5,dh);
			ps.setString(6,bz);
			ps.setString(7,yhmc);
			ps.executeUpdate();
			ps.close();
		}
	}


	//客户评价表
	ls_sql="delete from crm_khpjb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	String spjrybm=null;
	String spjry=null;
	String xmflbm=null;
	String xmfl=null;
	String pjxmbm=null;
	String pjxm=null;
	String xsfs=null;
	ls_sql="select spjrybm,spjry,xmflbm,xmfl,pjxmbm,pjxm,xsfs";
	ls_sql+=" from  crm_pjxmbm";
	ls_sql+=" order by pjxmbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		spjrybm=cf.fillNull(rs1.getString("spjrybm"));
		spjry=cf.fillNull(rs1.getString("spjry"));
		xmflbm=cf.fillNull(rs1.getString("xmflbm"));
		xmfl=cf.fillNull(rs1.getString("xmfl"));
		pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
		pjxm=cf.fillNull(rs1.getString("pjxm"));
		xsfs=cf.fillNull(rs1.getString("xsfs"));


		String pjjgbm=null;
		String pjjg=null;
		if (xsfs.equals("1"))//1：项目分类多选；2：项目分类单选
		{
			pjjgbm=cf.GB2Uni(request.getParameter("pjxmbm"+pjxmbm));
		}
		else{
			pjjgbm=cf.GB2Uni(request.getParameter("xmflbm"+spjrybm+xmflbm));

			if (pjjgbm==null || pjjgbm.equals(""))
			{
				conn.rollback();
				out.println("错误！["+spjry+"]的["+xmfl+"]没有选择");
				return;
			}
			else if (pjjgbm.equals(pjxmbm))
			{
				pjjgbm="1";
			}
			else{
				pjjgbm="2";
			}
		}
		if (pjjgbm.equals("1"))
		{
			pjjg="√";
		}
		else if (pjjgbm.equals("2"))
		{
			pjjg="×";
		}
		else
		{
			pjjg="空";
		}

		ls_sql="insert into crm_khpjb (khbh,pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh,pjjgbm,pjjg,lrr,lrsj) ";
		ls_sql+=" select ?,pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh,?,?,?,TRUNC(SYSDATE) ";
		ls_sql+=" from crm_pjxmbm";
		ls_sql+=" where pjxmbm='"+pjxmbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,pjjgbm);//1：同意；2：不同意；9：空
		ps.setString(3,pjjg);
		ps.setString(4,yhmc);
		ps.executeUpdate();
		ps.close();

	}
	rs1.close();
	ps1.close();

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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>