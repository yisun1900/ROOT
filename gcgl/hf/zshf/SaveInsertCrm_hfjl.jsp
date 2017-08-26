<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hflxbm=null;
String khbh=null;
String sjfa=null;
String hqfw=null;
String jdqk=null;
String zjyfw=null;
String zjydw=null;
String zjyjz=null;
String fwsz=null;
String sgzl=null;
String grsz=null;
String sjshfnr=null;
String zjyhfnr=null;
String sgdhfnr=null;
String sfjxhf=null;
java.sql.Date xchfrq=null;
String xchflxbm=null;
String clfs=null;
java.sql.Date hfsj=null;
String hfr=null;
String bz=cf.GB2Uni(request.getParameter("bz"));
String hfjlh=request.getParameter("hfjlh");
String jglxbm=request.getParameter("jglxbm");
String hfbm=request.getParameter("hfbm");
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sjfa=cf.GB2Uni(request.getParameter("sjfa"));
hqfw=cf.GB2Uni(request.getParameter("hqfw"));
jdqk=cf.GB2Uni(request.getParameter("jdqk"));
zjyfw=cf.GB2Uni(request.getParameter("zjyfw"));
zjydw=cf.GB2Uni(request.getParameter("zjydw"));
zjyjz=cf.GB2Uni(request.getParameter("zjyjz"));
fwsz=cf.GB2Uni(request.getParameter("fwsz"));
sgzl=cf.GB2Uni(request.getParameter("sgzl"));
grsz=cf.GB2Uni(request.getParameter("grsz"));
sjshfnr=cf.GB2Uni(request.getParameter("sjshfnr"));
zjyhfnr=cf.GB2Uni(request.getParameter("zjyhfnr"));
sgdhfnr=cf.GB2Uni(request.getParameter("sgdhfnr"));
sfjxhf=cf.GB2Uni(request.getParameter("sfjxhf"));
ls=request.getParameter("xchfrq");
try{
	if (!(ls.equals("")))  xchfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xchfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下次回访日期]类型转换发生意外:"+e);
	return;
}
xchflxbm=cf.GB2Uni(request.getParameter("xchflxbm"));
clfs=cf.GB2Uni(request.getParameter("clfs"));
String[] dwbh=request.getParameterValues("dwbh");
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访时间]类型转换发生意外:"+e);
	return;
}
hfr=cf.GB2Uni(request.getParameter("hfr"));

String jcjjsjs=request.getParameter("jcjjsjs");
String jsjjgw=request.getParameter("jsjjgw");
String jcxmzy=request.getParameter("jcxmzy");
String jcshaz=request.getParameter("jcshaz");
String jccpzl=request.getParameter("jccpzl");
String jchfnr=cf.GB2Uni(request.getParameter("jchfnr"));



