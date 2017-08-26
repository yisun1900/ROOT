<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String hfr=null;
java.sql.Date hfsj=null;
String hfsm=null;
hfr=cf.GB2Uni(request.getParameter("hfr"));
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hfsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访时间]类型转换发生意外:"+e);
	return;
}
hfsm=cf.GB2Uni(request.getParameter("hfsm"));

String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
String hfjgbm=cf.GB2Uni(request.getParameter("hfjgbm"));
String hfwtbm=cf.GB2Uni(request.getParameter("hfwtbm"));
String[] zrbm=request.getParameterValues("zrbm");

String[] dxpjzbbm=request.getParameterValues("dxpjzbbm");
String[] hfdxbm=request.getParameterValues("hfdxbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();

	String gethfjlh="";
	ls_sql="select hfjlh";
	ls_sql+=" from crm_wghfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ls_sql+=" order by hfjlh desc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gethfjlh=cf.fillNull(rs.getString("hfjlh"));
	}
	rs.close();
	ps.close();

	if (!gethfjlh.equals(hfjlh))
	{
		out.println("错误！只能修改最新的回访记录："+gethfjlh);
		return;
	}


	String getwtclzt="";
	ls_sql="select wtclzt";
	ls_sql+=" from crm_wghfjl";
	ls_sql+=" where hfjlh='"+hfjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getwtclzt=cf.fillNull(rs.getString("wtclzt"));
	}
	rs.close();
	ps.close();

	if (!getwtclzt.equals("") && !getwtclzt.equals("1"))
	{
		out.println("错误！已开始处理不能再改变状态");
		return;
	}

	String getxmjfzt="";
	ls_sql="select xmjfzt";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
	}
	rs.close();
	ps.close();

	if (!getxmjfzt.equals("X") && !getxmjfzt.equals("Y") && !getxmjfzt.equals("N"))
	{
		out.println("错误！状态不正确");
		return;
	}

	String wtclzt="";//1：未处理；2：在处理；3：已解决
	if (hfjgbm.equals("02"))//01：没问题；02：有问题；09：未联系上
	{
		wtclzt="1";
	}

	String xmjfzt="";//N：未交付；S：预交付；Y：回访成功；X：回访失败；C：失败已处理；W：项目交付
	if (hfjgbm.equals("01"))//01：没问题；02：有问题；09：未联系上
	{
		xmjfzt="Y";
	}
	else if (hfjgbm.equals("02"))//01：没问题；02：有问题；09：未联系上
	{
		xmjfzt="X";
	}
	else{
		xmjfzt="N";
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_wghfjl set hfjgbm=?,hfwtbm=?,wtclzt=?,hfr=?,hfsj=?,hfsm=?,lrr=?,lrsj=SYSDATE,lrbm=?";
	ls_sql+=" where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfjgbm);
	ps.setString(2,hfwtbm);
	ps.setString(3,wtclzt);
	ps.setString(4,hfr);
	ps.setDate(5,hfsj);
	ps.setString(6,hfsm);
	ps.setString(7,lrr);
	ps.setString(8,lrbm);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_wghfwtbm ";
	ls_sql+=" where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//完工回访问题部门
	if (zrbm!=null)
	{
		for (int i=0;i<zrbm.length ;i++ )
		{

			ls_sql="insert into crm_wghfwtbm (hfjlh,zrbm,khbh,clzt) ";
			ls_sql+=" values ( ?,?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfjlh);
			ps.setString(2,zrbm[i]);
			ps.setString(3,khbh);
			ps.setString(4,"1");//1：未处理；2：在处理；3：已解决
			ps.executeUpdate();
			ps.close();

		}
	}

	//N：未交付；S：预交付；Y：回访成功；X：回访失败；C：失败已处理；W：项目交付
	ls_sql="update crm_khxx set xmjfzt=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmjfzt);
	ps.executeUpdate();
	ps.close();

		
	ls_sql="delete from hf_khhfjg ";
	ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
		
	ls_sql="delete from hf_khhfbmyyy ";
	ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//客户回访结果+++++++++++++++++++开始
	for (int i=0;i<dxpjzbbm.length;i++)
	{
		String hfdxmc=null;
		String dxpjzb=null;
		ls_sql="select hdm_hfdxbm.hfdxmc,hdm_dxpjzb.dxpjzb";
		ls_sql+=" from  hdm_hfdxbm,hdm_dxpjzb";
		ls_sql+=" where hdm_hfdxbm.hfdxbm=hdm_dxpjzb.hfdxbm and hdm_dxpjzb.dxpjzbbm='"+dxpjzbbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			hfdxmc=rs.getString("hfdxmc");
			dxpjzb=rs.getString("dxpjzb");
		}
		rs.close();
		ps.close();

		String pfbm=null;
		pfbm=cf.GB2Uni(request.getParameter("dxpjzbbm"+dxpjzbbm[i]));

		if (pfbm==null || pfbm.equals(""))
		{
//			conn.rollback();
//			out.println("错误！【"+hfdxmc+"】在【"+dxpjzb+"】未选择【评分情况】");
//			return;
		}

		if (pfbm!=null && !pfbm.equals(""))
		{
			String pfmc=null;
			double df=0;
			ls_sql="select pfmc,df";
			ls_sql+=" from  hdm_pjzbpf";
			ls_sql+=" where dxpjzbbm='"+dxpjzbbm[i]+"' and pfbm='"+pfbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				pfmc=rs.getString("pfmc");
				df=rs.getDouble("df");
			}
			rs.close();
			ps.close();

			
			ls_sql="insert into hf_khhfjg (khbh,hflxbm,hfdxbm,hfdxmc,dxpjzbbm,dxpjzb,pfbm,pfmc,df,lrr,lrsj,xh) ";
			ls_sql+=" select ?,?,hdm_dxpjzb.hfdxbm,hdm_hfdxbm.hfdxmc,hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb,?,?,?,?,SYSDATE,?";
			ls_sql+=" from hdm_dxpjzb,hdm_hfdxbm";
			ls_sql+=" where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm and hdm_dxpjzb.dxpjzbbm='"+dxpjzbbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,hflxbm);
			ps.setString(3,pfbm);
			ps.setString(4,pfmc);
			ps.setDouble(5,df);
			ps.setString(6,lrr);
			ps.setInt(7,(i+1));
			ps.executeUpdate();
			ps.close();
		}
		
	}
	//客户回访结果---------------------------结束

	//客户回访不满意原因+++++++++++++++++++开始
	for (int i=0;i<hfdxbm.length;i++)
	{
		String bmyyy=null;
		bmyyy=cf.GB2Uni(request.getParameter("bmyyy"+hfdxbm[i]));

		if (bmyyy!=null && !bmyyy.equals(""))
		{
			ls_sql="insert into hf_khhfbmyyy (khbh,hflxbm,hfdxbm,bmyyy,lrr,lrsj) ";
			ls_sql+=" values( ?,?,?,?,?,SYSDATE)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,hflxbm);
			ps.setString(3,hfdxbm[i]);
			ps.setString(4,bmyyy);
			ps.setString(5,lrr);
			ps.executeUpdate();
			ps.close();
		}
	}
	//客户回访不满意原因---------------------------结束


	//客户调查表+++++++++++++++++++开始
		
	ls_sql="delete from hf_khwtda ";
	ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from hf_wtbcsm ";
	ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//取每个问题
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbsj=null;
	String sftxsm=null;
	String txsmts=null;
	ls_sql="select hdm_hfwt.wtbh,wtmc,sfkdx,yxbz,fbsj,sftxsm,txsmts ";
	ls_sql+=" from  hdm_hfwt,hdm_hfwtsz";
	ls_sql+=" where  hdm_hfwt.wtbh=hdm_hfwtsz.wtbh and hdm_hfwt.yxbz='Y' and hdm_hfwtsz.hflxbm='"+hflxbm+"'";
	ls_sql+=" order by wtbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));//是否可多选 ,1：多选；2：单选；3：写说明
		yxbz=cf.fillNull(rs.getString("yxbz"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		sftxsm=cf.fillNull(rs.getString("sftxsm"));//Y：允许；N：不允许
		txsmts=cf.fillNull(rs.getString("txsmts"));

		//保存答案
		if (sfkdx.equals("1") || sfkdx.equals("2"))//1：多选；2：单选；3：写说明
		{
			String[] khdabh=request.getParameterValues("wtbh"+wtbh);

			//插入客户调查表
			if (khdabh!=null)
			{
				for (int i=0;i<khdabh.length ;i++ )
				{
					ls_sql="insert into hf_khwtda (khbh,hflxbm,wtbh,wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,dasm,lrr,lrsj)";
					ls_sql+=" select ?,?,hdm_hfwtda.wtbh,hdm_hfwtda.wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,?,?,TRUNC(SYSDATE) ";
					ls_sql+=" from  hdm_hfwtda,hdm_hfwt";
					ls_sql+=" where  hdm_hfwtda.wtbh=hdm_hfwt.wtbh";
					ls_sql+=" and  hdm_hfwtda.wtbh="+wtbh+" and hdm_hfwtda.dabh="+khdabh[i];
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khbh);
					ps2.setString(2,hflxbm);
					ps2.setString(3,"");
					ps2.setString(4,lrr);
					ps2.executeUpdate();
					ps2.close();
				}
			}

			if (sftxsm.equals("Y"))//是否允许填写说明
			{
				String bcsm=null;
				bcsm=cf.GB2Uni(request.getParameter("w"+wtbh));
				if (bcsm!=null && !bcsm.equals(""))
				{
					ls_sql="insert into hf_wtbcsm (khbh,hflxbm,wtbh,wtmc,txsmts,bcsm,lrr,lrsj)";
					ls_sql+=" select ?,?,wtbh,wtmc,txsmts,?,?,TRUNC(SYSDATE) ";
					ls_sql+=" from  hdm_hfwt";
					ls_sql+=" where  hdm_hfwt.wtbh="+wtbh;
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khbh);
					ps2.setString(2,hflxbm);
					ps2.setString(3,bcsm);
					ps2.setString(4,lrr);
					ps2.executeUpdate();
					ps2.close();
				}
			}
		}
		else
		{
			String bcsm=null;
			bcsm=cf.GB2Uni(request.getParameter("wtbh"+wtbh));
			if (bcsm!=null && !bcsm.equals(""))
			{
				ls_sql="insert into hf_wtbcsm (khbh,hflxbm,wtbh,wtmc,txsmts,bcsm,lrr,lrsj)";
				ls_sql+=" select ?,?,wtbh,wtmc,txsmts,?,?,TRUNC(SYSDATE) ";
				ls_sql+=" from  hdm_hfwt";
				ls_sql+=" where  hdm_hfwt.wtbh="+wtbh;
				ps2= conn.prepareStatement(ls_sql);
				ps2.setString(1,khbh);
				ps2.setString(2,hflxbm);
				ps2.setString(3,bcsm);
				ps2.setString(4,lrr);
				ps2.executeUpdate();
				ps2.close();
			}

		}

		
		//保存答案说明
		String dabh=null;
		String damc=null;
		String sfyxsm=null;//是否允许填写说明
		ls_sql="select dabh,damc,sfyxsm";
		ls_sql+=" from  hdm_hfwtda";
		ls_sql+=" where  wtbh="+wtbh;
		ls_sql+=" order by dabh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			dabh=cf.fillNull(rs1.getString("dabh"));
			damc=cf.fillNull(rs1.getString("damc"));
			sfyxsm=cf.fillNull(rs1.getString("sfyxsm"));//Y：允许；N：不允许


