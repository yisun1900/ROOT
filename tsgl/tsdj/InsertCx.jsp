<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%  
String tslxbm = request.getParameter("tslxbm");//投诉报修大类编码
String tsxlbm = request.getParameter("tsxlbm");//投诉报修小类编码
String ssfgs = request.getParameter("ssfgs");
String khbh = request.getParameter("khbh");
String jcppbz=request.getParameter("jcppbz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	if (tslxbm!=null)//投诉大类
	{
		String c1=null;
		String c2=null;
		String retStr="";

		retStr+="[value1]";

		ls_sql="select tsxlbm,tsxlmc";
		ls_sql+=" from  dm_tsxlbm";
		ls_sql+=" where tslxbm='"+tslxbm+"'";
		ls_sql+=" order by tsxlbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			c1=rs.getString(1);
			c2=rs.getString(2);

			retStr+="%"+c1+"+"+c2;
		}
		rs.close();
		ps.close();

		out.print(retStr);  
	}
	else{
		String c1=null;
		String c2=null;
		String retStr="";

		retStr+="[value3]";

		ls_sql="select tsyybm,tsyymc";
		ls_sql+=" from  dm_tsyybm";
		ls_sql+=" where tsxlbm='"+tsxlbm+"'";
		ls_sql+=" order by tsyybm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			c1=rs.getString(1);
			c2=rs.getString(2);

			retStr+="%"+c1+"+"+c2;
		}
		rs.close();
		ps.close();

		//涉及厂商
		retStr+="[value4]";

		if (jcppbz.equals("N"))//是否启用集成订单:Y：启用；N：否
		{
			ls_sql="select distinct jxc_ppgysdzb.ppmc c1,jxc_ppgysdzb.ppmc c2";
			ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+ssfgs+"' ";
			ls_sql+=" order  by jxc_ppgysdzb.ppmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				c1=rs.getString(1);
				c2=rs.getString(2);

				retStr+="%"+c1+"+"+c2;
			}
			rs.close();
			ps.close();
		}
		else{
			//木门
			ls_sql="select distinct pdgcmc||'*'||ppmc||'*'||gys,pdgcmc||'(木门)'";
			ls_sql+=" from  jc_mmydd";
			ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
			ls_sql+=" order by pdgcmc||'*'||ppmc||'*'||gys,pdgcmc||'(木门)'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=rs.getString(1);
				c2=rs.getString(2);

				retStr+="%"+c1+"+"+c2;
			}
			rs.close();
			ps.close();

			//橱柜
			ls_sql="select distinct pdgcmc||'*'||ppmc||'*'||gys,pdgcmc||'(橱柜)'";
			ls_sql+=" from  jc_cgdd";
			ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
			ls_sql+=" order by pdgcmc||'*'||ppmc||'*'||gys,pdgcmc||'(橱柜)'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=rs.getString(1);
				c2=rs.getString(2);

				retStr+="%"+c1+"+"+c2;
			}
			rs.close();
			ps.close();

			//家具
			ls_sql="select distinct pdgcmc||'*'||jjppmc||'*'||jjgys,pdgcmc||'(家具)'";
			ls_sql+=" from  jc_jjdd";
			ls_sql+=" where khbh='"+khbh+"' and pdgcmc is not null";
			ls_sql+=" order by pdgcmc||'*'||jjppmc||'*'||jjgys,pdgcmc||'(家具)'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=rs.getString(1);
				c2=rs.getString(2);

				retStr+="%"+c1+"+"+c2;
			}
			rs.close();
			ps.close();

			//型材门
			ls_sql="select distinct xcmgcmc||'*'||xcmgys||'*'||xcmppmc,xcmgcmc||'(型材门)'";
			ls_sql+=" from  jc_jjdd";
			ls_sql+=" where khbh='"+khbh+"' and xcmgcmc is not null";
			ls_sql+=" order by xcmgcmc||'*'||xcmgys||'*'||xcmppmc,xcmgcmc||'(型材门)'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=rs.getString(1);
				c2=rs.getString(2);

				retStr+="%"+c1+"+"+c2;
			}
			rs.close();
			ps.close();

			//主材
			ls_sql="select distinct ppbm||'*'||ppmc||'*'||gys,ppbm||'(主材)'";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm is not null";
			ls_sql+=" order by ppbm||'*'||ppmc||'*'||gys,ppbm||'(主材)'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				c1=rs.getString(1);
				c2=rs.getString(2);

				retStr+="%"+c1+"+"+c2;
			}
			rs.close();
			ps.close();
		}


		out.print(retStr);  
	}


}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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

