<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String cw_khfkjl_fkxh=null;
String cw_khfkjl_sjbh=null;
String cw_khfkjl_fklxbm=null;
String cw_khfkjl_fkje=null;
String cw_khfkjl_jkr=null;
String cw_khfkjl_skr=null;
String cw_khfkjl_sksj=null;
String cw_khfkjl_skdw=null;
String cw_khfkjl_lrr=null;
String cw_khfkjl_lrsj=null;
String cw_khfkjl_bz=null;
String zffs=null;
String zckx=null;
String lrdw=null;
String fkcs=null;
String yfkbl=null;
String yfkje=null;
String gysbh=null;
String gljlbz=null;
String glxh=null;

String zcgysbh=null;
String xuhao=null;
String czlx=null;
String zrkdcpz=null;
String zckdcpz=null;
String dcr=null;
String dcsj=null;

String skdd=null;
String dsksjbz=null;
String sjr=null;
String sjsj=null;
String scbz=null;
String scr=null;
String scsj=null;
String sjfkzc=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String khlx=null;
String ddbh=null;
String zcddbh=null;
String yjjzsj=null;
String zjxbh=null;
String zczjxbh=null;
String jzwkqs=null;
String shsj=null;
String shyj=null;
String fkkhxm=null;
String fkfwdz=null;
String zzyhkh=null;

