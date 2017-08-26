<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] slStr=request.getParameterValues("sl");
String[] zqdjStr=request.getParameterValues("zqdj");
String[] djStr=request.getParameterValues("dj");
String[] cbjStr=request.getParameterValues("cbj");
String[] ycfStr=request.getParameterValues("ycf");
String[] qtfy=request.getParameterValues("qtfy");
String[] qtfyjeStr=request.getParameterValues("qtfyje");

String count=request.getParameter("count");
String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xh");

if (xh==null)
{
	return;
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	conn.setAutoCommit(false);

	ls_sql =" update crm_khxx set khjsbz='Y'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	if (Integer.parseInt(count)>0)
	{
		for (int i=0;i<xh.length ;i++ )
		{
			double sl=0;
			sl=Double.parseDouble(slStr[i]);
			double zqdj=0;
			zqdj=Double.parseDouble(zqdjStr[i]);
			double dj=0;
			dj=Double.parseDouble(djStr[i]);
			double cbj=0;
			cbj=Double.parseDouble(cbjStr[i]);
			double ycf=0;
			ycf=Double.parseDouble(ycfStr[i]);
			double qtfyje=0;
			qtfyje=Double.parseDouble(qtfyjeStr[i]);

			double zqje=cf.round(zqdj*sl,2);
			double je=cf.round(dj*sl,2);
			double dpzk=0;

			if (zqdj==0)
			{
				dpzk=10;
			}
			else{
				dpzk=cf.round(dj*10/zqdj,2);
			}

			ls_sql =" update bj_khzcmxnew set zqdj=?,dpzk=?,dj=?,cbj=?,sl=?,zqje=?,je=?,ycf=?,qtfy=?,qtfyje=?,lrr=?,lrsj=SYSDATE";
			ls_sql+=" where xh="+xh[i];
			ls_sql+=" and khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,zqdj);
			ps.setDouble(2,dpzk);
			ps.setDouble(3,dj);
			ps.setDouble(4,cbj);
			ps.setDouble(5,sl);
			ps.setDouble(6,zqje);
			ps.setDouble(7,je);
			ps.setDouble(8,ycf);
			ps.setString(9,qtfy[i]);
			ps.setDouble(10,qtfyje);
			ps.setString(11,yhmc);
			ps.executeUpdate();
			ps.close();

		}
	}
	else{
		ls_sql =" delete FROM bj_khzcmxnew";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int getxh=0;
		ls_sql="select NVL(max(xh),0)";
		ls_sql+=" from  bj_khzcmxnew";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			getxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		for (int i=0;i<xh.length ;i++ )
		{
			double sl=0;
			sl=Double.parseDouble(slStr[i]);
			double zqdj=0;
			zqdj=Double.parseDouble(zqdjStr[i]);
			double dj=0;
			dj=Double.parseDouble(djStr[i]);
			double cbj=0;
			cbj=Double.parseDouble(cbjStr[i]);
			double ycf=0;
			ycf=Double.parseDouble(ycfStr[i]);
			double qtfyje=0;
			qtfyje=Double.parseDouble(qtfyjeStr[i]);

			getxh++;

			double zqje=cf.round(zqdj*sl,2);
			double je=cf.round(dj*sl,2);
			double dpzk=0;

			if (zqdj==0)
			{
				dpzk=10;
			}
			else{
				dpzk=cf.round(dj*10/zqdj,2);
			}

			ls_sql =" insert into bj_khzcmxnew (xh,khbh,zcbm,xsxh,zcmc,zcdlbm,zcxlbm,ppbm,gys,ppmc,zclbbm,xinghao,gg,zcysbm,cz,zdxsj,zcpzwzbm,xzjg,jldwbm,zqdj,dpzk,dj,sfzp,zsdj,jgfs,jsfs,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,sxbz,sxhtyy,sftjp,fjddbh,ddmxxh,lrr,lrsj   ,bz)  ";
			ls_sql+=" select                    ? ,khbh,zcbm,xsxh,zcmc,zcdlbm,zcxlbm,ppbm,gys,ppmc,zclbbm,xinghao,gg,zcysbm,cz,zdxsj,zcpzwzbm,xzjg,jldwbm,?   ,?   ,? ,sfzp,zsdj,jgfs,jsfs,?  ,jsbl,? ,?   ,? ,?  ,?   ,?     ,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,sxbz,sxhtyy,sftjp,fjddbh,ddmxxh,?  ,SYSDATE,bz  ";
			ls_sql+=" from bj_khzcmx";
			ls_sql+=" where xh="+xh[i];
			ls_sql+=" and khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,getxh);
			ps.setDouble(2,zqdj);
			ps.setDouble(3,dpzk);
			ps.setDouble(4,dj);
			ps.setDouble(5,cbj);
			ps.setDouble(6,sl);
			ps.setDouble(7,zqje);
			ps.setDouble(8,je);
			ps.setDouble(9,ycf);
			ps.setString(10,qtfy[i]);
			ps.setDouble(11,qtfyje);
			ps.setString(12,yhmc);
			ps.executeUpdate();
			ps.close();

		}
	}
	


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
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