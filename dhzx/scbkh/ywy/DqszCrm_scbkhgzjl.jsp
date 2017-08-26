<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_scbkhxx_scbkhbh=null;
String crm_scbkhxx_khxm=null;
String crm_scbkhxx_fwdz=null;
String crm_scbkhxx_lxfs=null;
String crm_scbkhxx_ywy=null;
String crm_scbkhxx_zt=null;
String crm_scbkhxx_sbyybm=null;
String crm_scbkhxx_sbyysm=null;
String crm_scbkhxx_sbdjr=null;
String crm_scbkhxx_sbdjsj=null;
String crm_scbkhxx_lrr=null;
String crm_scbkhxx_lrsj=null;
String crm_scbkhxx_lrbm=null;
String crm_scbkhxx_ssfgs=null;
String fgsmc=null;
String crm_scbkhxx_bz=null;
String crm_scbkhxx_yjr=null;
String crm_scbkhxx_yjsj=null;
String crm_scbkhxx_yjbm=null;
String crm_scbkhxx_yjsm=null;
String crm_scbkhxx_jsr=null;
String crm_scbkhxx_jssj=null;
String crm_scbkhxx_khbh=null;
String crm_scbkhxx_cqbm=null;
String crm_scbkhxx_jiedao=null;
String crm_scbkhxx_xqbm=null;
String crm_scbkhxx_louhao=null;
String crm_scbkhxx_ywyssxz=null;
String crm_scbkhxx_xqlx=null;
String crm_scbkhxx_fwmj=null;
String crm_scbkhxx_hxbm=null;
String crm_scbkhxx_fj=null;
String crm_scbkhxx_khzyxz=null;
String crm_scbkhxx_yjzxsj=null;
String crm_scbkhxx_jzdsmc=null;
String crm_scbkhxx_zjgzsj=null;
String crm_scbkhxx_sfxhf=null;
String crm_scbkhxx_xchfsj=null;
String crm_scbkhxx_sfxxq=null;
String ywybm=null;
String scbkhbh=null;
scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select b.dwmc ywybm,crm_scbkhxx.scbkhbh as crm_scbkhxx_scbkhbh,crm_scbkhxx.khxm as crm_scbkhxx_khxm,crm_scbkhxx.fwdz as crm_scbkhxx_fwdz,crm_scbkhxx.lxfs as crm_scbkhxx_lxfs,crm_scbkhxx.ywy as crm_scbkhxx_ywy,crm_scbkhxx.zt as crm_scbkhxx_zt,crm_scbkhxx.sbyybm as crm_scbkhxx_sbyybm,crm_scbkhxx.sbyysm as crm_scbkhxx_sbyysm,crm_scbkhxx.sbdjr as crm_scbkhxx_sbdjr,crm_scbkhxx.sbdjsj as crm_scbkhxx_sbdjsj,crm_scbkhxx.lrr as crm_scbkhxx_lrr,crm_scbkhxx.lrsj as crm_scbkhxx_lrsj,crm_scbkhxx.lrbm as crm_scbkhxx_lrbm,crm_scbkhxx.ssfgs as crm_scbkhxx_ssfgs,a.dwmc as fgsmc,crm_scbkhxx.bz as crm_scbkhxx_bz,crm_scbkhxx.yjr as crm_scbkhxx_yjr,crm_scbkhxx.yjsj as crm_scbkhxx_yjsj,crm_scbkhxx.yjbm as crm_scbkhxx_yjbm,crm_scbkhxx.yjsm as crm_scbkhxx_yjsm,crm_scbkhxx.jsr as crm_scbkhxx_jsr,crm_scbkhxx.jssj as crm_scbkhxx_jssj,crm_scbkhxx.khbh as crm_scbkhxx_khbh,crm_scbkhxx.cqbm as crm_scbkhxx_cqbm,crm_scbkhxx.jiedao as crm_scbkhxx_jiedao,crm_scbkhxx.xqbm as crm_scbkhxx_xqbm,crm_scbkhxx.louhao as crm_scbkhxx_louhao,c.dwmc as crm_scbkhxx_ywyssxz,crm_scbkhxx.xqlx as crm_scbkhxx_xqlx,crm_scbkhxx.fwmj as crm_scbkhxx_fwmj,crm_scbkhxx.hxbm as crm_scbkhxx_hxbm,crm_scbkhxx.fj as crm_scbkhxx_fj,crm_scbkhxx.khzyxz as crm_scbkhxx_khzyxz,crm_scbkhxx.yjzxsj as crm_scbkhxx_yjzxsj,crm_scbkhxx.jzdsmc as crm_scbkhxx_jzdsmc,crm_scbkhxx.zjgzsj as crm_scbkhxx_zjgzsj,crm_scbkhxx.sfxhf as crm_scbkhxx_sfxhf,crm_scbkhxx.xchfsj as crm_scbkhxx_xchfsj,crm_scbkhxx.sfxxq as crm_scbkhxx_sfxxq ";
	ls_sql+=" from  crm_scbkhxx,sq_dwxx a,sq_dwxx b,sq_dwxx c";
	ls_sql+=" where crm_scbkhxx.ssfgs=a.dwbh(+) and crm_scbkhxx.ywybm=b.dwbh(+) and crm_scbkhxx.ywyssxz=c.dwbh(+) and  (crm_scbkhxx.scbkhbh='"+scbkhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ywybm=cf.fillNull(rs.getString("ywybm"));
		crm_scbkhxx_scbkhbh=cf.fillNull(rs.getString("crm_scbkhxx_scbkhbh"));
		crm_scbkhxx_khxm=cf.fillNull(rs.getString("crm_scbkhxx_khxm"));
		crm_scbkhxx_fwdz=cf.fillNull(rs.getString("crm_scbkhxx_fwdz"));
		crm_scbkhxx_lxfs=cf.fillNull(rs.getString("crm_scbkhxx_lxfs"));
		crm_scbkhxx_ywy=cf.fillNull(rs.getString("crm_scbkhxx_ywy"));
		crm_scbkhxx_zt=cf.fillNull(rs.getString("crm_scbkhxx_zt"));
		crm_scbkhxx_sbyybm=cf.fillNull(rs.getString("crm_scbkhxx_sbyybm"));
		crm_scbkhxx_sbyysm=cf.fillNull(rs.getString("crm_scbkhxx_sbyysm"));
		crm_scbkhxx_sbdjr=cf.fillNull(rs.getString("crm_scbkhxx_sbdjr"));
		crm_scbkhxx_sbdjsj=cf.fillNull(rs.getDate("crm_scbkhxx_sbdjsj"));
		crm_scbkhxx_lrr=cf.fillNull(rs.getString("crm_scbkhxx_lrr"));
		crm_scbkhxx_lrsj=cf.fillNull(rs.getDate("crm_scbkhxx_lrsj"));
		crm_scbkhxx_lrbm=cf.fillNull(rs.getString("crm_scbkhxx_lrbm"));
		crm_scbkhxx_ssfgs=cf.fillNull(rs.getString("crm_scbkhxx_ssfgs"));
		fgsmc=cf.fillNull(rs.getString("fgsmc"));
		crm_scbkhxx_bz=cf.fillNull(rs.getString("crm_scbkhxx_bz"));
		crm_scbkhxx_yjr=cf.fillNull(rs.getString("crm_scbkhxx_yjr"));
		crm_scbkhxx_yjsj=cf.fillNull(rs.getDate("crm_scbkhxx_yjsj"));
		crm_scbkhxx_yjbm=cf.fillNull(rs.getString("crm_scbkhxx_yjbm"));
		crm_scbkhxx_yjsm=cf.fillNull(rs.getString("crm_scbkhxx_yjsm"));
		crm_scbkhxx_jsr=cf.fillNull(rs.getString("crm_scbkhxx_jsr"));
		crm_scbkhxx_jssj=cf.fillNull(rs.getDate("crm_scbkhxx_jssj"));
		crm_scbkhxx_khbh=cf.fillNull(rs.getString("crm_scbkhxx_khbh"));
		crm_scbkhxx_cqbm=cf.fillNull(rs.getString("crm_scbkhxx_cqbm"));
		crm_scbkhxx_jiedao=cf.fillNull(rs.getString("crm_scbkhxx_jiedao"));
		crm_scbkhxx_xqbm=cf.fillNull(rs.getString("crm_scbkhxx_xqbm"));
		crm_scbkhxx_louhao=cf.fillNull(rs.getString("crm_scbkhxx_louhao"));
		crm_scbkhxx_ywyssxz=cf.fillNull(rs.getString("crm_scbkhxx_ywyssxz"));
		crm_scbkhxx_xqlx=cf.fillNull(rs.getString("crm_scbkhxx_xqlx"));
		crm_scbkhxx_fwmj=cf.fillNull(rs.getString("crm_scbkhxx_fwmj"));
		crm_scbkhxx_hxbm=cf.fillNull(rs.getString("crm_scbkhxx_hxbm"));
		crm_scbkhxx_fj=cf.fillNull(rs.getString("crm_scbkhxx_fj"));
		crm_scbkhxx_khzyxz=cf.fillNull(rs.getString("crm_scbkhxx_khzyxz"));
		crm_scbkhxx_yjzxsj=cf.fillNull(rs.getDate("crm_scbkhxx_yjzxsj"));
		crm_scbkhxx_jzdsmc=cf.fillNull(rs.getString("crm_scbkhxx_jzdsmc"));
		crm_scbkhxx_zjgzsj=cf.fillNull(rs.getDate("crm_scbkhxx_zjgzsj"));
		crm_scbkhxx_sfxhf=cf.fillNull(rs.getString("crm_scbkhxx_sfxhf"));
		crm_scbkhxx_xchfsj=cf.fillNull(rs.getDate("crm_scbkhxx_xchfsj"));
		crm_scbkhxx_sfxxq=cf.fillNull(rs.getString("crm_scbkhxx_sfxxq"));
	}
	rs.close();
	ps.close();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String yhmc=(String)session.getAttribute("yhmc");
	String ip=request.getRemoteHost();
	ls_sql="insert into sq_scbkhckrz ( ip,yhdlm,yhmc,cksj,scbkhbh ) ";
	ls_sql+=" values ( ?,?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ip);
	ps.setString(2,cf.GB2Uni(yhdlm));
	ps.setString(3,yhmc);
	ps.setString(4,scbkhbh);
	ps.executeUpdate();
	ps.close();


}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE3 {color: #FF0000; font-weight: bold; }
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<div align="center">定期回访设置（市场部客户编号：<%=crm_scbkhxx_scbkhbh%>）</div>


<form method="post" action="SaveDqszCrm_scbkhgzjl.jsp" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">*</span>回访间隔 </td> 
  <td width="32%"><input type="text" name="hfjg" size="10" maxlength="10"  value="" >
    天</td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="scbkhbh"  value="<%=scbkhbh%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	</div>      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    市场部客户编号  </td>
  <td width="32%"> 
    <%=crm_scbkhxx_scbkhbh%>  </td>
  <td align="right" width="18%">客户编号</td>
  <td width="32%"><%=crm_scbkhxx_khbh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 客户姓名 </td>
  <td><%=crm_scbkhxx_khxm%></td>
  <td align="right"> 所属城区 </td>
  <td><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",crm_scbkhxx_cqbm,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 街道 </td>
  <td><%=crm_scbkhxx_jiedao%> </td>
  <td align="right"> 小区 </td>
  <td><%=crm_scbkhxx_xqbm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 楼号 </td>
  <td><%=crm_scbkhxx_louhao%> </td>
  <td align="right">是否新小区</td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",crm_scbkhxx_sfxxq,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    房屋地址  </td>
  <td width="32%"> 
    <%=crm_scbkhxx_fwdz%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">联系方式</td>
  <td colspan="3"><%=crm_scbkhxx_lxfs%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1"> 
    业务员  </span></td>
  <td width="32%"> 
    <%=crm_scbkhxx_ywy%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">业务员部门</span></td>
  <td><%=ywybm%></td>
  <td align="right"><span class="STYLE1">业务员所属小组</span></td>
  <td><%=crm_scbkhxx_ywyssxz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">小区类型</span></td>
  <td><%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx",crm_scbkhxx_xqlx,true);
%></td>
  <td align="right"><span class="STYLE1">客户资源性质</span></td>
  <td><%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxz",crm_scbkhxx_khzyxz,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 建筑面积 </td>
  <td><%=crm_scbkhxx_fwmj%> </td>
  <td align="right"> 户型 </td>
  <td><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",crm_scbkhxx_hxbm,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 房价 </td>
  <td><%=crm_scbkhxx_fj%> </td>
  <td align="right">预计装修时间</td>
  <td><%=crm_scbkhxx_yjzxsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">竞争对手名称</td>
  <td colspan="3"><%=crm_scbkhxx_jzdsmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> <span class="STYLE1">状态</span></td>
  <td><%
	cf.radioToken(out, "1+跟踪&2+失败&3+移交&4+已接收&5+准备移交&6+准备失败&7+移交过期",crm_scbkhxx_zt,true);
%></td>
  <td align="right" bgcolor="#FFFFFF">最近跟踪时间</td>
  <td><%=crm_scbkhxx_zjgzsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">是否需回访 </span></td>
  <td><%
	cf.radioToken(out, "Y+需要&N+否",crm_scbkhxx_sfxhf,true);
%></td>
  <td align="right">下次回访时间</td>
  <td><%=crm_scbkhxx_xchfsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 录入人 </td>
  <td><%=crm_scbkhxx_lrr%> </td>
  <td align="right"> 录入时间 </td>
  <td><%=crm_scbkhxx_lrsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 录入部门 </td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",crm_scbkhxx_lrbm,true);
%>  </td>
  <td align="right"> 所属分公司 </td>
  <td><%=fgsmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><%=crm_scbkhxx_bz%></td>
</tr>
</table>

</body>
</html>
<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

//-->
</script>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.scbkhbh)=="") {
		alert("请输入[市场部客户编号]！");
		FormName.scbkhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hfjg)=="") {
		alert("请输入[回访间隔]！");
		FormName.hfjg.focus();
		return false;
	}
	if(!(isNumber(FormName.hfjg, "回访间隔 "))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
