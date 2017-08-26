<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdbmxq=cf.GB2Uni(request.getParameter("cxhdbmxq"));
String cxhdbmzh=cf.GB2Uni(request.getParameter("cxhdbmzh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String ssfgs=null;
	String ysshbz=null;
	ls_sql="select ssfgs,ysshbz";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString(1);
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//是否启用预算审核  B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
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

	if (sfqyyssh.equals("Y") && !ysshbz.equals("N") && !ysshbz.equals("M"))//N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过
	{
		out.println("错误！已申请[预算审核]，不能再调折扣");
		return;
	}

	/*检查促销活动是否可共享＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始*/
	String kgxqthd="";
	if (!cxhdbm.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbm+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if (!cxhdbmxq.equals("") || !cxhdbmzh.equals(""))
			{
				out.println("<BR>错误！！！公司促销活动["+cxhdbm+"]不可共享其它活动");
				return;
			}
		}
	}

	if (!cxhdbmxq.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmxq+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if ( (!cxhdbm.equals("无活动") && !cxhdbm.equals("")) || !cxhdbmzh.equals(""))
			{
				out.println("<BR>错误！！！小区促销活动["+cxhdbmxq+"]不可共享其它活动");
				return;
			}
		}
	}

	if (!cxhdbmzh.equals(""))
	{
		ls_sql="select kgxqthd";
		ls_sql+=" from  jc_cxhd";
		ls_sql+=" where cxhdmc ='"+cxhdbmzh+"' and fgsbh='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kgxqthd=rs.getString(1);
		}
		rs.close();
		ps.close();

		if (kgxqthd.equals("1"))//1：不可共享；2：可共享
		{
			if ((!cxhdbm.equals("无活动") && !cxhdbm.equals("")) || !cxhdbmxq.equals(""))
			{
				out.println("<BR>错误！！！展会促销活动["+cxhdbmzh+"]不可共享其它活动");
				return;
			}
		}
	}
	/*检查促销活动是否可共享=====================================结束*/


	//获取合同净值：合同净值＝工程费＋其它费（包括所有项）－活动赠送净值－特权赠送净值－赠送代金券
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double htjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值
	if (htjz<0)
	{
		out.println("错误！合同净值为负值："+htjz);
		return;
	}

	
	conn.setAutoCommit(false);

	ls_sql="update crm_zxkhxx set cxhdbm=?,cxhdbmxq=?,cxhdbmzh=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cxhdbm);
	ps.setString(2,cxhdbmxq);
	ps.setString(3,cxhdbmzh);
	ps.executeUpdate();
	ps.close();


	dzbj.Tzk tzk=new dzbj.Tzk();
	//根据促销活动，更新客户折扣
	tzk.updateHdZkl(conn,khbh,"yz");
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj newdzbj=new dzbj.NewDzbj();
	newdzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();
	//处理：电子报价促销活动折扣＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


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