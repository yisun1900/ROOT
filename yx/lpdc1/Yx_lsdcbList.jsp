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
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cqbm=null;
	String xqmc=null;
	String xsfs=null;
	String hxzl=null;
	String kfs=null;
	String jzs=null;
	String xss=null;
	String yzxfsp=null;
	String fyssj=null;
	String lrsj=null;
	String ywy=null;

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (yx_lsdcb.fgsbh='"+fgsbh+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (yx_lsdcb.dqbm='"+dqbm+"')";
	}

	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (yx_lsdcb.cqbm='"+cqbm+"')";
	}
	xqmc=request.getParameter("xqmc");
	if (xqmc!=null)
	{
		xqmc=cf.GB2Uni(xqmc);
		if (!(xqmc.equals("")))	wheresql+=" and  (yx_lsdcb.xqmc='"+xqmc+"')";
	}

	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (yx_lsdcb.xsfs='"+xsfs+"')";
	}
	hxzl=request.getParameter("hxzl");
	if (hxzl!=null)
	{
		hxzl=cf.GB2Uni(hxzl);
		if (!(hxzl.equals("")))	wheresql+=" and  (yx_lsdcb.hxzl='"+hxzl+"')";
	}
	kfs=request.getParameter("kfs");
	if (kfs!=null)
	{
		kfs=cf.GB2Uni(kfs);
		if (!(kfs.equals("")))	wheresql+=" and  (yx_lsdcb.kfs='"+kfs+"')";
	}
	jzs=request.getParameter("jzs");
	if (jzs!=null)
	{
		jzs=cf.GB2Uni(jzs);
		if (!(jzs.equals("")))	wheresql+=" and  (yx_lsdcb.jzs='"+jzs+"')";
	}
	xss=request.getParameter("xss");
	if (xss!=null)
	{
		xss=cf.GB2Uni(xss);
		if (!(xss.equals("")))	wheresql+=" and  (yx_lsdcb.xss='"+xss+"')";
	}
	yzxfsp=request.getParameter("yzxfsp");
	if (yzxfsp!=null)
	{
		yzxfsp=cf.GB2Uni(yzxfsp);
		if (!(yzxfsp.equals("")))	wheresql+=" and  (yx_lsdcb.yzxfsp='"+yzxfsp+"')";
	}
	fyssj=request.getParameter("fyssj");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj>=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	fyssj=request.getParameter("fyssj2");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj<=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (yx_lsdcb.ywy='"+ywy+"')";
	}

    

	ls_sql="SELECT yx_lsdcb.dqbm,dqmc,xqmc,cqmc,jw,fyssj,kfslxr,kfs,kfslxrdh,lrr,lrsj,dwmc fgsbh  ";
	ls_sql+=" FROM yx_lsdcb,dm_cqbm,dm_dqbm,sq_dwxx";
    ls_sql+=" where yx_lsdcb.cqbm=dm_cqbm.cqbm and yx_lsdcb.dqbm=dm_dqbm.dqbm and yx_lsdcb.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by yx_lsdcb.dqbm,xqmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yx_lsdcbList.jsp","SelectYx_lsdcb.jsp","","EditYx_lsdcb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","xqmc","cqmc","jw","fyssj","kfs","kfslxr","kfslxrdh","lrr","lrsj","fgsbh"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"dqbm","xqmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Yx_lsdcbList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dqbm","xqmc"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewYx_lsdcb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xqmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem=cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from yx_lsdcb where "+chooseitem;
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
  <B><font size="3">维护－楼盘信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">地区</td>
	<td  width="12%">小区名称</td>
	<td  width="5%">城区</td>
	<td  width="10%">价位</td>
	<td  width="6%">交钥匙时间</td>
	<td  width="15%">开发商</td>
	<td  width="10%">联系人</td>
	<td  width="16%">开发商联系人电话</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="7%">公司</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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