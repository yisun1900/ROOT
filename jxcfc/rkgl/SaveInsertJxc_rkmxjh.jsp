<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ls=null;
String rkph=null;
String clbm=null;
rkph=cf.GB2Uni(request.getParameter("rkph"));
String fhjlh=cf.GB2Uni(request.getParameter("fhjlh"));
int rkxh=0;
int nu=0;
double cbj=0;
double xsj=0;
double rksl=0;
double rkj=0;
int cgrksl=0;
double fhsj=0;
String sfxsh=null;
String clbmppmc=null;
String rkdppmc=null;
String gysmc=null;
String ygysmc=null;
String scph=null;
java.sql.Date scrq=null;
String[] clbmjh =request.getParameterValues("clbm");
String[] cbjjh =request.getParameterValues("cbj");
String[] rksljh =request.getParameterValues("rksl");
String[] fhsjjh =request.getParameterValues("fhsj");
String[] scrqjh =request.getParameterValues("scrq");
String[] scphjh =request.getParameterValues("scph");
String dqbm=null;
String sfycsh="N";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//查询供应商名称,所属地区
	ls_sql="select gysmc,dqbm ";
	ls_sql+=" from  jxc_rkd";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	//查询已入库产品数量
	ls_sql="select max(rkxh) ";
	ls_sql+=" from  jxc_rkmx";
	ls_sql+=" where rkph='"+rkph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rkxh=rs.getInt(1);
	}
	rs.close();
	ps.close();


	//插入数据
	for (int i=0;i<clbmjh.length ;i++ )
	{
		nu=i+1;
		rkxh++;

		clbm=clbmjh[i];
		clbm=cf.addZero(clbm,13);

		if (clbm!=null && !(clbm.equals("")))
		{
			//生产批号
			scph=cf.GB2Uni(scphjh[i]);
			if (scph==null || scph.equals(""))
			{
				conn.rollback();
				out.print("<font clolr='red'>第【"+nu+"】行【"+clbm+"】生产批号不能为空！</font><br>");
				return;
			}

			//生产日期
			ls=scrqjh[i];
			try{
				if (!(ls.equals(""))) 
				{
					scrq=java.sql.Date.valueOf(ls.trim());
				}
				else
				{
					conn.rollback();
					out.print("<font clolr='red'>第【"+nu+"】行【"+clbm+"】生产日期不能为空！</font><br>");
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
				if (!(ls.equals("")))  
				{
					rksl=Double.parseDouble(ls.trim());
				}
				else
				{
					conn.rollback();
					out.print("<font clolr='red'>第【"+nu+"】行【"+clbm+"】入库数量不能为空！</font><br>");
					return;
				}
			}
			catch (java.lang.NullPointerException nulle)
			{
				conn.rollback();
				out.println("<BR>变量rksl不存在");
				return;
			}
			catch (Exception e)
			{
				conn.rollback();
				out.println("<BR>[入库数量]类型转换发生意外:"+e);
				return;
			}

			//查询材料成本价
			ls_sql=" select cbj ";
			ls_sql+=" from jxc_cljgb ";
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				sfycsh="Y";
				rkj=rs.getDouble("cbj");
			}
			else
			{
				conn.rollback();
				sfycsh="N";
				out.print("<font color=\"red\">错误：材料【"+clbm+"】在价格表中没有找到对应的成本价！</font><br>");
				return;

			}
			rs.close();
			ps.close();

			if (rkj<=0)
			{
				out.print("<font color=red>提示：材料["+clbm+"]没有录入成本价!入库价将为零！</font><br>");
			}

			//检查材料编码是否存在	
			ls_sql=" select clbm,ppmc ";
			ls_sql+=" from jxc_clbm ";
			ls_sql+=" where clbm='"+clbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			int count=0;
			if (rs.next())
			{
				sfycsh="Y";
				clbmppmc=cf.fillNull(rs.getString("ppmc"));
			}
			else
			{
				conn.rollback();
				sfycsh="N";
				out.print("<font color=\"red\">错误：材料【"+clbm+"】不存在，请检查录入！</font><br>");
				return;

			}
			rs.close();
			ps.close();

			//检查材料编码中的子品牌名称是否与入库单子品牌名称一致
			if (gysmc!=null && gysmc.equals("集团"))
			{
				sfycsh="Y";
			}
			else
			{
				ls_sql=" select ppmc ";
				ls_sql+=" from jxc_ppgysdzb ";
				ls_sql+=" where ppmc='"+clbmppmc+"' and gysmc='"+gysmc+"' ";
				ps= conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if (rs.next())
				{
					sfycsh="Y";
				}
				else
				{
					conn.rollback();
					sfycsh="N";
					out.print("<font color=\"red\">材料【"+clbm+"】错误：子品牌["+clbmppmc+"]与供应商["+gysmc+"]无对应关系！<br>请检查供应商是否正确，或者您没有在子品牌供应商对照表里面将子品牌与该供应商关联！</font><br>");
					return;

				}
				rs.close();
				ps.close();
			}

			if (sfycsh.equals("Y"))
			{
				//写入入库明细
				ls_sql="insert into jxc_rkmx ( rkph,rkxh,clbm,cbj,rksl,rkj,zcpsl,ccpsl,thpsl,bfpsl,scrq,scph,ccpzkl ) ";
				ls_sql+=" values ( ?,?,?,?,?,?,0,0,0,0,?,?,1 ) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,rkph);
				ps.setLong(2,rkxh);
				ps.setString(3,clbm);
				ps.setDouble(4,cbj);
				ps.setDouble(5,rksl);
				ps.setDouble(6,rkj);
				ps.setDate(7,scrq);
				ps.setString(8,scph);
				ps.executeUpdate();
				ps.close();

				cgrksl++;

				//修改供应商发货
				ls_sql="update jxc_gysfhjl set sfrk='Y',rkph='"+rkph+"' ";
				ls_sql+=" where  fhjlh='"+fhjlh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				//修改入库单的发货记录号
				ls_sql="update jxc_rkd set fhjlh='"+fhjlh+"' ";
				ls_sql+=" where  rkph='"+rkph+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

			sfycsh="N";
		}
		else
		{
			out.print("<font clolr='red'>第【"+nu+"】行材料编码为空！</font><br>");
		}
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功，<%=cgrksl%>条数据已入库！");
	window.close();
	//-->
	</SCRIPT>
	<center><DIV><font color="blue">入库单保存成功！请提交入库单！</font></DIV></center>
	<center><DIV><font color="blue"><a href="tjrkd.jsp?rkph=<%=rkph%>">提交入库单</a></font></DIV></center>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
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