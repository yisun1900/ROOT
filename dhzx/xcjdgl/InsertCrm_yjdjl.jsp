<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jdjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";
String xcjdbz="";
String khqdzt="";
int sjhtje=0;
int tchtje=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
    
	ls_sql="select khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,sgd,zjxm,xcjdbz,sjhtje,tchtje";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		xcjdbz=cf.fillNull(rs.getString("xcjdbz"));
		sjhtje=rs.getInt("sjhtje");
		tchtje=rs.getInt("tchtje");
	}
	rs.close();
	ps.close();
	if(sjhtje==0 && tchtje!=0)
	{
	   khqdzt="已签套餐意向书";
	}
	else if(tchtje==0 &&sjhtje!=0)
	{
	   khqdzt="已签设计合同";
	}
    else if(tchtje==0 &&sjhtje==0) 
	 {
	   khqdzt="未签";
	}
	
	if (!xcjdbz.equals("1"))//1：未预预交底：2：提交申请：3：预预交底
	{
		out.println("错误！已提交预预交底申请");
		return;
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='店面经理' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(jdjlh,8,3)),0)";
	ls_sql+=" from  crm_yjdjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jdjlh=khbh+cf.addZero(count+1,3);
     
	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_yjdjl";
	ls_sql+=" where khbh='"+khbh+"' and clzt='1' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">录入预交底申请（预交底记录号：<%=jdjlh%>）</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">预交底记录号</td>
	<td  width="6%">申请日期</td>
	<td  width="6%">申请人</td>
	<td  width="6%">计划预交底日期</td>
	<td  width="6%">计划预交底时间</td>
	<td  width="6%">最终确认预交底日期</td>
	<td  width="6%">最终确认预交底时间</td>
	<td  width="6%">实际预交底时间</td>
	<td  width="6%">预交底是否成功</td>
	<td  width="6%">处理状态</td>
	<td  width="6%">录入人</td>
	<td  width="6%">录入时间</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_yjdjl.jdjlh,crm_yjdjl.sqrq,crm_yjdjl.sqr,crm_yjdjl.jhjdrq,crm_yjdjl.jhjdsj,crm_yjdjl.zzqrjdrq,crm_yjdjl.zzqrjdsj,crm_yjdjl.sjjdsj, DECODE(crm_yjdjl.jdsfcg,'Y','成功','N','否'), DECODE(crm_yjdjl.clzt,'1','申请','2','确认','3','特批完成','4','发布','5','已预交底'),crm_yjdjl.lrr,crm_yjdjl.lrsj";
	ls_sql+=" FROM crm_zxkhxx,crm_yjdjl  ";
    ls_sql+=" where crm_yjdjl.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_yjdjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_yjdjl.jdjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/Viewcrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">店长及电话</span></td>
    <td><%=dmjl%>（<%=dmjldh%>）</td>
  </tr>
 
   <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">签单状态</span></td>
    <td><%=khqdzt%></td>
	<td align="right"><span class="STYLE2">联系电话</span></td>
    <td><input type="button" value="查看电话" onClick="window.open('/dhzx/dhzx/ViewZxDh.jsp?khbh=<%=khbh%>')"></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>申请日期</td> 
  <td width="32%"> 
    <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>申请人</td> 
  <td width="32%"> 
    <input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>申请人联系电话</td> 
  <td colspan="3"> 
    <input type="text" name="sqrlxdh" value="" size="72" maxlength="40" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计划预交底日期</td> 
  <td width="32%"> 
    <input type="text" name="jhjdrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>计划预交底时间</td> 
  <td width="32%"> 
    <input type="text" name="jhjdsj" value="" size="6" maxlength="8" >
    格式 HH：MM(小时：分钟) </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">申请说明</td>
  <td colspan="3"><textarea name="sqsm" cols="71" rows="3"></textarea></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
    <input type="hidden" name="jdjlh" value="<%=jdjlh%>" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("请输入[预交底记录号]！");
		FormName.jdjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrlxdh)=="") {
		alert("请输入[申请人联系电话]！");
		FormName.sqrlxdh.focus();
		return false;
	}
	if(	javaTrim(FormName.jhjdrq)=="") {
		alert("请输入[计划预交底日期]！");
		FormName.jhjdrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjdrq, "计划预交底日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jhjdsj)=="") {
		alert("请输入[计划预交底时间]！");
		FormName.jhjdsj.focus();
		return false;
	}

	var flag=true;
	var p=/[0-90-9]\:[0-90-9]/; 

		if(document.insertform.jhjdsj.value!="")
		{
			flag = p.test(document.insertform.jhjdsj.value);
			if(!flag) 
　　　　　　{ 
			
　　　　　　　alert("请填写正确的[计划预交底时间]格式"); 
　　　　　　　return false; 
　　　　　　} 
		else
		{
			var time=document.insertform.jhjdsj.value.split(":");
			if(time[0]>=24)
			{
				alert("[计划预交底时间]里的小时必需小于24");
				return false; 
			}
			else
			{
				if(time[1]>59)
				{
					alert("[计划预交底时间]里的分钟必须小于59");
					return false; 
				}
			}
		
		}
		}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_yjdjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
