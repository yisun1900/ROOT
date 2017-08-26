<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String jzph=request.getParameter("jzph");


	ls_sql="SELECT b.dwmc fgs,a.dwmc bm,DECODE(rs_yhxxqmjz.sfzszg,'M','<font color=\"#009999\">实习生</font>','Y','转正','N','<font color=\"#0000CC\">试用期</font>','D','<font color=\"#CCCC00\">待岗</font>','S','<font color=\"#CC0000\">辞职</font>','T','<font color=\"#CC00CC\">辞退</font>'),rs_yhxxqmjz.bianhao,rs_yhxxqmjz.yhmc,xzzwbm,rs_yhxxqmjz.ygbh,dm_zwbm.zwmc,c.dwmc jzbm, DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商'),rs_yhxxqmjz.sjsbh, DECODE(rs_yhxxqmjz.gzlb,'1','固定','2','浮动工资'),kqhm, DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否'), DECODE(rs_yhxxqmjz.xb,'M','男','W','女'),rs_yhxxqmjz.csrq, DECODE(rs_yhxxqmjz.hf,'Y','是','N','否'),rs_yhxxqmjz.mz,'`'||rs_yhxxqmjz.sfzh,rs_yhxxqmjz.hjszd,rs_yhxxqmjz.dacfd,rs_yhxxqmjz.byyx,rs_yhxxqmjz.zy,dm_xlbm.xueli,DECODE(rs_yhxxqmjz.dhsfgb,'1','本公司内','2','不受限制','9','不公布'),rs_yhxxqmjz.dh,rs_yhxxqmjz.bgdh,rs_yhxxqmjz.jtdh,rs_yhxxqmjz.email,rs_yhxxqmjz.zz,rs_yhxxqmjz.cjgzsj,ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj,rs_yhxxqmjz.rzsj,rs_yhxxqmjz.htksrq,rs_yhxxqmjz.htdqrq,rs_yhxxqmjz.lzrq, DECODE(rs_yhxxqmjz.sfqs,'Y','是','N','否'), DECODE(rs_yhxxqmjz.ylbx,'Y','是','N','否'), DECODE(rs_yhxxqmjz.jylbx,'Y','是','N','否'), DECODE(rs_yhxxqmjz.sybx,'Y','是','N','否'), DECODE(rs_yhxxqmjz.gsby,'Y','是','N','否'), DECODE(rs_yhxxqmjz.syx,'Y','是','N','否') ,rs_yhxxqmjz.shbxh,rs_yhxxqmjz.jbxdd,rs_yhxxqmjz.jjlxr,rs_yhxxqmjz.lxrdh,rs_yhxxqmjz.zkl, DECODE(rs_yhxxqmjz.ckjgbz,'Y','可看','N','不可'), DECODE(rs_yhxxqmjz.zdyhbz,'Y','是','N','否'), rs_yhxxqmjz.bjjb,rs_yhxxqmjz.glgz,rs_yhxxqmjz.gwgz,rs_yhxxqmjz.jbgz,rs_sjsjb.sjsjbmc,rs_yhxxqmjz.yjsxe,rs_yhxxqmjz.jtbt,rs_yhxxqmjz.cb,rs_yhxxqmjz.dhbt, DECODE(rs_yhxxqmjz.sfydbs,'Y','是','N','否'), DECODE(rs_yhxxqmjz.sfytj,'Y','是','N','否'),rs_yhxxqmjz.tjrq,rs_yhxxqmjz.qgzdw,rs_yhxxqmjz.lrsj,rs_yhxxqmjz.bz ";
	ls_sql+=" FROM dm_xlbm,dm_zwbm,rs_sjsjb,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_yhxxqmjz  ";
    ls_sql+=" where rs_yhxxqmjz.sjsjb=rs_sjsjb.sjsjb(+) and rs_yhxxqmjz.zwbm=dm_zwbm.zwbm(+) and rs_yhxxqmjz.xlbm=dm_xlbm.xlbm(+)";
    ls_sql+=" and rs_yhxxqmjz.dwbh=a.dwbh(+) and rs_yhxxqmjz.ssfgs=b.dwbh(+) and rs_yhxxqmjz.jzbm=c.dwbh(+)";
    ls_sql+=" and rs_yhxxqmjz.jzph='"+jzph+"' ";
    ls_sql+=" order by rs_yhxxqmjz.ssfgs,rs_yhxxqmjz.dwbh,rs_yhxxqmjz.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yhmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果（结转批号：<%=jzph%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(720);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="120">分公司</td>
	<td  width="180">所属部门</td>
	<td  width="70">员工状态</td>
	<td  width="70">工号</td>
	<td  width="90">员工名称</td>
	<td  width="120">行政职务</td>
	<td  width="70">序号</td>
	<td  width="120">工种</td>
	<td  width="140">兼职部门</td>
	<td  width="140">用户角色</td>
	<td  width="140">所属设计室</td>
	<td  width="70">工资类别</td>
	<td  width="70">考勤号码</td>
	<td  width="70">可登陆系统</td>
	<td  width="70">性别</td>
	<td  width="90">出生日期</td>
	<td  width="70">婚否</td>
	<td  width="70">民族</td>
	<td  width="140">身份证号</td>
	<td  width="180">户籍所在地</td>
	<td  width="180">档案存放地</td>
	<td  width="210">毕业院校</td>
	<td  width="140">专业</td>
	<td  width="140">学历</td>
	<td  width="90">电话是否公布</td>
	<td  width="140">手机</td>
	<td  width="140">办公电话</td>
	<td  width="140">家庭电话</td>
	<td  width="140">email</td>
	<td  width="290">住址</td>
	<td  width="90">毕业时间</td>
	<td  width="70">工龄</td>
	<td  width="90">入职日期</td>
	<td  width="90">合同开始日期</td>
	<td  width="90">合同到期日期</td>
	<td  width="90">离职日期</td>
	<td  width="70">有亲属关系</td>
	<td  width="70">医疗保险</td>
	<td  width="70">养老保险</td>
	<td  width="70">失业保险</td>
	<td  width="70">工伤保险</td>
	<td  width="70">生育保险</td>
	<td  width="140">社会保险号</td>
	<td  width="140">缴保险地点</td>
	<td  width="140">紧急联系人</td>
	<td  width="140">急联系人手机</td>
	<td  width="70">允许折扣率</td>
	<td  width="70">允许查看价格</td>
	<td  width="70">重点用户标志</td>
	<td  width="160">报价级别</td>
	<td  width="70">工龄工资</td>
	<td  width="70">岗位工资</td>
	<td  width="70">基本工资</td>
	<td  width="140">设计师职称</td>
	<td  width="70">交纳基数</td>
	<td  width="70">交通补贴</td>
	<td  width="70">每日餐补</td>
	<td  width="70">手机补贴</td>
	<td  width="70">是否有担保书</td>
	<td  width="70">是否已体检</td>
	<td  width="140">体检日期</td>
	<td  width="140">前工作单位</td>
	<td  width="90">录入时间</td>
	<td  width="640">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>