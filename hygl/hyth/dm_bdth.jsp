<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="sthh" scope="page" class="mybean.sqlbean.SaveToHy_Hyxxb"/>


<HTML>
<HEAD>
<TITLE>异店退货登记</TITLE>
</HEAD>
<%//获得前一个页面传来的参数
  String yhdlm =cf.GB2Uni(request.getParameter("yhdlm"));  //用户登录名
  String thdw=cf.GB2Uni(request.getParameter("thdw"));     //退货单位
  String cpbm=cf.GB2Uni(request.getParameter("cpbm"));     //产品编码
  String thrq=cf.GB2Uni(request.getParameter("thrq"));     //退货日期
  String thjg=cf.GB2Uni(request.getParameter("thj"));      //退货价
  String thyy=cf.GB2Uni(request.getParameter("thyy"));     //退货原因
%>
<body bgcolor="#FFFFFF" text="#000000">
<%
  Connection conn=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  String sql=new String();
  
  boolean success=true;
  String bkbh=new String();
  String xsdw=new String();
  String ywxh=new String();
  float ckj=0;
  float jsl=100;
  String jyfs=new String();
  String khbh=new String();
  String khlx=new String();
  String ckbm=new String();
  float sxj=0;
  float jsj=0;
  float cbj,lsj,bqj,rkj;
  cbj=lsj=bqj=rkj=0;
  float thj=Float.parseFloat(thjg);
  String plbm=new String();
  String hjbm="";
  boolean existed=false;
  try{
      conn=cf.getConnection();
      conn.setAutoCommit(false);
 

      //根据产品编码从产品信息表中取得产品信息
      //版库编号、销售单位、业务序号、出库价、结算率、交易方式、客户编号、客户类型
	  //仓库编码、实销价、品类编码、成本价、零售价、标签价、入库价
      sql="select bkbh,xsdw,ywxh,ckj,jsl,jyfs,khbh,khlx,ckbm,sxj,plbm,cbj,lsj,bqj,rkj";
	  sql+=" from cp_cpxx where cpbm='"+cpbm+"'";
      //out.print(sql);
      ps=conn.prepareStatement(sql);
      rs=ps.executeQuery();
      if(rs.next()){
          bkbh=rs.getString(1);
		  xsdw=rs.getString(2);
		  ywxh=rs.getString(3);
		  ckj=rs.getFloat(4);
		  jsl=rs.getFloat(5);
		  jyfs=rs.getString(6);
		  khbh=rs.getString(7);
		  khlx=rs.getString(8);
		  ckbm=rs.getString(9);
		  sxj=rs.getFloat(10);
		  plbm=rs.getString(11);
		  cbj=rs.getFloat(12);
		  lsj=rs.getFloat(13);
		  bqj=rs.getFloat(14);
		  rkj=rs.getFloat(15);
      }
      rs.close();
      ps.close();


      //更新产品信息表中该产品相关记录：物流状态改为00，操作员改为yhdlm，退货价改为thj,结算率改为jsl
	  //结算价改为jsj，存在标志改为0，所在单位改为thdw，仓库编码改为ckbm，客户编号改为null，客户类型改为0
      sql="update cp_cpxx set wlzt='00'";
	  sql+=" where cpbm='"+cpbm+"'";
      //out.print(sql);
      ps=conn.prepareStatement(sql);
      ps.executeUpdate();
      ps.close();


      //在退货记录中插入记录
	  //退货日期thrq、退货单位thdw、产品编码cpbm、销售单位xsdw、退货价thj、退货标志0、客户编号khbh、操作员yhdlm
	  //退货原因thyy、审核标志1、结算价jsj、业务序号ywxh、结算率jsl、实销价sxj
      sql="insert into dm_thjl(thrq,thdw,cpbm,xsdw,thj,thbz,khbh,czy,thyy,shbz,jsj,ywxh,jsl,sxj,sfjs)";
      sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,'0')";
      //out.print(sql);
      ps=conn.prepareStatement(sql);
      ps.setDate(1,java.sql.Date.valueOf(thrq));
      ps.setString(2,thdw);
      ps.setString(3,cpbm);
      ps.setString(4,xsdw);
      ps.setFloat(5,thj);
      ps.setString(6,"0");
      ps.setString(7,khbh);
      ps.setString(8,yhdlm);
      ps.setString(9,thyy);
      ps.setString(10,"1");
      ps.setFloat(11,jsj);
      ps.setString(12,ywxh);
	  ps.setFloat(13,jsl);
	  ps.setFloat(14,sxj);
      if(ps.executeUpdate()!=1){
          out.print("插入退货记录失败");
          success=false;
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      //out.print("ok");
      //如果客户类型为"1",则修改会员详细信息表和会员消费记录表
	if(khlx.equals("1")){
		double xiaoFeiToJf=sthh.getXiaoFeiToJf();
		int jf=0;
		jf=(int)(sxj*xiaoFeiToJf);
		//修改会员详细信息
		sql="select hykh from hy_hyxxb where hykh='"+khbh+"' ";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			rs.close();
			ps.close();
			sql="update hy_hyxxb set gmcs=gmcs-?,xfzje=xfzje-?,jf=jf-?,wdhjf=wdhjf-? where hykh='"+khbh+"'";
			//System.out.println(sql);
			ps=conn.prepareStatement(sql);
			ps.setInt(1,0);
			ps.setFloat(2,sxj);
			ps.setInt(3,jf);
			ps.setInt(4,jf);
			ps.executeUpdate();
			rs.close();
			ps.close();
		}//end if(rs.next())
		rs.close();
		ps.close();
  
		sql="select hykh from hy_hyxfjlb where hykh='"+khbh+"' and ywxh='"+ywxh+"' and gmdd='"+xsdw+"' ";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			rs.close();
			ps.close();
			  //修改会员消费记录
			sql="update hy_hyxfjlb set gmzje=gmzje-? where hykh='"+khbh+"' and ywxh='"+ywxh+"' and gmdd='"+xsdw+"'";
			ps=conn.prepareStatement(sql);
			ps.setFloat(1,sxj);
			ps.executeUpdate();
			rs.close();
			ps.close();
		}//end if(rs.next())
		rs.close();
		ps.close();
	}//end if khlx.equals("1")

/////////////////////////////////////////////////////////////////	  

	 conn.commit();
	 out.print("本店退货处理成功！");
  }catch (Exception e){
     conn.rollback();
     out.print("数据库操作失败：" + e);
  }finally{
     try{
        conn.setAutoCommit(true);  
        if (ps!= null) ps.close();
        if (rs!=null) rs.close();
        if (conn != null) cf.close(conn);
     }catch (Exception e){
        out.println("数据库操作失败："+e.getMessage());
     }
  }
%>