<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fcsq=request.getParameter("fcsq");
String khbh=request.getParameter("khbh");
String psph=request.getParameter("psph");
String[] clbm=request.getParameterValues("clbm");
String[] psslStr=request.getParameterValues("pssl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	ls_sql=" SELECT psdzt ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("1"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：已审核；
	{
		out.print("错误！材料单["+psph+"]已审核完成，不能再修改，若想修改请在『材料单－修护审核』中删除审核信息");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		double pssl = Double.parseDouble(psslStr[i]);

		String xsfs="";
		double dhsl=0;
		ls_sql="select xsfs,dhsl";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.ssfgs='"+fcsq+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xsfs=cf.fillNull(rs.getString("xsfs"));
			dhsl=rs.getDouble("dhsl");
		}
		rs.close();
		ps.close();

		double zcpzsl=0;//库存数
		//查询库存信息
		ls_sql = " select sum(kcsl)";
		ls_sql+= " from jxc_kcb ";
		ls_sql +=" where clbm='"+clbm[i]+"' and ckbh in(select ckbh from jxc_ckssfgs where ssfgs='"+fcsq+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			zcpzsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (xsfs.equals("2"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			if (pssl > zcpzsl)
			{
				conn.rollback();
				out.println("错误！现货销售，【开单数量"+pssl+"】不能大于【可订货数量"+zcpzsl+"】，可订货数量＝正常品库存－订货");
				return;
			}
		}

		ls_sql="update jxc_clpsmx set pssl=?,psje=dj*?";
		ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,pssl);
		ps.setDouble(2,pssl);
		ps.executeUpdate();
		ps.close();

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


	//领用是否符合标准检查＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	int mark=0;
    double qye=0;
	String fgsbh=null;
	ls_sql=" select fgsbh,NVL(guanlif,0)+NVL(suijin,0)+qye qye";
    ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

    double sgcbj=0;
    double zxsgcbj=0;
	ls_sql=" select sgcbj,zxsgcbj";
    ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();

	double allbzlyje=0;
	double alllyxxje=0;
	double alllysxje=0;
	ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
	ls_sql+=" FROM sq_dwxx ";
    ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allbzlyje=rs.getDouble(1);
		alllyxxje=rs.getDouble(2);
		alllysxje=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	double khpszje=0;
	ls_sql="SELECT sum(pszje)";
	ls_sql+=" FROM jxc_clpsd";
	ls_sql+=" where jxc_clpsd.khbh='"+khbh+"'";
	ls_sql+=" and jxc_clpsd.psdzt!='6' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khpszje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (alllyxxje!=0)
	{
		if (alllyxxje>khpszje)
		{
			mark++;
			out.println("<P>总额提醒！小于领用下限，领用下限『"+alllyxxje+"』，领用总额『"+khpszje+"』");
		}
	}

	if (alllysxje!=0)
	{
		if (alllysxje<khpszje)
		{
			mark++;
			out.println("<P>总额提醒！超过领用上限，领用上限『"+alllysxje+"』，领用总额『"+khpszje+"』");
		}
	}

	String clxlmc=null;
	ls_sql="SELECT jxc_clxlbm.clxlmc ";
	ls_sql+=" FROM jxc_clxlbm,jxc_cldlbm ";
    ls_sql+=" where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc";
    ls_sql+=" and jxc_cldlbm.cldllb in('2','3')";//1：主材；2：辅材；3：通用
    ls_sql+=" order by jxc_clxlbm.clxlmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clxlmc=cf.fillNull(rs.getString("clxlmc"));

		double bzlyje=0;
		double lyxxje=0;
		double lysxje=0;
		ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
		ls_sql+=" from jxc_fclybl";
		ls_sql+=" where dwbh='"+fgsbh+"' and clxlmc='"+clxlmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bzlyje=rs1.getDouble(1);
			lyxxje=rs1.getDouble(2);
			lysxje=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		double ljpssl=0;
		double ljpsje=0;
		ls_sql="SELECT sum(jxc_clpsmx.pssl),sum(jxc_clpsmx.psje)";
		ls_sql+=" FROM jxc_clpsd,jxc_clpsmx,jxc_clbm ";
		ls_sql+=" where jxc_clpsd.psph=jxc_clpsmx.psph and jxc_clpsmx.clbm=jxc_clbm.clbm";
		ls_sql+=" and jxc_clpsd.khbh='"+khbh+"' and jxc_clbm.clxlbm='"+clxlmc+"' ";
		ls_sql+=" and jxc_clpsd.psdzt!='6' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljpssl=rs1.getDouble(1);
			ljpsje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (lyxxje!=0)
		{
			if (lyxxje>ljpsje)
			{
				mark++;
				out.println("<P>小类["+clxlmc+"]提醒！小于领用下限，领用下限『"+lyxxje+"』，目前累计领用『"+ljpsje+"』");
			}
		}

		if (lysxje!=0)
		{
			if (ljpsje>lysxje)
			{
				mark++;
				out.println("<P>小类["+clxlmc+"]提醒！超过领用上限，领用上限『"+lysxje+"』，目前累计领用『"+ljpsje+"』");
			}
		}

	}
	rs.close();
	ps.close();
	//领用是否符合标准检查＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>