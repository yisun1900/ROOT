<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yscsjlh=request.getParameter("yscsjlh");

String ls=null;
java.sql.Date yqjjsj=null;
ls=request.getParameter("yqjjsj");
try{
	if (!(ls.equals("")))  yqjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yqjjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[整改要求解决时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int wwcsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh ='"+yscsjlh+"'";
	ls_sql+=" and clbz='9'";//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wwcsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (wwcsl==0)
	{
		out.println("错误！已完成");
		return;
	}

	rwjh.Rwjh rwjh=new rwjh.Rwjh();

	conn.setAutoCommit(false);

	String ysjlh = null;
	String khbh = null;
	String gcysxmbm = null;
	java.sql.Date yssj=null;
	String lrr = null;
	java.sql.Date lrsj=null;
	String ysr = null;
	String sjysjg = null;
	String xlrmx = null;
	int zpsl=0;
	ls_sql="select ysjlh,khbh,gcysxmbm,ysr,yssj,lrr,lrsj,sjysjg,xlrmx,zpsl";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh ='"+yscsjlh+"'";
	ls_sql+=" and clbz='9'";//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
	ls_sql+=" order by ysjlh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ysjlh=cf.fillNull(rs1.getString("ysjlh"));
		khbh=cf.fillNull(rs1.getString("khbh"));
		gcysxmbm=cf.fillNull(rs1.getString("gcysxmbm"));
		ysr=cf.fillNull(rs1.getString("ysr"));
		yssj=rs1.getDate("yssj");
		lrr=cf.fillNull(rs1.getString("lrr"));
		lrsj=rs1.getDate("lrsj");
		sjysjg=cf.fillNull(rs1.getString("sjysjg"));//0：合格；1：不合格
		xlrmx=cf.fillNull(rs1.getString("xlrmx"));
		zpsl=rs1.getInt("zpsl");


		if (xlrmx.equals("2"))//1：不需录入；2：需录入；3：已录入
		{
			conn.rollback();
			out.println("错误！未录入验收项目，验收记录号:"+ysjlh);
			return;
		}
		if (zpsl==0)
		{
			conn.rollback();
			out.println("错误！未上传照片，验收记录号:"+ysjlh);
			return;
		}


		String clbz="";//0：没问题；1:未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
		if (sjysjg.equals("1"))//0：合格；1：不合格
		{
			clbz="1";

			if (yqjjsj==null)
			{
				conn.rollback();
				out.println("错误！发生整改，未录入【整改要求解决时间】:"+ysjlh);
				return;
			}
		}
		else{
			clbz="0";
		}

		ls_sql="update crm_heysjl set clbz=?,yqjjsj=? ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clbz);
		ps.setDate(2,yqjjsj);
		ps.executeUpdate();
		ps.close();

		if (sjysjg.equals("1"))//不合格不需设置
		{
			continue;
		}


		//获取客户回访和工程进度信息
		String nowgcjdbm=null;
		java.sql.Date nowhfrq=null;
		String nowhflxbm=null;
		String nowsfxhf=null;
		String nowysjlh=null;
		String nowzqysxmbm=null;
		java.sql.Date nowszqsj=null;
		double fwmj = 0;
		String fgsbh=null;
		ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq,ysjlh,zqysxmbm,sgyssj,fwmj,fgsbh";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			nowhflxbm=cf.fillNull(rs.getString("hflxbm"));
			nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
			nowhfrq=rs.getDate("hfrq");
			nowysjlh=cf.fillNull(rs.getString("ysjlh"));
			nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
			nowszqsj=rs.getDate("sgyssj");
			fwmj=rs.getDouble("fwmj");
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
		}
		rs.close();
		ps.close();

		String qdysxm="";//工期起点验收项目
		ls_sql="SELECT qdysxm";
		ls_sql+=" FROM sq_dwxx ";
		ls_sql+=" where  dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qdysxm=cf.fillNull(rs.getString("qdysxm"));
		}
		rs.close();
		ps.close();

		if (qdysxm.equals(""))
		{
			conn.rollback();
			out.println("错误！未设置【工期起点验收项目】");
			return;
		}

		//获取验收项目信息
		String dygcjdbm="";
		String getsfxhf="";
		String gethflxbm="";
		String sfsgjdb = null;//是否关联施工进度表
		String jdbm = null;//施工进度进度节点
		ls_sql="SELECT dygcjdbm,sfhf,hflxbm,sfsgjdb,jdbm";
		ls_sql+=" FROM dm_heysxm ";
		ls_sql+=" where  gcysxmbm='"+gcysxmbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
			getsfxhf=cf.fillNull(rs.getString("sfhf"));
			gethflxbm=cf.fillNull(rs.getString("hflxbm"));
			sfsgjdb=cf.fillNull(rs.getString("sfsgjdb"));
			jdbm=cf.fillNull(rs.getString("jdbm"));
		}
		rs.close();
		ps.close();

		if (!dygcjdbm.equals(""))
		{
			//检查是否能设置工程进度
			if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
			{
				if (nowgcjdbm.equals("2") || nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
				{
					conn.rollback();
					out.println("错误！客户已开工，不能设置成未开工");
					return;
				}
			}
			else if (dygcjdbm.equals("2"))
			{
				if (nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
				{
					conn.rollback();
					out.println("错误！客户已经开工，不能重新设置");
					return;
				}
			}
			else if (dygcjdbm.equals("6"))
			{
				if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
				{
					conn.rollback();
					out.println("错误！客户已完工，设置错误！");
					return;
				}
			}
			else if (dygcjdbm.equals("3"))
			{
				if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
				{
					conn.rollback();
					out.println("错误！客户已完工，设置错误！");
					return;
				}
			}
			else if (dygcjdbm.equals("4"))
			{
				if (nowgcjdbm.equals("5"))
				{
					conn.rollback();
					out.println("错误！客户已完结，设置错误！");
					return;
				}
			}



			if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
			{
				ls_sql="update crm_khxx set gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("2"))
			{
				ls_sql="update crm_khxx set sjkgrq=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("6"))
			{
				ls_sql="update crm_khxx set sybgcrq=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("3"))
			{
				ls_sql="update crm_khxx set szqsj=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
			else if (dygcjdbm.equals("4"))
			{
				ls_sql="update crm_khxx set sjjgrq=?,gcjdbm=?";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,dygcjdbm);
				ps.executeUpdate();
				ps.close();
			}
		}




		String hfszjlh=null;
		if (getsfxhf.equals("Y"))//自动设置回访
		{
			ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?+1 ";
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,gethflxbm);
			ps.setDate(2,yssj);
			ps.executeUpdate();
			ps.close();

			//插入：回访设置记录＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			String yhfszjlh=null;
			ls_sql="select hfszjlh";
			ls_sql+=" from  crm_hfszjl";
			ls_sql+=" where khbh='"+khbh+"' and zxszbz='Y'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yhfszjlh=rs.getString("hfszjlh");
			}
			rs.close();
			ps.close();

			ls_sql=" update crm_hfszjl set zxszbz='N'";	
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			int count=0;
			ls_sql="select NVL(max(substr(hfszjlh,8,3)),0)";
			ls_sql+=" from  crm_hfszjl";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			hfszjlh=khbh+cf.addZero(count+1,3);

			String hfszyy=ysjlh+":工程验收";
			ls_sql=" insert into crm_hfszjl (hfszjlh,khbh,hflxbm,hfsj,hfszr,hfszsj,hfszyy,lx,hfzcgjz,sfyhf,zxszbz,yhfszjlh) ";	
			ls_sql+=" values ( ?,?,?,?+1,?,SYSDATE,?,'5',?,'N','Y',?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfszjlh);
			ps.setString(2,khbh);
			ps.setString(3,gethflxbm);
			ps.setDate(4,yssj);
			ps.setString(5,lrr);
			ps.setString(6,hfszyy);
			ps.setString(7,ysjlh);
			ps.setString(8,yhfszjlh);
			ps.executeUpdate();
			ps.close();
			//插入：回访设置记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		}


		ls_sql="update crm_heysjl set sfszhf=?,hfszjlh=?,gcjdbm=?,sfsgjdb=?,jdbm=?  ";
		ls_sql+=" ,ygcjdbm=?,ysfxhf=?,yhfrq=?,yhflxbm=? ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,getsfxhf);
		ps.setString(2,hfszjlh);
		ps.setString(3,dygcjdbm);
		ps.setString(4,sfsgjdb);
		ps.setString(5,jdbm);

		ps.setString(6,nowgcjdbm);
		ps.setString(7,nowsfxhf);
		ps.setDate(8,nowhfrq);
		ps.setString(9,nowhflxbm);

		ps.executeUpdate();
		ps.close();


		if (gcysxmbm.equals(qdysxm))
		{
			//删除：初始化【客户施工计划表】
			rwjh.deleteInitRw(conn,khbh);


			//初始化【客户施工计划表】
			rwjh.initRw(conn,khbh,lrr);
			//验收更新：客户施工计划表
			rwjh.updateYsxmYsHr(conn,yscsjlh);
		}
		else{
			//验收更新：客户施工计划表
			rwjh.updateYsxmYsHr(conn,yscsjlh);
		}
	}
	rs1.close();
	ps1.close();
	


	conn.commit();

	//发送短信
	ybl.dxxt.Dxxt dxxt=new ybl.dxxt.Dxxt("hmy");
	String retStr=dxxt.gcysKhFsHr(conn,yscsjlh,lrr);//调用发送短信函数
	if (retStr.equals(""))
	{
		out.println("短信发送成功");
	}
	else{
		out.println(retStr);//将发送结果显示到页面上
	}

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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>