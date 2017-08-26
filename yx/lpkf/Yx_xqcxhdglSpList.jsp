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
	String yx_xqcxhdgl_cxhdmc=null;
	String yx_xqcxhdgl_xqmc=null;
	String yx_lsdcb_dqbm=null;
	String yx_lsdcb_cqbm=null;
	String yx_xqcxhdgl_kssj=null;
	String yx_xqcxhdgl_jzsj=null;
	String yx_xqcxhdgl_spjl=null;
	String yx_xqcxhdgl_spr=null;
	String yx_xqcxhdgl_spsj=null;
	String yx_xqcxhdgl_lrr=null;
	String yx_xqcxhdgl_lrsj=null;
	String yx_xqcxhdgl_fgsbh=null;
	String yx_xqcxhdgl_spzt=null;
	yx_xqcxhdgl_cxhdmc=request.getParameter("yx_xqcxhdgl_cxhdmc");
	if (yx_xqcxhdgl_cxhdmc!=null)
	{
		yx_xqcxhdgl_cxhdmc=cf.GB2Uni(yx_xqcxhdgl_cxhdmc);
		if (!(yx_xqcxhdgl_cxhdmc.equals("")))	wheresql+=" and  (yx_xqcxhdgl.cxhdmc='"+yx_xqcxhdgl_cxhdmc+"')";
	}
	yx_xqcxhdgl_xqmc=request.getParameter("yx_xqcxhdgl_xqmc");
	if (yx_xqcxhdgl_xqmc!=null)
	{
		yx_xqcxhdgl_xqmc=cf.GB2Uni(yx_xqcxhdgl_xqmc);
		if (!(yx_xqcxhdgl_xqmc.equals("")))	wheresql+=" and  (yx_xqcxhdgl.xqmc='"+yx_xqcxhdgl_xqmc+"')";
	}
	yx_lsdcb_dqbm=request.getParameter("yx_lsdcb_dqbm");
	if (yx_lsdcb_dqbm!=null)
	{
		yx_lsdcb_dqbm=cf.GB2Uni(yx_lsdcb_dqbm);
		if (!(yx_lsdcb_dqbm.equals("")))	wheresql+=" and  (yx_lsdcb.dqbm='"+yx_lsdcb_dqbm+"')";
	}
	yx_lsdcb_cqbm=request.getParameter("yx_lsdcb_cqbm");
	if (yx_lsdcb_cqbm!=null)
	{
		yx_lsdcb_cqbm=cf.GB2Uni(yx_lsdcb_cqbm);
		if (!(yx_lsdcb_cqbm.equals("")))	wheresql+=" and  (yx_lsdcb.cqbm='"+yx_lsdcb_cqbm+"')";
	}
	yx_xqcxhdgl_kssj=request.getParameter("yx_xqcxhdgl_kssj");
	if (yx_xqcxhdgl_kssj!=null)
	{
		yx_xqcxhdgl_kssj=yx_xqcxhdgl_kssj.trim();
		if (!(yx_xqcxhdgl_kssj.equals("")))	wheresql+="  and (yx_xqcxhdgl.kssj>=TO_DATE('"+yx_xqcxhdgl_kssj+"','YYYY/MM/DD'))";
	}
	yx_xqcxhdgl_kssj=request.getParameter("yx_xqcxhdgl_kssj2");
	if (yx_xqcxhdgl_kssj!=null)
	{
		yx_xqcxhdgl_kssj=yx_xqcxhdgl_kssj.trim();
		if (!(yx_xqcxhdgl_kssj.equals("")))	wheresql+="  and (yx_xqcxhdgl.kssj<=TO_DATE('"+yx_xqcxhdgl_kssj+"','YYYY/MM/DD'))";
	}
	yx_xqcxhdgl_jzsj=request.getParameter("yx_xqcxhdgl_jzsj");
	if (yx_xqcxhdgl_jzsj!=null)
	{
		yx_xqcxhdgl_jzsj=yx_xqcxhdgl_jzsj.trim();
		if (!(yx_xqcxhdgl_jzsj.equals("")))	wheresql+="  and (yx_xqcxhdgl.jzsj>=TO_DATE('"+yx_xqcxhdgl_jzsj+"','YYYY/MM/DD'))";
	}
	yx_xqcxhdgl_jzsj=request.getParameter("yx_xqcxhdgl_jzsj2");
	if (yx_xqcxhdgl_jzsj!=null)
	{
		yx_xqcxhdgl_jzsj=yx_xqcxhdgl_jzsj.trim();
		if (!(yx_xqcxhdgl_jzsj.equals("")))	wheresql+="  and (yx_xqcxhdgl.jzsj<=TO_DATE('"+yx_xqcxhdgl_jzsj+"','YYYY/MM/DD'))";
	}
	yx_xqcxhdgl_spjl=request.getParameter("yx_xqcxhdgl_spjl");
	if (yx_xqcxhdgl_spjl!=null)
	{
		yx_xqcxhdgl_spjl=cf.GB2Uni(yx_xqcxhdgl_spjl);
		if (!(yx_xqcxhdgl_spjl.equals("")))	wheresql+=" and  (yx_xqcxhdgl.spjl='"+yx_xqcxhdgl_spjl+"')";
	}
	yx_xqcxhdgl_spr=request.getParameter("yx_xqcxhdgl_spr");
	if (yx_xqcxhdgl_spr!=null)
	{
		yx_xqcxhdgl_spr=cf.GB2Uni(yx_xqcxhdgl_spr);
		if (!(yx_xqcxhdgl_spr.equals("")))	wheresql+=" and  (yx_xqcxhdgl.spr='"+yx_xqcxhdgl_spr+"')";
	}
	yx_xqcxhdgl_spsj=request.getParameter("yx_xqcxhdgl_spsj");
	if (yx_xqcxhdgl_spsj!=null)
	{
		yx_xqcxhdgl_spsj=yx_xqcxhdgl_spsj.trim();
		if (!(yx_xqcxhdgl_spsj.equals("")))	wheresql+="  and (yx_xqcxhdgl.spsj=TO_DATE('"+yx_xqcxhdgl_spsj+"','YYYY/MM/DD'))";
	}
	yx_xqcxhdgl_lrr=request.getParameter("yx_xqcxhdgl_lrr");
	if (yx_xqcxhdgl_lrr!=null)
	{
		yx_xqcxhdgl_lrr=cf.GB2Uni(yx_xqcxhdgl_lrr);
		if (!(yx_xqcxhdgl_lrr.equals("")))	wheresql+=" and  (yx_xqcxhdgl.lrr='"+yx_xqcxhdgl_lrr+"')";
	}
	yx_xqcxhdgl_lrsj=request.getParameter("yx_xqcxhdgl_lrsj");
	if (yx_xqcxhdgl_lrsj!=null)
	{
		yx_xqcxhdgl_lrsj=yx_xqcxhdgl_lrsj.trim();
		if (!(yx_xqcxhdgl_lrsj.equals("")))	wheresql+="  and (yx_xqcxhdgl.lrsj>=TO_DATE('"+yx_xqcxhdgl_lrsj+"','YYYY/MM/DD'))";
	}
	yx_xqcxhdgl_lrsj=request.getParameter("yx_xqcxhdgl_lrsj2");
	if (yx_xqcxhdgl_lrsj!=null)
	{
		yx_xqcxhdgl_lrsj=yx_xqcxhdgl_lrsj.trim();
		if (!(yx_xqcxhdgl_lrsj.equals("")))	wheresql+="  and (yx_xqcxhdgl.lrsj<=TO_DATE('"+yx_xqcxhdgl_lrsj+"','YYYY/MM/DD'))";
	}
	yx_xqcxhdgl_fgsbh=request.getParameter("yx_xqcxhdgl_fgsbh");
	if (yx_xqcxhdgl_fgsbh!=null)
	{
		yx_xqcxhdgl_fgsbh=cf.GB2Uni(yx_xqcxhdgl_fgsbh);
		if (!(yx_xqcxhdgl_fgsbh.equals("")))	wheresql+=" and  (yx_xqcxhdgl.fgsbh='"+yx_xqcxhdgl_fgsbh+"')";
	}
	yx_xqcxhdgl_spzt=request.getParameter("yx_xqcxhdgl_spzt");
	if (yx_xqcxhdgl_spzt!=null)
	{
		yx_xqcxhdgl_spzt=cf.GB2Uni(yx_xqcxhdgl_spzt);
		if (!(yx_xqcxhdgl_spzt.equals("")))	wheresql+=" and  (yx_xqcxhdgl.spzt='"+yx_xqcxhdgl_spzt+"')";
	}

	ls_sql="SELECT yx_xqcxhdgl.fgsbh,DECODE(yx_xqcxhdgl.spzt,'1','未审批','2','审批') spzt,yx_xqcxhdgl.xqmc,dwmc,yx_xqcxhdgl.yjfy,yx_xqcxhdgl.yjcc,yx_xqcxhdgl.sjfy,yx_xqcxhdgl.sjcc, DECODE(yx_xqcxhdgl.spjl,'Y','同意','N','不同意') spjl,yx_xqcxhdgl.spr,yx_xqcxhdgl.spsj,yx_xqcxhdgl.spyj,yx_xqcxhdgl.lrr,yx_xqcxhdgl.lrsj,dqmc,yx_lsdcb.kfs,yx_lsdcb.fyssj,yx_lsdcb.jw,yx_xqcxhdgl.bz ,yx_xqcxhdgl.scbfzr,yx_xqcxhdgl.scbfzrdh,yx_xqcxhdgl.scbzrs, DECODE(yx_xqcxhdgl.scbsffz,'N','未分组','Y','分组') scbsffz,yx_xqcxhdgl.gjjzgwrs,yx_xqcxhdgl.ryydl,yx_xqcxhdgl.kfql, DECODE(yx_xqcxhdgl.fasfwc,'N','未完成','Y','完成') fasfwc,yx_xqcxhdgl.kfxs ";
	ls_sql+=" FROM yx_lsdcb,yx_xqcxhdgl,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where yx_xqcxhdgl.xqmc=yx_lsdcb.xqmc and yx_lsdcb.dqbm=dm_dqbm.dqbm and yx_xqcxhdgl.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by yx_xqcxhdgl.fgsbh,yx_xqcxhdgl.lrsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yx_xqcxhdglSpList.jsp","SelectSpYx_xqcxhdgl.jsp","","SpYx_xqcxhdgl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列,yx_xqcxhdgl.jzsj,yx_xqcxhdgl.yjfy,yx_xqcxhdgl.yjcc,yx_xqcxhdgl.sjfy,yx_xqcxhdgl.sjcc, DECODE(yx_xqcxhdgl.spjl,'Y','同意','N','不同意'),yx_xqcxhdgl.spr,yx_xqcxhdgl.spsj,yx_xqcxhdgl.spyj,yx_xqcxhdgl.lrr,yx_xqcxhdgl.lrsj,dqmc,yx_lsdcb.kfs,yx_lsdcb.fyssj,yx_lsdcb.jw,yx_xqcxhdgl.bz  
	String[] disColName={"spzt","xqmc","dwmc","yjfy","yjcc","sjfy","sjcc","scbfzr","scbfzrdh","scbzrs","scbsffz","gjjzgwrs","ryydl","kfql","fasfwc","kfxs","spjl","spr","spsj","spyj","lrr","lrsj","dqmc","kfs","fyssj","jw","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"xqmc","fgsbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审批");

/*
	String[] keyName={"cxhdmc","fgsbh"};
	pageObj.setKey(keyName);
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
  <B><font size="3">申请－审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">状态</td>
	<td  width="6%">小区名称</td>
	<td  width="4%">公司</td>
	<td  width="2%">预计费用</td>
	<td  width="2%">预计产出</td>
	<td  width="2%">实际费用</td>
	<td  width="2%">实际产出</td>
	<td  width="3%">市场部负责人</td>
	<td  width="6%">负责人电话</td>
	<td  width="2%">市场部总人数</td>
	<td  width="2%">市场部是否分组</td>
	<td  width="2%">高级家装顾问人数</td>
	<td  width="2%">人员异动率</td>
	<td  width="3%">开发潜力</td>
	<td  width="2%">开发方案是否完成</td>
	<td  width="5%">开发形式</td>
	<td  width="3%">审批结论</td>
	<td  width="2%">审批人</td>
	<td  width="3%">审批时间</td>
	<td  width="10%">审批意见</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">地区</td>
	<td  width="7%">开发商</td>
	<td  width="3%">交钥匙时间</td>
	<td  width="5%">价位</td>
	<td  width="8%">备注</td>
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