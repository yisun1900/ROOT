<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] dqbm =request.getParameterValues("dqbm");
String[] clbm =request.getParameterValues("clbm");

String[] scph =request.getParameterValues("scph");
String[] scrq =request.getParameterValues("scrq");
String[] ckbh =request.getParameterValues("ckbh");
String[] hjbh =request.getParameterValues("hjbh");
String[] clgd =request.getParameterValues("clgd");

String[] hwbh =request.getParameterValues("hwbh");
String[] kcsl =request.getParameterValues("kcsl");
String[] rkj =request.getParameterValues("rkj");
String[] kcje =request.getParameterValues("kcje");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接



	conn.setAutoCommit(false);


	//产生主键流水号
	int maxlsh=0;
	ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
	ls_sql+=" from jxc_kcb ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())//库存有货 直接更新数量
	{
		maxlsh=rs.getInt("lsh");
	}
	rs.close();
	ps.close();

	jxc.JxcClass jxc=new jxc.JxcClass();
	
	for (int i=0;i<clbm.length ;i++ )
	{
		maxlsh++;

		ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
		ls_sql+=" ,clbm,zljb,clzk,rkph,rkxh,rksj,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj  ,lsj,xsj,dfgsjg,dgzjg,ztbz) ";
		ls_sql+=" select '"+maxlsh+"',jxc_clbm.clmc,cllb,jxc_clbm.cldlbm,jxc_clbm.clxlbm,scsmc,jxc_clbm.ppmc,gysmc,cllbbm,jxc_clbm.xh,jxc_clbm.nbbm,jxc_clbm.gg,clysbm,djzl,jxc_clbm.jldwbm,bzgg,bzjldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,jxc_clbm.bz ";
		ls_sql+=" ,jxc_clbm.clbm,'1',10,'','','','"+scph[i]+"',TO_DATE('"+scrq[i]+"','YYYY-MM-DD'),'"+hwbh[i]+"','"+hjbh[i]+"','"+ckbh[i]+"','"+dqbm[i]+"',"+rkj[i]+","+kcsl[i]+","+kcje[i]+",0  ,0,0,0,0,'N'";
		ls_sql+=" from jxc_cljgb,jxc_clbm ";
		ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm ";
		ls_sql+=" and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//修改:库存数
		double zcpzsl=0;
		double ccpzsl=0;
		double bfpzsl=0;

		ls_sql=" select sum(kcsl)";
		ls_sql+=" from jxc_kcb ";
		ls_sql+=" where clbm='"+clbm[i]+"' and dqbm='"+dqbm[i]+"' and zljb='1'";//1：正常品；2：残次品；3：报废品
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			zcpzsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select sum(kcsl)";
		ls_sql+=" from jxc_kcb ";
		ls_sql+=" where clbm='"+clbm[i]+"' and dqbm='"+dqbm[i]+"' and zljb='2'";//1：正常品；2：残次品；3：报废品
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			ccpzsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql=" select sum(kcsl)";
		ls_sql+=" from jxc_kcb ";
		ls_sql+=" where clbm='"+clbm[i]+"' and dqbm='"+dqbm[i]+"' and zljb='3'";//1：正常品；2：残次品；3：报废品
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			bfpzsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql=" update jxc_cljgb set zcpzsl=zcpzsl+"+zcpzsl+",ccpzsl=ccpzsl+"+ccpzsl+",bfpzsl=bfpzsl+"+bfpzsl;
		ls_sql+=" where dqbm='"+dqbm[i]+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		jxc.JsJqpjcbj(conn,dqbm[i],clbm[i]);
	
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
	out.print("<BR>ls_sql=" + ls_sql);
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
