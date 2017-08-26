<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] cldlbm =request.getParameterValues("cldlbm");
String[] clxlbm =request.getParameterValues("clxlbm");
String[] nbbm =request.getParameterValues("nbbm");
String[] clmc =request.getParameterValues("clmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] bzjldwbm =request.getParameterValues("bzjldwbm");
String[] bzgg =request.getParameterValues("bzgg");
String[] djzl =request.getParameterValues("djzl");
String[] clcd =request.getParameterValues("clcd");
String[] clkd =request.getParameterValues("clkd");
String[] clgd =request.getParameterValues("clgd");
String[] cgzq =request.getParameterValues("cgzq");
String[] bzq =request.getParameterValues("bzq");
String[] bztxq =request.getParameterValues("bztxq");
String[] ppmc =request.getParameterValues("ppmc");
String[] cglb =request.getParameterValues("cglb");
String[] bz =request.getParameterValues("bz");
String[] cbj =request.getParameterValues("cbj");
String[] dfgsjg =request.getParameterValues("dfgsjg");
String[] dgzjg =request.getParameterValues("dgzjg");
String[] xsfs =request.getParameterValues("xsfs");
String[] zxqdl =request.getParameterValues("zxqdl");
String[] sfcy =request.getParameterValues("sfcy");
String[] gysmc =request.getParameterValues("gysmc");
String dqbm=request.getParameter("dqbm");//地区编码



//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接


	//检查系统初始化内容
	String nbbmsfwy=null;
	sql=" select nbbmsfwy " ;
	sql+=" from jxc_xtcsh " ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		nbbmsfwy=cf.fillNull(rs.getString("nbbmsfwy"));
	}
	else
	{
		rs.close();
		ps.close();
		out.println("<BR>！！！错误，您还没有对系统进行初始化，请先初始化系统！");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	//生成材料编码
	int count=0;
	sql="select NVL(max(SUBSTR(clbm,3,11)),0)";
	sql+=" from  jxc_clbm";
	sql+=" where cllb='1'";//0：主材；1：辅材
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<nbbm.length ;i++ )
	{
		//查询内部编码
		if (nbbmsfwy.equals("Y"))//Y：唯一；N：不唯一；M：不启用
		{
			if (nbbm[i].equals(""))
			{
				out.println("<BR>！！错误，[内部编码]不能为空");
				return;
			}

			sql=" select nbbm " ;
			sql+=" from jxc_clbm " ;
			sql+=" where nbbm='"+nbbm[i]+"' and cllb='1'" ;//0：主材；1：辅材
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				out.println("<BR>！！！错误，[内部编码"+nbbm[i]+"]已经存在");

				rs.close();
				ps.close();
				return;
			}
			rs.close();
			ps.close();
		}
		else if (nbbmsfwy.equals("N"))//Y：唯一；N：不唯一；M：不启用
		{
			if (nbbm[i].equals(""))
			{
				out.println("<BR>！！错误，[内部编码]不能为空");
				return;
			}
		}

		count++;
		String clbm="FC"+cf.addZero(count,11);

		String zp=clbm+".jpg";

		String cllb="1";//0：代销品主材；1：辅材；2：库存品主材
		String scsmc="1";

		sql ="insert into jxc_clbm (clbm,nbbm,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,xh,gg ";
		sql+=" ,jldwbm,bzjldwbm,bzgg,cglb,cgzq,djzl,bzq,bztxq,clcd,clkd   ,clgd,zp,lrr,lrsj,lrbm,bz)";
		sql+=" values('"+clbm+"','"+nbbm[i]+"','"+cf.GB2Uni(clmc[i])+"','"+cllb+"','"+cf.GB2Uni(cldlbm[i])+"','"+cf.GB2Uni(clxlbm[i])+"','"+scsmc+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(jldwbm[i])+"','"+cf.GB2Uni(bzjldwbm[i])+"','"+bzgg[i]+"','"+cglb[i]+"','"+cgzq[i]+"','"+djzl[i]+"','"+bzq[i]+"','"+bztxq[i]+"','"+clcd[i]+"','"+clkd[i]+"'";
		sql+=" ,'"+clgd[i]+"','"+zp+"','"+yhmc+"',TRUNC(SYSDATE),'"+lrbm+"','"+cf.GB2Uni(bz[i])+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		//初始化材料价格明细（cl_jgmx）


		sql=" delete from jxc_cljgb  ";
		sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		sql=" insert into jxc_cljgb (clbm,dqbm,gysmc,sftjcp,sfyh,cbj,jsbl,jqpjcbj,lsj,xsj  ";
		sql+=" ,dfgsjg,dgzjg,zxqdl,sfcy,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj ";
		sql+=" ,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
		sql+=" ,lrr,lrsj,lrbm,ssfgs,jsfs,zdxsj,yjjrbl,cxyjjrbl,zdkcsl,zdkcje,cllb) ";
		sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,SYSDATE,?,?,'1',0,0,0,0,0,? ) ";
		ps= conn.prepareStatement(sql);
		ps.setString(1,clbm);
		ps.setString(2,dqbm);
		ps.setString(3,cf.GB2Uni(gysmc[i]));
		ps.setString(4,"N");
		ps.setString(5,"Y");
		ps.setString(6,cbj[i]);
		ps.setDouble(7,0);
		ps.setDouble(8,0);
		ps.setDouble(9,0);
		ps.setDouble(10,0);

		ps.setString(11,dfgsjg[i]);
		ps.setString(12,dgzjg[i]);
		ps.setString(13,zxqdl[i]);
		ps.setString(14,sfcy[i]);
		ps.setDouble(15,0);
		ps.setDouble(16,0);
		ps.setString(17,"N");
		ps.setString(18,"");
		ps.setString(19,"");
		ps.setDouble(20,0);

		ps.setDouble(21,0);
		ps.setDouble(22,0);
		ps.setDouble(23,0);
		ps.setDouble(24,0);
		ps.setString(25,xsfs[i]);
		ps.setDouble(26,0);
		ps.setDouble(27,0);
		ps.setDouble(28,0);
		ps.setDouble(29,0);
		ps.setDouble(30,0);

		ps.setString(31,yhmc);
		ps.setString(32,lrbm);
		ps.setString(33,ssfgs);
		ps.setString(34,cllb);
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
	out.print("<BR>sql=" + sql);
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
