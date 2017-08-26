<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010101")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>
<%

String ls=null;
String dwbh=null;
String dwmc=null;
String dwjc=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String ssdw=cf.GB2Uni(request.getParameter("ssdw"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String hthqz=cf.GB2Uni(request.getParameter("hthqz"));
String cxbz=cf.GB2Uni(request.getParameter("cxbz"));
dwmc=cf.GB2Uni(request.getParameter("dwmc"));
dwjc=cf.GB2Uni(request.getParameter("dwjc"));
dwlx=cf.GB2Uni(request.getParameter("dwlx"));
dwdz=cf.GB2Uni(request.getParameter("dwdz"));
dwfzr=cf.GB2Uni(request.getParameter("dwfzr"));
dwdh=cf.GB2Uni(request.getParameter("dwdh"));
dwcz=cf.GB2Uni(request.getParameter("dwcz"));
email=cf.GB2Uni(request.getParameter("email"));
bz=cf.GB2Uni(request.getParameter("bz"));
String bianma=cf.GB2Uni(request.getParameter("bianma"));

String ssdqbm=cf.GB2Uni(request.getParameter("ssdqbm"));
String dwflbm=cf.GB2Uni(request.getParameter("dwflbm"));
String ssfw=cf.GB2Uni(request.getParameter("ssfw"));
String dwjb=cf.GB2Uni(request.getParameter("dwjb"));
String dzbjbz=cf.GB2Uni(request.getParameter("dzbjbz"));
String dmxs=cf.GB2Uni(request.getParameter("dmxs"));

java.sql.Date kdsj=null;
java.sql.Date gdsj=null;
ls=request.getParameter("kdsj");
try{
	if (!(ls.equals("")))  kdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开店时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdsj");
try{
	if (!(ls.equals("")))  gdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[关店时间]类型转换发生意外:"+e);
	return;
}
int bzrs=0;
ls=request.getParameter("bzrs");
try{
	if (!(ls.equals("")))  bzrs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准人数]类型转换发生意外:"+e);
	return;
}

String kfdh=cf.GB2Uni(request.getParameter("kfdh"));
String sfjms=cf.GB2Uni(request.getParameter("sfjms"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));
String dhqh=cf.GB2Uni(request.getParameter("dhqh"));




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (dwbh.length()!=5)
	{
		out.println("错误！[单位编号]长度必须5位");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from bj_dzbjbz";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into sq_dwxx ( dwbh,dwmc,dwjc,dwlx,dwdz,dwfzr,dwdh,dwcz,email,ssdw ";
	ls_sql+=" ,dqbm,hthqz,cxbz,ssfgs,bianma,ssdqbm,dwflbm,ssfw,dwjb,kdsj ";
	ls_sql+=" ,gdsj,dmxs,bzrs,kfdh,sfjms,xuhao,dhqh,bz,khxxglsj,jcppbz ";

	ls_sql+=" ,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,dzbjjc,hfsjzdsz,xmzyglbz,jjgwglbz,jjsjsglbz,jcddblxs ";
	ls_sql+=" ,jcddmxblxs,djlrfs,kgcxhdbl,zcmmbz,mmbz,cgjjbz,jjbz,bzlybl,lyblxx,lyblsx ";
	ls_sql+=" ,jryjbfb,sjjryjbfb,gcjcbjxs,sgcbbjxs,zdyxmshbz,zdyxmyxq,clfbfb,sfqyyssh,bjdysq )";

	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,UPPER(?),?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);

	ps.setString(1,dwbh);
	ps.setString(2,dwmc);
	ps.setString(3,dwjc);
	ps.setString(4,dwlx);
	ps.setString(5,dwdz);
	ps.setString(6,dwfzr);
	ps.setString(7,dwdh);
	ps.setString(8,dwcz);
	ps.setString(9,email);
	ps.setString(10,ssdw);

	ps.setString(11,dqbm);
	ps.setString(12,hthqz);
	ps.setString(13,cxbz);
	ps.setString(14,ssfgs);
	ps.setString(15,bianma);
	ps.setString(16,ssdqbm);
	ps.setString(17,dwflbm);
	ps.setString(18,ssfw);
	ps.setString(19,dwjb);
	ps.setDate(20,kdsj);

	ps.setDate(21,gdsj);
	ps.setString(22,dmxs);
	ps.setInt(23,bzrs);
	ps.setString(24,kfdh);
	ps.setString(25,sfjms);
	ps.setString(26,xuhao);
	ps.setString(27,dhqh);
	ps.setString(28,bz);
	ps.setDate(29,null);//客户信息过滤时间
	ps.setString(30,"N");//投诉报修供应商检查  Y：无订单无法录入；N：无订单可录入

	ps.setString(31,"N");//启用咨询客户录入检查  N：不启用；Y：启用
	ps.setInt(32,0);//咨询客户提前录入天数
	ps.setString(33,"N");//启用签单客户补录检查 N：不启用；Y：启用
	ps.setInt(34,0);//签单客户补录允许天数
	ps.setString(35,"7");//启用电子报价检查   7：[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]不可改，可改其它优惠
	ps.setString(36,"1111");//启用回访时间自动设置  1111
	ps.setString(37,"Y");//集成订单对项目专员过滤标志  N：不过滤；Y：过滤
	ps.setString(38,"Y");//集成订单对家居顾问过滤标志  N：不过滤；Y：过滤
	ps.setString(39,"Y");//集成订单对家居设计师过滤标志  N：不过滤；Y：过滤
	ps.setString(40,"2");//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位

	ps.setString(41,"2");//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ps.setString(42,"2");//主材订单单价录入方式  1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	ps.setString(43,"N");//主材订单是否可改促销活动比例  Y：可改；N：不可改
	ps.setString(44,"Y");//主材收款检查  Y：无订单不能收款；N：无订单可收款；M：可空
	ps.setString(45,"Y");//木门收款检查 Y：无订单不能收款；N：无订单可收款；M：可空
	ps.setString(46,"Y");//橱柜收款检查  Y：无订单不能收款；N：无订单可收款；M：可空
	ps.setString(47,"Y");//家具收款检查  Y：无订单不能收款；N：无订单可收款；M：可空
	ps.setDouble(48,0);//标准领用比例
	ps.setDouble(49,0);//领用比例下限
	ps.setDouble(50,0);//领用比例上限

	ps.setDouble(51,0);//家装客户计入业绩收款比例
	ps.setDouble(52,0);//设计客户计入业绩收款比例
	ps.setDouble(53,1);//工程基础报价系数
	ps.setDouble(54,1);//施工成本报价系数
	ps.setString(55,"N");//是否启用自定义项审核  Y：启用；N：不启用
	ps.setInt(56,3);//自定义项目有效期,以月为单位
	ps.setDouble(57,31);//电子报价材料费百分比
	ps.setString(58,"N");//是否启用预算审核  Y：启用；N：不启用
	ps.setString(59,"1");//报价打印是否需授权  1：不需授权；2：只需一次授权；3：每次打印都需授权
	
	ps.executeUpdate();
	ps.close();


	ls_sql="update sq_dwxx set ssdqbm=?,dqbm=?";
	ls_sql+=" where ssfgs='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssdqbm);
	ps.setString(2,dqbm);
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
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>