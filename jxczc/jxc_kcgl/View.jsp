<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String clbm="";
String dqbm="";
String gysmc="";
String lsj="";
String xsj="";
String cxhdbl="";
String myqjf="";
String sfycx="";
String cxkssj="";
String cxjzsj="";
String cxj="";
String lscxhdbl="";
String cxmyqjf="";
String xsfs="";
double zcpzsl=0;
String dhsl="";
String ycgsl="";
String whereclbm="";
String wheredqbm="";
String clmc="";
String xh="";
String gg="";
String zp="";
String scsmc=""; 
String ppmc="";
String cldlbm=""; 
String clxlbm="";
String ccpzsl="";
String bfpzsl="";
String wheresql="";
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
if (whereclbm!=null && !(whereclbm.equals("")))
{
//	whereclbm=cf.addZero(whereclbm,13);
	wheresql+=" and jxc_clbm.nbbm='"+whereclbm+"' ";
}
wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
if (wheredqbm!=null && !(wheredqbm.equals("")))
{wheresql+=" and jxc_cljgb.dqbm='"+wheredqbm+"' ";}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select jxc_cljgb.clbm clbm,dqmc dqbm,jxc_kcb.gysmc gysmc,lsj,xsj,cxhdbl,myqjf,DECODE(sfycx,'N','无','Y','有') sfycx,cxkssj,cxjzsj,cxj,lscxhdbl,cxmyqjf,DECODE(xsfs,'1','代销品','2','现货销售','3','库存无货可销售') xsfs,zcpzsl,dhsl,ycgsl,jxc_clbm.clmc clmc,jxc_clbm.xh xh,jxc_clbm.gg gg,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_kcb.zp||'\" width=\"100px\" height=\"100px\">' zp,jxc_clbm.scsmc scsmc,jxc_clbm.ppmc ppmc,jxc_clbm.cldlbm cldlbm,jxc_clbm.clxlbm clxlbm,ccpzsl,bfpzsl ";
	ls_sql+=" from  jxc_cljgb,dm_dqbm,jxc_kcb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_kcb.clbm and jxc_cljgb.dqbm=dm_dqbm.dqbm and jxc_clbm.clbm=jxc_cljgb.clbm "; 
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ccpzsl=cf.fillNull(rs.getString("ccpzsl"));
		bfpzsl=cf.fillNull(rs.getString("bfpzsl"));
		clbm=cf.fillNull(rs.getString("clbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		lsj=cf.fillNull(rs.getString("lsj"));
		xsj=cf.fillNull(rs.getString("xsj"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		myqjf=cf.fillNull(rs.getString("myqjf"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cxj=cf.fillNull(rs.getString("cxj"));
		lscxhdbl=cf.fillNull(rs.getString("lscxhdbl"));
		cxmyqjf=cf.fillNull(rs.getString("cxmyqjf"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		zcpzsl=rs.getDouble("zcpzsl");
		dhsl=cf.fillNull(rs.getString("dhsl"));
		ycgsl=cf.fillNull(rs.getString("ycgsl"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		zp=cf.fillNull(rs.getString("zp"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
	}
	else 
	{
		if (whereclbm!=null && !(whereclbm.equals("")))
		{
			%>
		<SCRIPT language=javascript >
		<!--
//		alert("没有在库存中找到相应数据！");
		window.location.href="View2.jsp?dqbm=<%=wheredqbm%>&clbm=<%=whereclbm%>";
		window.close();
		//-->
		</SCRIPT>
		<%
		}
	}
//	out.print(ls_sql);
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 材料信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">材料编码</td>
  <td bgcolor="#FFFFCC"><%=clbm%></td>
  <td width="15%" rowspan="4" align="right">照片</td>
  <td width="35%" rowspan="4"><%=zp%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">材料名称</td>
  <td><%=clmc%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">供应商 </td>
  <td><%=gysmc%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="15%" align="right"><font color="red">销售价</font></td>
  <td width="35%"><%=xsj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#99CCFF">材料大类</td>
  <td width="35%" bgcolor="#99CCFF"><%=cldlbm%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">材料小类</td>
  <td width="35%" bgcolor="#99CCFF"><%=clxlbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" width="15%" bgcolor="#99CCFF"> 
    品牌</td>
  <td width="35%" bgcolor="#99CCFF"><%=scsmc%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">子品牌</td>
  <td width="35%" bgcolor="#99CCFF"><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99CCFF">型号</td>
  <td bgcolor="#99CCFF"><%=xh%></td>
  <td align="right" bgcolor="#99CCFF">规格</td>
  <td bgcolor="#99CCFF"><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF">地区编码 </td>
  <td width="35%" bgcolor="#9999FF"><%=dqbm%></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color=green>正常品总数量</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=green><%=zcpzsl%></font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF"><font color=blue>残次品总数量</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=blue><%=ccpzsl%></font></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color=red>报废品总数量</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=red><%=bfpzsl%></font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">市场标价</td>
  <td width="35%" bgcolor="#CCFFCC"><%=lsj%></td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    计入活动比例  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxhdbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    每元钱积分  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=myqjf%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    是否有促销  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=sfycx%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销开始时间  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxkssj%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销结束时间  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxjzsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    <font color="red">促销价</font>  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxj%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销期计入活动比例  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=lscxhdbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    促销期每元钱积分  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxmyqjf%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    销售方式  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=xsfs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">已采购数量</td>
  <td width="35%" bgcolor="#CCFFCC"><%=ycgsl%></td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    客户订货数量  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=dhsl%>  </td>
</tr>
</table>
</body>
</html>
<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql2=null;
	String wheresql2=" and clbm= '"+clbm+"' and jxc_kcb.dqbm='"+wheredqbm+"' ";
	ls_sql2="SELECT dqmc,ckmc,hjmc,hwmc,jxc_kcb.clbm clbm,jxc_kcb.clmc clmc,DECODE(zljb,'1','<font color=green>正常品</font>','2','<font color=blue>残次品</font>','3','<font color=red>报废品</font>'),jxc_kcb.xh xh,jxc_kcb.nbbm nbbm,'' zp,SUM(jxc_kcb.kcsl) ";
	ls_sql2+=" FROM jxc_kcb,dm_dqbm,jxc_ckmc,jxc_hjmc,jxc_hwmc  ";
    ls_sql2+=" where jxc_kcb.dqbm=dm_dqbm.dqbm and jxc_kcb.ckbh=jxc_ckmc.ckbh and jxc_kcb.hjbh=jxc_hjmc.hjbh and jxc_kcb.hwbh=jxc_hwmc.hwbh ";
    ls_sql2+=wheresql2;
	ls_sql2+=" group by dqmc,ckmc,hjmc,hwmc,jxc_kcb.clbm,jxc_kcb.clmc,DECODE(zljb,'1','<font color=green>正常品</font>','2','<font color=blue>残次品</font>','3','<font color=red>报废品</font>'),jxc_kcb.xh,jxc_kcb.nbbm,'' ";
	ls_sql2+=" order by dqmc,ckmc,hjmc,hwmc,jxc_kcb.clmc ";
//	out.print(ls_sql2);

    pageObj.sql=ls_sql2;
//进行对象初始化
	pageObj.initPage("","","","");
//	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lsh","jxc_kcb_clmc","jxc_kcb_cllb","jxc_kcb_cldlbm","jxc_kcb_clxlbm","jxc_kcb_scsmc","jxc_kcb_ppmc","jxc_kcb_cllbbm","jxc_kcb_xh","jxc_kcb_gg","jxc_kcb_clysbm","jxc_kcb_jldwbm","jxc_kcb_hwbh","jxc_kcb_pjts","jxc_kcb_sfyh","jxc_kcb_cpjb","jxc_kcb_fgsx","jxc_kcb_cpsm","jxc_kcb_cd","jxc_kcb_zp","jxc_kcb_cgzq","jxc_kcb_bz","jxc_kcb_clbm","jxc_kcb_hjbh","jxc_kcb_ckbh","jxc_kcb_dqbm","jxc_kcb_rkj","jxc_kcb_kcsl","jxc_kcb_kcje"};
	pageObj.setDisColName(disColName);
*/

//设置主键
//	String[] keyName={"clbm"};
//	pageObj.setKey(keyName);
	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("ckmc","1");//列参数对象加入Hash表
	spanColHash.put("hjmc","1");//列参数对象加入Hash表
	spanColHash.put("hwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<br>&nbsp;
<CENTER >
  库存情况
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">所在地区</td>
	<td  width="5%">所在仓库</td>
	<td  width="5%">所在货架</td>
	<td  width="5%">所在货位</td>
	<td  width="2%">材料编码</td>
	<td  width="5%">材料名称</td>
	<td  width="5%">质量级别</td>
	<td  width="3%">型号</td>
	<td  width="3%">内部编码</td>
	<td  width="1%">照片</td>
	<td  width="2%">库存数量</td>
	
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>