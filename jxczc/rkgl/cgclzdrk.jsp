<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="jqpj" scope="page" class="jxc.jqpj.Jqpj"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
int coun=0;
String lsh=null;
String clbm=null;
String rkph=null;
String dqbm=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String scph=null;
String zljb=null;
String gysmc=null;
java.sql.Date scrq2=null;
String scrq=null;
double sumkcje=0;
double sumkcsl=0;
double sumjqpjcbj=0;
double jqpjcbj=0;
double ccpzkl=0;
double rkj=0;
double rksl=0;
int maxlsh=0;
int lslsh=0;
String[] clbmjh =request.getParameterValues("clbm");//材料编码
String[] ccpzkljh =request.getParameterValues("ccpzkl");//残次品折扣率
String[] zljbjh =request.getParameterValues("zljb");//质量级别
String[] rksljh =request.getParameterValues("rksl");//入库数量
String[] rkjjh =request.getParameterValues("rkj");//入库货位
String[] hwbhjh =request.getParameterValues("hwbh");//入库货位
String[] hjbhjh =request.getParameterValues("hjbh");//入库货架
String[] scrqjh =request.getParameterValues("scrq");//生产日期
String[] scphjh =request.getParameterValues("scph");//生产批号
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
rkph=cf.GB2Uni(request.getParameter("rkph"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//检查批号是否已经入库
	ls_sql=" select clbm";
	ls_sql+=" from jxc_kcb ";
	ls_sql+=" where  rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		conn.rollback();
		out.print("入库失败！入库批号：【"+rkph+"】已经入库！");
		return;
	}
	rs.close();
	ps.close();

	//查询供货单位
	ls_sql=" select gysmc";
	ls_sql+=" from jxc_rkd ";
	ls_sql+=" where  rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));
	}
	rs.close();
	ps.close();

	//产生主键流水号
	ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
	ls_sql+=" from jxc_kcb ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())//库存有货 直接更新数量
	{
		maxlsh=rs.getInt("lsh");
	}
	rs.close();
	ps.close();

	//检查库存中是否有货 
	for (int i=0;i<clbmjh.length;i++)
	{
		coun++;

		//检查地区材料价格表里是否有此材料
		ls_sql=" select clbm";
		ls_sql+=" from jxc_cljgb ";
		ls_sql+=" where  clbm='"+clbmjh[i]+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())//检查材料编码
		{
			clbm=clbmjh[i];
		}
		else
		{
			conn.rollback();
			out.print("入库失败！地区材料价格表不存在编码【"+clbmjh[i]+"】！");
			return;
		}
		rs.close();
		ps.close();

		
		hwbh=hwbhjh[i];//检查货位
		if (hwbh==null || hwbh.equals(""))
		{
			conn.rollback();
			out.print("入库失败！序号【"+coun+"】中入库货位不能为空！");
			return;
		}

		hjbh=hjbhjh[i];//检查货架
		if (hjbh==null || hjbh.equals(""))
		{
			conn.rollback();
			out.print("入库失败！序号【"+coun+"】中入库货架不能为空！");
			return;
		}

		//质量级别
		zljb=zljbjh[i];
		if (zljb==null || zljb.equals(""))
		{
			conn.rollback();
			out.print("入库失败！序号【"+coun+"】中质量级别不能为空！");
			return;
		}

		//生产批号
		scph=cf.GB2Uni(scphjh[i]);
		if (scph==null || scph.equals(""))
		{
			conn.rollback();
			out.print("入库失败！序号【"+coun+"】中生产批号不能为空！");
			return;
		}

		//生产日期
		scrq=scrqjh[i];
		ls=scrqjh[i];
		try{
			if (!(ls.equals("")))  
			{
				scrq2=java.sql.Date.valueOf(ls.trim());
			}
			else
			{
				conn.rollback();
				out.print("入库失败！序号【"+coun+"】中生产日期不能为空！");
				return;
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>变量scrq不存在");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[生产日期]类型转换发生意外:"+e);
			return;
		}

		//入库数量
		ls=rksljh[i];
		try{
			if (!(ls.equals("")))  {
				rksl=Double.parseDouble(ls.trim());
			}
			else
			{
				conn.rollback();
				out.print("<font clolr='red'>第【"+coun+"】行【"+clbm+"】入库数量不能为空！</font><br>");
				return;
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>变量rksl不存在");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[入库数量]类型转换发生意外:"+e);
			return;
		}

		//入库价转换
		ls=rkjjh[i];
		try{
			if (!(ls.equals(""))) 
			{ 
				rkj=Double.parseDouble(ls.trim());
			}
			else
			{
				conn.rollback();
				out.print("<font clolr='red'>第【"+coun+"】行【"+clbm+"】入库价格不能为空！</font><br>");
				return;
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>变量rkj不存在");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[入库价]类型转换发生意外:"+e);
			return;
		}

		//检查残次品折扣率
		ls=ccpzkljh[i];
		try{
			if (!(ls.equals(""))) 
			{ 
				ccpzkl=Double.parseDouble(ls.trim());
			}
			else
			{
				if (zljb.equals("2"))
				{
					conn.rollback();
					out.print("错误：序号【"+coun+"】残次品数量不为零，必须录入残次品折扣率！");
					return;
				}
				else//如果没有残次品折扣率为1 及没有折扣
				{
					ccpzkl=1;
				}
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>变量ccpzkl不存在");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[残次品折扣率]类型转换发生意外:"+e);
			return;
		}

		//检查残次品折扣率录入是否合法
		if(ccpzkl>1 || ccpzkl<=0)
		{
			conn.rollback();
			out.print("错误：序号【"+coun+"】残次品折扣率应该为0-1之间！");
			return;
		}
