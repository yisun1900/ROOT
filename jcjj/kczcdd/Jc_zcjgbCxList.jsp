<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jxc_clbm_clbm=null;
	String jxc_clbm_clmc=null;
	String jxc_clbm_cldlbm=null;
	String jxc_clbm_xh=null;
	String jxc_clbm_gg=null;
	String jxc_cljgb_lsj=null;
	String jxc_cljgb_xsj=null;
	String jxc_clbm_ppmc=null;
	String jxc_clbm_zp=null;

	String jxc_clbm_cllbbm=null;
	String jxc_clbm_clysbm=null;
	String jxc_clbm_sfbhpj=null;
	String jxc_clbm_pjts=null;

	String jxc_clbm_nbbm=null;
	jxc_clbm_nbbm=request.getParameter("jxc_clbm_nbbm");
	if (jxc_clbm_nbbm!=null)
	{
		jxc_clbm_nbbm=cf.GB2Uni(jxc_clbm_nbbm);
		if (!(jxc_clbm_nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm='"+jxc_clbm_nbbm+"')";
	}

	String sftjcp=null;
	sftjcp=request.getParameter("sftjcp");
	if (sftjcp!=null)
	{
		sftjcp=cf.GB2Uni(sftjcp);
		if (!(sftjcp.equals("")))	wheresql+=" and  (jxc_cljgb.sftjcp='"+sftjcp+"')";
	}

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	wheresql+=" and  (jxc_cljgb.dqbm='"+dqbm+"')";

	jxc_clbm_cldlbm=request.getParameter("jxc_clbm_cldlbm");
	jxc_clbm_cldlbm=cf.GB2Uni(jxc_clbm_cldlbm);
	wheresql+=" and  (jxc_clbm.cldlbm='"+jxc_clbm_cldlbm+"')";
	
	jxc_clbm_ppmc=request.getParameter("jxc_clbm_ppmc");
	jxc_clbm_ppmc=cf.GB2Uni(jxc_clbm_ppmc);
	wheresql+=" and  (jxc_clbm.ppmc='"+jxc_clbm_ppmc+"')";

	String xhlist[]=request.getParameterValues("xhlist");
	jxc_clbm_xh=request.getParameter("jxc_clbm_xh");

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
			if (jxc_clbm_xh!=null)
			{
				jxc_clbm_xh=cf.GB2Uni(jxc_clbm_xh);
				if (!(jxc_clbm_xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+jxc_clbm_xh+"%')";
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
			if (jxc_clbm_xh!=null)
			{
				jxc_clbm_xh=cf.GB2Uni(jxc_clbm_xh);
				if (!(jxc_clbm_xh.equals("")))	wheresql+=" and  (jxc_clbm.xh='"+jxc_clbm_xh+"')";
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

	jxc_clbm_clbm=request.getParameter("jxc_clbm_clbm");
	if (jxc_clbm_clbm!=null)
	{
		jxc_clbm_clbm=cf.GB2Uni(jxc_clbm_clbm);
		if (!(jxc_clbm_clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+jxc_clbm_clbm+"')";
	}
	jxc_clbm_clmc=request.getParameter("jxc_clbm_clmc");
	if (jxc_clbm_clmc!=null)
	{
		jxc_clbm_clmc=cf.GB2Uni(jxc_clbm_clmc);
		if (!(jxc_clbm_clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc='"+jxc_clbm_clmc+"')";
	}

	jxc_clbm_gg=request.getParameter("jxc_clbm_gg");
	if (jxc_clbm_gg!=null)
	{
		jxc_clbm_gg=cf.GB2Uni(jxc_clbm_gg);
		if (!(jxc_clbm_gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+jxc_clbm_gg+"%')";
	}
	jxc_cljgb_lsj=request.getParameter("jxc_cljgb_lsj");
	if (jxc_cljgb_lsj!=null)
	{
		jxc_cljgb_lsj=jxc_cljgb_lsj.trim();
		if (!(jxc_cljgb_lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj>="+jxc_cljgb_lsj+") ";
	}
	jxc_cljgb_lsj=request.getParameter("jxc_cljgb_lsj2");
	if (jxc_cljgb_lsj!=null)
	{
		jxc_cljgb_lsj=jxc_cljgb_lsj.trim();
		if (!(jxc_cljgb_lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj<="+jxc_cljgb_lsj+") ";
	}
	jxc_cljgb_xsj=request.getParameter("jxc_cljgb_xsj");
	if (jxc_cljgb_xsj!=null)
	{
		jxc_cljgb_xsj=jxc_cljgb_xsj.trim();
		if (!(jxc_cljgb_xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj>="+jxc_cljgb_xsj+") ";
	}
	jxc_cljgb_xsj=request.getParameter("jxc_cljgb_xsj2");
	if (jxc_cljgb_xsj!=null)
	{
		jxc_cljgb_xsj=jxc_cljgb_xsj.trim();
		if (!(jxc_cljgb_xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj<="+jxc_cljgb_xsj+") ";
	}

	jxc_clbm_zp=request.getParameter("jxc_clbm_zp");
	if (jxc_clbm_zp!=null)
	{
		jxc_clbm_zp=cf.GB2Uni(jxc_clbm_zp);
		if (!(jxc_clbm_zp.equals("")))	wheresql+=" and  (jxc_clbm.zp='"+jxc_clbm_zp+"')";
	}
	jxc_clbm_cllbbm=request.getParameter("jxc_clbm_cllbbm");
	if (jxc_clbm_cllbbm!=null)
	{
		jxc_clbm_cllbbm=cf.GB2Uni(jxc_clbm_cllbbm);
		if (!(jxc_clbm_cllbbm.equals("")))	wheresql+=" and  (jxc_clbm.cllbbm like '%"+jxc_clbm_cllbbm+"%')";
	}
	jxc_clbm_clysbm=request.getParameter("jxc_clbm_clysbm");
	if (jxc_clbm_clysbm!=null)
	{
		jxc_clbm_clysbm=cf.GB2Uni(jxc_clbm_clysbm);
		if (!(jxc_clbm_clysbm.equals("")))	wheresql+=" and  (jxc_clbm.clysbm like '%"+jxc_clbm_clysbm+"%')";
	}

	jxc_clbm_sfbhpj=request.getParameter("jxc_clbm_sfbhpj");
	if (jxc_clbm_sfbhpj!=null)
	{
		jxc_clbm_sfbhpj=cf.GB2Uni(jxc_clbm_sfbhpj);
		if (!(jxc_clbm_sfbhpj.equals("")))	wheresql+=" and  (jxc_clbm.sfbhpj='"+jxc_clbm_sfbhpj+"')";
	}
	jxc_clbm_pjts=request.getParameter("jxc_clbm_pjts");
	if (jxc_clbm_pjts!=null)
	{
		jxc_clbm_pjts=jxc_clbm_pjts.trim();
		if (!(jxc_clbm_pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts>="+jxc_clbm_pjts+") ";
	}
	jxc_clbm_pjts=request.getParameter("jxc_clbm_pjts2");
	if (jxc_clbm_pjts!=null)
	{
		jxc_clbm_pjts=jxc_clbm_pjts.trim();
		if (!(jxc_clbm_pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts<="+jxc_clbm_pjts+") ";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT DECODE(jxc_cljgb.sftjcp,'Y','是','N','否'),jxc_clbm.clbm,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货卖','3','期货'),jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.zcpzsl-jxc_cljgb.dhsl,jxc_cljgb.zxqdl,jxc_clbm.clmc,cllbbm,jxc_clbm.xh,jxc_clbm.nbbm,jxc_clbm.gg,clysbm,jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,cxhdbl||'%',DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>'),DECODE(sfycx,'N','无','Y','<font color=\"#FF0000\">有促销</font>'),cxj,lscxhdbl||'%',cxkssj,cxjzsj,DECODE(jxc_clbm.sfbhpj,'Y','<font color=\"#FF0000\">包含</font>','N','否'),jxc_clbm.pjts,jxc_clbm.bz,jxc_clbm.ppmc,jxc_cljgb.gysmc";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
	ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
	ls_sql+=" and jxc_cljgb.sfyh='Y'";//Y：有货；N：无货
	ls_sql+=" and jxc_cljgb.xsfs in('2','3')";//1：代销品；2：现货销售；3：库存无货可销售
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_clbm.xh";
	if (jgpx!=null)
	{
		ls_sql+=jgpx;
	}
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_zcjgbCxList.jsp?ddbh="+ddbh,"","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"clbm","jxc_clbm_clmc","jdm_cldlbm_zcdlmc","jxc_clbm_xh","jxc_clbm_gg","jxc_cljgb_lsj","jxc_cljgb_xsj","sq_dwxx_dwmc","jxc_clbm_zp","jxc_clbm_bz","jxc_clbm_ppbm","jxc_clbm_cllbbm","jxc_clbm_clysbm","jxc_clbm_jldwbm","jxc_clbm_sfbhpj","jxc_clbm_pjts","jxc_clbm_pjjg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"保存打勾主材"};//按钮的显示名称
	String[] buttonLink={"ChooseJc_zcjgb.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("bz","2");//列参数对象加入Hash表
	spanColHash.put("ppmc","1");//列参数对象加入Hash表
	spanColHash.put("gysmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>
<center>订单编号（<%=ddbh%>）</center>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
	pageObj.displayTopButton();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="1%">推荐</td>
	<td  width="3%">主材编码</td>
	<td  width="2%">销售方式</td>
	<td  width="2%">库存</td>
	<td  width="2%">已订货</td>
	<td  width="2%">现货</td>
	<td  width="2%">最小起订量</td>
	<td  width="6%">主材名称</td>
	<td  width="7%">类别系列</td>
	<td  width="6%">型号</td>
	<td  width="4%">内部编码</td>
	<td  width="5%">规格</td>
	<td  width="3%">颜色</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">市场标价</td>
	<td  width="3%">销售价</td>
	<td  width="2%">计入活动比例</td>
	<td  width="2%">是否有货</td>
	<td  width="2%">是否有促销</td>
	<td  width="3%">促销价</td>
	<td  width="2%">促销计入比例</td>
	<td  width="4%">促销开始时间</td>
	<td  width="4%">促销结束时间</td>
	<td  width="2%">是否包含配件</td>
	<td  width="2%">配件套数</td>
	<td  width="9%">备注</td>
	<td  width="5%">品牌</td>
	<td  width="9%">供应商</td>
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