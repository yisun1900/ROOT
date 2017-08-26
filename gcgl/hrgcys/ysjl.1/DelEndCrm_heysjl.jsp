<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yscsjlh=request.getParameter("yscsjlh");

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
	ls_sql+=" and clbz in('0','1')";//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
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
		out.println("错误！未完成");
		return;
	}

	rwjh.Rwjh rwjh=new rwjh.Rwjh();

	conn.setAutoCommit(false);

	String ysjlh=null;
	String khbh=null;
	String oldgcysxmbm=null;
	String oldsfszhf=null;
	String oldhfszjlh=null;
	String oldgcjdbm=null;
	String oldygcjdbm=null;
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;

	String oldyysjlh=null;
	String oldygcysxmbm=null;
	java.sql.Date oldyyssj=null;
	int sjysjg=0;
	ls_sql="select ysjlh,khbh,gcysxmbm,sfszhf,hfszjlh,gcjdbm,ygcjdbm,ysfxhf,yhfrq,yhflxbm   ,yysjlh,ygcysxmbm,yyssj,sjysjg";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh ='"+yscsjlh+"'";
	ls_sql+=" and clbz in('0','1')";//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
	ls_sql+=" order by ysjlh desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		ysjlh=rs1.getString("ysjlh");
		khbh=rs1.getString("khbh");
		oldgcysxmbm=rs1.getString("gcysxmbm");
		oldsfszhf=cf.fillNull(rs1.getString("sfszhf"));
		oldhfszjlh=cf.fillNull(rs1.getString("hfszjlh"));
		oldgcjdbm=cf.fillNull(rs1.getString("gcjdbm"));
		oldygcjdbm=cf.fillNull(rs1.getString("ygcjdbm"));
		oldysfxhf=cf.fillNull(rs1.getString("ysfxhf"));
		oldyhfrq=rs1.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs1.getString("yhflxbm"));

		oldyysjlh=cf.fillNull(rs1.getString("yysjlh"));
		oldygcysxmbm=cf.fillNull(rs1.getString("ygcysxmbm"));
		oldyyssj=rs1.getDate("yyssj");
		sjysjg=rs1.getInt("sjysjg");


		String clbz="9";//9：录入未完成；0：没问题；1:未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过

		ls_sql="update crm_heysjl set clbz=? ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clbz);
		ps.executeUpdate();
		ps.close();

		if (sjysjg==1)//不合格不需设置
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
		ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq,ysjlh,zqysxmbm,sgyssj,fwmj";
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
		}
		rs.close();
		ps.close();


		if (nowgcjdbm.equals("5"))
		{
			conn.rollback();
			out.println("错误！已完结，不能再删除");
			return;
		}

		String nowyscsjlh="";//验收次数记录号
		ls_sql="SELECT yscsjlh";
		ls_sql+=" FROM crm_heysjl ";
		ls_sql+=" where  ysjlh='"+nowysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nowyscsjlh=cf.fillNull(rs.getString("yscsjlh"));
		}
		rs.close();
		ps.close();

		if (!nowyscsjlh.equals(yscsjlh))
		{
			conn.rollback();
			out.println("错误！只能删除最新的验收次数记录号:"+nowyscsjlh);
			return;
		}

		//获取回访设置记录信息
		String getsfyhf="";//是否已回访 ,Y：回访；N：未回访
		String getzxszbz="";//最新设置标志  ,Y：是；N：否
		String yhfszjlh=null;
		ls_sql="SELECT sfyhf,zxszbz,yhfszjlh ";
		ls_sql+=" FROM crm_hfszjl ";
		ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfyhf=cf.fillNull(rs.getString("sfyhf"));
			getzxszbz=cf.fillNull(rs.getString("zxszbz"));
			yhfszjlh=cf.fillNull(rs.getString("yhfszjlh"));
		}
		rs.close();
		ps.close();



		//删除回访设置信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (oldsfszhf.equals("Y"))//以前设置过回访, Y：是；N：否
		{
			if (getsfyhf.equals("N"))//客服没有实际回访
			{
				if (getzxszbz.equals("Y"))//是最新记录，可删除
				{
					//还原成以前设置信息
					ls_sql="update crm_khxx set sfxhf=?,hflxbm=?,hfrq=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldysfxhf);
					ps.setString(2,oldyhflxbm);
					ps.setDate(3,oldyhfrq);
					ps.executeUpdate();
					ps.close();

					//删除回访设置记录
					ls_sql="delete from crm_hfszjl ";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql=" update crm_hfszjl set zxszbz='Y'";	
					ls_sql+=" where hfszjlh='"+yhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{//未回访,非最新,下一级与前一级关联,删除本级
					//取下一级
					String nexthfszjlh=null;
					ls_sql="SELECT hfszjlh ";
					ls_sql+=" FROM crm_hfszjl ";
					ls_sql+=" where  khbh='"+khbh+"' and yhfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						nexthfszjlh=cf.fillNull(rs.getString("hfszjlh"));
					}
					rs.close();
					ps.close();

					//下一级与前一级关联
					ls_sql=" update crm_hfszjl set yhfszjlh=?";	
					ls_sql+=" where hfszjlh='"+nexthfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,yhfszjlh);
					ps.executeUpdate();
					ps.close();

					//删除本级回访设置记录
					ls_sql="delete from crm_hfszjl ";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
		//删除回访设置信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		//删除工程进度设置信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (!oldgcjdbm.equals(""))//以前设过
		{
			if (!oldgcjdbm.equals(nowgcjdbm))//设置的工程进度编码已改变，不能再修改
			{
//				conn.rollback();
//				out.println(ysjlh+":错误！工程进度已改变，不能再修改，客户现在工程进度:"+nowgcjdbm+"，验收设置工程进度:"+oldgcjdbm);
//				return;
			}
			else{//可修改
				//首先删除旧的＋＋＋＋＋＋＋＋＋＋＋＋＋开始
				if (oldgcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
				{
					ls_sql="update crm_khxx set gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("2"))
				{
					ls_sql="update crm_khxx set sjkgrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();

				}
				else if (oldgcjdbm.equals("6"))
				{
					ls_sql="update crm_khxx set sybgcrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("3"))
				{
					ls_sql="update crm_khxx set szqsj=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("4"))
				{
					ls_sql="update crm_khxx set sjjgrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				//首先删除旧的＝＝＝＝＝＝＝＝＝＝＝＝＝结束
			}
		}
		//删除工程进度设置信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束



		ls_sql="update crm_heysjl set sfszhf='N',hfszjlh=null,gcjdbm=null,ygcjdbm=null,ysfxhf=null,yhfrq=null,yhflxbm=null,jdbm=null  ";
		ls_sql+=" where ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		if (oldgcjdbm.equals("2"))
		{
			//删除：初始化【客户施工计划表】
			rwjh.deleteInitRw(conn,khbh);

			//删除：验收更新：客户施工计划表
			rwjh.deleteUpdateYsxmYsHr(conn,yscsjlh);
		}
		else{
			//删除：验收更新：客户施工计划表
			rwjh.deleteUpdateYsxmYsHr(conn,yscsjlh);
		}
	}
	rs1.close();
	ps1.close();
	

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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