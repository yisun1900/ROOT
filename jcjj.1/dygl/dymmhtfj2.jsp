<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
	String jc_mmydd_khxm=null;
	String jc_mmydd_jhazsj=null;
	Connection conn  = null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String ls_sql=null;
	try {
	    conn=cf.getConnection();
	    ls_sql="select khxm,fwdz,lxfs,htrq,jhazsj,mmhtje,wjhtje,blhtje,htje,azjssj";
	    ls_sql+=" from  jc_mmydd";
		ls_sql+=" where yddbh='"+yddbh+"'";
		//out.print(ls_sql);
	    ps= conn.prepareStatement(ls_sql);
	    rs =ps.executeQuery(ls_sql);
	    if (rs.next())
	    {
		   jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		   jc_mmydd_jhazsj=cf.fillNull(rs.getString("jhazsj"));
		   jc_mmydd_jhazsj=jc_mmydd_jhazsj.substring(0,10);
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
<title>松下亿达家具/壁柜门订购合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr> 
    <td width="34%"> 
    <div align="left">附件： </div></td>
  </tr>
  <tr align="right"> 
    <td><div align="center"><strong>元 洲 木 门 确 认 表</strong></div></td>
  </tr>
  <tr> 
    <td><table width="100%" border="0">
      <tr>
        <td width="280" scope="row">客户姓名：<%=jc_mmydd_khxm%></td>
        <td width="265" scope="row"> <div align="left"> 传真工厂记录：</div></td>
        <td width="200">安装日期：<%=jc_mmydd_jhazsj%></td>
      </tr>
    </table>
  <table width="100%" border="0">
              <tr>
                <td width="45%" scope="row"><div align="left"><strong>木质品部分 </strong></div></td>
                <td width="55%"><strong> 金额小计：</strong></td>
              </tr>
          </table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="4%">楼层</td>
	<td  width="5%">款式/编号</td>
	<td  width="8%">油色</td>
	<td  width="5%">安装位置</td>
	<td  width="5%">开启方向</td>
	<td  width="5%">单口</td>
	<td  width="5%">双口</td>
	<td  width="5%">地材种类</td>
	<td  width="5%">地材厚度</td>
	<td  width="7%">门洞规格</td>
	<td  width="4%">单位</td>
	<td  width="7%">金额</td>
	<td  width="10%">玻璃种类</td>
</tr>
<%

	ls_sql="SELECT '','',jc_mmydmx.mmxh,mmczmc,azwzmc,kqfxmc,'','', dczlmc,dczlmc,'','',mmhtje,jc_blbj.blxh ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmydmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm ,jc_mmydd ";
    ls_sql+=" where jc_mmydmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmydmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmydmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmydmx.czbm=dm_czbm.czbm(+) and jc_mmydmx.ysbm=jdm_mmczbm.mmczbm";
	ls_sql+=" and jc_mmydmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmydmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmydmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmydmx.blxhbm=jc_blbj.blxhbm(+)";
    ls_sql+=" and  jc_mmydmx.mlx=jdm_mlx.mlx(+) and jc_mmydmx.yddbh='"+yddbh+"' and jc_mmydd.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmydmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
	pageObj.printSum();
	pageObj.printFoot();

%>          
          <table width="100%" border="0">
              <tr> 
                <td width="100%"><table width="765" border="0">
                  <tr>
                    <th width="333" scope="row"><div align="left">五金类部分 </div></th>
                    <td width="422"><strong>金额小计：</strong></td>
                  </tr>
               
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="8%">种类</td>
	<td  width="8%">品牌</td>
	<td  width="8%">型号</td>
	<td  width="5%">单位</td>
	<td  width="8%">单价</td>
	<td  width="8%">金 额</td>

</tr>
<%

	ls_sql="SELECT '',wjjbm,xh,xinghao,sl,dj ,sl*dj";
	ls_sql+=" FROM jc_wjjddmx ";
    ls_sql+=" where  jc_wjjddmx.yddbh='"+yddbh+"' ";
    ls_sql+=" order by jc_wjjddmx.yddbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>
</table>
</td>
        </tr>
        <tr>
          <td>累计金额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元人民币（小写）</td>
        </tr>
        <tr>
          <td>已交订金：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元人民币（小写）</td>
        </tr>
        <tr>
          <td>实交款额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元人民币（小写）</td>
        </tr>
        <tr>
          <td>（大写）&nbsp;&nbsp;&nbsp;&nbsp; 万 &nbsp;&nbsp;&nbsp;&nbsp;仟 &nbsp;&nbsp;&nbsp;&nbsp;佰 &nbsp;&nbsp;&nbsp;&nbsp;元整</td>
        </tr>
        <tr>
          <td> 备注：</td>
        </tr>
        <tr>
          <td> 特殊提示：如您订购的是复合木地板，1.5m范围内地面落差超过2--3mm，必须对地面进行找平处理。</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="151"><table width="757" border="0">
        <tr>
 
          <td width="204">客户签字：</td>
          <td width="115">&nbsp;</td>
          <td width="388">经办人：</td>
        </tr>
        <tr>
  
          <td>签订日期：<%=cf.today()%></td>
          <td>&nbsp;</td>
          <td>签订日期：<%=cf.today()%></td>
        </tr>
      </table>      
    <p>&nbsp;</p>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
