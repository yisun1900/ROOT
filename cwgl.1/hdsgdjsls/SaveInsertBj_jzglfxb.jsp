<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String gdjsjlh=request.getParameter("gdjsjlh");

String[] glbxh=request.getParameterValues("glbxh");
String[] glflbm=request.getParameterValues("glflbm");
String[] glmc=request.getParameterValues("glmc");
String[] jldwbm=request.getParameterValues("jldwbm");
String[] xhlstr=request.getParameterValues("xhl");
String[] djstr=request.getParameterValues("dj");
String[] pp=request.getParameterValues("pp");
String[] xhgg=request.getParameterValues("xhgg");
String[] wlbm=request.getParameterValues("wlbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double dj=0;
double xhl=0;
int count=0;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	int mark=0;


	for (int i=0;i<glflbm.length ;i++ )
	{
		//未录信息
		if (glflbm[i].equals(""))
		{
			continue;
		}

		mark++;


		//[工料名称]是否为空
		if (glmc[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[工料名称]为空");
			return;
		}
		//[计量单位]是否为空
		if (jldwbm[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[计量单位]为空");
			return;
		}
		//[消耗量]是否为空
		if (xhlstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[消耗量]为空");
			return;
		}
		//[单价]是否为空
		if (djstr[i].equals(""))
		{
			conn.rollback();
			out.println("<BR>存盘失败！[单价]为空");
			return;
		}

		xhl=0;
		try{
			xhl=java.lang.Double.parseDouble(xhlstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！工料名称为["+cf.GB2Uni(glmc[i])+"]的[单价]输入不正确:"+xhlstr[i].trim());
			return;
		}

		dj=0;
		try{
			dj=java.lang.Double.parseDouble(djstr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>存盘失败！工料名称为["+cf.GB2Uni(glmc[i])+"]的[单价]输入不正确:"+djstr[i].trim());
			return;
		}
		
		if (glflbm[i].equals("1"))//1:材料费
		{
			//[物料编码]是否为空
			if (wlbm[i].equals(""))
			{
				conn.rollback();
				out.println("<BR>存盘失败！[结算材料编码]为空");
				return;
			}

			String getglmc="";
			String getpp="";
			String getxhgg="";
			String getjldwbm="";
			double getdj=0;
			ls_sql="select glmc,pp,xhgg,jldwbm,dj";
			ls_sql+=" from  bj_jscljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and wlbm='"+cf.GB2Uni(wlbm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getglmc=cf.fillNull(rs.getString("glmc"));
				getpp=cf.fillNull(rs.getString("pp"));
				getxhgg=cf.fillNull(rs.getString("xhgg"));
				getjldwbm=cf.fillNull(rs.getString("jldwbm"));
				getdj=rs.getDouble("dj");

				if (!getglmc.equals(cf.GB2Uni(glmc[i])) || !getpp.equals(cf.GB2Uni(pp[i])) || !getxhgg.equals(cf.GB2Uni(xhgg[i])) || !getjldwbm.equals(cf.GB2Uni(jldwbm[i])) || getdj!=dj)
				{
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<BR>结算材料编码["+cf.GB2Uni(wlbm[i])+"]存盘失败！录入值与标准的[工料名称、品牌、型号规格、计量单位、单价]不一致");
					return;
				}
			}
			else{
				rs.close();
				ps.close();

				conn.rollback();
				out.println("<BR>存盘失败！结算材料编码["+cf.GB2Uni(wlbm[i])+"]不存在");
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			//[物料编码]是否为空
			if (!wlbm[i].equals("") )
			{
				conn.rollback();
				out.println("<BR>存盘失败！非[材料类]，不能录入[结算材料编码]");
				return;
			}
		}

		int newglbxh=0;

		if (glbxh[i].equals(""))
		{
			ls_sql="select NVL(max(TO_NUMBER(glbxh)),0)";
			ls_sql+=" from  bj_khglfxb";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				newglbxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newglbxh++;

			//家装工料分析表
			ls_sql="insert into bj_khglfxb(khbh,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj,bjjb,wlbm,wlllbz)";
			ls_sql+=" values('"+khbh+"',"+newglbxh+",'"+dqbm+"','"+xmbh+"','"+glflbm[i]+"','"+cf.GB2Uni(glmc[i])+"','"+cf.GB2Uni(pp[i])+"','"+cf.GB2Uni(xhgg[i])+"','"+jldwbm[i]+"',"+xhl+","+dj+",'"+bjjbbm+"','"+cf.GB2Uni(wlbm[i])+"','N')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//家装工料分析表
			ls_sql="update bj_khglfxb set glflbm='"+glflbm[i]+"',glmc='"+cf.GB2Uni(glmc[i])+"',pp='"+cf.GB2Uni(pp[i])+"'";
			ls_sql+=" ,xhgg='"+cf.GB2Uni(xhgg[i])+"',jldwbm='"+jldwbm[i]+"',xhl="+xhl+",dj="+dj+",wlbm='"+cf.GB2Uni(wlbm[i])+"',wlllbz='N'";
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"' and glbxh="+glbxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	if (mark>0)
	{
		//【基价单价】发生变化需重新计算＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double cbdj=0;
		double cbje=0;
		double mll=0;
		double mle=0;
		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;
		double jsblxs=0;

		double sl=0;
		double dwbjje=0;


		//从【客户工料分析表（bj_khglfxb）】取基价单价
		ls_sql="SELECT sum(xhl*dj)";
		ls_sql+=" FROM bj_khglfxb  ";
		ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbdj=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		//取：结算比例系数
		ls_sql="SELECT jsblxs,sl,dwbjje";
		ls_sql+=" from cw_dejsmx ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jsblxs=rs.getDouble("jsblxs");
			sl=rs.getDouble("sl");
			dwbjje=rs.getDouble("dwbjje");
		}
		rs.close();
		ps.close();


		cbdj=cf.doubleTrim(cbdj,2);//成本单价、基价单价

		cbje=sl*cbdj;//工程量*成本单价
		cbje=cf.doubleTrim(cbje);//成本金额、基价金额


		mll=(dwbjje-cbje)/dwbjje*100;//（对外报价金额－成本金额）/报价金额
		mll=cf.doubleTrim(mll);//毛利率

		mle=dwbjje-cbje;//毛利率*对外报价金额
		mle=cf.doubleTrim(mle);//毛利金额


		nbjsdj=cbdj*(1+jsblxs/100);//成本单价*(1+结算比例系数)
		nbjsdj=cf.doubleTrim(nbjsdj);//内部结算单价

		nbjsje=nbjsdj*sl;//内部结算单价*工程数量
		nbjsje=cf.doubleTrim(nbjsje);//内部结算金额

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
		gsmll=cf.doubleTrim(gsmll);//公司毛利率

		gsmlr=dwbjje-nbjsje;//公司毛利率*对外报价金额
		gsmlr=cf.doubleTrim(gsmlr);//公司毛利润


		ls_sql="update cw_dejsmx set xclbz='Y',cbdj=?,cbje=?,mll=?,mle=?,nbjsdj=?,nbjsje=?,gsmll=?,gsmlr=?";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbdj);
		ps.setDouble(2,cbje);
		ps.setDouble(3,mll);
		ps.setDouble(4,mle);
		ps.setDouble(5,nbjsdj);
		ps.setDouble(6,nbjsje);
		ps.setDouble(7,gsmll);
		ps.setDouble(8,gsmlr);
		ps.executeUpdate();
		ps.close();

		//【基价单价】发生变化需重新计算===========================完成

		ls_sql="SELECT sum(nbjsje)";
		ls_sql+=" from cw_dejsmx ";
		ls_sql+=" where cw_dejsmx.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nbjsje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update cw_gdjsjl set dejsje="+nbjsje;
		ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	else{
		out.println("错误！无任何数据");
	}


	conn.commit();

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