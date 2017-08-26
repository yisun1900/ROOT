<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String sgd=cf.GB2Uni(request.getParameter("sgd"));

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队派单统计</font></B>
</CENTER>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,pdsj,pdr,DECODE(jlbz,'0','正常派单','1','回单奖励','2','公司奖励','3','设计师指定派单','4','客户指定派单','5','大单抵小单','6','小单抵大单'),pdsm,DECODE(kgzbz,'Y','已出','N','<font color=\"#FF00FF\">未出</font>'),DECODE(NVL(tgbz,'W'),'W','正常','N','<font color=\"#00FF00\">复工</font>','Y','<font color=\"#FF0000\">已停工</font>'),ysgcjdmc,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,a.dwmc qydm,crm_khxx.qyrq,jgrq,crm_khxx.qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) ";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_khxx.gcjdbm!='5' and zt='2'";
    ls_sql+=" order by pdsj";

//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="5%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="5%">派单时间</td>
	<td  width="4%">派单人</td>
	<td  width="4%">派单类型</td>
	<td  width="12%">派单说明</td>
	<td  width="3%">开工证</td>
	<td  width="3%">停工</td>
	<td  width="4%">工程进度</td>
	<td  width="17%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检</td>
	<td  width="5%">隐蔽工程验收</td>
	<td  width="5%">中期验收</td>
	<td  width="7%">签约店面</td>
	<td  width="5%">签约日期</td>
	<td  width="5%">合同竣工日期</td>
	<td  width="4%">工程签约额</td>
  </tr>

<%
	pageObj.displayDate();
%> 
</table>
</body>
</html>