//			out.println("w"+wtbh+"d"+dabh);

			if (sfyxsm.equals("Y"))//是否允许填写说明
			{
				String khdasm=cf.GB2Uni(request.getParameter("w"+wtbh+"d"+dabh));

				count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  hf_khwtda";
				ls_sql+=" where  khbh='"+khbh+"' and wtbh="+wtbh+" and dabh="+dabh;
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					count=rs2.getInt(1);
				}
				rs2.close();
				ps2.close();

				if (count>0)//被选择，要录入答案说明
				{
					if (khdasm==null || khdasm.equals(""))
					{
						if (!sfkdx.equals("3"))
						{
							conn.rollback();
							out.println("错误！『"+wtmc+"』的答案『"+damc+"』未录入【说明】");
							return;
						}
					}
					else{
						ls_sql="update hf_khwtda set dasm=?";
						ls_sql+=" where  khbh='"+khbh+"' and wtbh="+wtbh+" and dabh="+dabh;
						ps2= conn.prepareStatement(ls_sql);
						ps2.setString(1,khdasm);
						ps2.executeUpdate();
						ps2.close();
					}
				}
				else{//未被选择，不能录入答案说明
					if (khdasm!=null && !khdasm.equals(""))
					{
						conn.rollback();
						out.println("错误！『"+wtmc+"』的答案『"+damc+"』未被选择，不能录入【说明】");
						return;
					}
				}

			}
		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

	//客户调查表---------------------------结束

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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>