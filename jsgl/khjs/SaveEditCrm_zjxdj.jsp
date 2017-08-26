<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String zjxfsjd=null;
String zjxyysm=null;
double oldzjje=0;
double zjje=0;
double kglf=0;
double kqtk=0;
double jzjje=0;
java.sql.Date fssj=null;
ls=request.getParameter("fssj");
try{
	if (!(ls.equals("")))  fssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生时间]类型转换发生意外:"+e);
	return;
}

khbh=cf.GB2Uni(request.getParameter("khbh"));
zjxfsjd=cf.GB2Uni(request.getParameter("zjxfsjd"));
zjxyysm=cf.GB2Uni(request.getParameter("zjxyysm"));
ls=request.getParameter("oldzjje");
try{
	if (!(ls.equals("")))  oldzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量oldzjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[旧增减项发生额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kglf");
try{
	if (!(ls.equals("")))  kglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kglf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kqtk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣其它款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzjje");
try{
	if (!(ls.equals("")))  jzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[净增减金额]类型转换发生意外:"+e);
	return;
}

String zjxwcbz=request.getParameter("zjxwcbz");
double gckk=0;
ls=request.getParameter("gckk");
try{
	if (!(ls.equals("")))  gckk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gckk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程扣款]类型转换发生意外:"+e);
	return;
}

String gckkspbz="";
if (gckk>0)
{
	gckkspbz="N";
}

String[] zjxyybm=null;
zjxyybm=request.getParameterValues("zjxyybm");

String zjxxh=null;
zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldgckkspbz="";
	String newzjxxh="";
	String gcjdbm="";
	String gdjsjd="";
	String sjsjsbz="";
	ls_sql="select gckkspbz,gcjdbm,zjxxh,gdjsjd,sjsjsbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldgckkspbz=cf.fillNull(rs.getString("gckkspbz"));//工程扣款审批标志
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
	}
	rs.close();
	ps.close();

	if (oldgckkspbz.equals("Y"))//N：未审批；Y：已审批
	{
		out.println("错误！工程扣款已审批，不能再修改");
		return;
	}
	if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再修改");
		return;
	}
	if (sjsjsbz.equals("2"))//0：未结算；1：签单结算；2：完工结算
	{
		out.println("错误！设计师已结算，不能再修改");
		return;
	}
	if (gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		out.println("错误！施工队已结算，不能再修改");
		return;
	}
	if (!newzjxxh.equals(zjxxh))
	{
		out.println("错误！只能修改最新的增减项记录:"+newzjxxh);
		return;
	}
	

	double newzjje=0;
	ls_sql="select zjje";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newzjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	if (newzjje!=oldzjje)
	{
		out.println("错误！【增减项发生额】已通过增减明细进行自动修改，不能存盘，请刷新后重新保存");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set fssj=?,zjxfsjd=?,zjxyysm=?,zjje=?,kglf=?,kqtk=?,jzjje=?,gckk=?,zjxwcbz=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,fssj);
	ps.setString(2,zjxfsjd);
	ps.setString(3,zjxyysm);
	ps.setDouble(4,zjje);
	ps.setDouble(5,kglf);
	ps.setDouble(6,kqtk);
	ps.setDouble(7,jzjje);
	ps.setDouble(8,gckk);
	ps.setString(9,zjxwcbz);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zjxyydj ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<zjxyybm.length ;i++ )
	{
		ls_sql="insert into crm_zjxyydj ( zjxxh,khbh,zjxyybm) ";
		ls_sql+=" values ( ?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,zjxyybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	double allzjxje=0;
	double allkglf=0;
	double allkqtk=0;
	double alljzjje=0;

	ls_sql="select sum(zjje),sum(kglf),sum(kqtk),sum(jzjje)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		allkglf=rs.getDouble(2);
		allkqtk=rs.getDouble(3);
		alljzjje=rs.getDouble(4);
	}
	rs.close();
	ps.close();


	ls_sql="update crm_khxx set gckk=?,zjxwcbz=?,gckkspbz=? ";
	ls_sql+=" ,zjxje=?,kglf=?,kqtk=?,zhzjxje=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gckk);
	ps.setString(2,zjxwcbz);
	ps.setString(3,gckkspbz);
	ps.setDouble(4,allzjxje);
	ps.setDouble(5,allkglf);
	ps.setDouble(6,allkqtk);
	ps.setDouble(7,alljzjje);
	ps.executeUpdate();
	ps.close();

	if (zjxwcbz.equals("2"))//1：未完成；2：已完成
	{
		ls_sql="update crm_khxx set khjsje=qye+NVL(zhzjxje,0)+NVL(kglf,0)+NVL(kqtk,0)-NVL(gckk,0)";//客户已完成金额
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
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