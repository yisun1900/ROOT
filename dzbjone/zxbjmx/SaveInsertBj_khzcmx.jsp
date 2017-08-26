<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");
String dxpzcsq=request.getParameter("dxpzcsq");
String dqbm=request.getParameter("dqbm");

String[] jgwzbm=request.getParameterValues("jgwzbm");
String[] zcbm=request.getParameterValues("zcbm");
String[] slstr=request.getParameterValues("sl");
String[] djstr=request.getParameterValues("dj");
String[] ycfstr=request.getParameterValues("ycf");
String[] qtfy=request.getParameterValues("qtfy");
String[] qtfyjestr=request.getParameterValues("qtfyje");


double sl=0;
double dj=0;
double ycf=0;
double qtfyje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}


	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_khzcmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	xh++;

	conn.setAutoCommit(false);

	int count=0;
	for (int i=0;i<zcbm.length ;i++ )
	{
		if (zcbm[i].equals(""))
		{
			continue;
		}

		if (jgwzbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[结构位置]为空");
			return;
		}

		sl=0;
		try{
			sl=java.lang.Double.parseDouble(slstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！[数量]输入不正确:"+slstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！[单价]输入不正确:"+djstr[i].trim());
			return;
		}

		ycf=0;
		if (!ycfstr[i].trim().equals(""))
		{
			try{
				ycf=java.lang.Double.parseDouble(ycfstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>存盘失败！[远程费]输入不正确:"+ycfstr[i].trim());
				return;
			}
		}

		qtfyje=0;
		if (!qtfyjestr[i].trim().equals(""))
		{
			try{
				qtfyje=java.lang.Double.parseDouble(qtfyjestr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>存盘失败！[其它费]输入不正确:"+qtfyjestr[i].trim());
				return;
			}
		}


		if (qtfyje!=0 && qtfy[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[其它费项目]未选择");
			return;
		}


		ls_sql="select count(*)";
		ls_sql+=" from  bj_khzcmx";
		ls_sql+=" where khbh='"+khbh+"' and zcpzwzbm='"+cf.GB2Uni(jgwzbm[i])+"' and zcbm='"+zcbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("<BR>提醒！【"+cf.GB2Uni(jgwzbm[i])+"】内该种主材【"+zcbm[i]+"】已被选择，被忽略");
			continue;
		}

		String sfycx=null;
		String cxkssj=null;
		String cxjzsj=null;
		String sfyh=null;
		String cxhdbz="N";//Y：参加；N：不参加
		String getppmc=null;
		String getgysmc=null;
		String getscsmc=null;
		String jsfs="";
		double cxj=0;
		double xsj=0;
		double cbj=0;
		double jsbl=0;
		double cxcbj=0;
		double cxjsbl=0;

		double cxhdbl=0;
		double lscxhdbl=0;
		double yjjrbl=0;
		double cxyjjrbl=0;

		double zdxsj=0;
		String xinghao="";

		ls_sql="select sfycx,cxkssj,cxjzsj,sfyh,ppmc,gysmc,scsmc,jsfs";
		ls_sql+=" ,jxc_cljgb.cxj,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl";
		ls_sql+=" ,cxhdbl,lscxhdbl,yjjrbl,cxyjjrbl,jxc_cljgb.zdxsj,xh";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
		ls_sql+=" and jxc_clbm.clbm='"+zcbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
//		ls_sql+=" and jxc_clbm.clbm='"+zcbm[i]+"' and jxc_cljgb.ssfgs='"+dxpzcsq+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfycx=cf.fillNull(rs.getString("sfycx"));
			cxkssj=cf.fillNull(rs.getDate("cxkssj"));
			cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
			sfyh=cf.fillNull(rs.getString("sfyh"));
			getppmc=cf.fillNull(rs.getString("ppmc"));
			getgysmc=cf.fillNull(rs.getString("gysmc"));
			getscsmc=cf.fillNull(rs.getString("scsmc"));
			jsfs=cf.fillNull(rs.getString("jsfs"));

			cxj=rs.getDouble("cxj");
			xsj=rs.getDouble("xsj");
			cbj=rs.getDouble("cbj");
			jsbl=rs.getDouble("jsbl");
			cxcbj=rs.getDouble("cxcbj");
			cxjsbl=rs.getDouble("cxjsbl");

			cxhdbl=rs.getDouble("cxhdbl");
			lscxhdbl=rs.getDouble("lscxhdbl");
			yjjrbl=rs.getDouble("yjjrbl");
			cxyjjrbl=rs.getDouble("cxyjjrbl");
			zdxsj=rs.getDouble("zdxsj");
			xinghao=cf.fillNull(rs.getString("xh"));
		}
		else{
			conn.rollback();
			out.println("错误！该种主材【"+zcbm[i]+"】不存在");
			return;
		}
		rs.close();
		ps.close();

//		out.println(ls_sql);



		if (!sfyh.equals("Y"))
		{
			conn.rollback();
			out.println("错误！该种主材【"+zcbm[i]+"】无货");
			return;
		}

		if (dj<zdxsj)
		{
			conn.rollback();
			out.println("错误！该种主材【"+zcbm[i]+"】小于最低销售价『"+zdxsj+"』");
			return;
		}


		double zqje=0;
		double je=0;
		double cxhdje=0;
		double yjjrje=0;
		String xzjg="";
		double zqdj=0;

		//有促销，促销开始时间<=今天，and，促销结束时间>=今天，dj选择cxj
		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
		{
			zqdj=cxj;
			cbj=cxcbj;
			jsbl=cxjsbl;
			cxhdbl=lscxhdbl;
			yjjrbl=cxyjjrbl;

			if (cxhdbl>0)
			{
				cxhdbz="Y";
			}
			else{
				cxhdbz="N";
			}

			xzjg="1";

			zqje=cf.round(zqdj*sl,2);
			je=cf.round(dj*sl,2);
			cxhdje=cf.round(je*cxhdbl/100,2);
			yjjrje=cf.round(je*yjjrbl/100,2);

		}
		else//无促销
		{
			//dj=销售限价
			zqdj=xsj;
			cbj=cbj;
			jsbl=jsbl;
			cxhdbl=cxhdbl;
			yjjrbl=yjjrbl;

			if (cxhdbl>0)
			{
				cxhdbz="Y";
			}
			else{
				cxhdbz="N";
			}

			xzjg="2";

			zqje=cf.round(zqdj*sl,2);
			je=cf.round(dj*sl,2);
			cxhdje=cf.round(je*cxhdbl/100,2);
			yjjrje=cf.round(je*yjjrbl/100,2);

		}

		if (jsfs.equals("2"))//1：结算价；2：结算比例；3：供应商统一比例
		{
			cbj=cf.round(dj*jsbl/100,2);
		}

		double dpzk=10;
		if (zqdj!=0)
		{
			dpzk=cf.round(dj*10/zqdj,2);
		}

		if (dj<cbj)
		{
			conn.rollback();
			out.println("型号["+xinghao+"]错误！单价不能小于成本价");
			return;
		}

		ls_sql ="insert into bj_khzcmx (xh,fjddbh,khbh,zcbm         ,zcmc         ,zcdlbm         ,zcxlbm         ,ppbm         ,gys            ,ppmc          ,zclbbm         ,xinghao    ,gg               ,zcysbm         ,jldwbm         ,jsfs,cbj,jsbl,zdxsj,xzjg,zqdj,dpzk,dj,sl,zqje,je,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,zcpzwzbm,ycf,qtfy,qtfyje,sfzp,zsdj,sxbz,sftjp,lrr,lrsj) ";
		ls_sql+=" select                ? ,?     ,?   ,jxc_clbm.clbm,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.gysmc,jxc_clbm.scsmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg      ,jxc_clbm.clysbm,jxc_clbm.jldwbm,jsfs,?  ,?   ,?    ,?   ,?   ,?   ,? ,? ,?   ,? ,?     ,?     ,?     ,?     ,?     ,?       ,?  ,?   ,?     ,'N' ,0   ,'1' ,sftjp,?  ,SYSDATE";//xzjg 1:销售限价；2:促销价
		ls_sql+=" FROM jxc_clbm,jxc_cljgb";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
		ls_sql+=" and jxc_clbm.clbm='"+zcbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
//		ls_sql+=" and jxc_clbm.clbm='"+zcbm[i]+"' and jxc_cljgb.ssfgs='"+dxpzcsq+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,(xh+i));
		ps.setString(2,"");
		ps.setString(3,khbh);

		ps.setDouble(4,cbj);
		ps.setDouble(5,jsbl);
		ps.setDouble(6,zdxsj);
		ps.setString(7,xzjg);
		ps.setDouble(8,zqdj);
		ps.setDouble(9,dpzk);
		ps.setDouble(10,dj);
		ps.setDouble(11,sl);
		ps.setDouble(12,zqje);
		ps.setDouble(13,je);

		ps.setString(14,cxhdbz);
		ps.setDouble(15,cxhdbl);
		ps.setDouble(16,cxhdje);
		ps.setDouble(17,yjjrbl);
		ps.setDouble(18,yjjrje);
		ps.setString(19,cf.GB2Uni(jgwzbm[i]));
		ps.setDouble(20,ycf);
		ps.setString(21,qtfy[i]);
		ps.setDouble(22,qtfyje);
		ps.setString(23,yhmc);
		ps.executeUpdate();
		ps.close();

	}

	
	conn.commit();


	response.sendRedirect("EditBj_khzcmxAll.jsp?khbh="+khbh+"&bc=1");
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