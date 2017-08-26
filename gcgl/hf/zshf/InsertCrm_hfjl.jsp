<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String hfbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String khxm=null;
String hth=null;
String fwdz=null;
String lxfs=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sgbz=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String zjxm=null;
String bz=null;

String hflxbm=null;
String ysgcjdmc=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
String qye=null;
String zkl=null;
String yhyy=null;
String khlxmc=null;
String dwbh=null;
String dwmc=null;
String sjjgrq=null;
String sjwjrq=null;
double sfke=0;
int hfsl=0;
int cpsl=0;
String ssfgs=null;

String sjsdh=null;
String zjdh=null;
String dzdh=null;
String bzdh=null;

int tssl=0;

String ybysxmbm=null;
String zqysxmbm=null;
String sybgcrq=null;
String szqsj=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select fgsbh,ysgcjdmc,sjwjrq,sgbz,khxm,sfke,hth,fwdz,lxfs,hflxbm,kgrq,sjkgrq,jgrq,sgd,sjs,zjxm,qye,zkl,yhyy,khlxmc,sjjgrq,b.dwmc dwmc,crm_khxx.dwbh dwbh,crm_khxx.bz";
	ls_sql+=" ,crm_khxx.ybysxmbm,crm_khxx.zqysxmbm,crm_khxx.sybgcrq,crm_khxx.szqsj";
	ls_sql+=" from  crm_khxx,sq_dwxx b,dm_khlxbm,dm_gcjdbm";
	ls_sql+=" where crm_khxx.dwbh=b.dwbh(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)  and khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ybysxmbm=cf.fillNull(rs.getString("ybysxmbm"));
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		ssfgs=rs.getString("fgsbh");
		sfke=rs.getDouble("sfke");
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		hflxbm=cf.fillHtml(rs.getString("hflxbm"));
		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));

		sjwjrq=cf.fillHtml(rs.getDate("sjwjrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));

		sgd=cf.fillHtml(rs.getString("sgd"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
        qye=cf.fillHtml(rs.getString("qye"));
		zkl=cf.fillHtml(rs.getString("zkl"));
		yhyy=cf.fillHtml(rs.getString("yhyy"));
		khlxmc=cf.fillHtml(rs.getString("khlxmc"));
	    sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
	    dwmc=cf.fillHtml(rs.getString("dwmc"));
	    dwbh=cf.fillHtml(rs.getString("dwbh"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();


	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();

	//工程担当电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();


//队长电话
	ls_sql=" select sgdmc,dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();

//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();

	//回访记录号
	ls_sql="select NVL(max(substr(hfjlh,8,2)),0)";
	ls_sql+=" from  crm_hfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hfsl=rs.getInt(1);
	}
	rs.close();
	
	hfjlh=khbh+cf.addZero(hfsl+1,2);

	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tssl=rs.getInt(1);
	}
	rs.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">电话回访（回访记录号：<%=hfjlh%>） </div>
<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>客户姓名</b>：</font><%=khxm%>（<%=lxfs%>）</td>
    <td colspan="2"><font color="#0000FF"><b>合同号</b>：</font><%=hth%></td>
    <td width="26%"><font color="#0000CC"><b>客户编号</b>：</font><%=khbh%></td>
    <td width="24%"><font color="#0000FF"><b>关系客户</b>：</font><%=khlxmc%></td>
  </tr>
  <tr> 
    <td colspan="4"><font color="#0000CC"><b>房屋地址</b>：</font><%=fwdz%></td>
    <td width="26%"><font color="#0000FF"><b>签约金额</b>：</font><%=qye%>（<font color="#0000FF">折扣率：</font><%=zkl%>）</td>
    <td width="24%"><font color="#0000FF"><strong>家装实付款</strong>：</font><%=sfke%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>设计师</b></font>：（<%=dwmc%>）<%=sjs%>（<%=sjsdh%>）</td>
    <td colspan="2"><font color="#0000CC"><b>工程担当</b>：</font><%=zjxm%>（<%=zjdh%>）</td>
    <td width="26%"><font color="#0000CC"><b>施工队</b>：</font><%=sgdmc%>（<%=dzdh%>）</td>
    <td width="24%"><font color="#0000CC"><b>班长</b>：</font><%=sgbz%>（<%=bzdh%>）</td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>应开工日期</b>：</font><%=kgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>应竣工日期</b>：</font><%=jgrq%></td>
    <td colspan="2"><font color="#0000FF"><b>优惠内容</b>：</font><%=yhyy%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>实开工日期</b>：</font><%=sjkgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>实竣工日期</b>：</font><%=sjjgrq%></td>
    <td width="26%"><font color="#0000CC"><b>实际完结日期</b>：</font><%=sjwjrq%></td>
    <td width="24%"><font color="#0000CC"><b>工程进度</b>：</font><%=ysgcjdmc%> </td>
  </tr>
  <tr>
    <td colspan="6"><font color="#0000CC"><b>备注</b>：</font><%=bz%></td>
  </tr>
</table>
<%
if (hfsl>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">回访类型</td>
		<td  width="7%">回访时间</td>
		<td  width="8%">回访部门</td>
		<td  width="7%">回访结果</td>
		<td  width="31%">回访问题</td>
		<td  width="10%">反馈部门</td>
		<td  width="30%">相关部门处理情况</td>
	</tr>
	<%
	ls_sql="SELECT hflxmc,hfsj,a.dwmc hfbm,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[设计师]：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'；[工程担当]：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'；[施工队]：'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'；[集成]：'||jchfnr)||DECODE(crm_hfjl.bz,null,'',crm_hfjl.bz,'；[备注]：'||crm_hfjl.bz) as hfnr,b.dwmc dwmc,xwtclqk";
	ls_sql+=" FROM crm_hfjl,dm_jglxbm,crm_gchffkbm,sq_dwxx a,sq_dwxx b,dm_hflxbm";
    ls_sql+=" where crm_hfjl.jglxbm=dm_jglxbm.jglxbm and khbh='"+khbh+"'  ";
	ls_sql+=" and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+) and crm_hfjl.hfbm=a.dwbh(+) and crm_gchffkbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_hfjl.hflxbm=dm_hflxbm.hflxbm";
	ls_sql+=" order by hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[4]="align='left'";
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//列参数对象加入Hash表
	spanColHash.put("hfsj","1");//列参数对象加入Hash表
	spanColHash.put("hfbm","1");//列参数对象加入Hash表
	spanColHash.put("jglxmc","1");//列参数对象加入Hash表
	spanColHash.put("hfnr","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>

<%
if (tssl>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCFFCC"  align="center">
		<td  width="9%">受理时间</td>
		<td  width="10%">受理方式</td>
		<td  width="9%">结案状态</td>
		<td  width="11%">责任部门处理</td>
		<td  width="62%">投诉报修内容</td>
	</tr>
	<%

	ls_sql="SELECT tsjlh,slsj,slfsmc,DECODE(crm_tsjl.clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') clzt,DECODE(crm_tsjl.zrbmclzt,'1','未处理','2','在处理','3','已解决') zrbmclzt,tsnr";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[4]="align='left'";

//设置显示列
	String[] disColName={"slsj","slfsmc","clzt","zrbmclzt","tsnr"};
	pageObj.setDisColName(disColName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("slsj",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>

<table width="100%" border="0">
  <tr>
    <td>
<form method="post" action="SaveInsertCrm_hfjl.jsp" name="insertform" >
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          
          <tr bgcolor="#FFFFCC">
            <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">验收项目</font></strong></td>
            <td bgcolor="#E8E8FF"><A HREF="/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>" target="_blank"><%cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where gcysxmbm='"+zqysxmbm+"'",zqysxmbm,true);%></A></td>
            <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">验收时间</font></strong></td>
            <td bgcolor="#E8E8FF"><%=szqsj%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="13%" align="right">设计师</td>
            <td width="37%">设计方案：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sjfa","");
%><br>
              后期服务：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","hqfw","");
%><br>
              交底清楚：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jdqk","");
%> </td>
            <td width="14%" align="right">设计师回访内容</td>
            <td width="36%"> 
              <textarea name="sjshfnr" rows="3" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="13%" align="right">工程担当</td>
            <td width="37%" bgcolor="#E8E8FF">服务：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyfw","");
%><br>
              到位：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjydw","");
%><br>
              尽责：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyjz","");
%></td>
            <td width="14%" align="right">工程担当回访内容</td>
            <td width="36%"> 
              <textarea name="zjyhfnr" rows="3" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="13%" align="right">施工队</td>
            <td width="37%">服务素质：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","fwsz","");
%><br>
              施工质量：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sgzl","");
%><br>
              工人素质：<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","grsz","");
%> </td>
            <td width="14%" align="right">施工队回访内容</td>
            <td width="36%"> 
              <textarea name="sgdhfnr" rows="3" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="13%" align="right">集成家居</td>
            <td width="37%"> 家居设计师 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcjjsjs","");
%>			  
              <br>
              家居顾问： 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jsjjgw","");
%>			  
              <br>
              项目专员： 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcxmzy","");
%>			  
              <br>
              送货安装： 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcshaz","");
%>			  
              <br>
              产品质量： 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jccpzl","");
%>            </td>
            <td width="14%" align="right">集成家居回访内容</td>
            <td width="36%">
              <textarea name="jchfnr" rows="5" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right">备注</td>
            <td colspan="3"> 
              <input type="text" name="bz" maxlength="100" size="89">            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right"><font color="#FF0000">*</font>本次回访类型</td>
            <td width="37%"> 
              <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' and hflxbm='"+hflxbm+"'",hflxbm);
%> 
              </select>
              <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
              <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >
              <input type="hidden" name="hfbm" value="<%=hfbm%>" size="20" maxlength="20" >
              <input type="hidden" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" >
              <input type="hidden" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" >            </td>
            <td width="14%" align="right" bgcolor="#FFFFFF"><b><font color="#CC0000">工程进度</font></b></td>
            <td width="36%"> <%=ysgcjdmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right"><font color="#FF0000">*</font>回访结果</td>
            <td width="37%" bgcolor="#FFFFFF"> 
              <select name="jglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm","");
%> 
              </select>            </td>
            <td rowspan="5" align="right" bgcolor="#E8E8FF">反馈部门 </td>
            <td rowspan="5" bgcolor="#E8E8FF"> 
              <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:252PX" size="9" multiple>
                <option value=""></option>
                <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%> 
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>处理方式 </td>
            <td width="37%" bgcolor="#E8E8FF"> 
              <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f2(insertform)">
                <option value=""></option>
                <option value="0">不需处理</option>
                <option value="1">反馈相关部门</option>
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right"><font color="#FF0000">*</font>设置下次回访时间</td>
            <td width="37%" bgcolor="#FFFFFF"> 
				<input type="radio" name="sfjxhf"  value="Y" onClick="f1(insertform)">
				设置 
				<input type="radio" name="sfjxhf"  value="N" onClick="f1(insertform)">
				不设置 
				<input type="radio" name="sfjxhf"  value="F" onClick="f1(insertform)">
				重新回访			</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right">下次回访类型</td>
            <td width="37%" bgcolor="#FFFFFF"> 
              <select name="xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right">下次回访日期</td>
            <td width="37%"> 
              <input type="text" name="xchfrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">            </td>
          </tr>
          <tr> 
            <td colspan="4" align="center"> 
              <input type="button"  value="存盘" onClick="f_do(insertform)" name="button">
              <input type="button"  value="投诉登记" onClick="window.open('/tsgl/tsdj/InsertCrm_tsjl.jsp?khbh=<%=khbh%>')" name="button">
              <input type="button"  value="报修登记" onClick="window.open('/tsgl/bxdj/InsertCrm_tsjl.jsp?khbh=<%=khbh%>')" name="button2">
              <input type="reset"  value="重输" name="reset">            </td>
          </tr>
        </table>
      </form>
	</td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>

function f1(FormName)//参数FormName:Form的名称
{
	if (FormName.sfjxhf[0].checked)//设置
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value="";
		FormName.xchflxbm.options[0].text="";

		var actionStr="/gcgl/hfjl/InsertCx.jsp?ssfgs=<%=ssfgs%>";

//		window.open(actionStr);
		openAjax(actionStr);
	}
	else if (FormName.sfjxhf[1].checked)//不设置
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value="";
		FormName.xchflxbm.options[0].text="";

		FormName.xchfrq.value='';
	}
	else if (FormName.sfjxhf[2].checked)//重新回访
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value=FormName.hflxbm.options[0].value;
		FormName.xchflxbm.options[0].text=FormName.hflxbm.options[0].text;
	}
}

function getAjax(ajaxRetStr) 
{
	var value1=getStrValue(ajaxRetStr,1);
	strToSelect(insertform.xchflxbm,value1);
}


function f2(FormName)//参数FormName:Form的名称
{
	if (FormName.clfs.value=='0')
	{
		notAll(FormName.dwbh);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	f2(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请选择[本次回访类型]！");
		FormName.hflxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jglxbm)=="") {
		alert("请选择[回访结果]！");
		FormName.jglxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clfs)=="") {
		alert("请选择[处理方式]！");
		FormName.clfs.focus();
		return false;
	}
	if (FormName.clfs.value=='1')
	{
		if (!selectChecked(FormName.dwbh)){
			alert("请选择[反馈部门]！");
			FormName.dwbh.focus();
			return false;
		}
	}

	
	if(	!radioChecked(FormName.sfjxhf)) {
		alert("请选择[设置下次回访时间]！");
		FormName.sfjxhf[0].focus();
		return false;
	}

	if (FormName.sfjxhf[0].checked || FormName.sfjxhf[2].checked)
	{
		if(	javaTrim(FormName.xchflxbm)=="") {
			alert("请选择[下次回访类型]！");
			FormName.xchflxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.xchfrq)=="") {
			alert("请选择[下次回访日期]！");
			FormName.xchfrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfrq, "下次回访日期"))) {
			return false;
		}
	}
	

	if(	javaTrim(FormName.hfr)=="") {
		alert("请输入[回访人]！");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("请输入[回访时间]！");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "回访时间"))) {
		return false;
	}



	FormName.submit();
	return true;
}
//-->
</SCRIPT>

