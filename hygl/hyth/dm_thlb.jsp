<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>退货数据</title>
</head>
<%
  String yhdlm =cf.GB2Uni(request.getParameter("yhdlm"));
  String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
  String dwmc=cf.GB2Uni(request.getParameter("dwmc"));
  String yhmc=cf.GB2Uni(request.getParameter("yhmc"));
  String thrq=cf.GB2Uni(request.getParameter("thrq"));
  String []thlb=request.getParameterValues("thlb");
%>
<%
  Connection conn=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  String sql=null;
  String temp_thxx=new String();
  StringTokenizer thxx=null;
  String cpbm=new String();
  String thj=new String();
  String thyy=new String();
  String pmmc=new String();
  String plmc=new String();
  String xsrq=new String();
  String ywxh=new String();
  float sxj=0;
  String xsdw=new String();
  String xsdwmc=new String();
  String wlzt=new String();
  String khbh=new String();
  String hykh=new String();
  String hyjb="非会员";
  /*int xh=0;
  String zpbm=new String();
  String zpmc=new String();
  String zpbmlb=new String();
  String zpmclb=new String();
  */
  String ktbz="";
  StringTokenizer temp_zpmclb=null;
%>
<body bgcolor="#FFFFFF" text="#000000">
<p align=center>退货单</p>
<div align=center>
<table style="FONT-SIZE: 12px"  width=100% bgcolor=#999999 border=0 height="1">
  <tr bgcolor=#ffffff> 
    <td  align=right  colspan=13>操作员:<%=yhmc%>&nbsp; &nbsp; &nbsp;    退货日期:<%=thrq%></td>
  </tr>
  <tr bgcolor="#C0C0C0" align="center"> 
    <td   width=7% >序号</td>
    <td   width=7% >产品条码</td>
    <td   width=14% >品名</td>
    <td   width=7% >销售日期</td>
    <td   width=7% >销售单位</td>
    <td   width=7% >业务序号</td>
    <td   width=7% >实销价</td>
    <td   width=7% >退货价</td>
    <td   width=7% >退货原因</td>
    <td   width=7% >客户编号</td>
    <td   width=7% >会员级别</td>
    <td   width=7% >操作</td>
  </tr>

  <%try{
       conn=cf.getConnection();

       //从退货列表中取出每条信息，内容为产品编码/退货价格/退货原因
       for(int i=0;i<thlb.length;i++){
		  int xh=0;
		  String zpmc="";
		  String zpmclb="";
          ktbz="";  //可退标志
		  String ydth="";
		  temp_thxx=cf.GB2Uni(thlb[i]);
		  //out.println(temp_thxx);
		  thxx=new StringTokenizer(temp_thxx,"/");
     	  cpbm=thxx.nextToken();  //产品列表
		  thj=thxx.nextToken();   //退货价
		  thyy=thxx.nextToken();  //退货原因
		  ydth=thxx.nextToken();  //是否异店退货（0本店 1异店）
		  //根据产品编码从cp_cpxx,xt_pmbm,xt_plbm中查询该产品的信息
		  //(包括品名名称、品类名称、销售日期、业务序号、实销价、销售单位)
		  sql="select xt_plbm.plmc,TO_CHAR(cp_cpxx.xsrq,'YY-MM-DD'),cp_cpxx.ywxh,";
		  sql+=" cp_cpxx.sxj,cp_cpxx.xsdw,sq_dwxx.dwmc,cp_cpxx.wlzt,cp_cpxx.ktbz";
		  sql+=" from cp_cpxx,xt_plbm,sq_dwxx";
		  sql+=" where cp_cpxx.cpbm='"+cpbm+"' ";
		  sql+=" and cp_cpxx.plbm=xt_plbm.plbm and cp_cpxx.xsdw=sq_dwxx.dwbh";
    	  ps=conn.prepareStatement(sql);
		  rs=ps.executeQuery();
		  if(rs.next()){  //存在该商品
			  plmc=rs.getString(2);
			  xsrq=rs.getString(3);
			  ywxh=rs.getString(4);
			  sxj=rs.getFloat(5);
			  xsdw=rs.getString(6);
			  xsdwmc=rs.getString(7);
			  wlzt=rs.getString(8);
			  ktbz=rs.getString(9);
	      }
		  else{
	          plmc="非本公司产品";
		  }
	      //out.println(sql);
		  rs.close();
          ps.close();

		  //如果对该产品所做的操作是处理异店退货登记，则从数据库中读取退货价格和退货原因
		  if(ydth.equals("1")){   //处理异店退货
			  sql="select thj,thyy from dm_thjl where cpbm='"+cpbm+"' and xsdw='"+dwbh+"' ";
			  ps=conn.prepareStatement(sql);
			  rs=ps.executeQuery();
			  if(rs.next()){
			      thj=rs.getString(1);
				  thyy=rs.getString(2);
			  }
			  rs.close();
			  ps.close();
		  }// end if(ydth.equals("1"))

    	  //根据产品编码从cp_cpxx,hy_hyxxb,hy_hyjbb中查询顾客信息（包括客户编号和会员级别）
		  sql="select cp_cpxx.khbh,hy_hyxxb.hykh,hy_hyjbb.hyjb";
		  sql+=" from cp_cpxx,hy_hyxxb,hy_hyjbb";
		  sql+=" where cp_cpxx.cpbm='"+cpbm+"' and cp_cpxx.khbh=hy_hyxxb.hykh";
		  sql+=" and hy_hyxxb.hyjb=hy_hyjbb.hyjbbh";
		  ps=conn.prepareStatement(sql);
		  rs=ps.executeQuery();
		  if(rs.next()){
	         khbh=rs.getString(1);
			 hykh=rs.getString(2);
			 hyjb=rs.getString(3);
		  }
		  rs.close();
		  ps.close();
		  //out.println(sql);
		  //根据销售单位、业务序号和产品编码查询该次业务中该产品销售是附属赠品数量
		  sql="select max(xh) from cp_fszp where cpbm='"+cpbm+"'";
		  ps=conn.prepareStatement(sql);
		  rs=ps.executeQuery();
		  if(rs.next()){
		      xh=rs.getInt(1);
		  }
		  rs.close();
		  ps.close();
		  //out.println(sql);
		  //out.println(xh);
		  //根据产品编码和序号从dm_zpxs,cp_zprk,xt_pmbm中查询赠品信息
		  for(int j=1;j<=xh;j++){
		      sql="select xt_pmbm.pmmc from cp_fszp,cp_zprk,xt_pmbm";
			  sql+=" where cp_fszp.cpbm='"+cpbm+"' and cp_fszp.xh="+j+"";
			  sql+=" and cp_fszp.zpbm=cp_zprk.zpbm and cp_zprk.pmbm=xt_pmbm.pmbm";
			  //out.print(sql);
			  ps=conn.prepareStatement(sql);
			  rs=ps.executeQuery();
			  if(rs.next()){
				  zpmc=rs.getString(1);
			  }
			  rs.close();
			  ps.close();
			  zpmclb=zpmclb+"/"+zpmc;  //该字符串的第一位是"/"，使用时要从第二位开始
	      }//end for loop for zp
%>
  <tr bgcolor=#ffffff>
    <td ><%=i+1%></td>
    <td ><%=cpbm%></td>
    <td ><%=plmc%></td>
    <td ><%=xsrq%></td>
    <td ><%=xsdwmc%></td>
    <td ><%=ywxh%></td>
    <td ><%=sxj%></td>
    <td ><%=thj%></td>
    <td ><%=thyy%></td>
    <td ><%=khbh%></td>
    <td ><%=hyjb%></td>
<% 
    //如果是本单位销售的产品，产品的可退标志为可退（0）而且产品的物流状态为已销售或异店退货
	//则在本产品信息之后显示本店退货处理
    if(dwbh.equals(xsdw)&&ktbz.equals("0")&&(wlzt.equals("05")||wlzt.equals("13"))){
%>
    <td  align=center width=5%>
	<a href="dm_bdth.jsp?yhdlm=<%=yhdlm%>&thdw=<%=dwbh%>&cpbm=<%=cpbm%>&thrq=<%=thrq%>&thj=<%=thj%>&thyy=<%=thyy%>">本店退货</a></td>
<% //如果不是本单位销售的产品，产品的可退标志为可退（0）而且产品的物流状态为已销售
	//则在本产品信息之后显示异店退货
    }
	else if(!dwbh.equals(xsdw)&&ktbz.equals("0")&&wlzt.equals("05")){
%>
    <td  align=center width=5%>
	<a href="dm_ydth.jsp?yhdlm=<%=yhdlm%>&thdw=<%=dwbh%>&cpbm=<%=cpbm%>&thrq=<%=thrq%>&thj=<%=thj%>&thyy=<%=thyy%>">异店退货</a></td>
<%  //否则显示不可退
    }else{
%>
  <td align="center">不可退</td>
<%}%>
  </tr>
<%
  if(xh!=0){
%>
<tr>
  <td  width=10% colspan="13" align=right bgcolor="#FFFFFF">附属赠品名称:<%=zpmclb.substring(1)%></td>
</tr>
<%}//end if(xh!=0)
    }//end for loop for cp
    wlzt="";
    }catch (Exception e) { 
	   out.print("数据库操作失败：" + e); 
    }finally{ 
        try{ 
	    if (ps!= null) ps.close();   
 	    if (rs!= null) rs.close();   
	    if (conn != null) cf.close(conn);   
	}catch (Exception e){  
	    out.println("数据库操作失败："+e.getMessage());  
	}  
    }
  %>
</table>
</div>
</body>
</html>
