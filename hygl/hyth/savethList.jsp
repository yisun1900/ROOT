<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="hygl" scope="page" class="hygl.Hygl"/>
<%@ include file="/getlogin.jsp"%>


<HTML>
<HEAD>
<TITLE>异店退货登记</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
<%
  
String thdw =request.getParameter("thdw");  //退货单位
String thrq =request.getParameter("thrq");  //退货日期
String thczy =request.getParameter("thczy");  
String[] thlx=request.getParameterValues("thlx");
String[] thyy=request.getParameterValues("thyy");//退货原因
String[] thj=request.getParameterValues("thj");//退货价
String[] cpbm=request.getParameterValues("cpbm");//产品编码

String[] dwbh=request.getParameterValues("dwbh");//产品编码
String[] sxj=request.getParameterValues("sxj");//产品编码
String[] ywxh=request.getParameterValues("ywxh");//产品编码
String[] khbh=request.getParameterValues("khbh");//产品编码
String[] khlx=request.getParameterValues("khlx");//产品编码
String[] jyfs=request.getParameterValues("jyfs");//产品编码

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String sql=new String();

boolean success=true;

String thjlh=cf.today().substring(2,4);
String xh=null;


double dthj=0;
int i=0;
int count=0;
try{
	conn=cf.getConnection();
	
	sql="SELECT NVL(max(substr(thjlh,3,6))+1,1) FROM dm_thjl WHERE substr(thjlh,1,2) ='"+thjlh+"'";   
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		xh=rs.getString(1);
	}
	rs.close();
	ps.close();

	thjlh=thjlh+cf.addZero(xh,6);

	conn.setAutoCommit(false);
	for (i=0;i<cpbm.length ;i++ )
	{
		if (thj[i].equals(""))
		{
			out.println("产品编码："+cpbm[i]+"的<退货金额>不能为空！");
			conn.rollback();
			return;
		}
		else{
			dthj=Double.parseDouble(thj[i]);
		}
		if (thyy[i].equals(""))
		{
			out.println("产品编码："+cpbm[i]+"的<退货原因>不能为空！");
			conn.rollback();
			return;
		}
		else{
			thyy[i]=cf.GB2Uni(thyy[i]);
		}
		//马学中2003.9.24修改，销售的产品信息在cp_cpxx1中
		//sql="select count(*) FROM cp_cpxx WHERE cpbm='"+cpbm[i]+"' and wlzt='05'";
		sql="select count(*) FROM cp_cpxx1 WHERE cpbm='"+cpbm[i]+"' and wlzt='05'";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("产品编码："+cpbm[i]+"不是已销售产品！");
			conn.rollback();
			return;
		}

		
		String ckbm=null;
		String hjbm=null;
		sql="select ckbm FROM xt_ckxx WHERE dwbh='"+thdw+"' and cklx='01' order by ckbm";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			ckbm=rs.getString(1);
		}
		else{
			out.println("错误！无成品库");
			conn.rollback();
			return;
		}
		rs.close();
		ps.close();
		sql="select hjbm FROM xt_hjxx WHERE ckbm='"+ckbm+"' order by hjbm";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			hjbm=rs.getString(1);
		}
		else{
			out.println("错误！成品库无货架");
			conn.rollback();
			return;
		}
		rs.close();
		ps.close();
		//马学中2003.9.24修改cp_cpxx为cp_cpxx1，原因：销售的产品信息在cp_cpxx1中
		if (thlx[i].equals("0"))//0本店；
		{
			//sql="update cp_cpxx set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql="update cp_cpxx1 set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql+=" where cpbm='"+cpbm[i]+"'";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			//在退货记录中插入记录
			sql="insert into dm_thjl(thjlh,cpbm,thdw,thj,thyy,thbz,thrq,czy,ywxh,xsdw,sxj,khbh,shbz,sfjs,jyfs,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,khlx)";
			sql+=" select  ?,?,?,"+thj[i]+",?,?,?,?,?,?,"+sxj[i]+",?,'2','0',?,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,? ";
			sql+=" from cp_cpxx1 where cpbm='"+cpbm[i]+"' ";
			//out.print(sql);
			ps=conn.prepareStatement(sql);
			ps.setString(1,thjlh);
			ps.setString(2,cpbm[i]);
			ps.setString(3,thdw);
			ps.setString(4,thyy[i]);
			ps.setString(5,thlx[i]);
			ps.setDate(6,java.sql.Date.valueOf(thrq));
			ps.setString(7,thczy);
			ps.setString(8,ywxh[i]);
			ps.setString(9,dwbh[i]);
			ps.setString(10,khbh[i]);
			ps.setString(11,jyfs[i]);
			ps.setString(12,khlx[i]);
			ps.executeUpdate();
			ps.close();
		}
		else{//1异店
			//sql="update cp_cpxx set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql="update cp_cpxx1 set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql+=" ,szdw='"+thdw+"',ckbm='"+ckbm+"',hjbm='"+hjbm+"'";
			sql+=" where cpbm='"+cpbm[i]+"'";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			//在退货记录中插入记录
			sql="insert into dm_thjl(thjlh,cpbm,thdw,thj,thyy,thbz,thrq,czy,ywxh,xsdw,sxj,khbh,shbz,sfjs,jyfs,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,khlx)";
			sql+=" select  ?,?,?,"+thj[i]+",?,?,?,?,?,?,"+sxj[i]+",?,'2','0',?,?,?,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,? ";
			sql+=" from cp_cpxx1 where cpbm='"+cpbm[i]+"' ";
			//out.print(sql);
			ps=conn.prepareStatement(sql);
			ps.setString(1,thjlh);
			ps.setString(2,cpbm[i]);
			ps.setString(3,thdw);
			ps.setString(4,thyy[i]);
			ps.setString(5,thlx[i]);
			ps.setDate(6,java.sql.Date.valueOf(thrq));
			ps.setString(7,thczy);
			ps.setString(8,ywxh[i]);
			ps.setString(9,dwbh[i]);
			ps.setString(10,khbh[i]);
			ps.setString(11,jyfs[i]);
			ps.setString(12,ckbm);
			ps.setString(13,hjbm);
			ps.setString(14,khlx[i]);
			ps.executeUpdate();
			ps.close();
		}


		//马学中 2003.9.24 新增，原因：要将退货的销售产品放到cp_cpxx中
		//将退货的销售产品信息从cp_cpxx1、cp_cpstxx1表中移到cp_cpxx和cp_cpstxx中
		sql  =  " insert into cp_cpxx";
		sql +=  " select * ";
		sql +=  " from cp_cpxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();

		sql  =  " insert into cp_cpstxx";
		sql +=  " select * from cp_cpstxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();

		sql =  " delete from cp_cpstxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();

		sql =  " delete from cp_cpxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();
		//结束退货产品信息的移动

		String zp_ckbm=null;
		String zpwlzt=null;
		//查询赠品仓库
		sql="select ckbm FROM xt_ckxx WHERE dwbh='"+thdw+"' and cklx='09' order by ckbm";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			zp_ckbm=rs.getString(1);
		}
		else{
			out.println("错误！无赠品库");
			conn.rollback();
			return;
		}
		rs.close();
		ps.close();

		//查询物流状态
		sql="select wlzt from xt_ckxx where ckbm='"+zp_ckbm+"'";
		ps1=conn.prepareStatement(sql);
		rs1=ps1.executeQuery();
		if(rs1.next()){
			zpwlzt=rs1.getString(1);
		}
		rs1.close();
		ps1.close();
		//在赠品退货信息插入记录
		sql="insert into dm_zpth(thjlh,cpbm,xh,zpbm,ckbm,xsck,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx)";
		sql+=" select '"+thjlh+"',cpbm,xh,zpbm,'"+zp_ckbm+"',ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx";
		sql+=" from dm_zpxs";
		sql+="  where  ywxh='"+ywxh[i]+"' and cpbm='"+cpbm[i]+"'";
		//out.print(sql);
		ps=conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		String zpbm=null;
		String zplx=null;
		long zpxh=0;
		//根据产品编码从附属赠品表中查询附属赠品信息
		sql="select xh,zpbm,zplx from dm_zpxs ";
		sql+="  where  ywxh='"+ywxh[i]+"' and cpbm='"+cpbm[i]+"'";
