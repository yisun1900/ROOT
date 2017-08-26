<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<html>
<head>
<title>销售票据</title>
</head>
<%
String ywxh =cf.GB2Uni(request.getParameter("ywxh"));
String xsrq =cf.GB2Uni(request.getParameter("xsrq"));
String dwmc=cf.GB2Uni(request.getParameter("dwmc"));
String yhmc=cf.GB2Uni(request.getParameter("yhmc"));
String cplb=cf.GB2Uni(request.getParameter("cplb"));
%>

<body bgcolor="#FFFFFF" text="#000000">
<p align="center">销售票据</p>
<div align=center>
<table style="FONT-SIZE: 14px"  width=100%         
      bgcolor=#999999 border=0 height="14">
  <tr bgcolor=#ffffff> 
    <td height="16" width="12%" colspan=6 align="right"> 
    <%=ywxh%>
    </td>
  </tr>
  <tr bgcolor=#ffffff> 
    <td height="16" width="12%" align="center"> 
      <p align="left">店面名称</p>
    </td>
    <td height="16" width=30% align="center"> 
      <p align="left"><%=dwmc%></p>
    </td>
    <td height="16" width="12%" align="center"> 销售日期</td>
    <td height="16" width=20% align="center"><%=xsrq%></td>
    <td height="16" width="12%" align="center">操作员</td>
    <td height="16" width=14% align="center"><%=yhmc%></td>
  </tr>
</table>
</div>
<div align=center>
<table border="1" width=100%>
  <tr> 
    <td width="12%" bgcolor="#C0C0C0" align="center"><font size="2">产品条码</font></td>
    <td width="12%" bgcolor="#C0C0C0" align="center"><font size="2">产品名称</font></td>
    <td width="12%" bgcolor="#C0C0C0" align="center"><font size="2">品类名称</font></td>
    <td width="12%" bgcolor="#C0C0C0" align="center" ><font size="2">实销价</font></td>
  </tr>
 <%
 Connection conn=null;
 PreparedStatement ps=null;
 ResultSet rs=null;
 String sql=new String();
 StringTokenizer xsxx=new StringTokenizer(cplb.substring(1),"/");
 int cps=xsxx.countTokens();
 String cpbm=new String();
 String pmmc=new String();
 String plmc=new String();
 float sxj=0;
 float sum=0;
     
 try{
     conn=cf.getConnection();
     for(int i=0;i<cps;i++){
         cpbm=xsxx.nextToken();   
         sql="select xt_pmbm.pmmc,xt_plbm.plmc,cp_cpxx.sxj from cp_cpxx,xt_pmbm,xt_plbm";
         sql+=" where cp_cpxx.cpbm='"+cpbm+"' and cp_cpxx.pmbm=xt_pmbm.pmbm and cp_cpxx.plbm=xt_plbm.plbm";
	 //out.println(sql);
         ps=conn.prepareStatement(sql);
         rs=ps.executeQuery();
         if(rs.next()){
             pmmc=rs.getString(1);
             plmc=rs.getString(2);
	     sxj=rs.getFloat(3);
         }
	 if(rs!=null) rs.close();
         if(ps!=null) ps.close();
%>
  <tr> 
    <td width="12%" align="center"><font size="2"><%=cpbm%></font></td>
    <td width="12%" align="center"><font size="2"><%=pmmc%></font></td>
    <td width="12%" align="center"><font size="2"><%=plmc%></font></td>
    <td width="12%" align="right"><font size="2"><%=sxj%></font></td>
  </tr>     
<%
         sum=sum+sxj*100;
 }//end for loop
 }catch (Exception e) { 
        out.print("数据库操作失败：" + e); 
 }finally{ 
     try{
         if (ps!= null) ps.close();   
	 if(rs!=null) rs.close();
	 if (conn != null) cf.close(conn);   
     }catch (Exception e){  
         out.println("数据库操作失败："+e.getMessage());  
     }  
  }
 %>
 <tr>
    <td width="12%" bgcolor="#C0C0C0" colspan=4><font size="2">实销价总额：<%=sum/100%></font></td>
  </tr>
</table>
</div>
<p>&nbsp;</p>
</body>
</html>