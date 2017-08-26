<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String clbm=null;
	String clmc=null;
	String cldlbm=null;
	String xh=null;
	String gg=null;
	String lsj=null;
	String xsj=null;
	String zp=null;
	String cllbbm=null;
	String clysbm=null;
	String jldwbm=null;
	String sfbhpj=null;
	String pjts=null;

	String nbbm=null;
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm like '%"+nbbm+"%')";
	}

	String sftjcp=null;
	sftjcp=request.getParameter("sftjcp");
	if (sftjcp!=null)
	{
		sftjcp=cf.GB2Uni(sftjcp);
		if (!(sftjcp.equals("")))	wheresql+=" and  (jxc_cljgb.sftjcp='"+sftjcp+"')";
	}

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
//		if (!(lrbm.equals("")))	wheresql+=" and  (jxc_clbm.lrbm='"+lrbm+"')";
	}

	String xhlist[]=request.getParameterValues("xhlist");
	xh=request.getParameter("xh");

	String mhcx=request.getParameter("mhcx");
	if (mhcx.equals("Y"))
	{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jxc_clbm.xh like '%"+getxh+"%')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (xh!=null)
			{
				xh=cf.GB2Uni(xh);
				if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+xh+"%')";
			}
		}
	}
	else{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jxc_clbm.xh='"+getxh+"')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (xh!=null)
			{
				xh=cf.GB2Uni(xh);
				if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh='"+xh+"')";
			}
		}
	}


	String cxhdbl=null;
	cxhdbl=request.getParameter("cxhdbl");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jxc_cljgb.cxhdbl>="+cxhdbl+")";
	}
	cxhdbl=request.getParameter("cxhdbl2");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jxc_cljgb.cxhdbl<="+cxhdbl+")";
	}

	String scsmc=null;
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (jxc_clbm.scsmc='"+scsmc+"')";
	}
	String scsmc2=null;
	scsmc2=request.getParameter("scsmc2");
	if (scsmc2!=null)
	{
		scsmc2=cf.GB2Uni(scsmc2);
		if (!(scsmc2.equals("")))	wheresql+=" and  (jxc_clbm.scsmc like '%"+scsmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jxc_clbm.ppmc like '%"+ppmc2+"%')";
	}
	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc='"+gysmc+"')";
	}
	String gysmc2=null;
	gysmc2=request.getParameter("gysmc2");
	if (gysmc2!=null)
	{
		gysmc2=cf.GB2Uni(gysmc2);
		if (!(gysmc2.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc like '%"+gysmc2+"%')";
	}

	String clxlbm=null;
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+clxlbm+"')";
	}


	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		if (!(sfyh.equals("")))	wheresql+=" and  (jxc_cljgb.sfyh='"+sfyh+"')";
	}

	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		if (!(sfycx.equals("")))	wheresql+=" and  (jxc_cljgb.sfycx='"+sfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jxc_cljgb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jxc_cljgb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjzsj=null;
	cxjzsj=request.getParameter("cxjzsj");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jxc_cljgb.cxjzsj>=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	cxjzsj=request.getParameter("cxjzsj2");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jxc_cljgb.cxjzsj<=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	
	
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc like '%"+clmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_clbm.cldlbm='"+cldlbm+"')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+gg+"%')";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj<="+lsj+") ";
	}
	xsj=request.getParameter("xsj");
	if (xsj!=null)
	{
		xsj=xsj.trim();
		if (!(xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj>="+xsj+") ";
	}
	xsj=request.getParameter("xsj2");
	if (xsj!=null)
	{
		xsj=xsj.trim();
		if (!(xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj<="+xsj+") ";
	}
	zp=request.getParameter("zp");
	if (zp!=null)
	{
		zp=cf.GB2Uni(zp);
		if (!(zp.equals("")))	wheresql+=" and  (jxc_clbm.zp='"+zp+"')";
	}
	cllbbm=request.getParameter("cllbbm");
	if (cllbbm!=null)
	{
		cllbbm=cf.GB2Uni(cllbbm);
		if (!(cllbbm.equals("")))	wheresql+=" and  (jxc_clbm.cllbbm like '%"+cllbbm+"%')";
	}
	clysbm=request.getParameter("clysbm");
	if (clysbm!=null)
	{
		clysbm=cf.GB2Uni(clysbm);
		if (!(clysbm.equals("")))	wheresql+=" and  (jxc_clbm.clysbm like '%"+clysbm+"%')";
	}
	jldwbm=request.getParameter("jldwbm");
	if (jldwbm!=null)
	{
		jldwbm=cf.GB2Uni(jldwbm);
		if (!(jldwbm.equals("")))	wheresql+=" and  (jxc_clbm.jldwbm='"+jldwbm+"')";
	}
	sfbhpj=request.getParameter("sfbhpj");
	if (sfbhpj!=null)
	{
		sfbhpj=cf.GB2Uni(sfbhpj);
		if (!(sfbhpj.equals("")))	wheresql+=" and  (jxc_clbm.sfbhpj='"+sfbhpj+"')";
	}
	pjts=request.getParameter("pjts");
	if (pjts!=null)
	{
		pjts=pjts.trim();
		if (!(pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts>="+pjts+") ";
	}
	pjts=request.getParameter("pjts2");
	if (pjts!=null)
	{
		pjts=pjts.trim();
		if (!(pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts<="+pjts+") ";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,DECODE(jxc_cljgb.sftjcp,'Y','是','N','否'),DECODE(jxc_cljgb.sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>'),DECODE(jxc_cljgb.sfycx,'N','无','Y','<font color=\"#FF0000\">有促销</font>'),jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_clbm.cllbbm,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl||'%',jxc_cljgb.cxhdbl||'%',jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.lscxhdbl||'%',DECODE(jxc_clbm.sfbhpj,'Y','<font color=\"#FF0000\">含</font>','N','不含'),jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.scsmc,jxc_cljgb.gysmc,jxc_clbm.lrr,jxc_clbm.lrsj,jxc_clbm.bz";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
    ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
    ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
    ls_sql+=wheresql;
	if (jgpx==null || jgpx.equals(""))
	{
		ls_sql+=" order by cldlbm,clxlbm,ppmc,clbm";
	}
	else{
		ls_sql+=" order by "+jgpx;
	}
	pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Jxc_clbmList.jsp?dqbm="+dqbm,"","","EditJxc_clbm.jsp?dqbm="+dqbm);
	pageObj.setPageRow(Integer.parseInt(myxssl));//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"clbm","clmc","jdm_cldlbm_zcdlmc","xh","gg","lsj","xsj","sq_dwxx_dwmc","zp","bz","ppbm","cllbbm","clysbm","jldwbm","sfbhpj","pjts","pjjg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"促销开始","促销结束","有货","无货","删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"StartCx.jsp?dqbm="+dqbm,"SaveEndCx.jsp?dqbm="+dqbm,"SaveIsSfyh.jsp?dqbm="+dqbm,"SaveNotSfyh.jsp?dqbm="+dqbm,"Jxc_clbmList.jsp?dqbm="+dqbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1,1,1,0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String[] clbm = request.getParameterValues("clbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(clbm,"clbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from jxc_clbm where "+chooseitem;
		sql[1]="delete from jxc_cljgb where  dqbm='"+dqbm+"' and "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材库存品维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
	pageObj.displayTopButton ();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">主材编码</td>
	<td  width="2%">内部编码</td>
	<td  width="4%">主材名称</td>
	<td  width="3%">型号</td>
	<td  width="3%">规格</td>
	<td  width="4%">子品牌</td>
	<td  width="2%">是否推荐产品</td>
	<td  width="2%">是否有货</td>
	<td  width="2%">是否有促销</td>
	<td  width="3%">促销开始时间</td>
	<td  width="3%">促销结束时间</td>
	<td  width="4%">类别系列</td>
	<td  width="2%">颜色</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">市场标价</td>
	<td  width="2%">销售价</td>
	<td  width="2%">结算价</td>
	<td  width="2%">结算比例</td>
	<td  width="2%">计入活动比例</td>
	<td  width="2%">促销价</td>
	<td  width="2%">促销结算价</td>
	<td  width="2%">促销期计入比例</td>
	<td  width="2%">包含配件</td>
	<td  width="2%">配件套数</td>
	<td  width="2%">产品级别</td>
	<td  width="3%">风格属性</td>
	<td  width="4%">产品说明</td>
	<td  width="2%">产地</td>
	<td  width="3%">照片名称</td>
	<td  width="4%">大类</td>
	<td  width="4%">小类</td>
	<td  width="3%">品牌</td>
	<td  width="5%">供应商</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="6%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printPageLinkTr();
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