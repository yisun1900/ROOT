<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	cwgl.Cwgl cwgl=new cwgl.Cwgl();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{

		String gdjsjd="";
		String gcjdbm="";
		double sfke=0;
		double cwsfke=0;
		String fgsbh="";
		String sgd="";
		ls_sql="select gdjsjd,gcjdbm,sfke,cwsfke,fgsbh,sgd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
			gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			sfke=rs.getDouble("sfke");
			cwsfke=rs.getDouble("cwsfke");
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			sgd=cf.fillNull(rs.getString("sgd"));
		}
		rs.close();
		ps.close();

		int sqjl=0;
		ls_sql="select count(*)";
		ls_sql+=" from cw_sgdjssqjl";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ls_sql+=" and zt='1'";//1：未拨工费；2：已拨工费
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sqjl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (sqjl>0)
		{
			conn.rollback();
			out.println("<BR>！！！有拨工费授权记录，还未拨工费，不能再授权");
			return;
		}

		

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_gcfxysjl  ";
		ls_sql+=" where crm_gcfxysjl.khbh='"+khbh[i]+"' and crm_gcfxysjl.ysjg='2' ";//'1','合格','2','不合格'
		ls_sql+=" order by crm_gcfxysjl.ysjlh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			conn.rollback();
			out.println("<BR>！！！错误，验收未通过，不能拨工费");
			return;
		}

		//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：客户完结；7：合同异常终止
		if (gcjdbm.equals("4"))
		{
			conn.rollback();
			out.println("<BR>！！！错误，工程完工");
			return;
		}
		else if (gcjdbm.equals("5"))
		{
			conn.rollback();
			out.println("<BR>！！！错误，客户完结");
			return;
		}
		else if (gcjdbm.equals("7"))
		{
			conn.rollback();
			out.println("<BR>！！！错误，合同异常终止");
			return;
		}

		if (sgd.equals(""))
		{
			conn.rollback();
			out.println("<BR>！！！错误，未派单");
			return;
		}

		int ztjc=0;
		ls_sql="select count(*)";
		ls_sql+=" from dm_gdjsjd";
		ls_sql+=" where gdjsjd='"+gdjsjd+"' and ztlx='1'";//1：授权；2：拨工费；3：审核
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ztjc=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (ztjc==0)
		{
			conn.rollback();
			out.println("错误！状态不正确");
			return;
		}

		String nextzt="";//下一个结算进度编码
		int bfcs=0;//拨付次数
		ls_sql="select nextzt,bfcs";
		ls_sql+=" from dm_gdjsjd";
		ls_sql+=" where gdjsjd='"+gdjsjd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nextzt=cf.fillNull(rs.getString("nextzt"));//下一个结算进度编码
			bfcs=rs.getInt("bfcs");//拨付次数
		}
		rs.close();
		ps.close();
			
		String sksh="";//付款是否需财务审核
		String skshStr="";
		double fkbl=0;//要求付款比例
		String yqgcjdmc="";//要求工程进度
		ls_sql="select fkbl,sksh,DECODE(sksh,'Y','需审核','N','不需审核') skshStr,gcjdmc";
		ls_sql+=" from dm_sgdjscsb";
		ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fkbl=rs.getDouble("fkbl");
			sksh=rs.getString("sksh");
			skshStr=rs.getString("skshStr");
			yqgcjdmc=rs.getString("gcjdmc");
		}
		rs.close();
		ps.close();

		//结算要求工程进度
		int gcjdjc=0;
		ls_sql="select count(*)";
		ls_sql+=" from dm_yqgcjd";
		ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs="+bfcs+" and gcjdbm='"+gcjdbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjdjc=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (gcjdjc==0)
		{
			conn.rollback();
			out.println("<BR>！！！工程进度错误");
			return;
		}

		double fkze=cwgl.getAllFkje(khbh[i]);//获取应付款总金额

		if (sksh.equals("Y"))//付款是否需财务审核  Y：需审核；N：不需审核
		{
			if (cwsfke+1<cf.round(fkze*fkbl/100,2))
			{
				conn.rollback();
				out.println("<BR>！！！错误，付款不足，或者财务未审核，最低应付款:"+cf.round(fkze*fkbl/100,2)+"，实际支付:"+cwsfke);
				return;
			}
		}
		else {
			if (sfke+1<cf.round(fkze*fkbl/100,2))
			{
				conn.rollback();
				out.println("<BR>！！！错误，付款不足，最低应付款:"+cf.round(fkze*fkbl/100,2)+"，实际支付:"+sfke);
				return;
			}
		}
		
		ls_sql="update crm_khxx set gdjsjd='"+nextzt+"'";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdjssqjl ";
		ls_sql+=" where  khbh='"+khbh[i]+"' and gdjsjd='"+nextzt+"' and zt='1'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		String sqr=(String)session.getAttribute("yhmc");
		String sqbm=(String)session.getAttribute("dwbh");

		ls_sql =" insert into cw_sgdjssqjl (khbh      ,gdjsjd      ,ygdjsjd      ,sqr      ,sqsj   ,sqbm      ,zt ,bz) ";
		ls_sql+="                    values('"+khbh[i]+"','"+nextzt+"','"+gdjsjd+"','"+sqr+"',SYSDATE,'"+sqbm+"','1','')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>