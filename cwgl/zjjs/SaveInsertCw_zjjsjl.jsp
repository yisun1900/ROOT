<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String fgsbh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

String zjxm=null;
zjxm=cf.GB2Uni(request.getParameter("zjxm"));

java.sql.Date sjfw=null;
java.sql.Date sjfw2=null;
ls=request.getParameter("sjfw");
try{
	if (!(ls.equals("")))  sjfw=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfw不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[时间范围]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjfw2");
try{
	if (!(ls.equals("")))  sjfw2=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfw2不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[时间范围]类型转换发生意外:"+e);
	return;
}


String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String zjlx=cf.GB2Uni(request.getParameter("zjlx"));
String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String qdlx=null;
	String tclx=null;
	double tcjs=0;//提成基数
	double ytcbl=0;//已提成比率
	double ytcje=0;//已提成金额
	double bctcbl=0;//本次提成比率
	double bctcje=0;//本次提成金额
	double sjtcje=0;//实际提成金额

	conn.setAutoCommit(false);

	//完工提成
	if (khbh!=null)
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			String zt=null;
			String jzbz=null;
			String zjjsbz=null;
			double wdzgce=0;
			double qye=0;
			double zjxje=0;
			double zhzjxje=0;
			String cxhdbm=null;
			String getfgsbh=null;
			ls_sql="select zt,jzbz,zjjsbz,wdzgce,qye,zjxje,zhzjxje,cxhdbm,fgsbh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where crm_khxx.khbh='"+khbh[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zt=cf.fillNull(rs.getString("zt"));
				jzbz=cf.fillNull(rs.getString("jzbz"));
				zjjsbz=cf.fillNull(rs.getString("zjjsbz"));
				wdzgce=rs.getDouble("wdzgce");
				qye=rs.getDouble("qye");
				zjxje=rs.getDouble("zjxje");
				zhzjxje=rs.getDouble("zhzjxje");
				cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
				getfgsbh=cf.fillNull(rs.getString("fgsbh"));
			}
			rs.close();
			ps.close();

			if (!zjjsbz.equals("0"))
			{
				conn.rollback();
				out.println("错误！质检结算标志不正确："+khbh[i]);
				return;
			}

			//提成基数
			double zjyzkl=0;
			if (cxhdbm.equals(""))//无活动
			{
				tcjs=qye+zhzjxje;
			}
			else{
				ls_sql="select zjyzkl";
				ls_sql+=" from  jc_cxhd";
				ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+getfgsbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					zjyzkl=rs.getDouble("zjyzkl");
				}
				else{
					conn.rollback();
					out.println("错误！促销活动："+cxhdbm+"无质检员系数");
					return;
				}
				rs.close();
				ps.close();

				tcjs=(wdzgce+zjxje)*zjyzkl/100;
			}

			tcjs=cf.doubleTrim(tcjs);


			tclx="2";//2：完工提成

			if (jzbz.equals("2"))//1：家装；2：工装
			{
				qdlx="3";//1：家装；3：工装
			}
			else
			{
				qdlx="1";//1：家装；3：工装
			}


			//本次提成比率
			ls_sql="select tcbfb";
			ls_sql+=" from  cw_zjtcbl";
			ls_sql+=" where qd<"+tcjs+" and zd>="+tcjs+" and fgsbh='"+getfgsbh+"' and qdlx='"+zjlx+"'";//1：主任监理；3：监理
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				bctcbl=rs.getDouble("tcbfb");
			}
			else{
				conn.rollback();
				out.println("错误！提成比率参数不存在，提成基数："+tcjs);
				return;
			}
			rs.close();
			ps.close();


			bctcje=tcjs*bctcbl/100;
			sjtcje=bctcje;

			ls_sql=" insert into cw_zjjsmx (jsjlh,khbh,qdlx,tclx,sjfksbl,tcjs,ytcbl,ytcje,bctcbl  ,bctcje,zjqtfy,sjtcje) ";
			ls_sql+=" values ( ?,?,?,?,0,?,?,?,?  ,?,0,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jsjlh);
			ps.setString(2,khbh[i]);
			ps.setString(3,qdlx);
			ps.setString(4,tclx);
			ps.setDouble(5,tcjs);
			ps.setDouble(6,ytcbl);
			ps.setDouble(7,ytcje);
			ps.setDouble(8,bctcbl);
			ps.setDouble(9,bctcje);
			ps.setDouble(10,sjtcje);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx set zjjsbz='1',zjjsbl=?,zjjsje=?,zjjsjlh=?";
			ls_sql+=" where crm_khxx.khbh='"+khbh[i]+"' ";//0：未结算；1：已结算
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bctcbl);
			ps.setDouble(2,bctcje);
			ps.setString(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}

	


	ls_sql="insert into cw_zjjsjl ( jsjlh,fgsbh,dwbh,sjsbh,zjxm,zjlx,xdsskbfb,sjfw,sjfw2,tcze,lrr  ,lrsj,lrbm,spbz,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,fgsbh);
	ps.setString(3,"");
	ps.setString(4,"");
	ps.setString(5,zjxm);
	ps.setString(6,zjlx);
	ps.setDouble(7,0);
	ps.setDate(8,sjfw);
	ps.setDate(9,sjfw2);
	ps.setDouble(10,0);
	ps.setString(11,lrr);

	ps.setDate(12,lrsj);
	ps.setString(13,lrbm);
	ps.setString(14,"1");//1：开始结算；2：结算完成；3：审批通过；4：审批未通过
	ps.setString(15,bz);
	ps.executeUpdate();
	ps.close();


	double tcze=0;//提成总额
	ls_sql="select sum(sjtcje)";
	ls_sql+=" from  cw_zjjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" update cw_zjjsjl set tcze=?";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,tcze);
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
	out.print("存盘失败,发生意外: " + e);
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