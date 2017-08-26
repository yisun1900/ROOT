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

String ywy=null;
ywy=cf.GB2Uni(request.getParameter("ywy"));

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

double xdsskbfb=0;
ls=request.getParameter("xdsskbfb");
try{
	if (!(ls.equals("")))  xdsskbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xdsskbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[限定实收款百分比]类型转换发生意外:"+e);
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

String[] khbh=request.getParameterValues("khbh");
String[] khbh1=request.getParameterValues("khbh1");
String[] khbh2=request.getParameterValues("khbh2");

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

	//签单提成
	if (khbh!=null)
	{
		for (int i=0;i<khbh.length ;i++ )
		{
			String zt=null;
			String jzbz=null;
			String ywyjsbz=null;
			double wdzgce=0;
			double qye=0;
			double zjxje=0;
			double zhzjxje=0;
			String cxhdbm=null;
			String getfgsbh=null;
			ls_sql="select zt,jzbz,ywyjsbz,ywyqdjsbl,ywyqdjsje,wdzgce,qye,zjxje,zhzjxje,cxhdbm,fgsbh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where crm_khxx.khbh='"+khbh[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zt=cf.fillNull(rs.getString("zt"));
				jzbz=cf.fillNull(rs.getString("jzbz"));
				ywyjsbz=cf.fillNull(rs.getString("ywyjsbz"));
				ytcbl=rs.getDouble("ywyqdjsbl");
				ytcje=rs.getDouble("ywyqdjsje");
				wdzgce=rs.getDouble("wdzgce");
				qye=rs.getDouble("qye");
				zjxje=rs.getDouble("zjxje");
				zhzjxje=rs.getDouble("zhzjxje");
				cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
				getfgsbh=cf.fillNull(rs.getString("fgsbh"));
			}
			rs.close();
			ps.close();

			if (!ywyjsbz.equals("0"))
			{
				conn.rollback();
				out.println("错误！业务员结算标志不正确："+khbh[i]);
				return;
			}

			//提成基数
			double ywyzkl=0;
			if (cxhdbm.equals(""))//无活动
			{
				tcjs=qye;
			}
			else{
				ls_sql="select ywyzkl";
				ls_sql+=" from  jc_cxhd";
				ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+getfgsbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ywyzkl=rs.getDouble("ywyzkl");
				}
				else{
					conn.rollback();
					out.println("错误！促销活动："+cxhdbm+"无业务员提成系数");
					return;
				}
				rs.close();
				ps.close();

				tcjs=wdzgce*ywyzkl/100;
			}

			tcjs=cf.doubleTrim(tcjs);


			//qd：签单结算比例；
			double qdjsbl=0;
			ls_sql="select csz";
			ls_sql+=" from  cw_ywyjscs";
			ls_sql+=" where csbm='qd' and fgsbh='"+getfgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				qdjsbl=rs.getDouble("csz");
			}
			else{
				conn.rollback();
				out.println("错误！签单结算比例不存在");
				return;
			}
			rs.close();
			ps.close();

			//gz：工装最大结算产值；
			double gzzdjscz=0;
			ls_sql="select csz";
			ls_sql+=" from  cw_ywyjscs";
			ls_sql+=" where csbm='gz' and fgsbh='"+getfgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gzzdjscz=rs.getDouble("csz");
			}
			else{
				conn.rollback();
				out.println("错误！工装最大结算产值不存在");
				return;
			}
			rs.close();
			ps.close();
			
			
			tclx="1";//1：签单提成；2：完工提成；3：设计客户；4：退单
			
			if (jzbz.equals("2"))//1：家装；2：工装
			{
				qdlx="3";//1：家装；3：工装
				
				if (tcjs>gzzdjscz)//工装项目超过*万元，按*万元计算提成，超出部分不计产值
				{
					tcjs=gzzdjscz;
				}
			}
			else
			{
				qdlx="1";//1：家装；3：工装
			}


			//本次提成比率
			ls_sql="select tcbfb";
			ls_sql+=" from  cw_ywytcbl";
			ls_sql+=" where qd<"+tcjs+" and zd>="+tcjs+" and fgsbh='"+getfgsbh+"' and qdlx='"+qdlx+"'";
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


			bctcje=tcjs*bctcbl/100*qdjsbl/100;


			sjtcje=bctcje;

			ls_sql=" insert into cw_ywyjsmx (jsjlh,khbh,qdlx,tclx,sjfksbl,tcjs,ytcbl,ytcje,bctcbl  ,bctcje,zjqtfy,sjtcje) ";
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

			ls_sql=" update crm_khxx set ywyjsbz='1',ywyqdjsbl=?,ywyqdjsje=?,ywyjsjlh=?";
			ls_sql+=" where crm_khxx.khbh='"+khbh[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bctcbl);
			ps.setDouble(2,bctcje);
			ps.setString(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}

	//完工提成
	if (khbh1!=null)
	{
		for (int i=0;i<khbh1.length ;i++ )
		{
			String zt=null;
			String jzbz=null;
			String ywyjsbz=null;
			double wdzgce=0;
			double qye=0;
			double zjxje=0;
			double zhzjxje=0;
			String cxhdbm=null;
			String getfgsbh=null;
			ls_sql="select zt,jzbz,ywyjsbz,ywyqdjsbl,ywyqdjsje,wdzgce,qye,zjxje,zhzjxje,cxhdbm,fgsbh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where crm_khxx.khbh='"+khbh1[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zt=cf.fillNull(rs.getString("zt"));
				jzbz=cf.fillNull(rs.getString("jzbz"));
				ywyjsbz=cf.fillNull(rs.getString("ywyjsbz"));
				ytcbl=rs.getDouble("ywyqdjsbl");
				ytcje=rs.getDouble("ywyqdjsje");
				wdzgce=rs.getDouble("wdzgce");
				qye=rs.getDouble("qye");
				zjxje=rs.getDouble("zjxje");
				zhzjxje=rs.getDouble("zhzjxje");
				cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
				getfgsbh=cf.fillNull(rs.getString("fgsbh"));
			}
			rs.close();
			ps.close();

			if (!ywyjsbz.equals("1"))
			{
				conn.rollback();
				out.println("错误！业务员结算标志不正确："+khbh1[i]);
				return;
			}

			//提成基数
			double ywyzkl=0;
			if (cxhdbm.equals(""))//无活动
			{
				tcjs=qye+zhzjxje;
			}
			else{
				ls_sql="select ywyzkl";
				ls_sql+=" from  jc_cxhd";
				ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+getfgsbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ywyzkl=rs.getDouble("ywyzkl");
				}
				else{
					conn.rollback();
					out.println("错误！促销活动："+cxhdbm+"无业务员提成系数");
					return;
				}
				rs.close();
				ps.close();

				tcjs=(wdzgce+zjxje)*ywyzkl/100;
			}

			tcjs=cf.doubleTrim(tcjs);


			//gz：工装最大结算产值；
			double gzzdjscz=0;
			ls_sql="select csz";
			ls_sql+=" from  cw_ywyjscs";
			ls_sql+=" where csbm='gz' and fgsbh='"+getfgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gzzdjscz=rs.getDouble("csz");
			}
			else{
				conn.rollback();
				out.println("错误！工装最大结算产值不存在");
				return;
			}
			rs.close();
			ps.close();


			tclx="2";//1：签单提成；2：完工提成；3：设计客户；4：退单

			if (jzbz.equals("2"))//1：家装；2：工装
			{
				qdlx="3";//1：家装；3：工装
				
				if (tcjs>gzzdjscz)//工装项目超过*万元，按*万元计算提成，超出部分不计产值
				{
					tcjs=gzzdjscz;
				}
			}
			else
			{
				qdlx="1";//1：家装；3：工装
			}


			//本次提成比率
			ls_sql="select tcbfb";
			ls_sql+=" from  cw_ywytcbl";
			ls_sql+=" where qd<"+tcjs+" and zd>="+tcjs+" and fgsbh='"+getfgsbh+"' and qdlx='"+qdlx+"'";
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
			bctcje=bctcje-ytcje;
			sjtcje=bctcje;

			ls_sql=" insert into cw_ywyjsmx (jsjlh,khbh,qdlx,tclx,sjfksbl,tcjs,ytcbl,ytcje,bctcbl  ,bctcje,zjqtfy,sjtcje) ";
			ls_sql+=" values ( ?,?,?,?,0,?,?,?,?  ,?,0,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jsjlh);
			ps.setString(2,khbh1[i]);
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

			ls_sql=" update crm_khxx set ywyjsbz='2',ywywgjsbl=?,ywywgjsje=?,ywywgjsjlh=?";
			ls_sql+=" where crm_khxx.khbh='"+khbh1[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bctcbl);
			ps.setDouble(2,bctcje);
			ps.setString(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}

	

	//退单结算
	if (khbh2!=null)
	{
		for (int i=0;i<khbh2.length ;i++ )
		{
			String zt=null;
			String jzbz=null;
			String ywyjsbz=null;
			double wdzgce=0;
			double qye=0;
			double zjxje=0;
			double zhzjxje=0;
			String cxhdbm=null;
			String getfgsbh=null;
			ls_sql="select zt,jzbz,ywyjsbz,ywyqdjsbl,ywyqdjsje,wdzgce,qye,zjxje,zhzjxje,cxhdbm,fgsbh";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where crm_khxx.khbh='"+khbh2[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zt=cf.fillNull(rs.getString("zt"));
				jzbz=cf.fillNull(rs.getString("jzbz"));
				ywyjsbz=cf.fillNull(rs.getString("ywyjsbz"));
				ytcbl=rs.getDouble("ywyqdjsbl");
				ytcje=rs.getDouble("ywyqdjsje");
				wdzgce=rs.getDouble("wdzgce");
				qye=rs.getDouble("qye");
				zjxje=rs.getDouble("zjxje");
				zhzjxje=rs.getDouble("zhzjxje");
				cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
				getfgsbh=cf.fillNull(rs.getString("fgsbh"));
			}
			rs.close();
			ps.close();


			tclx="4";//1：签单提成；2：完工提成；3：设计客户；4：退单

			if (jzbz.equals("2"))//1：家装；2：工装
			{
				qdlx="3";//1：家装；3：工装
			}
			else
			{
				qdlx="1";//1：家装；3：工装
			}


			tcjs=0;
			bctcbl=-1*ytcbl;
			bctcje=-1*ytcje;

			sjtcje=bctcje;

			ls_sql=" insert into cw_ywyjsmx (jsjlh,khbh,qdlx,tclx,sjfksbl,tcjs,ytcbl,ytcje,bctcbl  ,bctcje,zjqtfy,sjtcje) ";
			ls_sql+=" values ( ?,?,?,?,0,?,?,?,?  ,?,0,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jsjlh);
			ps.setString(2,khbh2[i]);
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

			ls_sql=" update crm_khxx set ywyjsbz='2',ywywgjsbl=?,ywywgjsje=?,ywywgjsjlh=?";
			ls_sql+=" where crm_khxx.khbh='"+khbh2[i]+"' ";//0：未结算；1：签单结算；2：完工结算
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bctcbl);
			ps.setDouble(2,bctcje);
			ps.setString(3,jsjlh);
			ps.executeUpdate();
			ps.close();
		}
	}
	

	ls_sql="insert into cw_ywyjsjl ( jsjlh,fgsbh,dwbh,sjsbh,ywy,xdsskbfb,sjfw,sjfw2,tcze,lrr  ,lrsj,lrbm,spbz,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,fgsbh);
	ps.setString(3,"");
	ps.setString(4,"");
	ps.setString(5,ywy);
	ps.setDouble(6,xdsskbfb);
	ps.setDate(7,sjfw);
	ps.setDate(8,sjfw2);
	ps.setDouble(9,0);
	ps.setString(10,lrr);

	ps.setDate(11,lrsj);
	ps.setString(12,lrbm);
	ps.setString(13,"1");//1：开始结算；2：结算完成；3：审批通过；4：审批未通过
	ps.setString(14,bz);
	ps.executeUpdate();
	ps.close();


	double tcze=0;//提成总额
	ls_sql="select sum(sjtcje)";
	ls_sql+=" from  cw_ywyjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" update cw_ywyjsjl set tcze=?";
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