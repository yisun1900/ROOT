<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));

	
	
	ls_sql="SELECT  crm_tsjl.tsjlh,crm_tsbm.zrr,crm_tsjl.khbh,tsxlmc,dm_slfsbm.slfsmc,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,crm_tsjl.lrsj,crm_tsbm.dwbh,sq_dwxx.dwmc zrbm,crm_tsbm.tzsj,crm_tsbm.tsyybm,crm_tsbm.tspp";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as clzt,crm_khxx.sjs";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') as jazt,sgdmc";

	ls_sql+=" ,crm_tsbm.jssj,crm_tsbm.jsr,crm_tsbm.jssm";
	ls_sql+=" ,crm_tsbm.jhcxcsj,crm_tsbm.kcjlh,crm_tsbm.sjcxcr,crm_tsbm.sjcxcsj,crm_tsbm.cxcsm";
	ls_sql+=" ,crm_tsbm.jhcfasj,crm_tsbm.cfajlh,crm_tsbm.sjcfar,crm_tsbm.sjcfasj,crm_tsbm.jjfa";
	ls_sql+=" ,crm_tsbm.jhjjsj,DECODE(crm_tsbm.sfpfkh,'1','否','2','赔付') sfpfkh,crm_tsbm.khpfze,DECODE(crm_tsbm.sfnbcf,'1','否','2','处罚') sfnbcf,crm_tsbm.nbcfze";
	ls_sql+=" ,crm_tsbm.shbm,crm_tsbm.shr,crm_tsbm.shsj,crm_tsbm.shsm";
	ls_sql+=" ,crm_tsbm.cljlh,crm_tsbm.sjjjsj,crm_tsbm.clr,crm_tsbm.clsj,crm_tsbm.clqk";
	ls_sql+=" ,dm_tshfjgbm.hfjgmc,crm_tsbm.qrjjsj,dm_zzjgbm.zzjgmc,dm_jsxbm.jsxmc";



	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,crm_tsbm,sq_dwxx,sq_sgd,dm_tshfjgbm,dm_zzjgbm,dm_jsxbm ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)";
    ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsbm.hfjgbm=dm_tshfjgbm.hfjgbm(+) ";
    ls_sql+=" and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+) ";
    ls_sql+=" and crm_tsbm.jsxbm=dm_jsxbm.jsxbm(+) ";
		ls_sql+=" and crm_tsjl.slfsbm='5'";//5:回访
		ls_sql+=" and crm_tsjl.lx='1'";//1：投诉；2：报修
		ls_sql+=" and crm_tsjl.clzt!='9'";//9:不立案
		ls_sql+=wheresql;
		ls_sql+=" and crm_tsbm.qrjjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsbm.qrjjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ls_sql+=" and crm_tsbm.clzt='5'";//5：结案
		ls_sql+=" and crm_tsbm.sfjslx='Y'";//Y：及时联系
    ls_sql+=" order by crm_tsjl.lrsj,crm_tsjl.tsjlh,crm_tsbm.jssj,crm_tsbm.cljlh,crm_tsbm.tsyybm" ;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数

//设置显示列
	String[] disColName={"tsjlh","zrbm","zrr","tsxlmc","clzt","khxm","fwdz","jssj","jsr","jssm","jhcxcsj","kcjlh","sjcxcsj","sjcxcr","cxcsm","jhcfasj","cfajlh","sjcfasj","sjcfar","jjfa","jhjjsj","sfpfkh","khpfze","sfnbcf","nbcfze","shbm","shr","shsj","shsm","cljlh","sjjjsj","clsj","clr","clqk","hfjgmc","qrjjsj","zzjgmc","jsxmc","sjs","sgdmc","slfsmc","lrsj","jazt","tspp"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"tsjlh","tsyybm"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("处理"); 




//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>回访问题</B> 
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(530);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">回访序号</td>
	<td  width="2%">责任部门</td>
	<td  width="1%">负责人</td>
	<td  width="3%">问题原因</td>
	<td  width="2%">处理状态</td>
	<td  width="1%">姓名</td>
	<td  width="5%">房屋地址</td>

	<td  width="80px">接收时间</td>
	<td  width="1%">接收人</td>
	<td  width="6%">接收说明</td>

	<td  width="80px">计划出现场时间</td>
	<td  width="80px">出现场记录号</td>
	<td  width="80px">实际出现场时间</td>
	<td  width="1%">实际出现场人</td>
	<td  width="7%">出现场说明</td>

	<td  width="80px">计划出方案时间</td>
	<td  width="80px">出方案记录号</td>
	<td  width="80px">实际出方案时间</td>
	<td  width="1%">实际出方案人</td>
	<td  width="9%">解决方案</td>

	<td  width="80px">计划解决时间</td>
	<td  width="1%">是否赔付客户</td>
	<td  width="1%">客户赔付总额</td>
	<td  width="1%">是否内部处罚</td>
	<td  width="1%">内部处罚总额</td>

	<td  width="2%">方案审核部门</td>
	<td  width="1%">方案审核人</td>
	<td  width="80px">方案审核时间</td>
	<td  width="6%">方案审核说明</td>

	<td  width="80px">处理记录号</td>
	<td  width="80px">责任部门解决时间</td>
	<td  width="80px">最新处理时间</td>
	<td  width="1%">最新处理人</td>
	<td  width="10%">最新处理情况</td>

	<td  width="2%">客服回访结果</td>
	<td  width="80px">回访确认解决时间</td>
	<td  width="2%">结案客户是否满意</td>
	<td  width="2%">解决问题及时性</td>



	<td  width="1%">设计师</td>
	<td  width="1%">施工队</td>
	<td  width="1%">来源</td>
	<td  width="80px">录入时间</td>
	<td  width="2%">结案状态</td>
	<td  width="3%">涉及厂商</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>
