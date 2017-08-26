<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] cbjStr=request.getParameterValues("cbj");

String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xh");

if (xh==null)
{
	return;
}


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

	String fjtcbz="";
	ls_sql="select fjtcbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))
	{
		out.println("错误！已审核");
		return ;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		double cbj=0;
		cbj=Double.parseDouble(cbjStr[i]);

		ls_sql="update bj_khzcmx set jsfs='1',cbj=? ";
		ls_sql+=" where xh="+xh[i];
		ls_sql+=" and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.executeUpdate();
		ps.close();
	}

/*
	jcjj.Fjdd fjdd=new jcjj.Fjdd();
	String retStr=fjdd.fj(conn,khbh,yhmc,dwbh);
	if (!retStr.equals(""))
	{
		conn.rollback();
		out.println(retStr);
		return;
	}
*/
	String lrr=yhmc;
	String lrbm=dwbh;
	String retStr="";

		String ssfgs=null;
//		String dwbh=null;
		String sjs=null;
//		String fjtcbz="";
		String sfyckh="";
		String clgw="";
		ls_sql="select ssfgs,zxdm,sjs,fjtcbz,sfyckh,clgw";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ssfgs=rs.getString("ssfgs");
			dwbh=rs.getString("zxdm");
			sjs=rs.getString("sjs");
			fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
			sfyckh=cf.fillNull(rs.getString("sfyckh"));//是否远程客户 
			clgw=cf.fillNull(rs.getString("clgw"));
		}
		rs.close();
		ps.close();

		if (fjtcbz.equals("Y"))
		{
			conn.rollback();
			out.println("错误！已分解");
			return;
		}



		//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
		int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
		int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
		String dxpzcsq=""; 
		ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100),dxpzcsq";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jcddblxs=rs.getInt(1);
			jcddmxblxs=rs.getInt(2);
			dxpzcsq=cf.fillNull(rs.getString("dxpzcsq"));
		}
		rs.close();
		ps.close();

		if (jcddblxs==-100)
		{
			conn.rollback();
			out.println("错误，没有设置『集成订单保留小数位数』，请联系管理员");
			return;
		}

		if (jcddmxblxs==-100)
		{
			conn.rollback();
			out.println("错误，没有设置『集成订单明细保留小数』，请联系管理员");
			return;
		}
		//获取保留小数参数＝＝＝＝＝＝＝＝＝＝＝＝＝结束



		ls_sql="update crm_zxkhxx set fjtcbz='Y'";//M：不需分解；N：等待分解；Y：分解完成
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		//订单分解＋＋＋＋＋＋＋＋＋＋＋开始

		String zcdlbm=null;
		String ppmc=null;
		String gys=null;

		//1：原项目；2：新增；3：删除

		//新增、未分解
		ls_sql="SELECT distinct zcdlbm,ppbm,gys";
		ls_sql+=" FROM bj_khzcmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by zcdlbm,ppbm,gys";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			zcdlbm=rs1.getString("zcdlbm");
			ppmc=rs1.getString("ppbm");
			gys=rs1.getString("gys");



			String sfxcl="N";//是否需测量
			String gysjsfs="";//供应商结算方式  1：非统一比例结算；2：统一比例结算
			String jsjhqsj="";//结算价获取时间  1：录入订单；2：订单确认；3：发送货通知；4：结算
			double fdbl=0;//正常品厂商结算比例
			double cxfdbl=0;//促销品厂商结算比例
			double azfjsbl=0;//安装费结算比例
			double ycfjsbl=0;//远程费结算比例


			String sfycx=null;//是否有阶段比例
			String cxkssj=null;//开始时间
			String cxjzsj=null;//结束时间
			double fdblls=0;//正常品厂商结算比例(阶段)
			double cxfdblls=0;//促销品厂商结算比例(阶段)
			double azfjsblls=0;//安装费结算比例(阶段)
			double ycfjsblls=0;//远程费结算比例(阶段)


			ls_sql="select sfxcl,gysjsfs,jsjhqsj   ,fdbl  ,cxfdbl  ,azfjsbl  ,ycfjsbl ";
			ls_sql+="       ,sfycx,cxkssj,cxjzsj   ,fdblls,cxfdblls,azfjsblls,ycfjsblls";

			ls_sql+=" from jxc_ppgysdzb  ";
			ls_sql+=" where cllx='1' ";//1：主材；2：辅材；3：通用

			ls_sql+=" and ppmc='"+ppmc+"'";
			ls_sql+=" and gysmc='"+gys+"'";
			ls_sql+=" and ssfgs='"+dxpzcsq+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfxcl=cf.fillNull(rs.getString("sfxcl"));
				gysjsfs=cf.fillNull(rs.getString("gysjsfs"));
				jsjhqsj=cf.fillNull(rs.getString("jsjhqsj"));

				fdbl=rs.getDouble("fdbl");
				cxfdbl=rs.getDouble("cxfdbl");
				azfjsbl = rs.getDouble("azfjsbl");			    
				ycfjsbl = rs.getDouble("ycfjsbl");			    

				sfycx=cf.fillNull(rs.getString("sfycx"));
				cxkssj=cf.fillNull(rs.getDate("cxkssj"));
				cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));

				fdblls=rs.getDouble("fdblls");
				cxfdblls=rs.getDouble("cxfdblls");
				azfjsblls=rs.getDouble("azfjsblls");
				ycfjsblls=rs.getDouble("ycfjsblls");
			}
			rs.close();
			ps.close();

			if (gysjsfs.equals(""))
			{
				gysjsfs="1";//供应商结算方式  1：非统一比例结算；2：统一比例结算
			}

			if (jsjhqsj.equals(""))
			{
				jsjhqsj="1";//结算价获取时间  1：录入订单；2：订单确认；3：发送货通知；4：结算
			}

			if (sfycx==null)
			{
				conn.rollback();
				out.println("错误，无品牌供应商对照表:"+ls_sql);
				return;
			}

			//是否有阶段比例，开始时间<=今天，and，结束时间>=今天 
			if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
			{
				fdbl=fdblls;
				cxfdbl=cxfdblls;
				azfjsbl=azfjsblls;
				ycfjsbl=ycfjsblls;
			}


			String scsmc=null;
			ls_sql="select scsmc";
			ls_sql+=" from jxc_ppxx  ";
			ls_sql+=" where ppmc='"+ppmc+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				scsmc = rs.getString("scsmc");			    
			}
			rs.close();
			ps.close();


			String xclbz="1";//产品类型 1：非定制式产品；2：定制式产品
			if (sfxcl.equals("Y"))
			{
				xclbz="2";
			}



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

			String ddlx=null;
			ddlx="1";//1：代销品
			String sfkgsl="Y";//是否可改数量  Y：可以；N：否

			ls_sql="insert into jc_zcdd ( ddbh,khbh,clgw,ztjjgw,xmzy,jjsjs,khjl,ddshbz,kjxsj,htshsj";
			ls_sql+=" ,qhtsj,zcdlbm,zcxlbm,ppbm,gys,ppmc,zczkl,dzyy,xclbz,ddlx ";
			ls_sql+=" ,wdzje,hkze,cbze,htcxhdje,zjxcxhdje,qtycf,sfyyh,yhkssj,yhjzsj,yhnr ";
			ls_sql+=" ,gysjsfs,jsjhqsj,fdbl,khfdbl,tcjrbl,tjpfdbl,tjpkhfdbl,tjptcjrbl,azfjsbl,ycfjsbl ";
			ls_sql+=" ,zjxxh,sfkgsl,fgsbh,qddm,jzsjs,dwbh,lrr,lrsj,bz ";

			ls_sql+=" ,zqclf,zhclf,ycf,qtf,  zqzjxclf,zhzjxclf,zjxycf,zjxqtf,zjxcbze,zqzjhze ";
			ls_sql+=" ,zjhze,sfjs,clzt,sfjrht,jmje,zsje,htyjjrje,zjxzsje,zjxyjjrje,sfck";
			ls_sql+=" ,ycksl,yckje,tbhzt,sskje,shsskje,zcpclf,tjpclf,fjddbz ,sgdje,zjxsgdje) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ";
			ls_sql+=" ,?,?,?,?,?,?,?,?,?,?  ";
			ls_sql+=" ,?,?,?,?,?,?,?,?,?,?";
			ls_sql+=" ,?,?,?,?,?,?,?,?,?,?  "; 
			ls_sql+=" ,?,?,?,?,?,?,?,SYSDATE,? ";

			ls_sql+=" ,0,0,0,0   ,0,0,0,0,0,0";
			ls_sql+=" ,0,'N','07','N',0,0,0,0,0,'1'  "; //1：未出库；2：部分出库；3：已出库
			ls_sql+=" ,0,0,'00',0,0,0,0,'Y',0,0 ) "; //分解订单标志  N：否；Y：是
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
			ps.setString(12,zcdlbm);
			ps.setString(13,"a");
			ps.setString(14,ppmc);
			ps.setString(15,gys);
			ps.setString(16,scsmc);
			ps.setDouble(17,10);
			ps.setString(18,"");
			ps.setString(19,xclbz);
			ps.setString(20,ddlx);

			ps.setDouble(21,0);
			ps.setDouble(22,0);
			ps.setDouble(23,0);
			ps.setDouble(24,0);
			ps.setDouble(25,0);
			ps.setDouble(26,0);
			ps.setString(27,"N");
			ps.setDate(28,null);
			ps.setDate(29,null);
			ps.setString(30,"");

			ps.setString(31,gysjsfs);
			ps.setString(32,jsjhqsj);
			ps.setDouble(33,fdbl);
			ps.setDouble(34,0);
			ps.setDouble(35,100);
			ps.setDouble(36,cxfdbl);
			ps.setDouble(37,0);
			ps.setDouble(38,100);
			ps.setDouble(39,azfjsbl);
			ps.setDouble(40,ycfjsbl);

			ps.setString(41,"");
			ps.setString(42,sfkgsl);
			ps.setString(43,ssfgs);
			ps.setString(44,dwbh);
			ps.setString(45,sjs);
			ps.setString(46,lrbm);
			ps.setString(47,lrr);
			ps.setString(48,"");

			ps.executeUpdate();
			ps.close();




			long sxh=0;
			ls_sql="select NVL(max(xh),0)";
			ls_sql+=" from  jc_zcddmx";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sxh=rs.getLong(1);
			}
			rs.close();
			ps.close();


			String getxh="";
			ls_sql =" select  xh";
			ls_sql+=" from  bj_khzcmx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and ppbm='"+ppmc+"' and gys='"+gys+"' and zcdlbm='"+zcdlbm+"'";
			ls_sql+=" order by xh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				getxh=rs.getString("xh");

				sxh++;

				ls_sql ="insert into jc_zcddmx  (xh,ddbh,khbh,zcbm,xsxh,cltxm,zcmc,zcdlbm,zcxlbm,dwbh,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,cz,jldwbm,dzbjjldw,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,zqdj,dpzk,dj ,tcyhj,dzbjxsj,czpmtcj  ,jsfs,jsbl,cbj    ,jgfs,sl,zqje,je,ycf,qtfy,azf,jgf,qtfyje    ,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy   ,cxhdbz,cxhdbl,cxhdje,zjhcxhdje    ,zcpzwzbm,lx,lrr,lrsj   ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz       ,bzjsbl,cxjsbl,sxh,sftjcp,zdxsj,bzyjjrbl,yjjrbl,htyjjrje,zjhyjjrje,sfzp,zsdj,SGDDJ)"; 
				ls_sql+=" select                 ? ,?   ,?   ,zcbm,xsxh,''   ,zcmc,zcdlbm,zcxlbm,ppbm,gys  ,ppmc,zclbbm,xinghao,gg  ,zcysbm,cz,jldwbm,jldwbm  ,'N'    ,0   ,0 ,0    ,cbj  ,0       ,'N'  ,''    ,''    ,0  ,0    ,0         ,xzjg,zqdj,dpzk,dj ,0    ,0      ,0        ,jsfs,jsbl,cbj    ,jgfs,sl,zqje,je,ycf,qtfy,0  ,0  ,qtfyje    ,sl   ,zqje   ,je   ,ycf   ,qtfyje    ,cxhdbz,cxhdbl,cxhdje,cxhdje       ,zcpzwzbm,'1',? ,SYSDATE,sxbz,sxhtyy,?    ,?   ,?    ,bz       ,jsbl  ,0     ,'' ,'N'   ,0    ,0       ,0     ,0       ,0        ,'N' ,0,0";//xzjg 1:销售限价；2:促销价
				ls_sql+=" from  bj_khzcmx ";
				ls_sql+=" where xh='"+getxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setLong(1,sxh);
				ps2.setString(2,ddbh);
				ps2.setString(3,khbh);
				ps2.setString(4,lrr);
				ps2.setString(5,ssfgs);
				ps2.setString(6,dwbh);
				ps2.setString(7,sjs);
				ps2.executeUpdate();
				ps2.close();


				ls_sql=" update  bj_khzcmx set fjddbh=?,ddmxxh=?";
				ls_sql+=" where xh='"+getxh+"'";
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,ddbh);
				ps2.setLong(2,sxh);
				ps2.executeUpdate();
				ps2.close();
			}
			rs.close();
			ps.close();

			//完成订单＋＋＋＋＋＋＋＋＋＋＋＋＋开始

			//根据结算比例计算结算价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="update jc_zcddmx set sftjp='N'";//N：否；Y：特价品
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and sftjp is null";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			//正价品:设置结算比例
			ls_sql="update jc_zcddmx set jsbl="+fdbl;
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and jsfs='3'";//1：结算价；2：结算比例；3：取供应商结算比例
			ls_sql+=" and sftjp='N'";//N：否；Y：特价品
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
			//特价品:设置结算比例
			ls_sql="update jc_zcddmx set jsbl="+cxfdbl;
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and jsfs='3'";//1：结算价；2：结算比例；3：取供应商结算比例
			ls_sql+=" and sftjp='Y'";//N：否；Y：特价品
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			

			//设置结算价
			ls_sql="update jc_zcddmx set cbj=jsbl/100*dj";
			ls_sql+=" where  ddbh='"+ddbh+"'";
			ls_sql+=" and jsfs in('2','3')";//1：结算价；2：结算比例；3：供应商统一比例
			ls_sql+=" and xzjg not in('4')";//0:手写项目；1:销售限价；2:促销价；3: 市场标价；4: 套餐价
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			
/*

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
			String sxhtsfysh="M";//M：不需审核；Y：手写合同已审核；N：手写合同未审核；S：打折已审核；T：打折未审核

			ls_sql="update jc_zcdd set clzt='09',zczkl='"+zczkl+"',sxhtsfysh='"+sxhtsfysh+"',cbze="+cbze+",wdzje="+wdzje+",hkze=ROUND("+hkze+","+jcddblxs+")-jmje,htcxhdje=ROUND("+cxhdje+","+jcddblxs+")";
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


			
			//完成订单＋＋＋＋＋＋＋＋＋＋＋＋＋开始
*/
		}
		rs1.close();
		ps1.close();

/*
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
		ls_sql+=" and jc_zcdd.fjddbz='Y'";//分解订单标志  N：否；Y：是
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


		ls_sql="update crm_khqye set zchtje=?,zchtcb=?,zczxje=?,zczxcb=?,zchtml=?,zczxml=?,khhtml=?,khzxml=?";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,zczxje);
		ps.setDouble(2,zczxcb);
		ps.setDouble(3,zczxje);
		ps.setDouble(4,zczxcb);
		ps.setDouble(5,zczxml);
		ps.setDouble(6,zczxml);
		ps.setDouble(7,khzxml);
		ps.setDouble(8,khzxml);
		ps.executeUpdate();
		ps.close();
		
		//主材毛利计算＝＝＝＝＝＝＝＝＝＝＝＝＝结束
*/
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
			if (rs2!= null) rs2.close(); 
			if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>