String ysfxhf=null;
java.sql.Date yhfrq=null;
String yhflxbm=null;
String ywgbz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();



	ls_sql="select sfxhf,hfrq,hflxbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysfxhf=rs.getString("sfxhf");
		yhfrq=rs.getDate("hfrq");
		yhflxbm=rs.getString("hflxbm");
	}
	rs.close();
	ps.close();
	
	String yhfszjlh=null;
	ls_sql="select hfszjlh";
	ls_sql+=" from  crm_hfszjl";
	ls_sql+=" where khbh='"+khbh+"' and zxszbz='Y'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhfszjlh=rs.getString("hfszjlh");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);


	ls_sql=" update crm_hfszjl set sfyhf='Y',zxhfsj=?,hfjlh=? ";	
	ls_sql+=" where  khbh='"+khbh+"' and hfszjlh='"+yhfszjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,hfsj);
	ps.setString(2,hfjlh);
	ps.executeUpdate();
	ps.close();

	String hfszjlh=null;
	if (sfjxhf.equals("Y") || sfjxhf.equals("F"))//Y：设置；N：不设置；F：重新回访
	{
		ls_sql="update crm_khxx set sfxhf=?,hfrq=?,hflxbm=? where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"Y");
		ps.setDate(2,xchfrq);
		ps.setString(3,xchflxbm);
		ps.executeUpdate();
		ps.close();

		//插入：回访设置记录＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql=" update crm_hfszjl set zxszbz='N'";	
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="select NVL(max(substr(hfszjlh,8,3)),0)";
		ls_sql+=" from  crm_hfszjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		hfszjlh=khbh+cf.addZero(count+1,3);

		String hfszyy=hfjlh+":回访时设置";
		ls_sql=" insert into crm_hfszjl (hfszjlh,khbh,hflxbm,hfsj,hfszr,hfszsj,hfszyy,lx,hfzcgjz,sfyhf,zxszbz,yhfszjlh) ";	
		ls_sql+=" values ( ?,?,?,?,?,SYSDATE,?,'6',?,'N','Y',?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfszjlh);
		ps.setString(2,khbh);
		ps.setString(3,xchflxbm);
		ps.setDate(4,xchfrq);
		ps.setString(5,hfr);
		ps.setString(6,hfszyy);
		ps.setString(7,hfjlh);
		ps.setString(8,yhfszjlh);
		ps.executeUpdate();
		ps.close();
		//插入：回访设置记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	}
	else{
		ls_sql="update crm_khxx set sfxhf=?,hfrq=null,hflxbm=null where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"N");
		ps.executeUpdate();
		ps.close();
	}
	
	String yhfjlh=null;
	ls_sql="select hfjlh";
	ls_sql+=" from  crm_hfjl";
	ls_sql+=" where khbh='"+khbh+"' and zxhfbz='Y'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhfjlh=rs.getString("hfjlh");
	}
	rs.close();
	ps.close();

	ls_sql=" update crm_hfjl set zxhfbz='N'";	
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_hfjl ( hflxbm,khbh,sjfa,hqfw,jdqk,sjshfnr,zjyfw,zjydw,zjyjz,zjyhfnr,fwsz,sgzl,grsz,sgdhfnr,sfjxhf,xchfrq,xchflxbm,clfs,hfsj,hfr,hfjlh,ysfxhf,yhfrq,yhflxbm,jglxbm,bz,hfbm,jcjjsjs,jsjjgw,jcxmzy,jcshaz,jccpzl,jchfnr,zxhfbz,yhfjlh,hfszjlh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ,?,?,?,'Y',?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hflxbm);
	ps.setString(2,khbh);
	ps.setString(3,sjfa);
	ps.setString(4,hqfw);
	ps.setString(5,jdqk);
	ps.setString(6,sjshfnr);
	ps.setString(7,zjyfw);
	ps.setString(8,zjydw);
	ps.setString(9,zjyjz);
	ps.setString(10,zjyhfnr);
	ps.setString(11,fwsz);
	ps.setString(12,sgzl);
	ps.setString(13,grsz);
	ps.setString(14,sgdhfnr);
	ps.setString(15,sfjxhf);
	ps.setDate(16,xchfrq);
	ps.setString(17,xchflxbm);
	ps.setString(18,clfs);
	ps.setDate(19,hfsj);
	ps.setString(20,hfr);
	ps.setString(21,hfjlh);

	ps.setString(22,ysfxhf);
	ps.setDate(23,yhfrq);
	ps.setString(24,yhflxbm);


	ps.setString(25,jglxbm);
	ps.setString(26,bz);
	ps.setString(27,hfbm);

	ps.setString(28,jcjjsjs);
	ps.setString(29,jsjjgw);
	ps.setString(30,jcxmzy);
	ps.setString(31,jcshaz);
	ps.setString(32,jccpzl);
	ps.setString(33,jchfnr);
	ps.setString(34,yhfjlh);
	ps.setString(35,hfszjlh);

	ps.executeUpdate();
	ps.close();

	if (dwbh!=null)
	{
		for (int i=0;i<dwbh.length ;i++ )
		{
			ls_sql="insert into crm_gchffkbm (hfjlh,dwbh,clzt ) ";
			ls_sql+=" values (?,?,'N') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfjlh);
			ps.setString(2,dwbh[i]);
			ps.executeUpdate();
			ps.close();
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
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