<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc="触摸屏";


String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] pjxmbm=request.getParameterValues("pjxmbm");
String[] pjxm=request.getParameterValues("pjxm");

String[] wtbh=request.getParameterValues("wtbh");
String[] wtmc=request.getParameterValues("wtmc");

if (pjxmbm==null)
{
	response.sendRedirect("note.jsp");
}

if (khbh==null || khbh.equals(""))
{
	response.sendRedirect("note.jsp");
}


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
	
	ls_sql="delete from cmp_khpjb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="delete from cmp_khdcb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//客户评价表+++++++++++++++++++开始
	int xh=0;
	for (int i=0;i<pjxmbm.length ;i++ )
	{
		String pjjgbm=null;
		String pjjg=null;

		pjjgbm=request.getParameter("pjxmbm"+(i+1));

		if (pjjgbm==null || pjjgbm.equals(""))
		{
			conn.rollback();
			out.println("完成失败！第"+(i+1)+"项【"+cf.GB2Uni(pjxm[i])+"】没有选择");
			return;
		}
		else if (pjjgbm.equals("1"))
		{
			pjjg="满意";
		}
		else if (pjjgbm.equals("2"))
		{
			pjjg="一般";
		}
		else
		{
			pjjg="不满意";
		}

		ls_sql="insert into cmp_khpjb (khbh,pjxmbm,pjxm,xmflbm,xmfl,xsfs,xh,pjjgbm,pjjg,lrr,lrsj,sfkp) ";
		ls_sql+=" select ?,pjxmbm,pjxm,xmflbm,xmfl,xsfs,xh,?,?,?,TRUNC(SYSDATE),'N' ";
		ls_sql+=" from cmp_pjxmbm";
		ls_sql+=" where pjxmbm='"+pjxmbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,pjjgbm);//1：满意；2：一般；3：不满意
		ps.setString(3,pjjg);
		ps.setString(4,yhmc);
		ps.executeUpdate();
		ps.close();
	}

	//客户评价表---------------------------结束

	//客户调查表+++++++++++++++++++开始
	//取每个问题
	if (wtbh!=null)
	{
		for (int i=0;i<wtbh.length ;i++ )
		{
			//保存答案
			String[] khdabh=request.getParameterValues("wtbh"+(i+1));

			//插入客户调查表
			if (khdabh!=null)
			{
				for (int j=0;j<khdabh.length ;j++ )
				{
					ls_sql="insert into cmp_khdcb (khbh,wtbh,wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,dasm,lrr,lrsj)";
					ls_sql+=" select ?,cmp_dcwtda.wtbh,cmp_dcwtda.wtmc,sfkdx,yxbz,fbr,fbsj,dabh,damc,sfyxsm,?,?,TRUNC(SYSDATE) ";
					ls_sql+=" from  cmp_dcwtda,cmp_dcwt";
					ls_sql+=" where  cmp_dcwtda.wtbh=cmp_dcwt.wtbh";
					ls_sql+=" and  cmp_dcwtda.wtbh="+wtbh[i]+" and cmp_dcwtda.dabh="+khdabh[j];
					ps2= conn.prepareStatement(ls_sql);
					ps2.setString(1,khbh);
					ps2.setString(2,"");
					ps2.setString(3,yhmc);
					ps2.executeUpdate();
					ps2.close();
				}
			}
			else{
				conn.rollback();
				out.println("完成失败！第"+(i+1)+"个问题【"+cf.GB2Uni(wtmc[i])+"】没有选择");
				return;
			}
		}
	}


	//客户调查表---------------------------结束
	
	ls_sql="update cmp_cmpjl set cmpzt='2',sjtxsj=SYSDATE";
	ls_sql+=" where khbh='"+khbh+"' and cmpzt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set cmpzt=2";//0：未授权；1：等待填写；2：已填写
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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