<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ddbh=request.getParameter("ddbh");
    String jc_cgdd_khxm=null;
	Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
	try {
	    conn=cf.getConnection();
	    ls_sql="select khxm";
	    ls_sql+=" from  jc_cgdd,crm_khxx";
		ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and ddbh='"+ddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_cgdd_khxm=cf.fillNull(rs.getString("khxm"));
		   
		 }
	     rs.close();
	     ps.close();

       }
      catch (Exception e) {
	      out.print("Exception: " + e);
	      return;
      }
     finally 
    {
	   try{
		    if (rs != null) rs.close(); 
		    if (ps != null) ps.close(); 
		    if (conn != null) cf.close(conn); 
	      }
	     catch (Exception e){
		     if (conn != null) cf.close(conn); 
	     }
      }


%>
<html>
<head>
<title>壁柜门附件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr align="right">
    <td><div align="center"><strong>壁柜门附件</strong></div></td>
  </tr>
  <tr align="right"> 
    <td width="34%"><div align="left">客户姓名：<%=jc_cgdd_khxm%></div></td>
  </tr>
  <tr> 
    <td>
     <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">家具类别</td>
	<td  width="8%">门安装位置</td>
	<td  width="6%">壁柜门长度</td>
	<td  width="6%">壁柜门宽度</td>
	<td  width="8%">边框颜色</td>
	<td  width="8%">边框型号</td>
	<td  width="8%">面板材料1</td>
	<td  width="8%">面板材料2</td>
	<td  width="8%">面板材料3</td>
	<td  width="6%">单价</td>
	<td  width="24%">备注</td>
</tr>
<%

	ls_sql="SELECT jdm_jjlbbm.jjlbmc,jdm_bgmazwzbm.bgmazwzmc,TO_CHAR(jc_ddbgmmx.bgmcd),TO_CHAR(jc_ddbgmmx.bgmkd),jdm_bgmbkysbm.bgmbkysmc,jc_ddbgmmx.bgmbkxh,jdm_bgmmbclbm.bgmmbclmc,jc_ddbgmmx.bgmmbclbm2,jc_ddbgmmx.bgmmbclbm3,jc_ddbgmmx.dj,jc_ddbgmmx.bz  ";
	ls_sql+=" FROM jc_ddbgmmx,jdm_bgmazwzbm,jdm_bgmbkysbm,jdm_bgmmbclbm,jdm_jjlbbm  ";
    ls_sql+=" where jc_ddbgmmx.bgmbkysbm=jdm_bgmbkysbm.bgmbkysbm(+) and jc_ddbgmmx.bgmazwzbm=jdm_bgmazwzbm.bgmazwzbm(+)";
    ls_sql+=" and jc_ddbgmmx.jjlbbm=jdm_jjlbbm.jjlbbm(+) and JC_DDBGMMX.bgmmbclbm1=jdm_bgmmbclbm.bgmmbclbm(+)";
    ls_sql+=" and jc_ddbgmmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
            <table width="100%" border="0">
              <tr> 
                <td width="100%"><table width="765" border="0">
                  <tr>
                    <td width="195" scope="row">小 计:</td>
                    <td width="560" scope="row">实收金额：（大写）&nbsp; 万 &nbsp;仟&nbsp; 佰&nbsp; 拾 &nbsp;元整 ￥：</td>
                  </tr>
                </table> 
                </td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><p>壁柜门简图：</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p></td>
        </tr>
        <tr>
          <td>备注：</td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
              <td width="45">&nbsp;</td>
              <td width="705">1、请将壁柜门的分割尺寸表示清楚（请注意分割的尺寸对其的影响）。</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>2、隔断门需在地板或地砖铺好后测量，壁柜门应尽可能在壁柜安装后再复测。</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>3、无特殊情况壁柜加工周期为10天，具备条件后测量或安装请提前3天通知。</td>
            </tr>
          </table></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="151"><table width="757" border="0">
        <tr>
          <td width="175" height="15">客户签字：</td>
          <td width="190"> 签定日期：<%=cf.today()%></td>
          <td width="213">家居设计师：</td>
          <td width="161">&nbsp;</td>
        </tr>
      </table>      
    <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
