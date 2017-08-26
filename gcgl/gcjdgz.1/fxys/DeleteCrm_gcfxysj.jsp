<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ysjlhStr = request.getParameterValues("ysjlh");
if (ysjlhStr.length>1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}

String ysjlh=ysjlhStr[0];


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//获取验收记录信息
	String khbh=null;
	String oldgcysxmbm=null;
	String oldsfszhf=null;
	String oldhfszjlh=null;
	String oldgcjdbm=null;
	String oldygcjdbm=null;
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;
	String oldygcysxmbm=null;
	java.sql.Date oldyyssj=null;
	ls_sql="select khbh,gcysxmbm,sfszhf,hfszjlh,gcjdbm,ygcjdbm,ysfxhf,yhfrq,yhflxbm,ygcysxmbm,yyssj";
	ls_sql+=" from  crm_gcfxysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		oldgcysxmbm=rs.getString("gcysxmbm");
		oldsfszhf=cf.fillNull(rs.getString("sfszhf"));
		oldhfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		oldgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		oldygcjdbm=cf.fillNull(rs.getString("ygcjdbm"));
		oldysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		oldyhfrq=rs.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs.getString("yhflxbm"));
		oldygcysxmbm=cf.fillNull(rs.getString("ygcysxmbm"));
		oldyyssj=rs.getDate("yyssj");
	}
	else{
		out.println("错误！不存在的验收记录号："+ysjlh);
		return;
	}
	rs.close();
	ps.close();
	
	//获取最新工程进度
	String nowgcjdbm="";
	String nowzqysxmbm="";
	ls_sql="select gcjdbm,zqysxmbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
	}
	rs.close();
	ps.close();

	if (nowgcjdbm.equals("5"))
	{
		out.println("错误！已完结，不能再删除");
		return;
	}

	String oldgcysxmmc=null;
	String olddygcjdbm="";
	String oldgetsfxhf="";
	String oldgethflxbm="";
	ls_sql="SELECT gcysxmmc,dygcjdbm,sfhf,hflxbm";
	ls_sql+=" FROM dm_gcysxm ";
	ls_sql+=" where  gcysxmbm='"+oldgcysxmbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldgcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		olddygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
		oldgetsfxhf=cf.fillNull(rs.getString("sfhf"));
		oldgethflxbm=cf.fillNull(rs.getString("hflxbm"));
	}
	rs.close();
	ps.close();

	if (!olddygcjdbm.equals("") || oldgetsfxhf.equals("Y"))
	{
		if (!nowzqysxmbm.equals(oldgcysxmbm))
		{
			out.println("错误！只能删除最新的验收项目");
			return;
		}
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

	conn.setAutoCommit(false);

	//删除：工程分项验收照片
	ls_sql="delete from  crm_gcfxyszp ";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//删除：工程分项验收记录
	ls_sql="delete from  crm_gcfxysjl ";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
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
			conn.rollback();
			out.println("错误！客户工程进度已改变，不能再修改");
			return;
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

	ls_sql="update crm_khxx set szqsj=?,zqysxmbm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,oldyyssj);
	ps.setString(2,oldygcysxmbm);
	ps.executeUpdate();
	ps.close();

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