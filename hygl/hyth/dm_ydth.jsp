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
  String thjg=cf.GB2Uni(request.getParameter("thj"));     //退货价
  String thyy=cf.GB2Uni(request.getParameter("thyy"));     //退货原因
%>
<body bgcolor="#FFFFFF" text="#000000">
<%
  Connection conn=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  String sql=new String();
  boolean successed=true;
  String bkbh=new String();
  String xsdw=new String();
  String ywxh=new String();
  float ckj=0;
  float jsl=0;
  String jyfs=new String();
  String khbh=new String();
  String khlx=new String();
  float sxj=0;
  float thj=Float.parseFloat(thjg);
  try{
      conn=cf.getConnection();
      conn.setAutoCommit(false);
      //根据产品编码从产品信息表中取得产品信息
	  //（版库编号、销售单位、业务序号、出库价、结算率、交易方式、客户编号、客户类型，实销价）
      sql="select bkbh,xsdw,ywxh,ckj,jsl,jyfs,khbh,khlx,sxj from cp_cpxx where cpbm='"+cpbm+"'";
      //out.println(sql);
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
		  sxj=rs.getFloat(9);
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      //更新产品信息表中该产品相关记录：物流状态改为13，操作员改为yhdlm，退货价改为thj
      sql="update cp_cpxx set wlzt=?,czy=?,thj=? where cpbm='"+cpbm+"'";
      //out.println(sql);
      ps=conn.prepareStatement(sql);
      ps.setString(1,"13");
      ps.setString(2,yhdlm);
      ps.setFloat(3,thj);
      if(ps.executeUpdate()!=1){
          out.print("产品信息修改失败");
          successed=false;
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      //在退货记录中插入记录
	  //退货日期thrq、退货单位thdw、产品编码cpbm、销售单位xsdw、退货价thj、退货标志1（异店退货）、客户编号khbh
	  //操作员yhdlm、退货原因thyy、审核标志2（未审核）、业务序号ywxh,实销价sxj、结算率jsl
      sql="insert into dm_thjl(thrq,thdw,cpbm,xsdw,thj,thbz,khbh,czy,thyy,shbz,ywxh,sxj,jsl)";
      sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
      ps=conn.prepareStatement(sql);
      ps.setDate(1,java.sql.Date.valueOf(thrq));
      ps.setString(2,thdw);
      ps.setString(3,cpbm);
      ps.setString(4,xsdw);
      ps.setFloat(5,thj);
      ps.setString(6,"1");
      ps.setString(7,khbh);
      ps.setString(8,yhdlm);
      ps.setString(9,thyy);
      ps.setString(10,"2");
      ps.setString(11,ywxh);
	  ps.setFloat(12,sxj);
	  ps.setFloat(13,jsl);
      if(ps.executeUpdate()!=1){
	  out.print("插入退货记录失败");
          successed=false;
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      if (successed){
          conn.commit();
	  out.print("异店退货登记成功！");
      }else{
          conn.rollback();
	  out.print("异店退货登记失败！");
      }
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
