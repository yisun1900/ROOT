<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=request.getParameter("ssfgs");
String khbh=request.getParameter("khbh");
String psph=request.getParameter("psph");


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

	if (!psdzt.equals("0") && !psdzt.equals("6"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：审核未通过；7：作废；
	{
		out.print("错误！材料单["+psph+"]已提交");
		return;
	}

	conn.setAutoCommit(false);

	//修改：材料单(jxc_clpsd)＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
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
	//修改：材料单(jxc_clpsd)＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

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
	ls_sql=" select ROUND(bzlybl/100*"+sgcbj+",2),ROUND(lyblxx/100*"+sgcbj+",2),ROUND(lyblsx/100*"+sgcbj+",2)";
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
	ls_sql+=" and jxc_clpsd.psdzt not in('6','7') ";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
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
		ls_sql=" select ROUND(bzlybl/100*"+sgcbj+",2),ROUND(lyblxx/100*"+sgcbj+",2),ROUND(lyblsx/100*"+sgcbj+",2)";
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
		ls_sql+=" FROM jxc_clpsd,jxc_clpsmx ";
		ls_sql+=" where jxc_clpsd.psph=jxc_clpsmx.psph ";
		ls_sql+=" and jxc_clpsd.khbh='"+khbh+"' and jxc_clpsmx.clxlbm='"+clxlmc+"' ";
		ls_sql+=" and (jxc_clpsd.psdzt not in('0','1','6','7') OR jxc_clpsd.psph='"+psph+"')";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljpssl=rs1.getDouble(1);
			ljpsje=rs1.getDouble(2);
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


	//修改：材料单(jxc_clpsd)＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (mark>0)//有多条未达标，需审核
	{
		//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
		psdzt="1";
	}
	else{
		psdzt="2";
	}

	ls_sql="update jxc_clpsd set psdzt='"+psdzt+"'";
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//修改：材料单(jxc_clpsd)＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//检查数量录入是否正确
	String clbm=null;
	String clmc=null;
	String nbbm=null;
	String xsfs=null;
	double pssl=0;
	ls_sql=" select clbm,clmc,nbbm,pssl,xsfs ";
	ls_sql+=" from jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		pssl=rs.getDouble("pssl");
		xsfs=cf.fillNull(rs.getString("xsfs"));

		if (pssl<=0)
		{
			rs.close();
			ps.close();

			conn.rollback();
			out.print("错误！材料["+clbm+"："+clmc+"]数量必须大于零！");
			return;
		}

		if (psdzt.equals("2") && !xsfs.equals("1"))//2：等待出库  ,1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			ls_sql="update jxc_cljgb set dhsl=dhsl+"+pssl;
			ls_sql+=" where clbm='"+clbm+"' and ssfgs='"+ssfgs+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
	}
	rs.close();
	ps.close();

/*csrj控制
	//拨至75%限制＋＋＋＋＋＋＋＋＋＋＋开始
	//材料单
	double sgdlkhj=0;
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"' and psdzt in('2','3','5')";
	//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdlkhj=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//工地用品领用记录
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//0：未结算；1：已结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdlkhj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//已付工费
	ls_sql="select sum(sjbk)";
	ls_sql+=" from  cw_sgdzqjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdlkhj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//拨款基数
	double bkjs=0;
	ls_sql="select jsjsze";
	ls_sql+=" from  cw_sgdzqjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by jsjlh desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bkjs=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double zxsgcbj=0;
	ls_sql="select zxsgcbj";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();

	if (bkjs==0)//如果为0取最新施工成本价
	{
		bkjs=zxsgcbj;//拨款基数=最新工程施工成本价
	}

	double yfgck=cf.round(bkjs*0.75,2);

	if (sgdlkhj>yfgck)
	{
		conn.rollback();
		out.println("错误！累计拨款【"+sgdlkhj+"】不能超过拨款基数【"+bkjs+"】的75％【"+yfgck+"】");
		return;
	}
	
	
	//拨至75%限制＝＝＝＝＝＝＝＝＝＝＝结束

*/
	conn.commit();

	if (mark>0)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("提交成功！提醒！有『<%=mark%>』小类领用金额不符合规定，需要审批后才能出库，若不想审批，请先删除提交，然后修改数量以符合标准");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("提交成功！不需审批，可以直接出库");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
}
%>