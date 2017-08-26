<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String psph=request.getParameter("psph");


String[] clbm=request.getParameterValues("clbm");
String[] psslstr=request.getParameterValues("pssl");
double pssl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	String ssfgs=null;
	ls_sql=" SELECT psdzt,ssfgs ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("0") && !psdzt.equals("6"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：审核未通过；7：作废；
	{
		out.print("错误！材料单["+psph+"]已提交，不能再修改！");
		return;
	}

	String fccbj="";//1：入库价；2：加权平均价
	ls_sql=" SELECT fccbj ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fccbj=cf.fillNull(rs.getString("fccbj"));
	}
	rs.close();
	ps.close();

	//查询最大数量
	int psxh=0;
	ls_sql="select NVL(max(psxh),0)";
	ls_sql+=" from  jxc_clpsmx";
	ls_sql+=" where psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		if (psslstr[i]==null || psslstr[i].trim().equals(""))
		{
			ls_sql="delete from jxc_clpsmx ";
			ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		pssl = Double.parseDouble(psslstr[i].trim());
		if (pssl==0)
		{
			ls_sql="delete from jxc_clpsmx ";
			ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		String xsfs="";
		double zcpzsl=0;
		double dhsl=0;
		ls_sql="select xsfs,zcpzsl,dhsl";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xsfs=cf.fillNull(rs.getString("xsfs"));
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
		}
		rs.close();
		ps.close();

		if (xsfs.equals("2"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			if (pssl > (zcpzsl-dhsl))
			{
				conn.rollback();
				out.println("错误！现货销售，【开单数量"+pssl+"】不能大于【可订货数量"+(zcpzsl-dhsl)+"】，可订货数量＝正常品库存－订货");
				return;
			}
		}

		//查询是否已存在
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and psph='"+psph+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			psxh++;
			if (fccbj.equals("2"))//1：入库价；2：加权平均价
			{
				ls_sql="insert into jxc_clpsmx (psph,clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dj,ppmc,gysmc,cldlbm,clxlbm,sqpssl,pssl,psje,cksl,psxh,xsfs)";
				ls_sql+=" select ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,jqpjcbj,dgzjg,ppmc,gysmc,cldlbm,clxlbm,?,?,dgzjg*?,0,?,? ";
				ls_sql+=" from  jxc_cljgb,jxc_clbm";
				ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
				ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,psph);
				ps.setDouble(2,pssl);
				ps.setDouble(3,pssl);
				ps.setDouble(4,pssl);
				ps.setInt(5,psxh);
				ps.setString(6,xsfs);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into jxc_clpsmx (psph,clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dj,ppmc,gysmc,cldlbm,clxlbm,sqpssl,pssl,psje,cksl,psxh,xsfs)";
				ls_sql+=" select ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dgzjg,ppmc,gysmc,cldlbm,clxlbm,?,?,dgzjg*?,0,?,? ";
				ls_sql+=" from  jxc_cljgb,jxc_clbm";
				ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
				ls_sql+=" and  jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,psph);
				ps.setDouble(2,pssl);
				ps.setDouble(3,pssl);
				ps.setDouble(4,pssl);
				ps.setInt(5,psxh);
				ps.setString(6,xsfs);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			ls_sql="update jxc_clpsmx set sqpssl=?,pssl=?,psje=dj*?";
			ls_sql+=" where clbm='"+clbm[i]+"'  and psph='"+psph+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,pssl);
			ps.setDouble(2,pssl);
			ps.setDouble(3,pssl);
			ps.executeUpdate();
			ps.close();
		}
	}

	double pszsl=0;
	double pszje=0;
	double cbze=0;
	ls_sql=" SELECT sum(pssl),sum(psje),sum(cbj*pssl) ";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszsl=rs.getDouble(1);
		pszje=rs.getDouble(2);
		cbze=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql="update jxc_clpsd set pszsl="+pszsl+",pszje="+pszje+",cbze="+cbze;
	ls_sql+=" where psph='"+psph+"'";
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