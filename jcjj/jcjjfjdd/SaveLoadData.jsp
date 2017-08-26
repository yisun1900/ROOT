<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");

String[] zcpzwzbm =request.getParameterValues("zcpzwzbm");
String[] ppbm =request.getParameterValues("ppbm");
String[] zcmc =request.getParameterValues("zcmc");
String[] xinghao =request.getParameterValues("xinghao");
String[] gg =request.getParameterValues("gg");
String[] jldwbm =request.getParameterValues("jldwbm");

String[] slStr =request.getParameterValues("sl");
String[] zqdjStr =request.getParameterValues("zqdj");
String[] djStr =request.getParameterValues("dj");
String[] cbjStr =request.getParameterValues("cbj");
String[] ycfStr =request.getParameterValues("ycf");

String[] qtfy =request.getParameterValues("qtfy");
String[] qtfyjeStr =request.getParameterValues("qtfyje");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


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

	String ssfgs = null;
	ls_sql="select fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql =" update crm_khxx set khjsbz='Y'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql =" delete from bj_khzcmxnew";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<zcmc.length ;i++ )
	{
		getxh++;

		String gys = null;
		String ppmc = null;
		ls_sql="select scsmc,gysmc ";
		ls_sql+=" from jxc_ppgysdzb,jxc_ppxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
		ls_sql+=" and jxc_ppgysdzb.cllx='1' ";//1：主材；2：辅材；3：通用

		ls_sql+=" and jxc_ppgysdzb.ppmc='"+cf.GB2Uni(ppbm[i])+"'";
		ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppmc = rs.getString("scsmc");			    
			gys = rs.getString("gysmc");			    
		}
		rs.close();
		ps.close();

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

		ls_sql =" insert into bj_khzcmxnew (xh,khbh      ,zcbm,xsxh,zcmc                    ,zcdlbm,zcxlbm,ppbm                    ,gys      ,ppmc      ,zclbbm,xinghao                    ,gg                    ,zcysbm,cz,zdxsj,zcpzwzbm                    ,xzjg,jldwbm                    ,zqdj    ,dpzk    ,dj    ,sfzp,zsdj,jgfs,jsfs,cbj    ,jsbl,sl    ,zqje    ,je    ,ycf    ,qtfy         ,qtfyje    ,cxhdbz,cxhdbl,cxhdje,yjjrbl,yjjrje,sxbz,sxhtyy,sftjp,fjddbh,ddmxxh,lrr       ,lrsj   ,bz)  ";
		ls_sql+=" values(           "+getxh+" ,'"+khbh+"','0' ,''  ,'"+cf.GB2Uni(zcmc[i])+"','0'   ,''    ,'"+cf.GB2Uni(ppbm[i])+"','"+gys+"','"+ppmc+"',''    ,'"+cf.GB2Uni(xinghao[i])+"','"+cf.GB2Uni(gg[i])+"',''    ,'',0    ,'"+cf.GB2Uni(zcpzwzbm[i])+"','0' ,'"+cf.GB2Uni(jldwbm[i])+"',"+zqdj+","+dpzk+","+dj+",''  ,0   ,''  ,'0' ,"+cbj+",0   ,"+sl+","+zqje+","+je+","+ycf+",'"+qtfy[i]+"',"+qtfyje+",'N'   ,0     ,0     ,0     ,0     ,'2' ,''    ,''   ,''    ,''    ,'"+yhmc+"',SYSDATE,'' ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
