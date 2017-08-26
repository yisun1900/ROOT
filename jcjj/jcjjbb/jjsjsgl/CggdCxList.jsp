<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

			int curPage=0;//当前需要显示的页序号
			String ls_sql=null;
			String wheresql="";
			String xmzy=null;
			String xm=cf.GB2Uni(request.getParameter("XM"));
			xmzy=request.getParameter("xmzy");
			if (xmzy!=null)
			{
				xmzy=cf.GB2Uni(xmzy);
				if (!(xmzy.equals("")))	wheresql+="  and (jc_cgdd.xmzy='"+xmzy+"')";
			
			}
			String pageStr=request.getParameter("curPage");//获取当前页号
			if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
			{
				curPage=1;				
				
				ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.xmzy,jc_cgdd.khbh as khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs, DECODE(jc_cgdd.kfcbz,'Y','可复测','N','不可复测') as jc_cgdd_kfcbz,jc_cgdd.ssje as jc_cgdd_ssje, DECODE(jc_cgdd.clzt,'00','预订单未完成','01','预订单已完成','02','已派单','03','已初测','04','已复测','05','签订合同','06','合同已确认','07','已入库','08','已安装') as jc_cgdd_clzt, DECODE(jc_cgdd.khlx,'1','装修客户','2','橱柜客户') as jc_cgdd_khlx,jc_cgdd.khxm as jc_cgdd_khxm,jc_cgdd.fwdz as jc_cgdd_fwdz,jc_cgdd.hth as jc_cgdd_hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
				ls_sql+=" FROM jc_cgdd,sq_dwxx,sq_yhxx  ";
				ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh(+)  and jc_cgdd.clzt not in('08')";
				ls_sql+=wheresql ;
				ls_sql+=" order by sq_yhxx.yhmc,jc_cgdd.lrsj";
				pageObj.sql=ls_sql;
			//进行对象初始化
				pageObj.initPage("CggdCxList.jsp","SelectXmzy.jsp","","");
			//	pageObj.setPageRow(10);//设置每页显示记录数
			//设置显示列
				String[] disColName={"ddbh","xmzy","jc_cgdd_clzt","jc_cgdd_khxm","jc_cgdd_fwdz","jc_cgdd_hth","jc_cgdd_dj","jc_cgdd_cgsjs","jc_cgdd_kfcbz","jc_cgdd_ssje","jc_cgdd_khlx","sq_dwxx_dwmc"};
				pageObj.setDisColName(disColName);

			//设置主键
				String[] keyName={"ddbh"};
				pageObj.setKey(keyName);
			//设置列超级连接
				Hashtable coluParmHash=new Hashtable();
				ColuParm coluParm=null;

				coluParm=new ColuParm();//生成一个列参数对象
				String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
				coluParm.key=coluKey;//设置列参数：coluParm.key的主键
				coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
				coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
				coluParmHash.put("jc_cgdd_khxm",coluParm);//列参数对象加入Hash表
				pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

				coluParm=new ColuParm();//生成一个列参数对象
				String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
				coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
				coluParm.link="ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
				coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
				coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
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
			  <B><font size="3"><%=xm%>项目专员跟单情况表</font></B>
			</CENTER>
			<%
				pageObj.out=out;
				pageObj.getDate(curPage);
				pageObj.printPageLink();
			%>
			<tr bgcolor="#CCCCCC"  align="center">
				<td  width="6%">订单编号</td>
				<td  width="6%">项目专员</td>
				<td  width="11%">处理状态</td>
				<td  width="6%">客户姓名</td>
				<td  width="22%">房屋地址</td>
				<td  width="9%">合同号</td>
				<td  width="6%">订金</td>
				<td  width="6%">家居设计师</td>
				<td  width="9%">可复测标志</td>
				<td  width="6%">实收金额</td>
				<td  width="8%">客户类型</td>
				<td  width="11%">录入部门</td>
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
