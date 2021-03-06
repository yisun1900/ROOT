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
PreparedStatement ps1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String fgsbh=null;
	ls_sql =" select khbh,clzt,fgsbh";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
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


	String sxhtsfysh=null;//M：非手写合同；Y：已审核；N：未审核
	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zczjxmx";
	ls_sql+=" where zjxbh='"+zjxbh+"' "; 
    ls_sql+=" and jc_zczjxmx.lx='2' and jc_zczjxmx.sxbz='2'";//1：非手写；2：手写
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
		sxhtsfysh="N";
	}
	else{
		sxhtsfysh="M";
	}


	count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zczjxmx";
	ls_sql+=" where zjxbh='"+zjxbh+"' and zjsl=0";
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
		out.println("<BR>错误，有的单品未录增减数量");
		return;
	}

	String xinghao=null;
	double zdxsj=0;
	double dj=0;
	count=0;
	ls_sql =" select jc_zcddmx.xinghao,jc_zcddmx.zdxsj,jc_zcddmx.dj";
	ls_sql+=" from jc_zczjxmx,jc_zcddmx";
	ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh";
	ls_sql+=" and jc_zcddmx.ddbh='"+ddbh+"'";
	ls_sql+=" and jc_zczjxmx.zjxbh='"+zjxbh+"'";
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
	String getxh=null;
	ls_sql =" select xh ";
	ls_sql+=" from jc_zczjxmx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ls_sql+=" and lx='2'";//1：已有项目；2：新增项目
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getxh=rs.getString("xh");

		ls_sql="update jc_zcddmx set cbj=jsbl/100*dj";
		ls_sql+=" where  ddbh='"+ddbh+"' and xh="+getxh;
		ls_sql+=" and jsfs='2'";//1：结算价；2：结算比例
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//对小数位处理
	ls_sql="update jc_zczjxmx ";
	ls_sql+=" set zjje=ROUND(zjje,"+jcddmxblxs+")";
	ls_sql+=" ,zjycf=ROUND(zjycf,"+jcddmxblxs+")";
	ls_sql+=" ,zjqtfy=ROUND(zjqtfy,"+jcddmxblxs+")";
	ls_sql+=" ,zjcxhdje=ROUND(zjcxhdje,"+jcddmxblxs+")";
	ls_sql+=",zjcbje=jc_zczjxmx.zjsl*(select jc_zcddmx.cbj from jc_zcddmx where jc_zcddmx.xh=jc_zczjxmx.xh)";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材增减项（jc_zczjx）:增减项总额
	double zqzjxze=0;
	double zhzjxze=0;
	double zjxcxhdje=0;
	double zjxcbze=0;
	double zqzjxclf=0;
	double zhzjxclf=0;
	double zjxycf=0;
	double zjxqtf=0;
	double zjxyjjrje=0;
	ls_sql="select sum(zqzjje+zjycf+zjqtfy),sum(zjje+zjycf+zjqtfy),sum(zjcxhdje),sum(zjcbje),sum(zqzjje),sum(zjje),sum(zjycf),sum(zjqtfy),sum(zjyjjrje) ";
	ls_sql+=" from jc_zczjxmx ";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqzjxze=rs.getDouble(1);
		zhzjxze=rs.getDouble(2);
		zjxcxhdje=rs.getDouble(3);
		zjxcbze=rs.getDouble(4);
		zqzjxclf=rs.getDouble(5);
		zhzjxclf=rs.getDouble(6);
		zjxycf=rs.getDouble(7);
		zjxqtf=rs.getDouble(8);
		zjxyjjrje=rs.getDouble(9);
	}
	rs.close();
	ps.close();

	double zsje=0;
	ls_sql="select sum(jc_zcddmx.zsdj*jc_zczjxmx.zjsl)";
	ls_sql+=" from jc_zczjxmx,jc_zcddmx ";
	ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
	ls_sql+=" and jc_zcddmx.sfzp='Y' ";//Y：赠品；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double zjxzkl=0;
	if (zqzjxclf==0)
	{
		zjxzkl=0;
	}
	else{
		zjxzkl=zhzjxclf*10/zqzjxclf;
	}

	ls_sql="update jc_zczjx set zjxzkl="+zjxzkl+",zqzjxze="+zqzjxze+",zjxze=ROUND("+zhzjxze+","+jcddblxs+") ";
	ls_sql+=" ,zjxcxhdje=ROUND("+zjxcxhdje+","+jcddblxs+"),zjxcbze="+zjxcbze+",clzt='01',sxhtsfysh='"+sxhtsfysh+"'";
	ls_sql+=" ,zqzjxclf="+zqzjxclf+",zhzjxclf="+zhzjxclf+",zjxycf="+zjxycf+",zjxqtf="+zjxqtf+",zsje="+zsje+",zjxyjjrje="+zjxyjjrje;
	ls_sql+=" where zjxbh='"+zjxbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcddmx";
	ls_sql+=" set zjhsl=sl+NVL((select sum(zjsl) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zqzjhje=zqje+NVL((select sum(zqzjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhje=je+NVL((select sum(zjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhycf=ycf+NVL((select sum(zjycf) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhqtfy=qtfyje+NVL((select sum(zjqtfy) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhcxhdje=cxhdje+NVL((select sum(zjcxhdje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0)";
	ls_sql+=" ,zjhyjjrje=htyjjrje+round(yjjrbl/100*NVL((select sum(zjje) from jc_zczjxmx,jc_zczjx where jc_zczjxmx.zjxbh=jc_zczjx.zjxbh and jc_zczjx.clzt not in('00','99')  and jc_zczjx.ddbh='"+ddbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh),0),2)";
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
	String getzcmc;
	String getxinghao;
	double getzjhycf=0;
	double getzjhqtfy=0;
	ls_sql="select zcmc,xinghao,zjhycf,zjhqtfy";
	ls_sql+=" from jc_zcddmx ";
	ls_sql+=" where ddbh='"+ddbh+"' and zjhsl=0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzcmc=rs.getString("zcmc");
		getxinghao=rs.getString("xinghao");
		getzjhycf=rs.getDouble("zjhycf");
		getzjhqtfy=rs.getDouble("zjhqtfy");

		if (getzjhycf!=0)
		{
			conn.rollback();
			out.println("错误！【"+getzcmc+"】型号【"+getxinghao+"】数量已减为0，可是【增减后远程费:"+getzjhycf+"】不为0");
			return;
		}
		if (getzjhqtfy!=0)
		{
			conn.rollback();
			out.println("错误！【"+getzcmc+"】型号【"+getxinghao+"】数量已减为0，可是【增减后其它费用:"+getzjhqtfy+"】不为0");
			return;
		}
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcddmx ";
	ls_sql+=" set zqzjhje=0,zjhje=0,zjhycf=0,zjhqtfy=0,zjhcxhdje=0,zjhyjjrje=0";
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
	zhzjxclf=0;
	zjxycf=0;
	zjxqtf=0;
	zsje=0;
	zjxyjjrje=0;
	ls_sql="select sum(zqzjxze),sum(zjxze),sum(zjxcbze),sum(zjxcxhdje)   ,sum(zqzjxclf),sum(zhzjxclf),sum(zjxycf),sum(zjxqtf),sum(zsje),sum(zjxyjjrje)";
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
		zjxycf=rs.getDouble(7);
		zjxqtf=rs.getDouble(8);
		zsje=rs.getDouble(9);
		zjxyjjrje=rs.getDouble(10);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcdd set zqzjhze="+zqzjhze+",zjhze=ROUND("+zjhze+","+jcddblxs+")";
	ls_sql+=" ,zjxcxhdje=ROUND("+zjxcxhdje+","+jcddblxs+"),zjxcbze="+zjxcbze;
	ls_sql+=" ,zqzjxclf="+zqzjxclf+",zhzjxclf="+zhzjxclf+",zjxycf="+zjxycf+",zjxqtf="+zjxqtf+",zjxzsje="+zsje+",zjxyjjrje="+zjxyjjrje ;
	ls_sql+=" where ddbh='"+ddbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc,zqje,zhje,cbje,fssj)";
	ls_sql+=" select zjxbh,'4','2',ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm,'',ppbm,gys,ppmc,zqzjxze,zjxze,zjxcbze,zjxfssj";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
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
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
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