//		out.println("<BR>"+sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			zpxh=rs.getLong(1);
			zpbm=rs.getString(2);
			zplx=rs.getString(3);
			

			sql="select count(*) from cp_zpkc ";
			sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			if (count==0)
			{
				//插入赠品库存
				sql="insert into cp_zpkc(zpbm,ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx) ";
				sql+="  select zpbm,'"+zp_ckbm+"',ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx";
				sql+="  from dm_zpxs ";
				sql+="  where  ywxh='"+ywxh[i]+"' and cpbm='"+cpbm[i]+"' and xh="+zpxh;
//				out.println("<BR>"+sql);
				ps1=conn.prepareStatement(sql);  
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				//修改赠品库存，
				sql="update cp_zpkc set sl=sl+1 ";
				sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
//				out.println("<BR>"+sql);
				ps1=conn.prepareStatement(sql);  
				ps1.executeUpdate();
				ps1.close();
			}
			if (zplx.equals("1"))
			{
				//修改产品信息
				//马学中2003.9.24修改cp_cpxx为cp_cpxx1,原因：销售的产品在cp_cpxx1中
				sql="update cp_cpxx1 set wlzt='"+zpwlzt+"',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
				sql+=" where cpbm=? ";
				ps1=conn.prepareStatement(sql);
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

                //马学中 2003.9.24 新增，原因：要将退货的销售产品放到cp_cpxx中
				//处理成品专成的赠品信息，将退货的销售产品信息从cp_cpxx1、cp_cpstxx1表中移到cp_cpxx和cp_cpstxx中
				sql  =  " insert into cp_cpxx";
				sql +=  " select *";
				sql +=  " from cp_cpxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

				sql  =  " insert into cp_cpstxx";
				sql +=  " select * from cp_cpstxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

				sql =  " delete from cp_cpstxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

				sql =  " delete from cp_cpxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();
				//结束退货产品信息的移动
			}
		}//end while loop
		rs.close();
		ps.close();
	  
	  //如果客户类型为"1",则修改会员详细信息表和会员消费记录表
		if(!khbh[i].equals("")){
			hygl.th(conn,Double.parseDouble(sxj[i]),khbh[i],ywxh[i],out);
		}
	}
 
	 conn.commit();
	 out.print("退货处理成功！");
}
catch (NumberFormatException nfe){
	conn.rollback();
	out.print("操作失败：你输入的不是数字，请重新输入");
	out.print("<BR>退货金额=" + thj[i]);
}
catch (Exception e){
	conn.rollback();
	out.print("数据库操作失败：" + e);
	out.print("<BR>SQL=" + sql);
}
finally{
	try{
		conn.setAutoCommit(true);  
		if (rs!=null) rs.close();
		if (ps!= null) ps.close();
		if (rs1!=null) rs1.close();
		if (ps1!= null) ps1.close();
		if (conn != null) cf.close(conn);
	}catch (Exception e){
		out.println("数据库操作失败："+e.getMessage());
	}
}
%>