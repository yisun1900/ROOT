<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));

String slfsbm=null;
String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String dwbh=null;
String zjxm=null;
String sjkgrq=null;
String sjjgrq=null;
String sfxhf=null;
String hfsj=null;
String tsclzt=null;
String yzcdbm=null;
String bz=null;
String yqjjsj=null;
String ldyqjjsj=null;
String ldclyj=null;
String slbm=null;
String tsnr=null;
String tsbxsj=null;
String zrbmclzt=null;
String sfxtz=null;
String lrr=null;
String lrsj=null;
String slr=null;
String slsj=null;

String zrbm=null;
String tslxbm=null;
String tsxlbm=null;
String clzt=null;
String jssj=null;
String jsr=null;
String jssm=null;
String jhcxcsj=null;

String kcjlh=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select crm_tsjl.slsj,crm_tsjl.slr,crm_tsjl.lrr,crm_tsjl.lrsj,crm_tsjl.tsbxsj,crm_tsjl.ldyqjjsj,crm_tsjl.ldclyj ";
	ls_sql+=" ,DECODE(crm_tsjl.zrbmclzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as zrbmclzt";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') as clzt";
	ls_sql+=" ,crm_tsjl.sfxtz,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,qtdh,sjs,sgd,sgbz,crm_khxx.dwbh,zjxm,sjkgrq,sjjgrq,crm_tsjl.sfxhf,crm_tsjl.hfsj,crm_tsjl.yqjjsj";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zrbmclzt=cf.fillNull(rs.getString("zrbmclzt"));
		tsclzt=cf.fillNull(rs.getString("clzt"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		sfxtz=cf.fillNull(rs.getString("sfxtz"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		ldyqjjsj=cf.fillHtml(rs.getDate("ldyqjjsj"));
		ldclyj=cf.fillHtml(rs.getString("ldclyj"));
	}
	rs.close();

	ls_sql="select crm_tsbm.dwbh,tslxbm,tsxlbm,clzt";
	ls_sql+=" ,crm_tsbm.jssm,crm_tsbm.jhcxcsj,crm_tsbm.jssj,crm_tsbm.jsr";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and crm_tsbm.tsyybm='"+tsyybm+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zrbm=cf.fillNull(rs.getString("dwbh"));
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
		clzt=cf.fillNull(rs.getString("clzt"));

		jssm=cf.fillNull(rs.getString("jssm"));
		jhcxcsj=cf.fillNull(rs.getDate("jhcxcsj"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
	}
	rs.close();

	int count=0;
	ls_sql="select NVL(max(substr(kcjlh,11,2)),0)";
	ls_sql+=" from  crm_tsbxxckcjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	kcjlh=tsjlh+cf.addZero(count+1,2);
%>

<html>
<head>
<title>报修处理－出现场</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">报修处理－出现场（报修记录号：<%=tsjlh%>） </div>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">客户编号</font>    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">合同号</font>    </td>
    <td width="32%"> <%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">客户姓名</font></td>
    <td width="33%"> <%=khxm%></td>
    <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">电话</font></td>
    <td colspan="3"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
    <td colspan="3"> <%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">设计师</font>    </td>
    <td width="33%"> <%=sjs%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">质检员</font>    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      <font color="#0000CC">施工队</font>    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      <font color="#0000CC">施工班组</font>    </td>
    <td width="32%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">实开工日期</font></td>
    <td width="33%"> <%=sjkgrq%> </td>
    <td width="18%" align="right"><font color="#0000CC">实交工日期</font></td>
    <td width="32%"> <%=sjjgrq%> </td>
  </tr>
</table>

<BR>
<center>
报修内容
<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF"> 
    <td width="83%" valign="top"><%=tsnr%>  </td>
</tr>
</table>


<BR>
<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">


<tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">严重程度</td>
    <td width="29%"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
    <td width="21%" align="right">处理状态</td>
    <td width="29%" valign="top"><%=tsclzt%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong><font color="#FF0000">客户要求解决时间</font></strong></td>
    <td><%=yqjjsj%></td>
    <td align="right"><strong><font color="#FF0000">领导要求解决时间</font></strong></td>
    <td valign="top"><%=ldyqjjsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">领导处理意见</td>
    <td colspan="3"><%=ldclyj%></td>
    </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">客户报修时间</td>
    <td width="29%"><%=tsbxsj%> </td>
    <td width="21%" align="right">报修来源</td>
    <td width="29%" valign="top"><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm where slfsbm='"+slfsbm+"'",slfsbm,true);
%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">录入人</td>
    <td width="29%"><%=lrr%></td>
    <td width="21%" align="right">录入时间</td>
    <td width="29%" valign="top"><%=lrsj%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">备注</td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>涉及部门</strong></td>
	<td width="19%"><strong>原因</strong></td>
	<td width="8%"><strong>状态</strong></td>
	<td width="46%"><strong>接收说明</strong></td>
	<td width="9%"><strong>接收时间</strong></td>
	<td width="6%"><strong>接收人</strong></td>
  </tr>
<%
	String getdwmc="";
	String gettsyymc="";
	String getjssm="";
	String getjhcxcsj="";
	String getjssj="";
	String getjsr="";
	String geclzt="";
	ls_sql="select dwmc,'（'||tsxlmc||'）'||tsyymc tsyymc,crm_tsbm.jssm,crm_tsbm.jhcxcsj,crm_tsbm.jssj,crm_tsbm.jsr";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as clzt";
	ls_sql+=" from  crm_tsbm,sq_dwxx,dm_tsxlbm,dm_tsyybm";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) ";
	ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)";
	ls_sql+=" and crm_tsbm.tsjlh='"+tsjlh+"'";
	ls_sql+=" order by crm_tsbm.dwbh";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		getdwmc=cf.fillNull(rs.getString("dwmc"));
		gettsyymc=cf.fillNull(rs.getString("tsyymc"));
		getjssm=cf.fillHtml(rs.getString("jssm"));
		getjsr=cf.fillHtml(rs.getString("jsr"));
		getjssj=cf.fillHtml(rs.getDate("jssj"));
		getjhcxcsj=cf.fillHtml(rs.getDate("jhcxcsj"));
		geclzt=cf.fillHtml(rs.getString("clzt"));

		%>
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td><%=getdwmc%></td>
			<td align="left"><%=gettsyymc%></td>
			<td><%=geclzt%></td>
			<td align="left"><%=getjssm%></td>
			<td><%=getjssj%></td>
			<td><%=getjsr%></td>
		  </tr>
		<%
	}
	rs.close();


%> 
</table>


<BR>

<table width="90%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" align="center"> 
	<td width="12%"><strong>回访时间</strong></td>
	<td width="60%"><strong>客户回访情况</strong></td>
	<td width="28%"><strong>回访中出现的新问题</strong></td>
  </tr>
<%
	String khhfqk=null;
	String cxxwt=null;

	ls_sql="select hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and tsjlh='"+tsjlh+"'";
	ls_sql+=" order by hfsj";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));

		%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center" ><%=hfsj%></td>
            <td ><%=khhfqk%></td>
            <td ><%=cxxwt%></td>
          </tr>
		<%
	}
	rs.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
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
</table>
</center>


