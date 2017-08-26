<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String fgsbh=null;
	String sfkgsl="";//是否可改数量  Y：可以；N：否
	String zcdlbm="";
	ls_sql =" select khbh,clzt,fgsbh,sfkgsl,zcdlbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
		sfkgsl=cf.fillNull(rs.getString("sfkgsl"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("07"))
	{
		out.println("<BR>错误，存盘失败！合同已完成");
		return;
	}

	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
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
	//获取保留小数参数＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	String sxhtsfysh=null;//M：非手写合同；Y：已审核；N：未审核
	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"' and sxbz='2'";//1：非手写；2：手写
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		sxhtsfysh="N";//M：不需审核；Y：手写合同已审核；N：手写合同未审核；S：打折已审核；T：打折未审核
	}
	else{
		sxhtsfysh="M";
	}

	if (sfkgsl.equals("Y") && zcdlbm.equals("过门石"))//是否可改数量 Y：可以；N：否
	{
		sxhtsfysh="N";
	}

	count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"' and sl=0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>错误，有的单品未录订货数量");
		return;
	}

	String xinghao=null;
	double zdxsj=0;
	double dj=0;
	count=0;
	ls_sql =" select xinghao,zdxsj,dj";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xinghao=rs.getString("xinghao");
		zdxsj=rs.getDouble("zdxsj");
		dj=rs.getDouble("dj");

		if (zdxsj>dj)
		{
			out.println("<BR>错误！【型号:"+xinghao+"】的【单价:"+dj+"】小于【最低销售限价:"+zdxsj+"】");
			count++;
		}

	}
	rs.close();
	ps.close();

	if (count>0)
	{
		return;
	}

	conn.setAutoCommit(false);

	//根据结算比例计算结算价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update jc_zcddmx set cbj=jsbl/100*dj";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ls_sql+=" and jsfs='2'";//1：结算价；2：结算比例
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//对小数位处理＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update jc_zcddmx set je=ROUND(je,"+jcddmxblxs+"),ycf=ROUND(ycf,"+jcddmxblxs+"),qtfyje=ROUND(qtfyje,"+jcddmxblxs+")";
	ls_sql+=" ,zjhje=ROUND(zjhje,"+jcddmxblxs+"),zjhycf=ROUND(zjhycf,"+jcddmxblxs+"),zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
	ls_sql+=" ,cxhdje=ROUND( cxhdje,"+jcddmxblxs+"),zjhcxhdje=ROUND( zjhcxhdje,"+jcddmxblxs+")";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//对小数位处理－－－－－－－－－－－－－－－结束


	double wdzje=0;
	double hkze=0;
	double cxhdje=0;
	double zqclf=0;
	double zhclf=0;
	double ycf=0;
	double qtf=0;
	double zsje=0;
	double htyjjrje=0;
	ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(zqje),sum(je),sum(ycf),sum(qtfyje),sum(zsdj*sl),sum(htyjjrje)";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzje=rs.getDouble(1);
		hkze=rs.getDouble(2);
		cxhdje=rs.getDouble(3);
		zqclf=rs.getDouble(4);
		zhclf=rs.getDouble(5);
		ycf=rs.getDouble(6);
		qtf=rs.getDouble(7);
		zsje=rs.getDouble(8);
		htyjjrje=rs.getDouble(9);
	}
	rs.close();
	ps.close();

	double cbze=0;
	ls_sql =" select sum(cbj*sl) ";
	ls_sql+=" from jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cbze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	
	double zczkl=10;
	if (zqclf==0)
	{
		zczkl=10;
	}
	else{
		zczkl=zhclf*10/zqclf;
	}

	//打折审核
	if (sxhtsfysh.equals("M"))
	{
		if (zczkl<10)
		{
			sxhtsfysh="T";//M：不需审核；Y：手写合同已审核；N：手写合同未审核；S：打折已审核；T：打折未审核
		}
	}

	ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='"+sxhtsfysh+"',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
	ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf+",zsje="+zsje+",htyjjrje="+htyjjrje;
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='07'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,zqje,zhje,cbje,fssj)";
	ls_sql+=" select ddbh,'4','1',ddbh,khbh,fgsbh,qddm,jzsjs,khjl,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,wdzje,hkze,cbze,qhtsj";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材毛利计算＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double zxmle=0;
	double zxhtjz=0;
	ls_sql="SELECT zxmle,zxhtjz";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zxmle=rs.getDouble(1);//最新毛利额
		zxhtjz=rs.getInt(2);//最新合同净值
	}
	rs.close();
	ps.close();

	
	double zczxje=0;
	double zczxcb=0;
	ls_sql="SELECT sum(hkze+zjhze),sum(cbze+ycf+qtf+zjxcbze+zjxycf+zjxqtf)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zczxje=rs.getDouble(1);//主材销售额
		zczxcb=rs.getInt(2);//主材成本额
	}
	rs.close();
	ps.close();

	double sfje=0;
	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx in('8','4')";//8：公司购主材税金
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	zczxje=cf.round(zczxje+sfje,2);

	double zczxml=0;//主材最新毛利
	if (zczxje!=0)
	{
		zczxml=cf.round((zczxje-zczxcb)*100/zczxje,2);
	}

	double khzxml=0;//客户最新毛利
	if ((zczxje+zxhtjz)!=0)
	{
		khzxml=cf.round((zczxje-zczxcb+zxmle)*100/(zczxje+zxhtjz),2);
	}

	ls_sql="update crm_khqye set zczxje=?,zczxcb=?,zczxml=?,khzxml=?";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zczxje);
	ps.setDouble(2,zczxcb);
	ps.setDouble(3,zczxml);
	ps.setDouble(4,khzxml);
	ps.executeUpdate();
	ps.close();
	
	//主材毛利计算＝＝＝＝＝＝＝＝＝＝＝＝＝结束
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>