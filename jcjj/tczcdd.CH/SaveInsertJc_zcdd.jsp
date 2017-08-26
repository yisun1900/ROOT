<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String ssfgs=null;
	String dwbh=null;
	String sjs=null;
	String fjtcbz="";
	String sfyckh="";
	ls_sql="select fgsbh,dwbh,sjs,fjtcbz,sfyckh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
		dwbh=rs.getString("dwbh");
		sjs=rs.getString("sjs");
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
		sfyckh=cf.fillNull(rs.getString("sfyckh"));//是否远程客户 
	}
	rs.close();
	ps.close();


	String clgw="";
	ls_sql="select clgw";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clgw=cf.fillNull(rs.getString("clgw"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))
	{
		out.println("错误！已分解订单");
		return;
	}

	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
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


	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set fjtcbz='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//套餐订单分解＋＋＋＋＋＋＋＋＋＋＋开始
	String xmdlbm=null;
	String xmdlmc=null;
	String xmxlbm=null;
	String xmxlmc=null;

	ls_sql="SELECT distinct bj_bjxmmx.xmdlbm,bdm_xmdlbm.xmdlmc,bj_bjxmmx.xmxlbm,bdm_xmxlbm.xmxlmc";
	ls_sql+=" FROM bj_bjxmmx,bdm_xmdlbm,bdm_xmxlbm ";
    ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmflbm='07'";//主材类
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm(+)  ";
	ls_sql+=" and bj_bjxmmx.xmxlbm=bdm_xmxlbm.xmxlbm(+)  ";
	ls_sql+=" order by bj_bjxmmx.xmdlbm,bj_bjxmmx.xmxlbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmdlbm=rs1.getString("xmdlbm");
		xmdlmc=rs1.getString("xmdlmc");
		xmxlbm=rs1.getString("xmxlbm");
		xmxlmc=rs1.getString("xmxlmc");

		String ddlx=null;
		ddlx="5";//5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材

		String ppbm=xmxlmc;
		String ppmc=xmxlmc;
		String gysmc="整装";

		double tcycf=0;//套餐远程费
		String sfxcl="N";//是否需测量
		String sfkgtcsl="N";//是否可改数量

		double qtycf=0;

		String sfkgsl=sfkgtcsl;//是否可改数量
		String xclbz="1";//产品类型 1：非定制式产品；2：定制式产品


		String cldlmc=xmdlmc;


		String ddbh=null;
		int count=0;
		ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ddbh=khbh+cf.addZero(count+1,2);

		ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
		ls_sql+=" ,qhtsj,jhtzshsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz ";
		ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,sfyyh,yhkssj,yhjzsj,yhnr,fgsbh ";
		ls_sql+=" ,qddm,jzsjs,dwbh,lrr,lrsj,bz,sfkgsl,qtycf ";
		ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf ";
		ls_sql+=" ,zjxcbze,zqzjhze,zjhze,sfjs,clzt,ddlx,sfjrht,jmje,ZSJE,ZJXZSJE,sfck )";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?,?,?,?,?";
		ls_sql+=" ,?,?,?,?,SYSDATE,?,?,?    ";
		ls_sql+=" ,0,0,0,0   ,0,0,0,0   ,0,0,0,'N','07',?,'N',0,0,0,'1') ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,khbh);
		ps.setString(3,clgw);
		ps.setString(4,"");
		ps.setString(5,"");
		ps.setString(6,"");
		ps.setString(7,"");
		ps.setString(8,"");
		ps.setDate(9,null);
		ps.setDate(10,null);

		ps.setDate(11,cf.getDate());
		ps.setDate(12,null);
		ps.setString(13,cldlmc);
		ps.setString(14,"a");
		ps.setString(15,ppbm);
		ps.setString(16,gysmc);
		ps.setString(17,ppmc);
		ps.setDouble(18,10);
		ps.setString(19,"");
		ps.setString(20,xclbz);

		ps.setDouble(21,0);
		ps.setDouble(22,0);
		ps.setDouble(23,0);
		ps.setDouble(24,0);
		ps.setDouble(25,0);
		ps.setString(26,"N");
		ps.setDate(27,null);
		ps.setDate(28,null);
		ps.setString(29,"");
		ps.setString(30,ssfgs);

		ps.setString(31,dwbh);
		ps.setString(32,sjs);
		ps.setString(33,lrbm);
		ps.setString(34,yhmc);
		ps.setString(35,"");
		ps.setString(36,sfkgsl);
		ps.setDouble(37,qtycf);
		ps.setString(38,ddlx);

		ps.executeUpdate();
		ps.close();

		long xh=0;
		ls_sql="select NVL(max(xh),0)";
		ls_sql+=" from  jc_zcddmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();
		xh++;


		ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,zcmc,zcdlbm           ,zcxlbm           ,dwbh,gys,ppmc,zclbbm,xinghao            ,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj,cbj,sl              ,je,ycf,qtfy,qtfyje,zjhsl            ,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm         ,cxhdbz,cxhdbl,cxhdje,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz             ,bzjsbl,cxjsbl,jsfs,jsbl,zclx,ddcljjfs,sxh,zjhcxhdje,sftjcp,zqdj,dpzk,zqje,zqzjhje,bjjbbm)"; 
		ls_sql+=" select           ?+rownum,?   ,?   ,xmbh,xmmc,xmdlmc,xmxlmc,?   ,?  ,?   ,''    ,gycl     ,''  ,''    ,jldwmc,'N'    ,0   ,0 ,0    ,0    ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,'1' ,0 ,0  ,sum(sl),0 ,0  ,0   ,0     ,sum(sl) ,0    ,0     ,0        ,jgwzbm  ,'N'   ,0     ,0     ,'1',? ,SYSDATE,'1',''     ,?    ,?   ,?    ,bz   ,0     ,0     ,'1' ,0   ,'1' ,''      ,0  ,0        ,'N'   ,0   ,10  ,0   ,0      ,''";//xzjg 1:销售限价；2:促销价
		ls_sql+=" FROM (";
		
		
		ls_sql+=" select                              bj_bjxmmx.xmbh,xmmc,bdm_xmdlbm.xmdlmc,bdm_xmxlbm.xmxlmc,                     bj_bjxmmx.gycl                 ,jldwmc                                                                                          ,sum(bj_gclmx.sl) sl,bj_gclmx.jgwzbm,bj_bjxmmx.bz ";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm,bdm_xmxlbm,jdm_jldwbm ";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm='"+xmdlbm+"'";
		ls_sql+=" and bj_bjxmmx.xmxlbm='"+xmxlbm+"'";
		ls_sql+=" and bj_bjxmmx.xmflbm='07'";//主材类
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm(+)  ";
		ls_sql+=" and bj_bjxmmx.xmxlbm=bdm_xmxlbm.xmxlbm(+)  ";
		ls_sql+=" and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+) ";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" group by bj_bjxmmx.xmbh,xmmc,bdm_xmdlbm.xmdlmc,bdm_xmxlbm.xmxlmc,jldwmc,bj_gclmx.jgwzbm,bj_bjxmmx.gycl,bj_bjxmmx.bz";
		
		ls_sql+=" )";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,ddbh);
		ps.setString(3,khbh);

		ps.setString(4,ppbm);
		ps.setString(5,gysmc);
		ps.setString(6,ppmc);

		ps.setString(7,yhmc);
		ps.setString(8,ssfgs);
		ps.setString(9,dwbh);
		ps.setString(10,sjs);
		ps.executeUpdate();
		ps.close();




		//对小数位处理＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql="update jc_zcddmx set je=ROUND(je,"+jcddmxblxs+"),ycf=ROUND(ycf,"+jcddmxblxs+"),qtfyje=ROUND(qtfyje,"+jcddmxblxs+")";
		ls_sql+=" ,zjhje=ROUND(zjhje,"+jcddmxblxs+"),zjhycf=ROUND(zjhycf,"+jcddmxblxs+"),zjhqtfy=ROUND(zjhqtfy,"+jcddmxblxs+")";
		ls_sql+=" ,cxhdje=ROUND( cxhdje,"+jcddmxblxs+"),zjhcxhdje=ROUND( zjhcxhdje,"+jcddmxblxs+"),sxbz='1'";//1：非手写；2：手写
		ls_sql+=" where  ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//对小数位处理－－－－－－－－－－－－－－－结束

		double wdzje=0;
		double hkze=0;
		double cxhdje=0;
		double cbze=0;
		double zqclf=0;
		double zhclf=0;
		double ycf=0;
		double qtf=0;
		ls_sql =" select sum(zqje+ycf+qtfyje),sum(je+ycf+qtfyje),sum(cxhdje),sum(cbj*sl),sum(zqje),sum(je),sum(ycf),sum(qtfyje)";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wdzje=rs.getDouble(1);
			hkze=rs.getDouble(2);
			cxhdje=rs.getDouble(3);
			cbze=rs.getDouble(4);
			zqclf=rs.getDouble(5);
			zhclf=rs.getDouble(6);
			ycf=rs.getDouble(7);
			qtf=rs.getDouble(8);
		}
		rs.close();
		ps.close();

		double zczkl=10;

		ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='M',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+"),htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
		ls_sql+=" ,zqclf="+zqclf+",zhclf="+zhclf+",ycf=qtycf+"+ycf+",qtf="+qtf;
		ls_sql+=" where  ddbh='"+ddbh+"'";
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
	}
	rs1.close();
	ps1.close();
	//套餐订单分解＝＝＝＝＝＝＝＝＝＝＝结束



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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>