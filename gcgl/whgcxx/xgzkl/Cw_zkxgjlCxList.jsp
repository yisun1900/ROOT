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
	String cw_zkxgjl_khbh=null;
	String cw_zkxgjl_xgsj=null;
	String cw_zkxgjl_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_zkxgjl_fgsbh=null;
	String cw_zkxgjl_xgr=null;
	String cw_zkxgjl_zklx=null;
	String cw_zkxgjl_gxqzkl=null;
	String cw_zkxgjl_gxhzkl=null;
	cw_zkxgjl_khbh=request.getParameter("cw_zkxgjl_khbh");
	if (cw_zkxgjl_khbh!=null)
	{
		cw_zkxgjl_khbh=cf.GB2Uni(cw_zkxgjl_khbh);
		if (!(cw_zkxgjl_khbh.equals("")))	wheresql+=" and  (cw_zkxgjl.khbh='"+cw_zkxgjl_khbh+"')";
	}
	cw_zkxgjl_xgsj=request.getParameter("cw_zkxgjl_xgsj");
	if (cw_zkxgjl_xgsj!=null)
	{
		cw_zkxgjl_xgsj=cw_zkxgjl_xgsj.trim();
		if (!(cw_zkxgjl_xgsj.equals("")))	wheresql+="  and (cw_zkxgjl.xgsj<=TO_DATE('"+cw_zkxgjl_xgsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	cw_zkxgjl_xgsj=request.getParameter("cw_zkxgjl_xgsj2");
	if (cw_zkxgjl_xgsj!=null)
	{
		cw_zkxgjl_xgsj=cw_zkxgjl_xgsj.trim();
		if (!(cw_zkxgjl_xgsj.equals("")))	wheresql+="  and (cw_zkxgjl.xgsj<=TO_DATE('"+cw_zkxgjl_xgsj+"','YYYY/MM/DD'))";
	}
	cw_zkxgjl_khxm=request.getParameter("cw_zkxgjl_khxm");
	if (cw_zkxgjl_khxm!=null)
	{
		cw_zkxgjl_khxm=cf.GB2Uni(cw_zkxgjl_khxm);
		if (!(cw_zkxgjl_khxm.equals("")))	wheresql+=" and  (cw_zkxgjl.khxm='"+cw_zkxgjl_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	cw_zkxgjl_fgsbh=request.getParameter("cw_zkxgjl_fgsbh");
	if (cw_zkxgjl_fgsbh!=null)
	{
		cw_zkxgjl_fgsbh=cf.GB2Uni(cw_zkxgjl_fgsbh);
		if (!(cw_zkxgjl_fgsbh.equals("")))	wheresql+=" and  (cw_zkxgjl.fgsbh='"+cw_zkxgjl_fgsbh+"')";
	}
	cw_zkxgjl_xgr=request.getParameter("cw_zkxgjl_xgr");
	if (cw_zkxgjl_xgr!=null)
	{
		cw_zkxgjl_xgr=cf.GB2Uni(cw_zkxgjl_xgr);
		if (!(cw_zkxgjl_xgr.equals("")))	wheresql+=" and  (cw_zkxgjl.xgr='"+cw_zkxgjl_xgr+"')";
	}
	cw_zkxgjl_zklx=request.getParameter("cw_zkxgjl_zklx");
	if (cw_zkxgjl_zklx!=null)
	{
		cw_zkxgjl_zklx=cf.GB2Uni(cw_zkxgjl_zklx);
		if (!(cw_zkxgjl_zklx.equals("")))	wheresql+=" and  (cw_zkxgjl.zklx='"+cw_zkxgjl_zklx+"')";
	}
	cw_zkxgjl_gxqzkl=request.getParameter("cw_zkxgjl_gxqzkl");
	if (cw_zkxgjl_gxqzkl!=null)
	{
		cw_zkxgjl_gxqzkl=cw_zkxgjl_gxqzkl.trim();
		if (!(cw_zkxgjl_gxqzkl.equals("")))	wheresql+=" and  (cw_zkxgjl.gxqzkl="+cw_zkxgjl_gxqzkl+") ";
	}
	cw_zkxgjl_gxhzkl=request.getParameter("cw_zkxgjl_gxhzkl");
	if (cw_zkxgjl_gxhzkl!=null)
	{
		cw_zkxgjl_gxhzkl=cw_zkxgjl_gxhzkl.trim();
		if (!(cw_zkxgjl_gxhzkl.equals("")))	wheresql+=" and  (cw_zkxgjl.gxhzkl="+cw_zkxgjl_gxhzkl+") ";
	}
	ls_sql="SELECT cw_zkxgjl.khbh,cw_zkxgjl.xgsj,cw_zkxgjl.khxm,crm_khxx.fwdz,crm_khxx.hth,dwmc,cw_zkxgjl.xgr, DECODE(cw_zkxgjl.zklx,'1','全额折扣','2','单项'),cw_zkxgjl.gxqzkl,cw_zkxgjl.gxqzjxzkl,cw_zkxgjl.gxqcdzwjmje,cw_zkxgjl.gxqglfjmje,cw_zkxgjl.gxqsjjmje   ,cw_zkxgjl.gxhzkl,cw_zkxgjl.gxhzjxzkl,cw_zkxgjl.gxhcdzwjmje,cw_zkxgjl.gxhglfjmje,cw_zkxgjl.gxhsjjmje,cw_zkxgjl.bz  ";
	ls_sql+=" FROM crm_khxx,cw_zkxgjl,sq_dwxx  ";
    ls_sql+=" where cw_zkxgjl.khbh=crm_khxx.khbh(+) and cw_zkxgjl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zkxgjl.xgsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zkxgjlCxList.jsp","SelectCxCw_zkxgjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","xgsj","cw_zkxgjl_khxm","crm_khxx_fwdz","crm_khxx_hth","cw_zkxgjl_fgsbh","cw_zkxgjl_xgr","cw_zkxgjl_zklx","cw_zkxgjl_gxqzkl","cw_zkxgjl_gxhzkl","cw_zkxgjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh","xgsj"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">查询－折扣修改记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">客户编号</td>
	<td  width="4%">修改时间</td>
	<td  width="4%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="4%">合同号</td>
	<td  width="6%">所属分公司</td>
	<td  width="3%">修改人</td>
	<td  width="4%">折扣类型</td>
	<td  width="4%"><font color="#0000CC"><strong>更新前合同折扣</strong></font></td>
	<td  width="4%"><font color="#0000CC"><strong>更新前增减项折扣</strong></font></td>
	<td  width="5%"><font color="#0000CC"><strong>更新前合同减免额</strong></font></td>
	<td  width="5%"><font color="#0000CC"><strong>更新前管理费减免额</strong></font></td>
	<td  width="5%"><font color="#0000CC"><strong>更新前税金减免额</strong></font></td>

	<td  width="4%"><font color="#990033"><strong>更新后合同折扣</strong></font></td>
	<td  width="4%"><font color="#990033"><strong>更新后增减项折扣</strong></font></td>
	<td  width="5%"><font color="#990033"><strong>更新后合同减免额</strong></font></td>
	<td  width="5%"><font color="#990033"><strong>更新后管理费减免额</strong></font></td>
	<td  width="5%"><font color="#990033"><strong>更新后税金减免额</strong></font></td>
	<td  width="18%">备注</td>
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