String fkxh=null;
fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select fkkhxm,fkfwdz,zzyhkh,shyj,shsj,DECODE(NVL(jzwkqs,'N'),'Y','全收','N','否') jzwkqs,zjxbh,zczjxbh,yjjzsj,ddbh,zcddbh,gljlbz,glxh,zcgysbh,xuhao,DECODE(cw_khfkjl.czlx,'1','录入','2','导出凭证','3','凭证导入') czlx,DECODE(cw_khfkjl.zrkdcpz,'0','否','1','是') zrkdcpz,DECODE(cw_khfkjl.zckdcpz,'0','否','1','是') zckdcpz,dcr,dcsj,DECODE(sjfkzc,'N','不可转出','Y','可转出') sjfkzc,gysbh,yfkje,fkcsmc fkcs,cw_khfkjl.yfkbl,DECODE(scbz,'N','未删除','Y','<font color=\"#FF0000\">已删除</font>') scbz,scr,scsj,zckx,lrdw,zffs,skdd,dsksjbz,sjr,sjsj,cw_khfkjl.khbh as khbh,cw_khfkjl.fkxh as cw_khfkjl_fkxh,cw_khfkjl.sjbh as cw_khfkjl_sjbh,cw_khfkjl.fklxbm as cw_khfkjl_fklxbm,cw_khfkjl.fkje as cw_khfkjl_fkje,cw_khfkjl.jkr as cw_khfkjl_jkr,cw_khfkjl.skr as cw_khfkjl_skr,cw_khfkjl.sksj as cw_khfkjl_sksj,cw_khfkjl.skdw as cw_khfkjl_skdw,cw_khfkjl.lrr as cw_khfkjl_lrr,cw_khfkjl.lrsj as cw_khfkjl_lrsj,cw_khfkjl.bz as cw_khfkjl_bz ";
	ls_sql+=" from  cw_khfkjl,cw_fkcs";
	ls_sql+=" where cw_khfkjl.fkcs=cw_fkcs.fkcs(+) and cw_khfkjl.fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkkhxm=cf.fillNull(rs.getString("fkkhxm"));
		fkfwdz=cf.fillNull(rs.getString("fkfwdz"));
		zzyhkh=cf.fillNull(rs.getString("zzyhkh"));
		shyj=cf.fillNull(rs.getString("shyj"));
		shsj=cf.fillNull(rs.getString("shsj"));
		jzwkqs=cf.fillNull(rs.getString("jzwkqs"));
		zjxbh=cf.fillNull(rs.getString("zjxbh"));
		zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		gljlbz=cf.fillNull(rs.getString("gljlbz"));
		glxh=cf.fillNull(rs.getString("glxh"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		xuhao=cf.fillNull(rs.getString("xuhao"));
		czlx=cf.fillNull(rs.getString("czlx"));
		zrkdcpz=cf.fillNull(rs.getString("zrkdcpz"));
		zckdcpz=cf.fillNull(rs.getString("zckdcpz"));
		dcr=cf.fillNull(rs.getString("dcr"));
		dcsj=cf.fillNull(rs.getString("dcsj"));
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		gysbh=cf.fillNull(rs.getString("gysbh"));
		yfkje=cf.fillNull(rs.getString("yfkje"));
		fkcs=cf.fillNull(rs.getString("fkcs"));
		yfkbl=cf.fillNull(rs.getString("yfkbl"));
		scbz=cf.fillNull(rs.getString("scbz"));
		scr=cf.fillNull(rs.getString("scr"));
		scsj=cf.fillNull(rs.getString("scsj"));
		zckx=cf.fillNull(rs.getString("zckx"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		zffs=cf.fillNull(rs.getString("zffs"));
		skdd=cf.fillNull(rs.getString("skdd"));
		dsksjbz=cf.fillNull(rs.getString("dsksjbz"));
		sjr=cf.fillNull(rs.getString("sjr"));
		sjsj=cf.fillNull(rs.getDate("sjsj"));

		khbh=cf.fillNull(rs.getString("khbh"));
		cw_khfkjl_fkxh=cf.fillNull(rs.getString("cw_khfkjl_fkxh"));
		cw_khfkjl_sjbh=cf.fillNull(rs.getString("cw_khfkjl_sjbh"));
		cw_khfkjl_fklxbm=cf.fillNull(rs.getString("cw_khfkjl_fklxbm"));
		cw_khfkjl_fkje=cf.fillNull(rs.getString("cw_khfkjl_fkje"));
		cw_khfkjl_jkr=cf.fillNull(rs.getString("cw_khfkjl_jkr"));
		cw_khfkjl_skr=cf.fillNull(rs.getString("cw_khfkjl_skr"));
		cw_khfkjl_sksj=cf.fillNull(rs.getDate("cw_khfkjl_sksj"));
		cw_khfkjl_skdw=cf.fillNull(rs.getString("cw_khfkjl_skdw"));
		cw_khfkjl_lrr=cf.fillNull(rs.getString("cw_khfkjl_lrr"));
		cw_khfkjl_lrsj=cf.fillNull(rs.getDate("cw_khfkjl_lrsj"));
		cw_khfkjl_bz=cf.fillNull(rs.getString("cw_khfkjl_bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,lxfs,fwdz,hth,DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') zt" ;
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		khlx=cf.fillNull(rs.getString("zt"));
	}
	else{
		rs.close();
		ps.close();

		ls_sql="select khxm,lxfs,fwdz,hth,DECODE(zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zt";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			hth=cf.fillNull(rs.getString("hth"));
			khlx=cf.fillNull(rs.getString("zt"));
		}
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">客户付款记录（收款序号：<%=fkxh%>）
<%
	if (cw_khfkjl_fklxbm.equals("11") )
	{
		%>
        <input type="button" name="Button" value="打印收据" onClick="window.open('/cwgl/qyecx/PrintJzSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')">
		<%
	}
	else if (cw_khfkjl_fklxbm.equals("21") || cw_khfkjl_fklxbm.equals("22") || cw_khfkjl_fklxbm.equals("23") || cw_khfkjl_fklxbm.equals("24") )
	{
		%>
        <input type="button" name="Button" value="打印收据" onClick="window.open('/cwgl/qyecx/PrintJcSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')">
		<%
	}
	else{
		%>
        <input type="button" name="Button" value="打印收据" onClick="window.open('/cwgl/qyecx/PrintQtSj.jsp?fkxh=<%=fkxh%>&khbh=<%=khbh%>')">
		<%
	}

%>
      
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right"> 
              客户编号            </td>
            <td width="33%"> <%=khbh%> </td>
            <td width="20%" align="right"> 
              合同号            </td>
            <td width="32%"><%=hth%> </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right"><strong> 
            当前客户姓名            </strong></td>
            <td width="33%"><A HREF='/cwgl/qyecx/ViewKhxx.jsp?fkxh=<%=fkxh%>' target='_blank'><B><%=khxm%></B></A>            </td>
            <td width="20%" align="right"><strong>付款客户姓名</strong></td>
            <td width="32%"><%=fkkhxm%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right"><strong>当前房屋地址</strong></td>
            <td><%=fwdz%></td>
            <td align="right" bgcolor="#FFFFCC"><strong>付款房屋地址</strong></td>
            <td bgcolor="#FFFFCC"><%=fkfwdz%></td>
          </tr>
          <tr bgcolor="#FFFFCC">
            <td align="right">客户类型</td>
            <td><%=khlx%></td>
            <td align="right" bgcolor="#FFFFCC">家装尾款全收</td>
            <td><%=jzwkqs%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="20%" align="right"> 
              收款序号            </td>
            <td width="33%"> <%=cw_khfkjl_fkxh%> </td>
            <td width="20%" align="right" bgcolor="#FFFFCC">收据编号</td>
            <td width="32%"><%=cw_khfkjl_sjbh%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="20%" align="right" bgcolor="#FFFFCC">收款类型</td>
            <td width="33%"><%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+cw_khfkjl_fklxbm+"'",cw_khfkjl_fklxbm,true);
%></td>
            <td width="20%" align="right">支付方式</td>
            <td width="32%"><%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm where zffsbm='"+zffs+"'",zffs,true);
%></td>
          </tr>
          <tr bgcolor="#FFFFCC">
            <td align="right">收款品牌</td>
            <td><%=gysbh%></td>
            <td align="right">银行转帐帐号</td>
            <td><%=zzyhkh%></td>
          </tr>
          
          
          <tr bgcolor="#FFFFCC">
            <td align="right">收款订单编号</td>
            <td><%=ddbh%></td>
            <td align="right">收款增减项编号</td>
            <td><%=zjxbh%></td>
          </tr>
          <tr bgcolor="#FFFFCC">
            <td align="right">转帐款项</td>
            <td><%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fklxbm='"+zckx+"'",zckx,true);
%></td>
            <td align="right">转帐品牌</td>
            <td><%=zcgysbh%></td>
          </tr>
          
          <tr bgcolor="#FFFFCC"> 
            <td width="20%" align="right">转帐订单编号</td>
            <td width="33%"><%=zcddbh%></td>
            <td width="20%" align="right">转帐增减项编号</td>
            <td width="32%"><%=zczjxbh%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right"><span class="STYLE1">收款期数</span></td>
            <td><%=fkcs%></td>
            <td align="right"><span class="STYLE1">应收款比率</span></td>
            <td><%=yfkbl%>%</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align="right"><span class="STYLE1">应收款金额</span></td>
            <td><%=yfkje%></td>
            <td align="right"><span class="STYLE1">实收款金额</span></td>
            <td><%=cw_khfkjl_fkje%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td bgcolor="#FFFFFF" align="right">业绩结转时间</td>
            <td><%=yjjzsj%></td>
            <td align="right">交款人</td>
            <td><%=cw_khfkjl_jkr%></td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right"> 
              收款人            </td>
            <td width="33%"> <%=cw_khfkjl_skr%> </td>
            <td width="20%" align="right"> 
              收款时间            </td>
            <td width="32%"> <%=cw_khfkjl_sksj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">收款单位</td>
            <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_khfkjl_skdw+"'",cw_khfkjl_skdw,true);
%></td>
            <td width="20%" align="right">录入单位</td>
            <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw,true);
%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right" bgcolor="#FFFFFF"> 
              录入人            </td>
            <td width="33%"><%=cw_khfkjl_lrr%> </td>
            <td width="20%" align="right"> 
              录入时间            </td>
            <td width="32%"><%=cw_khfkjl_lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">是否需审核</td>
            <td width="33%"><%
	cf.selectToken(out,"1+不需审核&2+需审核",skdd,true);
%></td>
            <td width="20%" align="right">审核标志</td>
            <td width="32%"><%
	cf.selectToken(out,"N+未审核&Y+审核通过&M+审核未通过",dsksjbz,true);
%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">财务收款时间</td>
            <td><%=sjsj%></td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">审核人</td>
            <td width="33%"><%=sjr%></td>
            <td width="20%" align="right">审核时间</td>
            <td width="32%"><%=shsj%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">审核意见</td>
            <td colspan="3"><%=shyj%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="20%" align="right">关联记录标志</td>
            <td width="33%"><%
	cf.selectToken(out,"N+非关联记录&Y+关联记录",gljlbz,true);
%></td>
            <td width="20%" align="right">关联序号</td>
            <td width="32%"><%=glxh%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="20%" align="right">导入凭证序号</td>
            <td width="33%"><%=xuhao%></td>
            <td width="20%" align="right">操作类型</td>
            <td width="32%"><%=czlx%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="20%" align="right">转入款导出凭证</td>
            <td width="33%"><%=zrkdcpz%></td>
            <td width="20%" align="right">转出款导出凭证</td>
            <td width="32%"><%=zckdcpz%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="20%" align="right">导出人</td>
            <td width="33%"><%=dcr%></td>
            <td width="20%" align="right">导出时间</td>
            <td width="32%"><%=dcsj%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right" bgcolor="#CCCCFF">删除标志</td>
            <td width="33%" bgcolor="#CCCCFF"><%=scbz%></td>
            <td width="20%" align="right" bgcolor="#FFFFFF">设计费是否可转出</td>
            <td width="32%" bgcolor="#FFFFFF"><%=sjfkzc%></td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="20%" align="right" bgcolor="#CCCCFF">删除人</td>
            <td width="33%"><%=scr%></td>
            <td width="20%" align="right">删除时间</td>
            <td width="32%"><%=scsj%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">备注</td>
            <td colspan="3"><%=cw_khfkjl_bz%></td>
          </tr>
      </table>

	  
	  
    </td>
  </tr>
</table>
<center>关联记录（支付方式为转换款项，才会有关联记录）</center>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">收款序号</td>
		<td  width="9%">收款类型</td>
		<td  width="6%">期数</td>
		<td  width="14%" bgcolor="#CCCCCC">收款品牌</td>
		<td  width="7%" bgcolor="#CCCCCC">收款订单号</td>
		<td  width="8%">实收款金额</td>
		<td  width="6%">审核</td>
		<td  width="6%">支付</td>
		<td  width="9%">转帐款项</td>
		<td  width="14%">转帐品牌</td>
		<td  width="7%">转帐订单号</td>
		<td  width="7%">收款时间</td>
	</tr>
	<%

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,ddbh,cw_khfkjl.fkje,DECODE(skdd,'1','不需','2','需审核') skdd";
	ls_sql+=" ,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,cw_khfkjl.sksj";
	ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
	ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.glxh='"+glxh+"' ";
	ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
	ls_sql+=" order by cw_khfkjl.fklxbm,gysbh,fkxh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>

</body>
</html>
