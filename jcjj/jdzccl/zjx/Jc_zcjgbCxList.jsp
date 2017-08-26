<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_zcjgb_zcbm=null;
	String jc_zcjgb_zcmc=null;
	String jc_zcjgb_zcdlbm=null;
	String jc_zcjgb_xh=null;
	String jc_zcjgb_gg=null;
	String jc_zcjgb_lsj=null;
	String jc_zcjgb_yhj=null;
	String jc_zcjgb_dwbh=null;
	String jc_zcjgb_zp=null;
	String jc_zcjgb_zclbbm=null;
	String jc_zcjgb_zcysbm=null;
	String jc_zcjgb_jldwbm=null;
	String jc_zcjgb_sfbhpj=null;
	String jc_zcjgb_pjts=null;

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	wheresql+=" and  (jc_zcjgb.dqbm='"+dqbm+"')";

	jc_zcjgb_zcdlbm=request.getParameter("jc_zcjgb_zcdlbm");
	jc_zcjgb_zcdlbm=cf.GB2Uni(jc_zcjgb_zcdlbm);
	wheresql+=" and  (jc_zcjgb.zcdlbm='"+jc_zcjgb_zcdlbm+"')";
	
	jc_zcjgb_dwbh=request.getParameter("jc_zcjgb_dwbh");
	jc_zcjgb_dwbh=cf.GB2Uni(jc_zcjgb_dwbh);
	wheresql+=" and  (jc_zcjgb.dwbh='"+jc_zcjgb_dwbh+"')";

	String xhlist[]=request.getParameterValues("xhlist");
	jc_zcjgb_xh=request.getParameter("jc_zcjgb_xh");

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
				lsxh+=" or (jc_zcjgb.xh like '%"+getxh+"%')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (jc_zcjgb_xh!=null)
			{
				jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
				if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh like '%"+jc_zcjgb_xh+"%')";
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
				lsxh+=" or (jc_zcjgb.xh='"+getxh+"')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (jc_zcjgb_xh!=null)
			{
				jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
				if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh='"+jc_zcjgb_xh+"')";
			}
		}
	}


	String cxhdbl=null;
	cxhdbl=request.getParameter("cxhdbl");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl>="+cxhdbl+")";
	}
	cxhdbl=request.getParameter("cxhdbl2");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl<="+cxhdbl+")";
	}

	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		if (!(sfyh.equals("")))	wheresql+=" and  (jc_zcjgb.sfyh='"+sfyh+"')";
	}


	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		if (!(sfycx.equals("")))	wheresql+=" and  (jc_zcjgb.sfycx='"+sfycx+"')";
	}

	jc_zcjgb_zcbm=request.getParameter("jc_zcjgb_zcbm");
	if (jc_zcjgb_zcbm!=null)
	{
		jc_zcjgb_zcbm=cf.GB2Uni(jc_zcjgb_zcbm);
		if (!(jc_zcjgb_zcbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcbm='"+jc_zcjgb_zcbm+"')";
	}
	jc_zcjgb_zcmc=request.getParameter("jc_zcjgb_zcmc");
	if (jc_zcjgb_zcmc!=null)
	{
		jc_zcjgb_zcmc=cf.GB2Uni(jc_zcjgb_zcmc);
		if (!(jc_zcjgb_zcmc.equals("")))	wheresql+=" and  (jc_zcjgb.zcmc='"+jc_zcjgb_zcmc+"')";
	}

	jc_zcjgb_gg=request.getParameter("jc_zcjgb_gg");
	if (jc_zcjgb_gg!=null)
	{
		jc_zcjgb_gg=cf.GB2Uni(jc_zcjgb_gg);
		if (!(jc_zcjgb_gg.equals("")))	wheresql+=" and  (jc_zcjgb.gg like '%"+jc_zcjgb_gg+"%')";
	}
	jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj");
	if (jc_zcjgb_lsj!=null)
	{
		jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
		if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj>="+jc_zcjgb_lsj+") ";
	}
	jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj2");
	if (jc_zcjgb_lsj!=null)
	{
		jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
		if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj<="+jc_zcjgb_lsj+") ";
	}
	jc_zcjgb_yhj=request.getParameter("jc_zcjgb_yhj");
	if (jc_zcjgb_yhj!=null)
	{
		jc_zcjgb_yhj=jc_zcjgb_yhj.trim();
		if (!(jc_zcjgb_yhj.equals("")))	wheresql+=" and  (jc_zcjgb.yhj>="+jc_zcjgb_yhj+") ";
	}
	jc_zcjgb_yhj=request.getParameter("jc_zcjgb_yhj2");
	if (jc_zcjgb_yhj!=null)
	{
		jc_zcjgb_yhj=jc_zcjgb_yhj.trim();
		if (!(jc_zcjgb_yhj.equals("")))	wheresql+=" and  (jc_zcjgb.yhj<="+jc_zcjgb_yhj+") ";
	}

	jc_zcjgb_zp=request.getParameter("jc_zcjgb_zp");
	if (jc_zcjgb_zp!=null)
	{
		jc_zcjgb_zp=cf.GB2Uni(jc_zcjgb_zp);
		if (!(jc_zcjgb_zp.equals("")))	wheresql+=" and  (jc_zcjgb.zp='"+jc_zcjgb_zp+"')";
	}
	jc_zcjgb_zclbbm=request.getParameter("jc_zcjgb_zclbbm");
	if (jc_zcjgb_zclbbm!=null)
	{
		jc_zcjgb_zclbbm=cf.GB2Uni(jc_zcjgb_zclbbm);
		if (!(jc_zcjgb_zclbbm.equals("")))	wheresql+=" and  (jc_zcjgb.zclbbm like '%"+jc_zcjgb_zclbbm+"%')";
	}
	jc_zcjgb_zcysbm=request.getParameter("jc_zcjgb_zcysbm");
	if (jc_zcjgb_zcysbm!=null)
	{
		jc_zcjgb_zcysbm=cf.GB2Uni(jc_zcjgb_zcysbm);
		if (!(jc_zcjgb_zcysbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcysbm like '%"+jc_zcjgb_zcysbm+"%')";
	}
	jc_zcjgb_jldwbm=request.getParameter("jc_zcjgb_jldwbm");
	if (jc_zcjgb_jldwbm!=null)
	{
		jc_zcjgb_jldwbm=cf.GB2Uni(jc_zcjgb_jldwbm);
		if (!(jc_zcjgb_jldwbm.equals("")))	wheresql+=" and  (jc_zcjgb.jldwbm='"+jc_zcjgb_jldwbm+"')";
	}
	jc_zcjgb_sfbhpj=request.getParameter("jc_zcjgb_sfbhpj");
	if (jc_zcjgb_sfbhpj!=null)
	{
		jc_zcjgb_sfbhpj=cf.GB2Uni(jc_zcjgb_sfbhpj);
		if (!(jc_zcjgb_sfbhpj.equals("")))	wheresql+=" and  (jc_zcjgb.sfbhpj='"+jc_zcjgb_sfbhpj+"')";
	}
	jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts");
	if (jc_zcjgb_pjts!=null)
	{
		jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
		if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts>="+jc_zcjgb_pjts+") ";
	}
	jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts2");
	if (jc_zcjgb_pjts!=null)
	{
		jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
		if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts<="+jc_zcjgb_pjts+") ";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT zclbbm,jc_zcjgb.zcmc,jc_zcjgb.xh,jc_zcjgb.gg,zcysbm,jldwbm,jc_zcjgb.lsj,jc_zcjgb.yhj,cxhdbl||'%',DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>'),DECODE(sfycx,'N','无','Y','<font color=\"#FF0000\">有促销</font>'),cxj,lscxhdbl||'%',cxkssj,cxjzsj,DECODE(jc_zcjgb.sfbhpj,'Y','<font color=\"#FF0000\">包含</font>','N','否'),jc_zcjgb.pjts,jc_zcjgb.zcbm,jc_zcjgb.bz,jc_zcjgb.ppmc,jc_zcjgb.gys";
	ls_sql+=" FROM jc_zcjgb";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by dwbh";
	if (jgpx!=null)
	{
		ls_sql+=jgpx;
	}
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_zcjgbCxList.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh,"","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zcbm","jc_zcjgb_zcmc","jdm_zcdlbm_zcdlmc","jc_zcjgb_xh","jc_zcjgb_gg","jc_zcjgb_lsj","jc_zcjgb_yhj","sq_dwxx_dwmc","jc_zcjgb_zp","jc_zcjgb_bz","jc_zcjgb_ppbm","jc_zcjgb_zclbbm","jc_zcjgb_zcysbm","jc_zcjgb_jldwbm","jc_zcjgb_sfbhpj","jc_zcjgb_pjts","jc_zcjgb_pjjg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zcbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"保存打勾主材"};//按钮的显示名称
	String[] buttonLink={"ChooseJc_zcjgb.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zclbbm","1");//列参数对象加入Hash表
	spanColHash.put("zcmc","1");//列参数对象加入Hash表
	spanColHash.put("xh","1");//列参数对象加入Hash表
	spanColHash.put("gg","1");//列参数对象加入Hash表
	spanColHash.put("bz","2");//列参数对象加入Hash表
	spanColHash.put("ppmc","1");//列参数对象加入Hash表
	spanColHash.put("gys","1");//列参数对象加入Hash表
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
<CENTER >
  <B><font size="3">增加 标准项目（增减项编号：<%=zjxbh%>）</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
	pageObj.displayTopButton();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">类别系列</td>
	<td  width="6%">主材名称</td>
	<td  width="6%">型号</td>
	<td  width="5%">规格</td>
	<td  width="4%">颜色</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">市场标价</td>
	<td  width="4%">销售限价</td>
	<td  width="3%">计入活动比例</td>
	<td  width="3%">是否有货</td>
	<td  width="3%">是否有促销</td>
	<td  width="4%">促销价</td>
	<td  width="3%">促销期计入活动比例</td>
	<td  width="4%">促销开始时间</td>
	<td  width="4%">促销结束时间</td>
	<td  width="3%">是否包含配件</td>
	<td  width="3%">配件套数</td>
	<td  width="3%">主材编码</td>
	<td  width="14%">备注</td>
	<td  width="6%">品牌</td>
	<td  width="7%">供应商</td>
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