<form method="post" action="SaveInsertCrm_tsbxxckcjl.jsp" name="editform" target="_blank">
        <div align="center"><b>报修处理－出现场</b>（出现场记录号：<%=kcjlh%>）</div>
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">报修报修大类</font></td>
      <td width="32%"> 
        <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tslxbm='"+tslxbm+"'",tslxbm);
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">报修报修小类</font></td>
      <td width="33%"> 
        <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm where tsxlbm='"+tsxlbm+"'",tsxlbm);
%> 
        </select>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">责任部门</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	   cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zrbm+"'",zrbm);
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">报修报修原因</font></td>
      <td width="33%"> 
        <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsyybm='"+tsyybm+"'",tsyybm);
%> 
        </select>      </td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>计划出方案时间</td>
      <td><input type="text" name="jhcfasj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
      <td align="right"><font color="#0000CC">计划出现场时间</font></td>
      <td><input type="text" name="jhcxcsj" size="20" maxlength="10" value="<%=jhcxcsj%>" readonly></td>
    </tr>
    
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font>出现场人</td>
      <td width="32%"> 
        <input type="text" name="cxcr" value="<%=yhmc%>" size="20" maxlength="20" >      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font>出现场时间</td>
      <td width="33%"> 
        <input type="text" name="cxcsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>现场情况</td>
      <td colspan="3"><textarea name="xcqk" cols="71" rows="9"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">录入人</font></td>
      <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000CC">录入时间</font></td>
      <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0033CC">录入部门</font></td>
      <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
        </select>      </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
		<input type="hidden" name="kcjlh" value="<%=kcjlh%>" >
          <input type="button"  value="存盘" onClick="f_do(editform)" >
          <input type="button"  value="上传照片" onClick="f_lr(editform)" name="lr" disabled>
          <input type="button"  value="查看照片" onClick="f_ck(editform)" name="ck" disabled>
      <input type="reset"  value="重输" name="reset"></td>
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
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请输入[报修报修记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("请输入[报修原因]！");
		FormName.tsyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[出现场记录号]！");
		FormName.kcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.jhcfasj)=="") {
		alert("请输入[计划出方案时间]！");
		FormName.jhcfasj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhcfasj, "计划出方案时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xcqk)=="") {
		alert("请输入[现场情况]！");
		FormName.xcqk.focus();
		return false;
	}
	if(	javaTrim(FormName.cxcr)=="") {
		alert("请输入[出现场人]！");
		FormName.cxcr.focus();
		return false;
	}
	if(	javaTrim(FormName.cxcsj)=="") {
		alert("请输入[出现场时间]！");
		FormName.cxcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxcsj, "出现场时间"))) {
		return false;
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

	FormName.action="SaveInsertCrm_tsbxxckcjl.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kcjlh)=="") {
		alert("请输入[勘查记录号]！");
		FormName.kcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
