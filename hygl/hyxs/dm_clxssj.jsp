<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="hygl" scope="page" class="hygl.Hygl"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>产品销售</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
<form name="xhd" method="post" action="dm_dyxspj.jsp">

<%
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));   //用户登录名
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));     //单位编号
String dwmc=cf.GB2Uni(request.getParameter("dwmc"));     //单位名称
String yhmc=cf.GB2Uni(request.getParameter("yhmc"));     //用户名称

String jyfs=cf.GB2Uni(request.getParameter("jyfs"));     //交易方式
String hykh=cf.GB2Uni(request.getParameter("hykh"));     //水质分析卡号
String hybh=cf.GB2Uni(request.getParameter("hybh"));     //水质分析卡号
String xsrq=cf.GB2Uni(request.getParameter("xsrq"));     //销售日期
String ckbm=cf.GB2Uni(request.getParameter("ckbm"));     //仓库编码
String []xslb=request.getParameterValues("xslb");        //销售列表
String fszp=cf.GB2Uni(request.getParameter("fszp"));     //带赠品销售标志
String gmyy=cf.GB2Uni(request.getParameter("gmyy"));
String gmyjbm=cf.GB2Uni(request.getParameter("gmyjbm"));

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

StringTokenizer xsxx=null;
String cpbm=null;
String khlx=null;//客户类型,0:一般客户;1:会员
if (hykh!=null && !hykh.equals(""))
{
	khlx="1";
}
else{
	khlx="0";
}

double totalpayment=0;
  
String 	zp_ckbm=null;//赠品库编码
String 	ls=null;
int bj=0;
double bqj=0;//标签价
double sxj=0;//实销价
double shjzkl=0;//实际折扣率
double zkl=0;//最低折扣率
String 	zkcx=null;//折扣超限
String zpbm=null;
String zplx=null;
int sl=0;

String ywxh=cf.today().substring(2,4);//业务序号
String xh=null;
int count=0;

