<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String dqbm = request.getParameter("dqbm");


String[] xuhao =request.getParameterValues("xuhao");
String[] scsmc =request.getParameterValues("scsmc");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");

String[] clbm =request.getParameterValues("clbm");
String[] nbbm =request.getParameterValues("nbbm");

String[] clmc =request.getParameterValues("clmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] lsjstr =request.getParameterValues("lsj");
String[] xsjstr =request.getParameterValues("xsj");

String[] cbjstr =request.getParameterValues("cbj");
String[] jsblstr =request.getParameterValues("jsbl");
String[] cxhdblstr =request.getParameterValues("cxhdbl");
String[] sfycx =request.getParameterValues("sfycx");
String[] cxkssjstr =request.getParameterValues("cxkssj");
String[] cxjzsjstr =request.getParameterValues("cxjzsj");
String[] cxjstr =request.getParameterValues("cxj");
String[] cxcbjstr =request.getParameterValues("cxcbj");
String[] lscxhdblstr =request.getParameterValues("lscxhdbl");


String[] sfyh =request.getParameterValues("sfyh");

String[] sftjcp =request.getParameterValues("sftjcp");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加主材报价，操作人："+yhmc);



	conn.setAutoCommit(false);

	for (i=0;i<clbm.length ;i++ )
	{
		double lsj=0;
		double xsj=0;
		double cbj=0;
		double jsbl=0;
		double cxhdbl=0;
		java.sql.Date cxkssj=null;
		java.sql.Date cxjzsj=null;
		double cxj=0;
		double cxcbj=0;
		double lscxhdbl=0;
		int pjts=0;

		//市场标价
		lsj=0;
		if (lsjstr[i]!=null && !lsjstr[i].equals(""))
		{
			lsj=Double.parseDouble(lsjstr[i]);
		}
		//销售价
		xsj=0;
		if (xsjstr[i]!=null && !xsjstr[i].equals(""))
		{
			xsj=Double.parseDouble(xsjstr[i]);
		}
		//结算价
		cbj=0;
		if (cbjstr[i]!=null && !cbjstr[i].equals(""))
		{
			cbj=Double.parseDouble(cbjstr[i]);
		}
		//结算比例
		jsbl=0;
		if (jsblstr[i]!=null && !jsblstr[i].equals(""))
		{
			jsbl=Double.parseDouble(jsblstr[i]);
		}
		//计入活动比例
		cxhdbl=0;
		if (cxhdblstr[i]!=null && !cxhdblstr[i].equals(""))
		{
			cxhdbl=Double.parseDouble(cxhdblstr[i]);
		}


		//促销价
		cxj=0;
		if (cxjstr[i]!=null && !cxjstr[i].equals(""))
		{
			cxj=Double.parseDouble(cxjstr[i]);
		}
		//促销结算价
		cxcbj=0;
		if (cxcbjstr[i]!=null && !cxcbjstr[i].equals(""))
		{
			cxcbj=Double.parseDouble(cxcbjstr[i]);
		}
		//促销期计入活动比例
		lscxhdbl=0;
		if (lscxhdblstr[i]!=null && !lscxhdblstr[i].equals(""))
		{
			lscxhdbl=Double.parseDouble(lscxhdblstr[i]);
		}
		//促销开始时间
		cxkssj=null;
		if (cxkssjstr[i]!=null && !cxkssjstr[i].equals(""))
		{
			cxkssj=java.sql.Date.valueOf(cxkssjstr[i]);
		}
		//促销结束时间
		cxjzsj=null;
		if (cxjzsjstr[i]!=null && !cxjzsjstr[i].equals(""))
		{
			cxjzsj=java.sql.Date.valueOf(cxjzsjstr[i]);
		}

		int count=0;
		sql=" select count(*)" ;
		sql+=" from jxc_cljgb " ;
		sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			sql="update jxc_cljgb set gysmc=?,lsj=?,xsj=?,cbj=?,jsbl=?,cxhdbl=?,sfycx=?,cxkssj=?,cxjzsj=?,cxj=?  ,cxcbj=?,lscxhdbl=?,sfyh=?,sftjcp=? ,lrr=?,lrsj=SYSDATE ";
			sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm[i]+"'" ;
			ps= conn.prepareStatement(sql);
			ps.setString(1,cf.GB2Uni(gysmc[i]));
			ps.setDouble(2,lsj);
			ps.setDouble(3,xsj);
			ps.setDouble(4,cbj);
			ps.setDouble(5,jsbl);
			ps.setDouble(6,cxhdbl);
			ps.setString(7,sfycx[i]);
			ps.setDate(8,cxkssj);
			ps.setDate(9,cxjzsj);
			ps.setDouble(10,cxj);

			ps.setDouble(11,cxcbj);
			ps.setDouble(12,lscxhdbl);
			ps.setString(13,sfyh[i]);
			ps.setString(14,sftjcp[i]);
			ps.setString(15,yhmc);
			ps.executeUpdate();
			ps.close();
		}
		else{
			sql ="insert into jxc_cljgb (clbm,dqbm,gysmc,lsj,xsj,cbj,jsbl,cxhdbl";
			sql+=" ,sfycx,cxkssj,cxjzsj";
			sql+=" ,cxj,cxcbj,lscxhdbl,sfyh,sftjcp";
			sql+=" ,lrr,lrsj,lrbm,ssfgs,dfgsjg,dgzjg,zxqdl,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl)";
			sql+=" values('"+clbm[i]+"','"+dqbm+"','"+cf.GB2Uni(gysmc[i])+"',"+lsj+","+xsj+","+cbj+","+jsbl+","+cxhdbl;
			sql+=" ,'"+sfycx[i]+"',TO_DATE('"+cxkssjstr[i]+"','YYYY-MM-DD')"+",TO_DATE('"+cxjzsjstr[i]+"','YYYY-MM-DD')";
			sql+=" ,"+cxj+","+cxcbj+","+lscxhdbl+",'"+sfyh[i]+"','"+sftjcp[i]+"'";
			sql+=" ,'"+yhmc+"',SYSDATE,'"+lrbm+"','"+ssfgs+"',0,0,0,'3',0,0,0,0,0";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
			sql+="  )";
	//		out.println(sql);
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}





		if (i%200==0)
		{
			System.out.println(xuhao[i]);
		}
	}
	
	conn.commit();

	System.out.println("更新主材报价完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[更新主材报价]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + xuhao[i]);
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
