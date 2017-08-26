<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] pjxmstr=request.getParameterValues("pjxm");

String yjdz=null;
String yb=null;
String sjr=null;
String dh=null;
String bz=null;

yjdz=cf.GB2Uni(request.getParameter("yjdz"));
yb=cf.GB2Uni(request.getParameter("yb"));
sjr=cf.GB2Uni(request.getParameter("sjr"));
dh=cf.GB2Uni(request.getParameter("dh"));
bz=cf.GB2Uni(request.getParameter("bz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	
	//保单信息
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_bdxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (!sjr.equals(""))
	{
		if (count>0)
		{
			ls_sql="update crm_bdxx set yjdz=?,yb=?,sjr=?,dh=?,bz=?,lrr=?,lrsj=TRUNC(SYSDATE) ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yjdz);
			ps.setString(2,yb);
			ps.setString(3,sjr);
			ps.setString(4,dh);
			ps.setString(5,bz);
			ps.setString(6,yhmc);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into crm_bdxx ( khbh,yjdz,yb,sjr,dh,bz,lrr,lrsj ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,TRUNC(SYSDATE) ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,yjdz);
			ps.setString(3,yb);
			ps.setString(4,sjr);
			ps.setString(5,dh);
			ps.setString(6,bz);
			ps.setString(7,yhmc);
			ps.executeUpdate();
			ps.close();
		}
	}


	//客户评价表+++++++++++++++++++开始
	ls_sql="delete from crm_khpjb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	String spjrybm=null;
	String spjry=null;
	String xmflbm=null;
	String xmfl=null;
	String pjxmbm=null;
	String pjxm=null;
	String xsfs=null;
	ls_sql="select spjrybm,spjry,xmflbm,xmfl,pjxmbm,pjxm,xsfs";
	ls_sql+=" from  crm_pjxmbm";
	ls_sql+=" order by pjxmbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		spjrybm=cf.fillNull(rs1.getString("spjrybm"));
		spjry=cf.fillNull(rs1.getString("spjry"));
		xmflbm=cf.fillNull(rs1.getString("xmflbm"));
		xmfl=cf.fillNull(rs1.getString("xmfl"));
		pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
		pjxm=cf.fillNull(rs1.getString("pjxm"));
		xsfs=cf.fillNull(rs1.getString("xsfs"));


		String pjjgbm=null;
		String pjjg=null;
		if (xsfs.equals("1"))//1：项目分类多选；2：项目分类单选
		{
			pjjgbm=cf.GB2Uni(request.getParameter("pjxmbm"+pjxmbm));

			if (pjjgbm.equals("1"))
			{
				pjjg="√";
			}
			else if (pjjgbm.equals("2"))
			{
				pjjg="×";
			}
			else
			{
				pjjg="空";
			}

			ls_sql="insert into crm_khpjb (khbh,pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh,pjjgbm,pjjg,lrr,lrsj) ";
			ls_sql+=" select ?,pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh,?,?,?,TRUNC(SYSDATE) ";
			ls_sql+=" from crm_pjxmbm";
			ls_sql+=" where pjxmbm='"+pjxmbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,pjjgbm);//1：同意；2：不同意；9：空
			ps.setString(3,pjjg);
			ps.setString(4,yhmc);
			ps.executeUpdate();
			ps.close();
		}
		else{
			pjjgbm=cf.GB2Uni(request.getParameter("xmflbm"+spjrybm+xmflbm));

			if (pjjgbm==null || pjjgbm.equals(""))
			{
				conn.rollback();
				out.println("错误！["+spjry+"]的["+xmfl+"]没有选择");
				return;
			}
			else if (pjjgbm.equals(pjxmbm))
			{
				pjjgbm="1";
			}
			else{
				pjjgbm="2";
			}

			if (pjjgbm.equals("1"))
			{
				pjjg="√";

				ls_sql="insert into crm_khpjb (khbh,pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh,pjjgbm,pjjg,lrr,lrsj) ";
				ls_sql+=" select ?,pjxmbm,pjxm,spjrybm,spjry,xmflbm,xmfl,xsfs,xh,?,?,?,TRUNC(SYSDATE) ";
				ls_sql+=" from crm_pjxmbm";
				ls_sql+=" where pjxmbm='"+pjxmbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,pjjgbm);//1：同意；2：不同意；9：空
				ps.setString(3,pjjg);
				ps.setString(4,yhmc);
				ps.executeUpdate();
				ps.close();
			}

		}

	}
	rs1.close();
	ps1.close();

	//客户评价表---------------------------结束

	//客户调查表+++++++++++++++++++开始

	ls_sql="delete from crm_khdcb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//取每个问题
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbsj=null;
	ls_sql="select wtbh,wtmc,sfkdx,yxbz,fbsj ";
	ls_sql+=" from  crm_khdcwt";
	ls_sql+=" where  yxbz='Y'";
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

		//保存答案
		if (sfkdx.equals("1") || sfkdx.equals("2"))//1：多选；2：单选；3：写说明
		{
			String[] khdabh=request.getParameterValues("wtbh"+wtbh);

			//插入客户调查表
			if (khdabh!=null)
			{
				for (int i=0;i<khdabh.length ;i++ )
				{
					ls_sql="insert into crm_khdcb (khbh,wtbh,wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,dasm,lrr,lrsj)";
					ls_sql+=" select ?,crm_khdcwtda.wtbh,crm_khdcwtda.wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,?,?,TRUNC(SYSDATE) ";
					ls_sql+=" from  crm_khdcwtda,crm_khdcwt";
					ls_sql+=" where  crm_khdcwtda.wtbh=crm_khdcwt.wtbh";
					ls_sql+=" and  crm_khdcwtda.wtbh="+wtbh+" and crm_khdcwtda.dabh="+khdabh[i];
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khbh);
					ps2.setString(2,"");
					ps2.setString(3,yhmc);
					ps2.executeUpdate();
					ps2.close();
				}
			}
		}
		else
		{
			ls_sql="insert into crm_khdcb (khbh,wtbh,wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,dasm,lrr,lrsj)";
			ls_sql+=" select ?,crm_khdcwtda.wtbh,crm_khdcwtda.wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,?,?,TRUNC(SYSDATE) ";
			ls_sql+=" from  crm_khdcwtda,crm_khdcwt";
			ls_sql+=" where  crm_khdcwtda.wtbh=crm_khdcwt.wtbh";
			ls_sql+=" and  crm_khdcwtda.wtbh="+wtbh;
			ps2= conn.prepareStatement(ls_sql);
			ps2.setString(1,khbh);
			ps2.setString(2,"");
			ps2.setString(3,yhmc);
			ps2.executeUpdate();
			ps2.close();
		}

		
		//保存答案说明
		String dabh=null;
		String damc=null;
		String sfyxsm=null;
		ls_sql="select dabh,damc,sfyxsm";
		ls_sql+=" from  crm_khdcwtda";
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

			if (sfyxsm.equals("Y"))
			{
				String khdasm=cf.GB2Uni(request.getParameter("w"+wtbh+"d"+dabh));

				count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  crm_khdcb";
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
						ls_sql="update crm_khdcb set dasm=?";
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