<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=request.getParameter("ddbh");
String zjxbh=request.getParameter("zjxbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String clzt=null;
	String fgsbh=null;
	ls_sql =" select clzt,fgsbh";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单保留小数位数』，请联系管理员");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单明细保留小数』，请联系管理员");
		return;
	}

	conn.setAutoCommit(false);

	//对小数位处理
	ls_sql="update jc_zczjxmx ";
	ls_sql+=" set zjje=ROUND(zjje,"+jcddmxblxs+")";
	ls_sql+=" ,zjycf=ROUND(zjycf,"+jcddmxblxs+")";
	ls_sql+=" ,zjqtfy=ROUND(zjqtfy,"+jcddmxblxs+")";
	ls_sql+=" ,zjcxhdje=ROUND(zjcxhdje,"+jcddmxblxs+")";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材增减项（jc_zczjx）:增减项总额
	double zqzjxze=0;
	double zjxcxhdje=0;
	double zjxcbze=0;
	double zqzjxclf=0;
	double zqzjxycf=0;
	double zqzjxqtf=0;
	ls_sql="select sum(zjje+zjycf+zjqtfy),sum(zjcxhdje),sum(zjcbje),sum(zjje),sum(zjycf),sum(zjqtfy) ";
	ls_sql+=" from jc_zczjxmx ";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqzjxze=rs.getDouble(1);
		zjxcxhdje=rs.getDouble(2);
		zjxcbze=rs.getDouble(3);
		zqzjxclf=rs.getDouble(4);
		zqzjxycf=rs.getDouble(5);
		zqzjxqtf=rs.getDouble(6);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zczjx set zqzjxze=ROUND("+zqzjxze+","+jcddblxs+"),zjxze=ROUND("+zqzjxze+"*zjxzkl/10,"+jcddblxs+") ";
	ls_sql+=" ,zjxcxhdje=ROUND("+zjxcxhdje+"*zjxzkl/10,"+jcddblxs+"),zjxcbze="+zjxcbze+",clzt='01'";
	ls_sql+=" ,zqzjxclf="+zqzjxclf+",zhzjxclf="+zqzjxclf+"*zjxzkl/10,zqzjxycf="+zqzjxycf+",zhzjxycf="+zqzjxycf+"*zjxzkl/10,zqzjxqtf="+zqzjxqtf+",zhzjxqtf="+zqzjxqtf+"*zjxzkl/10 ";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcddmx";
	ls_sql+=" set zjhsl=sl+NVL((select sum(zjsl) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhje=je+NVL((select sum(zjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhycf=ycf+NVL((select sum(zjycf) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhqtfy=qtfyje+NVL((select sum(zjqtfy) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhcxhdje=cxhdje+NVL((select sum(zjcxhdje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" and jc_zcddmx.xh in(select xh from jc_zczjxmx where zjxbh='"+zjxbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	//对小数位处理
	ls_sql="update jc_zcddmx ";
	ls_sql+=" set zjhje=ROUND(zjhje,"+jcddmxblxs+")";
	ls_sql+=" ,zjhycf=ROUND(zjhycf,"+jcddmxblxs+")";
	ls_sql+=" ,zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
	ls_sql+=" ,zjhcxhdje=ROUND(zjhcxhdje,"+jcddmxblxs+")";
	ls_sql+=" where ddbh='"+ddbh+"'";
    ls_sql+=" and jc_zcddmx.xh in(select xh from jc_zczjxmx where zjxbh='"+zjxbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	//对小数位处理
	ls_sql="update jc_zcddmx ";
	ls_sql+=" set zjhje=0,zjhycf=0,zjhqtfy=0,zjhcxhdje=0";
	ls_sql+=" where ddbh='"+ddbh+"' and zjhsl=0";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材订单（jc_zcdd）:汇总增减项总额
	double zqzjhze=0;
	double zjhze=0;
	zjxcbze=0;
	zjxcxhdje=0;

	zqzjxclf=0;
	double zhzjxclf=0;
	zqzjxycf=0;
	double zhzjxycf=0;
	zqzjxqtf=0;
	double zhzjxqtf=0;
	ls_sql="select sum(zqzjxze),sum(zjxze),sum(zjxcbze),sum(zjxcxhdje)   ,sum(zqzjxclf),sum(zhzjxclf),sum(zqzjxycf),sum(zhzjxycf),sum(zqzjxqtf),sum(zhzjxqtf)";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqzjhze=rs.getDouble(1);
		zjhze=rs.getDouble(2);
		zjxcbze=rs.getDouble(3);
		zjxcxhdje=rs.getDouble(4);

		zqzjxclf=rs.getDouble(5);
		zhzjxclf=rs.getDouble(6);
		zqzjxycf=rs.getDouble(7);
		zhzjxycf=rs.getDouble(8);
		zqzjxqtf=rs.getDouble(9);
		zhzjxqtf=rs.getDouble(10);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcdd set zqzjhze=ROUND("+zqzjhze+","+jcddblxs+"),zjhze=ROUND("+zjhze+","+jcddblxs+")";
	ls_sql+=" ,zjxcxhdje=ROUND("+zjxcxhdje+","+jcddblxs+"),zjxcbze="+zjxcbze;
	ls_sql+=" ,zqzjxclf="+zqzjxclf+",zhzjxclf="+zhzjxclf+",zqzjxycf="+zqzjxycf+",zhzjxycf="+zhzjxycf+",zqzjxqtf="+zqzjxqtf+",zhzjxqtf="+zhzjxqtf+" ";
	ls_sql+=" where ddbh='"+ddbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,zqje,zhje,cbje,fssj)";
	ls_sql+=" select zjxbh,'4','2',ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,zqzjxze,zjxze,zjxcbze,zjxfssj";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>