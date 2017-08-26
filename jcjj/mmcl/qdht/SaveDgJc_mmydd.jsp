<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String htqdr=cf.GB2Uni(request.getParameter("htqdr"));
String htbz=cf.GB2Uni(request.getParameter("htbz"));

String ls=null;

java.sql.Date jhazsj=null;
java.sql.Date htrq=null;
java.sql.Date kjxsj=null;
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划安装时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htrq");
try{
	if (!(ls.equals("")))  htrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可减项截止时间]类型转换发生意外:"+e);
	return;
}
double fwf=0;
ls=request.getParameter("fwf");
try{
	if (!(ls.equals("")))  fwf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[服务费]类型转换发生意外:"+e);
	return;
}

double mmzkl=0;
ls=request.getParameter("mmzkl");
try{
	if (!(ls.equals("")))  mmzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[木门折扣率]类型转换发生意外:"+e);
	return;
}
double wjzkl=0;
ls=request.getParameter("wjzkl");
try{
	if (!(ls.equals("")))  wjzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金折扣率]类型转换发生意外:"+e);
	return;
}
double blzkl=0;
ls=request.getParameter("blzkl");
try{
	if (!(ls.equals("")))  blzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量blzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[玻璃折扣率]类型转换发生意外:"+e);
	return;
}

String dzyy=cf.GB2Uni(request.getParameter("dzyy"));


String wjqk=cf.GB2Uni(request.getParameter("wjqk"));
String wjsgsbz=null;
if (wjqk.equals("1"))//1：客户自购；2：公司购买
{
	wjsgsbz="N";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("03"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}

	int mmxh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_mmdgdmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmxh=rs.getInt(1);
	}
	rs.close();
	ps.close();



	//检查门洞是否超范围
	int gdbxy=0;
	int gdbdy=0;
	int kdbxy=0;
	int kdbdy=0;
	int lsmdk=0;
	int lsmdg=0;
	String mlx=null;
	String mumxh=null;
	String mlxmc=null;

	ls_sql="select jc_mmccd.mlx,mlxmc,jc_mmccd.mmxh,mdk,mdg";
	ls_sql+=" from  jc_mmccd,jdm_mlx";
	ls_sql+=" where jc_mmccd.mlx=jdm_mlx.mlx(+) and yddbh='"+yddbh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		mlx=rs1.getString("mlx");
		mlxmc=rs1.getString("mlxmc");
		mumxh=rs1.getString("mmxh");
		lsmdk=rs1.getInt("mdk");
		lsmdg=rs1.getInt("mdg");

		if (mlx!=null)
		{
			ls_sql="select gdbxy,gdbdy,kdbxy,kdbdy";
			ls_sql+=" from  jdm_mlx";
			ls_sql+=" where mlx='"+mlx+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				gdbxy=rs.getInt("gdbxy");
				gdbdy=rs.getInt("gdbdy");
				kdbxy=rs.getInt("kdbxy");
				kdbdy=rs.getInt("kdbdy");
			}
			rs.close();
			ps.close();

			if (lsmdg<gdbxy || lsmdg>gdbdy)
			{
				out.println("<BR>提醒！木门型号["+cf.fillNull(mumxh)+"]：[高度]超标准范围，标准范围（"+gdbxy+"mm---"+gdbdy+"mm）");
			}
			if (lsmdk<kdbxy || lsmdk>kdbdy)
			{
				out.println("<BR>提醒！木门型号["+cf.fillNull(mumxh)+"]：[宽度]超标准范围，标准范围（"+kdbxy+"mm---"+kdbdy+"mm）");
			}
		}
	}
	rs1.close();
	ps1.close();


	conn.setAutoCommit(false);

	ls_sql="update jc_mmydd set clzt='04',jhazsj=?,htrq=?,htqdr=?,htbz=?  ,kjxsj=?,wjqk=?,wjsgsbz=?,fwf=?,mmzkl=?,wjzkl=?,blzkl=?,dzyy=?";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhazsj);
	ps.setDate(2,htrq);
	ps.setString(3,htqdr);
	ps.setString(4,htbz);
	ps.setDate(5,kjxsj);
	ps.setString(6,wjqk);
	ps.setString(7,wjsgsbz);
	ps.setDouble(8,fwf);
	ps.setDouble(9,mmzkl);
	ps.setDouble(10,wjzkl);
	ps.setDouble(11,blzkl);
	ps.setString(12,dzyy);

	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_mmdgdmx (xh,yddbh,mmdglxbm,mlx,mmxh,ysbm,czbm,azwzbm,kqfxbm,mtxbm  ,mxxbm,dczlbm,dbh,qh,mdk,mdg,ctbs,tjx,dsk,blxhbm  ,sfsmjcc,sfydc,lx,sfzdjj,bzdj,dj,sl,zjhsl,bz,blxh) ";
	ls_sql+=" select   "+mmxh+"+rownum,yddbh,mmdglxbm,mlx,mmxh,ysbm,czbm,azwzbm,kqfxbm,mtxbm  ,mxxbm,dczlbm,dbh,qh,mdk,mdg,ctbs,tjx,dsk,blxhbm  ,sfsmjcc,sfydc,'1','1'  ,0   ,0,sl,sl,bz,blxh";//1：自动；2：人工
	ls_sql+=" from jc_mmccd ";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy ,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc  ,zqje,zhje,cbje,fssj)";
	ls_sql+=" select yddbh,'1','1',yddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy          ,'','',''           ,pdgc,pdgcmc,gys,ppmc  ,0   ,0   ,0   ,htrq";
	ls_sql+=" from jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>