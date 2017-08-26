<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
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
	curPage=1;
	String wheresql="";
	String jxc_clbm_lsh=null;
	String jxc_clbm_clmc=null;
	String jxc_clbm_cllb=null;
	String jxc_clbm_cldlbm=null;
	String jxc_clbm_clxlbm=null;
	String jxc_clbm_scsmc=null;
	String jxc_clbm_ppmc=null;
	String jxc_clbm_cllbbm=null;
	String jxc_clbm_xh=null;
	String jxc_clbm_gg=null;
	String jxc_clbm_clysbm=null;
	String jxc_clbm_jldwbm=null;
	String jxc_clbm_hwbh=null;
	String jxc_clbm_pjts=null;
	String jxc_clbm_sfyh=null;
	String jxc_clbm_cpjb=null;
	String jxc_clbm_fgsx=null;
	String jxc_clbm_cpsm=null;
	String jxc_clbm_cd=null;
	String jxc_clbm_zp=null;
	String jxc_clbm_cgzq=null;
	String jxc_clbm_bz=null;
	String jxc_clbm_clbm=null;
	String jxc_clbm_hjbh=null;
	String jxc_clbm_ckbh=null;
	String jxc_clbm_dqbm=null;
	String jxc_clbm_cbj=null;
	String jxc_clbm_kcsl=null;
	String jxc_clbm_kcje=null;
	String jxc_clbm_clmc_mh=null;
	String jxc_clbm_xh_mh=null;
	String jxc_clbm_gg_mh=null;
	String jxc_clbm_fgsx_mh=null;
	String jxc_clbm_cpsm_mh=null;
	String myxssl=request.getParameter("myxssl");//每页显示数量
	String sfxstp=request.getParameter("sfxstp"); //是否显示图片
	String ordersql=request.getParameter("pxfs"); //排序方式
	String ls="";
	if (myxssl==null || myxssl.equals(""))
	{myxssl="30";}//如果没有录入 初始化成30
	jxc_clbm_lsh=request.getParameter("jxc_clbm_lsh");
	String[] clbm=request.getParameterValues("clbmlist");
	if (clbm!=null)
	{
		for (int i=clbm.length-1;i>=0 ; i--)
		{
			ls+=",'"+clbm[i]+"'";
		}
		ls=ls.substring(1);
		if (!(ls.equals("")))	wheresql+="  and (jxc_clbm.clbm in ("+ls+"))";
	}
	if (jxc_clbm_lsh!=null)
	{
		jxc_clbm_lsh=cf.GB2Uni(jxc_clbm_lsh);
		if (!(jxc_clbm_lsh.equals("")))	wheresql+=" and  (jxc_clbm.lsh='"+jxc_clbm_lsh+"')";
	}
	jxc_clbm_clmc=request.getParameter("jxc_clbm_clmc");
	jxc_clbm_clmc_mh=request.getParameter("jxc_clbm_clmc_mh");
	if (jxc_clbm_clmc!=null)
	{
		jxc_clbm_clmc=cf.GB2Uni(jxc_clbm_clmc);
		if (!(jxc_clbm_clmc.equals("")))	
		{
			if (jxc_clbm_clmc_mh!=null && jxc_clbm_clmc_mh!="")
				{wheresql+=" and  (jxc_clbm.clmc like '%"+jxc_clbm_clmc+"%')";}
			else
			{wheresql+=" and  (jxc_clbm.clmc='"+jxc_clbm_clmc+"')";}
		}
	}
	jxc_clbm_cllb=request.getParameter("jxc_clbm_cllb");
	if (jxc_clbm_cllb!=null)
	{
		jxc_clbm_cllb=cf.GB2Uni(jxc_clbm_cllb);
		if (!(jxc_clbm_cllb.equals("")))	wheresql+=" and  (jxc_clbm.cllb='"+jxc_clbm_cllb+"')";
	}
	jxc_clbm_cldlbm=request.getParameter("jxc_clbm_cldlbm");
	if (jxc_clbm_cldlbm!=null)
	{
		jxc_clbm_cldlbm=cf.GB2Uni(jxc_clbm_cldlbm);
		if (!(jxc_clbm_cldlbm.equals("")))	wheresql+=" and  (jxc_clbm.cldlbm='"+jxc_clbm_cldlbm+"')";
	}
	jxc_clbm_clxlbm=request.getParameter("jxc_clbm_clxlbm");
	if (jxc_clbm_clxlbm!=null)
	{
		jxc_clbm_clxlbm=cf.GB2Uni(jxc_clbm_clxlbm);
		if (!(jxc_clbm_clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+jxc_clbm_clxlbm+"')";
	}
	jxc_clbm_scsmc=request.getParameter("jxc_clbm_scsmc");
	if (jxc_clbm_scsmc!=null)
	{
		jxc_clbm_scsmc=cf.GB2Uni(jxc_clbm_scsmc);
		if (!(jxc_clbm_scsmc.equals("")))	wheresql+=" and  (jxc_clbm.scsmc='"+jxc_clbm_scsmc+"')";
	}
	jxc_clbm_ppmc=request.getParameter("jxc_clbm_ppmc");
	if (jxc_clbm_ppmc!=null)
	{
		jxc_clbm_ppmc=cf.GB2Uni(jxc_clbm_ppmc);
		if (!(jxc_clbm_ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+jxc_clbm_ppmc+"')";
	}
	jxc_clbm_cllbbm=request.getParameter("jxc_clbm_cllbbm");
	if (jxc_clbm_cllbbm!=null)
	{
		jxc_clbm_cllbbm=cf.GB2Uni(jxc_clbm_cllbbm);
		if (!(jxc_clbm_cllbbm.equals("")))	wheresql+=" and  (jxc_clbm.cllbbm='"+jxc_clbm_cllbbm+"')";
	}
	jxc_clbm_xh=request.getParameter("jxc_clbm_xh");
	jxc_clbm_xh_mh=request.getParameter("jxc_clbm_xh_mh");
	if (jxc_clbm_xh!=null)
	{
		jxc_clbm_xh=cf.GB2Uni(jxc_clbm_xh);
		if (!(jxc_clbm_xh.equals("")))	
		{
			if (jxc_clbm_xh_mh!=null && jxc_clbm_xh_mh!="") 
				{wheresql+=" and  (jxc_clbm.xh like '%"+jxc_clbm_xh+"%')";}
			else
				{wheresql+=" and  (jxc_clbm.xh='"+jxc_clbm_xh+"')";}
		}
	}
	jxc_clbm_gg=request.getParameter("jxc_clbm_gg");
	jxc_clbm_gg_mh=request.getParameter("jxc_clbm_gg_mh");
	if (jxc_clbm_gg!=null)
	{
		jxc_clbm_gg=cf.GB2Uni(jxc_clbm_gg);
		if (!(jxc_clbm_gg.equals("")))
		{
			if (jxc_clbm_gg_mh!=null && jxc_clbm_gg_mh!="") 
			{wheresql+=" and  (jxc_clbm.gg like '%"+jxc_clbm_gg+"%')";}
			else
			{wheresql+=" and  (jxc_clbm.gg='"+jxc_clbm_gg+"')";}
		}
	}
	jxc_clbm_clysbm=request.getParameter("jxc_clbm_clysbm");
	if (jxc_clbm_clysbm!=null)
	{
		jxc_clbm_clysbm=cf.GB2Uni(jxc_clbm_clysbm);
		if (!(jxc_clbm_clysbm.equals("")))	wheresql+=" and  (jxc_clbm.clysbm='"+jxc_clbm_clysbm+"')";
	}
	jxc_clbm_jldwbm=request.getParameter("jxc_clbm_jldwbm");
	if (jxc_clbm_jldwbm!=null)
	{
		jxc_clbm_jldwbm=cf.GB2Uni(jxc_clbm_jldwbm);
		if (!(jxc_clbm_jldwbm.equals("")))	wheresql+=" and  (jxc_clbm.jldwbm='"+jxc_clbm_jldwbm+"')";
	}
	jxc_clbm_hwbh=request.getParameter("jxc_clbm_hwbh");
	if (jxc_clbm_hwbh!=null)
	{
		jxc_clbm_hwbh=cf.GB2Uni(jxc_clbm_hwbh);
		if (!(jxc_clbm_hwbh.equals("")))	wheresql+=" and  (jxc_clbm.hwbh='"+jxc_clbm_hwbh+"')";
	}
	jxc_clbm_pjts=request.getParameter("jxc_clbm_pjts");
	if (jxc_clbm_pjts!=null)
	{
		jxc_clbm_pjts=jxc_clbm_pjts.trim();
		if (!(jxc_clbm_pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts="+jxc_clbm_pjts+") ";
	}
	jxc_clbm_sfyh=request.getParameter("jxc_clbm_sfyh");
	if (jxc_clbm_sfyh!=null)
	{
		jxc_clbm_sfyh=cf.GB2Uni(jxc_clbm_sfyh);
		if (!(jxc_clbm_sfyh.equals("")))	wheresql+=" and  (jxc_clbm.sfyh='"+jxc_clbm_sfyh+"')";
	}
	jxc_clbm_cpjb=request.getParameter("jxc_clbm_cpjb");
	if (jxc_clbm_cpjb!=null)
	{
		jxc_clbm_cpjb=cf.GB2Uni(jxc_clbm_cpjb);
		if (!(jxc_clbm_cpjb.equals("")))	wheresql+=" and  (jxc_clbm.cpjb='"+jxc_clbm_cpjb+"')";
	}
	jxc_clbm_fgsx=request.getParameter("jxc_clbm_fgsx");
	jxc_clbm_fgsx_mh=request.getParameter("jxc_clbm_fgsx_mh");
	if (jxc_clbm_fgsx!=null)
	{
		jxc_clbm_fgsx=cf.GB2Uni(jxc_clbm_fgsx);
		if (!(jxc_clbm_fgsx.equals("")))	
		{
			if (jxc_clbm_fgsx_mh!=null && jxc_clbm_fgsx_mh!="") 
			{wheresql+=" and  (jxc_clbm.fgsx like '%"+jxc_clbm_fgsx+"%')";}
			else
			{wheresql+=" and  (jxc_clbm.fgsx='"+jxc_clbm_fgsx+"')";}
		}
	}
	jxc_clbm_cpsm=request.getParameter("jxc_clbm_cpsm");
	jxc_clbm_cpsm_mh=request.getParameter("jxc_clbm_cpsm_mh");
	if (jxc_clbm_cpsm!=null)
	{
		jxc_clbm_cpsm=cf.GB2Uni(jxc_clbm_cpsm);
		if (!(jxc_clbm_cpsm.equals("")))	
		{
			if (jxc_clbm_cpsm_mh!=null && jxc_clbm_cpsm_mh!="") 
			{wheresql+=" and  (jxc_clbm.cpsm like '%"+jxc_clbm_cpsm+"%')";}
				else
			{wheresql+=" and  (jxc_clbm.cpsm='"+jxc_clbm_cpsm+"')";}
		}
	}
	jxc_clbm_cd=request.getParameter("jxc_clbm_cd");
	if (jxc_clbm_cd!=null)
	{
		jxc_clbm_cd=cf.GB2Uni(jxc_clbm_cd);
		if (!(jxc_clbm_cd.equals("")))	wheresql+=" and  (jxc_clbm.cd='"+jxc_clbm_cd+"')";
	}
	jxc_clbm_zp=request.getParameter("jxc_clbm_zp");
	if (jxc_clbm_zp!=null)
	{
		jxc_clbm_zp=cf.GB2Uni(jxc_clbm_zp);
		if (!(jxc_clbm_zp.equals("")))	wheresql+=" and  (jxc_clbm.zp='"+jxc_clbm_zp+"')";
	}
	jxc_clbm_cgzq=request.getParameter("jxc_clbm_cgzq");
	if (jxc_clbm_cgzq!=null)
	{
		jxc_clbm_cgzq=jxc_clbm_cgzq.trim();
		if (!(jxc_clbm_cgzq.equals("")))	wheresql+=" and (jxc_clbm.cgzq="+jxc_clbm_cgzq+") ";
	}
	jxc_clbm_bz=request.getParameter("jxc_clbm_bz");
	if (jxc_clbm_bz!=null)
	{
		jxc_clbm_bz=cf.GB2Uni(jxc_clbm_bz);
		if (!(jxc_clbm_bz.equals("")))	wheresql+=" and  (jxc_clbm.bz='"+jxc_clbm_bz+"')";
	}
	jxc_clbm_clbm=request.getParameter("jxc_clbm_clbm");
	if (jxc_clbm_clbm!=null)
	{
		jxc_clbm_clbm=cf.GB2Uni(jxc_clbm_clbm);
		if (!(jxc_clbm_clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+jxc_clbm_clbm+"')";
	}
	jxc_clbm_hjbh=request.getParameter("jxc_clbm_hjbh");
	if (jxc_clbm_hjbh!=null)
	{
		jxc_clbm_hjbh=cf.GB2Uni(jxc_clbm_hjbh);
		if (!(jxc_clbm_hjbh.equals("")))	wheresql+=" and  (jxc_clbm.hjbh='"+jxc_clbm_hjbh+"')";
	}
	jxc_clbm_ckbh=request.getParameter("jxc_clbm_ckbh");
	if (jxc_clbm_ckbh!=null)
	{
		jxc_clbm_ckbh=cf.GB2Uni(jxc_clbm_ckbh);
		if (!(jxc_clbm_ckbh.equals("")))	wheresql+=" and  (jxc_clbm.ckbh='"+jxc_clbm_ckbh+"')";
	}
	jxc_clbm_dqbm=request.getParameter("jxc_clbm_dqbm");
	if (jxc_clbm_dqbm!=null)
	{
		jxc_clbm_dqbm=cf.GB2Uni(jxc_clbm_dqbm);
		if (!(jxc_clbm_dqbm.equals("")))	
		{wheresql+=" and  (jxc_clbm.dqbm='"+jxc_clbm_dqbm+"')";}
		else
		{
			if (yhjs.equals("A0") || yhjs.equals("A1"))
			{}
			else
			{wheresql="jxc_clbm.dqbm='"+dqbm+"'";}
		}
	}
	jxc_clbm_cbj=request.getParameter("jxc_clbm_cbj");
	if (jxc_clbm_cbj!=null)
	{
		jxc_clbm_cbj=jxc_clbm_cbj.trim();
		if (!(jxc_clbm_cbj.equals("")))	wheresql+=" and  (jxc_clbm.rkj="+jxc_clbm_cbj+") ";
	}
	jxc_clbm_kcsl=request.getParameter("jxc_clbm_kcsl");
	if (jxc_clbm_kcsl!=null)
	{
		jxc_clbm_kcsl=jxc_clbm_kcsl.trim();
		if (!(jxc_clbm_kcsl.equals("")))	wheresql+=" and (jxc_cljgb.zcpzsl="+jxc_clbm_kcsl+") ";
	}
	jxc_clbm_kcje=request.getParameter("jxc_clbm_kcje");
	if (jxc_clbm_kcje!=null)
	{
		jxc_clbm_kcje=jxc_clbm_kcje.trim();
		if (!(jxc_clbm_kcje.equals("")))	wheresql+=" and  (jxc_clbm.kcje="+jxc_clbm_kcje+") ";
	}
	if (sfxstp!=null && sfxstp!="")
	{
	ls_sql="SELECT dqmc,jxc_clbm.clbm clbm,jxc_clbm.clmc clmc,jxc_clbm.xh xh,jxc_clbm.gg gg,jxc_clbm.nbbm nbbm,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_clbm.zp||'\" width=\"100px\" height=\"100px\">' zp,SUM(jxc_cljgb.zcpzsl),jldwbm,SUM(jxc_cljgb.zcpzsl*cbj) ";
	}
	else
	{
		ls_sql="SELECT dqmc,jxc_clbm.clbm clbm,jxc_clbm.clmc clmc,jxc_clbm.xh xh,jxc_clbm.gg gg,jxc_clbm.nbbm nbbm,'' zp,SUM(jxc_cljgb.zcpzsl),jldwbm,SUM(jxc_cljgb.zcpzsl*cbj) ";
	}
	ls_sql+=" FROM dm_dqbm,jxc_cljgb,jxc_clbm ";
    ls_sql+=" where jxc_cljgb.dqbm=dm_dqbm.dqbm and jxc_cljgb.clbm=jxc_clbm.clbm and jxc_cljgb.zcpzsl<0  and cllb='1'";
    ls_sql+=wheresql;
	if (sfxstp!=null && sfxstp!="")
	{
	ls_sql+=" group by dqmc,jxc_clbm.clbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.nbbm,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_clbm.zp||'\" width=\"100px\" height=\"100px\">',jldwbm";
	}
	else
	{ls_sql+=" group by dqmc,jxc_clbm.clbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.nbbm,'',jldwbm ";}
//	ls_sql+=ordersql;
	ls_sql+=" order by dqmc,jxc_clbm.clmc ";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("jxc_clbmT.jsp","SelectCxjxc_clbm.jsp","","");
//	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lsh","jxc_clbm_clmc","jxc_clbm_cllb","jxc_clbm_cldlbm","jxc_clbm_clxlbm","jxc_clbm_scsmc","jxc_clbm_ppmc","jxc_clbm_cllbbm","jxc_clbm_xh","jxc_clbm_gg","jxc_clbm_clysbm","jxc_clbm_jldwbm","jxc_clbm_hwbh","jxc_clbm_pjts","jxc_clbm_sfyh","jxc_clbm_cpjb","jxc_clbm_fgsx","jxc_clbm_cpsm","jxc_clbm_cd","jxc_clbm_zp","jxc_clbm_cgzq","jxc_clbm_bz","jxc_clbm_clbm","jxc_clbm_hjbh","jxc_clbm_ckbh","jxc_clbm_dqbm","jxc_clbm_rkj","jxc_clbm_kcsl","jxc_clbm_kcje"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("scsmc","1");//列参数对象加入Hash表
	spanColHash.put("ppmc","1");//列参数对象加入Hash表
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
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">所在地区</td>
	<td  width="2%">材料编码</td>
	<td  width="5%">材料名称</td>
	<td  width="3%">型号</td>
	<td  width="3%">规格</td>
	<td  width="3%">内部编码</td>
	<td  width="1%">照片</td>
	<td  width="2%">库存</td>
	<td  width="2%">单位</td>
	<td  width="2%">库存金额</td>
</tr>
<%
	pageObj.displayDateSum();
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