//更新库存
		lslsh=maxlsh+coun;
		lsh=cf.addZero(lslsh,13);

		//将库存表中不存在的数据写入
		ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
		ls_sql+=" ,clbm,zljb,clzk,rkph,scph,scrq ";
		ls_sql+=" ,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj) ";
		ls_sql+=" select '"+lsh+"',clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,'"+gysmc+"',cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
		ls_sql+=" ,jxc_rkmx.clbm,'"+zljb+"','"+ccpzkl+"','"+rkph+"','"+scph+"',to_date('"+scrq+"','YYYY-MM-DD')";
		ls_sql+=" ,'"+hwbh+"','"+hjbh+"','"+ckbh+"','"+dqbm+"','"+rkj+"','"+rksl+"','"+rkj*rksl+"','0' jqpjcbj ";
		ls_sql+=" from jxc_rkmx,jxc_clbm ";
		ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.clbm='"+clbm+"' and jxc_rkmx.rkph='"+rkph+"'";
		ls_sql+=" and jxc_rkmx.scph='"+scph+"' and to_char(jxc_rkmx.scrq,'YYYY-MM-DD')='"+scrq+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (zljb.equals("1"))//1：正常品；2：残次品；3：报废品；
		{
			//正常品总数量,已采购数量
			ls_sql="update jxc_cljgb set zcpzsl=zcpzsl+"+rksl+",ycgsl=ycgsl-"+rksl+" ";
			ls_sql+=" where  clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (zljb.equals("2"))//1：正常品；2：残次品；3：报废品；
		{
			//残次品总数量,已采购数量
			ls_sql="update jxc_cljgb set ccpzsl=ccpzsl+"+rksl+",ycgsl=ycgsl-"+rksl+" ";
			ls_sql+=" where  (clbm='"+clbm+"' and dqbm='"+dqbm+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (zljb.equals("3"))//1：正常品；2：残次品；3：报废品；
		{
			//报废品总数量,已采购数量
			ls_sql="update jxc_cljgb set bfpzsl=bfpzsl+"+rksl+",ycgsl=ycgsl-"+rksl+" ";
			ls_sql+=" where  (clbm='"+clbm+"' and dqbm='"+dqbm+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		
	}

	//更新入库单状态,0：未提交；1：等待审核；2：等待入库；3：已入库；4：已结算；6：等待总部审核
	ls_sql="update jxc_rkd set rkdzt='3' ";
	ls_sql+=" where  (rkph='"+rkph+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	//加权平均成本价
	out.print(jqpj.jqpjcbj(dqbm));

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<center><DIV><font color="blue">材料入库完成！！！</font></DIV></center>
	<center><DIV><a href="/jxcdy/printzcrkd.jsp?rkph=<%=rkph%>" target="_back">打印入库单</a></DIV></center>
	<%
	
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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