try{
	conn=cf.getConnection();

	//取水质分析卡号
	if (khlx.equals("1"))
	{
		sql="select hybh from hy_hyxxb where hybh='"+hybh+"'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
		}
		else{
			out.println("错误！不存在的水质分析卡号");
			return;
		}
		rs.close();
		ps.close();
	}

	//产生:业务序号
	sql="SELECT NVL(max(substr(ywxh,3,6))+1,1) FROM dm_xsjl WHERE substr(ywxh,1,2) ='"+ywxh+"'";   
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		xh=rs.getString(1);
	}
	rs.close();
	ps.close();

	ywxh=ywxh+cf.addZero(xh,6);

	//取赠品库
	sql="select ckbm from xt_ckxx where cklx='09' and dwbh='"+dwbh+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next()){
		zp_ckbm=rs.getString(1);
	}

	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//对销售信息中的每个产品循环取值
	for(int i=1;i<xslb.length;i++)
	{
		bj=0;
		xsxx=new StringTokenizer(xslb[i],"/");
		cpbm=xsxx.nextToken();

		ls=xsxx.nextToken();
		bqj=Double.parseDouble(ls);
		ls=xsxx.nextToken();
		sxj=Double.parseDouble(ls);
		ls=xsxx.nextToken();
		shjzkl=Double.parseDouble(ls);
		ls=xsxx.nextToken();
		zkl=Double.parseDouble(ls);//应该的折扣率

		if(shjzkl<zkl){       
			zkcx="1";//0:未超限，1:超限
		}
		else{
			zkcx="0";
		}
		totalpayment+=sxj;
		 
		if(xsxx.countTokens()>0){    //确定是否有赠品
			bj=xsxx.countTokens();    //计算赠品数
		}

		//查询条码是否在库商品
		sql="select count(*) from cp_cpxx where wlzt='00' and szdw='"+dwbh+"' and cpbm='"+cpbm+"'";
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			conn.rollback();
			out.println("<BR>存盘失败！条码："+cpbm+"不是成品库产品");
			return;
		}

		 //将销售记录插入到店面销售信息表中（dm_xsjl）
		 sql="insert into dm_xsjl(dwbh,ywxh,cpbm,bqj,sxj,zkl,sjzkl,khlx,khbh,jyfs,czy,xsrq,zkcx,shbz,sfjs,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,jwbm,xsbddbh,lrrq,gmyy,gmyjbm)";
         sql+=" select ?,?,?,?,?,?,?,?,?,?,?,?,?,'9','0',ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,jwbm,xsbddbh,?,?,? ";
         sql+=" from cp_cpxx where cpbm='"+cpbm+"' ";
         ps=conn.prepareStatement(sql);
         ps.setString(1,dwbh);
         ps.setString(2,ywxh);
		 ps.setString(3,cpbm);
    	 ps.setDouble(4,bqj);
    	 ps.setDouble(5,sxj);
    	 ps.setDouble(6,zkl);
    	 ps.setDouble(7,shjzkl);
		 ps.setString(8,khlx);
		 ps.setString(9,hybh);
         ps.setString(10,jyfs);
    	 ps.setString(11,yhdlm);
         ps.setDate(12,java.sql.Date.valueOf(xsrq));
         ps.setString(13,zkcx);
         ps.setDate(14,java.sql.Date.valueOf(cf.today()));
         ps.setString(15,gmyy);
         ps.setString(16,gmyjbm);

         ps.executeUpdate();
         ps.close();
         
		 //马学中 2003.9.24 新增，原因：要将销售的产品放到cp_cpxx1中
		 //将销售的产品信息从cp_cpxx、cp_cpstxx表中移到cp_cpxx1和cp_cpstxx1中
		 sql  =  " insert into cp_cpxx1";
		 sql +=  " select * ";
		 sql +=  " from cp_cpxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();
         
		 sql  =  " insert into cp_cpstxx1";
		 sql +=  " select * from cp_cpstxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();
         
		 sql =  " delete from cp_cpstxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();

		 sql =  " delete from cp_cpxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();
		 //结束销售产品信息的移动

    	 //马学中 2003.9.24 注释，原因：要将销售的产品放到cp_cpxx1中
		 //修改产品信息(跟踪)表:
	     //sql="update cp_cpxx set ywxh=?,wlzt=?,xsrq=?,sxj=?,jyfs=?";
		 sql="update cp_cpxx1 set ywxh=?,wlzt=?,xsrq=?,sxj=?,jyfs=?,khbh=?,khlx=?";
		 sql+=" where cpbm='"+cpbm+"' and wlzt='00'";
         ps=conn.prepareStatement(sql);  
	     ps.setString(1,ywxh);
	     ps.setString(2,"05");
         ps.setDate(3,java.sql.Date.valueOf(xsrq));
    	 ps.setDouble(4,sxj);
	     ps.setString(5,jyfs);
	     ps.setString(6,hybh);
	     ps.setString(7,khlx);
         ps.executeUpdate();
         ps.close();
		 
		 //对每个产品带有的每个赠品循环取值
	     for(int j=1;j<=bj;j++){
	         zpbm=xsxx.nextToken();
			 //out.print(zpbm);
			 //根据zpbm,ckbm查入库信息
	         sql="select sl,zplx  from cp_zpkc ";
	         sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
	         ps=conn.prepareStatement(sql);         
	         rs=ps.executeQuery();         
             if (rs.next()){         
		         sl=rs.getInt(1);
		         zplx=rs.getString(2);
	         }       
			 else{
				conn.rollback();
				out.println("错误：赠品编码："+zpbm+"不存在！");
				return;
			 }
             rs.close();
             ps.close();
			 if (sl<1)
			 {
				conn.rollback();
				out.println("错误：赠品编码："+zpbm+"的库存数量为0！");
				return;
			 }
     
	         //插入赠品销售信息
  	         sql="insert into dm_zpxs(ywxh,cpbm,xh,zpbm,ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx) ";
	         sql+=" select ?,?,?,zpbm,ckbm,ztbm,plbm,1,djzl,cbj,lsj,ysj,bqj,zplx ";
             sql+="  from cp_zpkc ";
             sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2' ";   
	         ps=conn.prepareStatement(sql);
	         ps.setString(1,ywxh);
	         ps.setString(2,cpbm);
	         ps.setInt(3,j);
			 ps.executeUpdate();
			 ps.close();

			 if (zplx.equals("1"))//1：成品转入
	         {
				 //马学中 2003.9.24 新增，原因：要将销售的产品放到cp_cpxx1中
				 //处理由成品专成的赠品信息，将销售的产品信息从cp_cpxx、cp_cpstxx表中移到cp_cpxx1和cp_cpstxx1中
				 sql  =  " insert into cp_cpxx1";
				 sql +=  " select * ";
				 sql +=  " from cp_cpxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();
				 
				 sql  =  " insert into cp_cpstxx1";
				 sql +=  " select * from cp_cpstxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();
				 
				 sql =  " delete from cp_cpstxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();

				 sql =  " delete from cp_cpxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();
				 //结束销售产品信息的移动
				 
				 //修改产品信息(跟踪)表:
				 sql="update cp_cpxx1 set ywxh=?,wlzt=?,xsrq=?,sxj=0,jyfs=?,hybh=?,khlx=?";
				 sql+=" where cpbm='"+zpbm+"'";
				 //out.println(sql);
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,ywxh);
				 ps.setString(2,"05");
				 ps.setDate(3,java.sql.Date.valueOf(xsrq));
				 ps.setString(4,jyfs);
				 ps.setString(5,hybh);
				 ps.setString(6,khlx);
				 ps.executeUpdate();
				 ps.close();
	         }
			 //修改赠品库存，库存数量减1，
             sql="update cp_zpkc set  sl=sl-1 ";
             sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
	         ps=conn.prepareStatement(sql);  
			 ps.executeUpdate();
			 ps.close();
			 //删除赠品库，库存数量为0记录，
             sql="delete from cp_zpkc ";
             sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2' and sl=0";   
	         ps=conn.prepareStatement(sql);  
			 ps.executeUpdate();
			 ps.close();
		}//end for loop(zp)
	}//end for loop(cp)


	//计算会员本次积分
	if(hykh.length()>=1){
		hygl.addJf(conn,ywxh,out);
	}

	conn.commit();
	out.println("<BR>销售成功！");
}
catch (Exception e){
	conn.rollback();
	out.print("数据库操作失败：" + e);
	out.print("sql=" + sql);
}
finally{
	try{
		conn.setAutoCommit(true);  
		if (ps!= null) ps.close();
		if (rs!=null) rs.close();
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("数据库操作失败："+e.getMessage());
	}
}
 %>
</form>
<p align="center">&nbsp;<a href="dm_txxssj.jsp?xsrq=<%=xsrq%>">继续销售</a></p>
<p align="center">&nbsp;<a href="printxssj.jsp?ywxh=<%=ywxh%>" target='_blank'>打印票据</a></p>
</body>
</html>

