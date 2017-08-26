<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String yhdlm=(String)session.getAttribute("yhdlm");

String tzjlh=request.getParameter("tzjlh");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//最低折扣
		zdmll=rs.getDouble("zdmll");//签单最低毛利率
	}
	rs.close();
	ps.close();

	String zklx="";//1：整单打折；2：单项打折；3：部分费用打折
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_tzzkjl";
    ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");//整单折扣
		gcfqdzk=rs.getDouble("gcfqdzk");//工程费折扣
	}
	rs.close();
	ps.close();

	String ysshbz="";
	String ssfgs="";
	ls_sql="select ysshbz,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//是否启用预算审核  N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//是否启用预算审核  Y：启用；N：不启用
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印是否需授权  1：不需授权；2：只需一次授权；3：每次打印都需授权
	}
	rs.close();
	ps.close();

 
	conn.setAutoCommit(false);

	dzbj.Tzk tzk=new dzbj.Tzk();
	//根据修改，更新客户折扣
	tzk.updateTzZkl(conn,tzjlh,khbh,"yz");
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
	newdzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();


	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
	if (htjz<0)
	{
		conn.rollback();
		out.println("错误！合同净值为负值："+htjz);
		return;
	}

	double  sgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	
	double  mle=cf.round(htjz-sgcbj,2);//毛利额=合同净值－施工成本价

	double mll=0;
	if (htjz==0)
	{
		mll=100;
	}
	else{
		mll=cf.round(mle/htjz*100,2);//毛利率＝毛利额÷合同净值
	}


	//成本价＝施工成本价＋其它项（不含：管理费、税金）
	//毛利率＝（合同净值－成本价）÷合同净值
	String clzt="2";//1：未完成；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过

	if (kzdzfs.equals("1"))//1：控制毛利率；2：控制折扣
	{
		if (mll<zdmll || mll>100)
		{
			conn.rollback();

			clzt="3";
		}
		else{
			clzt="2";
		}
	}
	else if (kzdzfs.equals("2"))//1：控制毛利率；2：控制折扣
	{
		if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
		{
			if (zdzk<zdzkl)
			{

				conn.rollback();
				clzt="3";
			}
			else{
				clzt="2";
			}
		}
		else{
			if (gcfqdzk<zdzkl)
			{
				conn.rollback();
				clzt="3";
			}
			else{
				clzt="2";
			}
		}
	}


	ls_sql="update crm_tzzkjl set tzhmll=?,clzt=?";
	ls_sql+=" where khbh='"+khbh+"' and clzt not in('2','4','5')";//1：未完成；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,mll);
	ps.setString(2,clzt);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	if (clzt.equals("3"))
	{
		out.println("直接修改折扣失败！需审批");
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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