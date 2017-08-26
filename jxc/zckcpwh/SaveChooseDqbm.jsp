<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="xym" scope="page" class="jxc.xym.Xym"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String ydqbm=request.getParameter("ydqbm");
String[] dqbm = request.getParameterValues("dqbm");
String[] clbm = request.getParameterValues("clbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//检查系统初始化内容

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		for (int j=0;j<dqbm.length ;j++ )
		{
			String ppmc=null;
			ls_sql="select ppmc";
			ls_sql+=" from  jxc_clbm";
			ls_sql+=" where clbm='"+clbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ppmc=rs.getString(1);
			}
			rs.close();
			ps.close();

			int count=0;
			ls_sql="select count(*)";
			ls_sql+=" from  jxc_ppxx";
			ls_sql+=" where ppmc='"+ppmc+"'";
			ls_sql+=" and jxc_ppxx.pplb in('1','3') ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count==0)
			{
				conn.rollback();
				out.println("错误！材料编码["+clbm[i]+"]的子品牌["+ppmc+"]不存在");
				return;
			}


			String gysmc="";
			ls_sql="select jxc_ppgysdzb.gysmc";
			ls_sql+=" FROM jxc_ppgysdzb,jxc_ppxx,jxc_gysxx,sq_dwxx  ";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm ";
			ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
			ls_sql+=" and jxc_ppgysdzb.ssfgs=sq_dwxx.dwbh ";
			ls_sql+=" and jxc_ppxx.pplb='1' ";
			ls_sql+=" and jxc_gysxx.cllx='1' ";
			ls_sql+=" and jxc_ppgysdzb.ppmc='"+ppmc+"' and sq_dwxx.dqbm='"+dqbm[j]+"'";
//			out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gysmc=cf.fillNull(rs.getString(1));
			}
			rs.close();
			ps.close();

			if (gysmc.equals(""))
			{
				conn.rollback();
				out.println("错误！子品牌["+ppmc+"]在地区["+dqbm[j]+"]未建对照关系");
				return;
			}
			
			
			ls_sql="select count(*)";
			ls_sql+=" from  jxc_cljgb";
			ls_sql+=" where clbm='"+clbm[i]+"' and dqbm='"+dqbm[j]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count==0)
			{
				ls_sql=" insert into jxc_cljgb (clbm,dqbm,gysmc,cllb,sftjcp,sfyh,cbj,jsbl,jqpjcbj,lsj,xsj  ";
				ls_sql+=" ,dfgsjg,dgzjg,zxqdl,sfcy,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj ";
				ls_sql+=" ,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
				ls_sql+=" ,lrr,lrsj,lrbm,ssfgs,jsfs,zdxsj,yjjrbl,zdkcsl,zdkcje) ";

				ls_sql+=" select clbm,?,?,cllb,sftjcp,sfyh,cbj,jsbl,jqpjcbj,lsj,xsj  ";
				ls_sql+=" ,dfgsjg,dgzjg,zxqdl,sfcy,cxhdbl,myqjf,sfycx,cxkssj,cxjzsj,cxj ";
				ls_sql+=" ,cxcbj,cxjsbl,lscxhdbl,cxmyqjf,xsfs,0,0,0,0,0 ";
				ls_sql+=" ,?,SYSDATE,?,?,jsfs,zdxsj,yjjrbl,zdkcsl,zdkcje ";
				ls_sql+=" from  jxc_cljgb";
				ls_sql+=" where clbm='"+clbm[i]+"' and dqbm='"+ydqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,dqbm[j]);
				ps.setString(2,gysmc);
				ps.setString(3,lrr);
				ps.setString(4,lrbm);
				ps.setString(5,ssfgs);
				ps.executeUpdate();
				ps.close();
			}



			String ckbh=null;
			String cllb=null;
			double kcsl=0;
			ls_sql="select ckbh,cllb,sum(kcsl) kcsl";
			ls_sql+=" from  jxc_kcb";
			ls_sql+=" where cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
			ls_sql+=" group by ckbh,cllb";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				ckbh=cf.fillNull(rs1.getString("ckbh"));
				cllb=cf.fillNull(rs1.getString("cllb"));
				kcsl=rs1.getDouble("kcsl");

				ls_sql=" update jxc_cljgb set zcpzsl="+kcsl;
				ls_sql+=" where dqbm in() and clbm='"+clbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();


			}
			rs1.close();
			ps1.close();


		}
	}



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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>