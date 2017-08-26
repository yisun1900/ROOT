<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ckzt=null;
	String psdh=null;
	String dwbh=null;
	String cksj=null;
	String lx=null;
	ls_sql="select ckzt,psdh,dwbh,cksj,lx";
	ls_sql+="  from cl_ckd ";  
	ls_sql+=" where ckph='"+ckph+"'";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckzt=cf.fillNull(rs.getString("ckzt")); 
		psdh=cf.fillNull(rs.getString("psdh")); 
		dwbh=cf.fillNull(rs.getString("dwbh")); 
		cksj=cf.fillNull(rs.getDate("cksj")); 
		lx=cf.fillNull(rs.getString("lx")); 
	} 
	else{
		out.println("错误！不存在的出库批号");
		return;
	}
	rs.close();
	ps.close();

	if (!ckzt.equals("1"))//1：未提交；2：已提交
	{
		out.println("错误！该单号已提交");
		return;
	}

	if (psdh.equals(""))
	{
		out.println("错误！配送单号不存在");
		return;
	}

	String jzph=dwbh+cksj.substring(0,4)+cksj.substring(5,7);

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+="  from cl_ydjz where dwbh='"+dwbh+"' and  jzph='"+jzph+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1); 
	} 
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！本月已结转，不能再进行出入库操作，若想操作，请删除结转记录");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="delete from cl_ckmx";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	
	String clbm=null;

	if (lx.equals("2"))//1：出库；2：退货
	{
		ls_sql="SELECT clbm";
		ls_sql+=" FROM cl_psdmx ";
		ls_sql+=" where cl_psdmx.psdh='"+psdh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			clbm=cf.fillNull(rs1.getString("clbm"));

			double gdj=0;
			double cj=0;
			double cjjsj=0;
			double fgsdj=0;
			String sfycx=null;
			String cxkssj=null;
			String cxjzsj=null;
			double cxgdj=0;
			double cxcj=0;
			double cxcjjsj=0;
			double cxfgsdj=0;
			ls_sql="SELECT cj,cjjsj,fgsdj,gdj,sfycx,cxkssj,cxjzsj,cxgdj,cxcj,cxcjjsj,cxfgsdj  ";
			ls_sql+=" FROM cl_jgmx ";
			ls_sql+=" where clbm='"+clbm+"' and dwbh='"+dwbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cj=rs.getDouble("cj");
				cjjsj=rs.getDouble("cjjsj");
				fgsdj=rs.getDouble("fgsdj");
				gdj=rs.getDouble("gdj");

				sfycx=cf.fillNull(rs.getString("sfycx"));
				cxkssj=cf.fillNull(rs.getDate("cxkssj"));
				cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
				cxgdj=rs.getDouble("cxgdj");
				cxcj=rs.getDouble("cxcj");
				cxcjjsj=rs.getDouble("cxcjjsj");
				cxfgsdj=rs.getDouble("cxfgsdj");
			}
			rs.close();
			ps.close();

			if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
			{
				gdj=cxgdj;
				cj=cxcj;
				cjjsj=cxcjjsj;
				fgsdj=cxfgsdj;
			}

			ls_sql="insert into cl_ckmx ( ckph,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,cksl,ckje,leixing ) ";
			ls_sql+=" select '"+ckph+"',cl_psdmx.clbm,cl_psdmx.clmc,cl_psdmx.clgg,cl_psdmx.cldlmc,cl_psdmx.jldwmc,cl_psdmx.lrjsfs,cl_psdmx.lrbfb,cl_psdmx.ckmc,cl_psdmx.sfrk,"+cj+","+cjjsj+","+fgsdj+","+gdj+",-1*cl_psdmx.pssl,-1*"+gdj+"*cl_psdmx.pssl,'1'  ";
			ls_sql+=" from cl_psdmx ";
			ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();
	}
	else{
		ls_sql="SELECT clbm";
		ls_sql+=" FROM cl_psdmx ";
		ls_sql+=" where cl_psdmx.psdh='"+psdh+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			clbm=cf.fillNull(rs1.getString("clbm"));

			double gdj=0;
			double cj=0;
			double cjjsj=0;
			double fgsdj=0;
			String sfycx=null;
			String cxkssj=null;
			String cxjzsj=null;
			double cxgdj=0;
			double cxcj=0;
			double cxcjjsj=0;
			double cxfgsdj=0;
			ls_sql="SELECT cj,cjjsj,fgsdj,gdj,sfycx,cxkssj,cxjzsj,cxgdj,cxcj,cxcjjsj,cxfgsdj  ";
			ls_sql+=" FROM cl_jgmx ";
			ls_sql+=" where clbm='"+clbm+"' and dwbh='"+dwbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cj=rs.getDouble("cj");
				cjjsj=rs.getDouble("cjjsj");
				fgsdj=rs.getDouble("fgsdj");
				gdj=rs.getDouble("gdj");

				sfycx=cf.fillNull(rs.getString("sfycx"));
				cxkssj=cf.fillNull(rs.getDate("cxkssj"));
				cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
				cxgdj=rs.getDouble("cxgdj");
				cxcj=rs.getDouble("cxcj");
				cxcjjsj=rs.getDouble("cxcjjsj");
				cxfgsdj=rs.getDouble("cxfgsdj");
			}
			rs.close();
			ps.close();

			if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
			{
				gdj=cxgdj;
				cj=cxcj;
				cjjsj=cxcjjsj;
				fgsdj=cxfgsdj;
			}

			ls_sql="insert into cl_ckmx ( ckph,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,cksl,ckje,leixing ) ";
			ls_sql+=" select '"+ckph+"',cl_psdmx.clbm,cl_psdmx.clmc,cl_psdmx.clgg,cl_psdmx.cldlmc,cl_psdmx.jldwmc,cl_psdmx.lrjsfs,cl_psdmx.lrbfb,cl_psdmx.ckmc,cl_psdmx.sfrk,"+cj+","+cjjsj+","+fgsdj+","+gdj+",cl_psdmx.pssl,"+gdj+"*cl_psdmx.pssl,'1'  ";
			ls_sql+=" from cl_psdmx ";
			ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();
	}
	


	double ckzsl = 0;
	double ckzje = 0;
	ls_sql=" SELECT sum(cksl),sum(ckje) FROM cl_ckmx where (ckph='"+ckph+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ckzsl = rs.getDouble(1);
		ckzje = rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update cl_ckd set ckzsl="+ckzsl+",ckzje="+ckzje;
	ls_sql+=" where  (ckph='"+ckph+"')  ";
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