<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ssfgs=(String)session.getAttribute("ssfgs");

	String ls_sql=null;
	String wheresql="";

	String khxm=null;
	String fwdz=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";

	
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz+"%')";
	}


	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,sjs,ywy, DECODE(crm_zxkhxx.zxzt,'0','咨询登记','1','设计师咨询','2','店面退回客户','3','已签约','4','失败') as crm_zxkhxx_zxzt,lrsj,a.dwmc zxdjbm,b.dwmc as zxdm,fwlxmc as crm_zxkhxx_fwlxbm,crm_zxkhxx.hfrq as crm_zxkhxx_hfrq,DECODE(crm_zxkhxx.hdbz,'1','非回单','3','施工队回单') as crm_zxkhxx_hdbz  ";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where (crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+))";
    ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","InsertYbj_cgsq.jsp","");
	pageObj.setPageRow(1000);//设置每页显示记录数


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("录入");
	pageObj.setViewBolt("");
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">咨询客户信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">客户编号</td>
	<td  width="5%">姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="10%">联系方式</td>
	<td  width="5%">设计师</td>
	<td  width="5%">业务员</td>
	<td  width="6%">咨询状态</td>
	<td  width="7%">录入时间</td>
	<td  width="9%">咨询登记部门</td>
	<td  width="8%">咨询店面</td>
	<td  width="7%">房屋类型</td>
	<td  width="7%">回访日期</td>
	<td  width="6%">回单标志</td>
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