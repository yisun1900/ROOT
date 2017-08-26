<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zwbm=(String)session.getAttribute("zwbm");

%>
<%
String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
String sbdjsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String louhao=null;
String qtdh=null;
String ywyssxz=null;
String xqlx=null;
String fwmj=null;
String hxbm=null;
String fj=null;
String khzyxz=null;
String yjzxsj=null;
String jzdsmc=null;
String sfxhf=null;
String xchfsj=null;
String dqbm=null;

String scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khxm,fwdz,lxfs,ywy,zt,sbyybm,sbyysm,sbdjr,sbdjsj,lrr,lrsj,lrbm,ssfgs,bz,cqbm,jiedao,xqbm,louhao,ywyssxz,xqlx,fwmj,hxbm,fj,khzyxz,yjzxsj,jzdsmc,sfxhf,xchfsj ";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where  scbkhbh='"+scbkhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		zt=cf.fillNull(rs.getString("zt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sbyysm=cf.fillNull(rs.getString("sbyysm"));
		sbdjr=cf.fillNull(rs.getString("sbdjr"));
		sbdjsj=cf.fillNull(rs.getDate("sbdjsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fj=cf.fillNull(rs.getString("fj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		jzdsmc=cf.fillNull(rs.getString("jzdsmc"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		xchfsj=cf.fillNull(rs.getDate("xchfsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditXzCrm_scbkhxx.jsp" name="insertform">
<div align="center">小组－维护（市场部客户编号：）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>客户姓名</td> 
  <td width="32%"><input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>状态</td> 
  <td width="32%"><%
	cf.radioToken(out, "zt","1+跟踪&5+准备移交&3+移交",zt,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>联系方式</td>
  <td colspan="3"><input type="text" name="lxfs" size="73" maxlength="50"  value="<%=lxfs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它电话</td>
  <td colspan="3"><input type="text" name="qtdh" size="73" maxlength="50"  value="<%=qtdh%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>所属城区</td>
  <td><select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%>
  </select></td>
  <td align="right">街道</td>
  <td><input type="text" name="jiedao" size="20" maxlength="50"  value="<%=jiedao%>" onChange="cf_fwdz(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>小区</td>
  <td>
	<input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onKeyUp="changheIn(insertform)"  onblur="cf_fwdz(insertform)">  
  </td>
  <td align="right"><span class="STYLE1">*</span>楼号</td>
  <td><input type="text" name="louhao" size="20" maxlength="50"  value="<%=louhao%>" onChange="cf_fwdz(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">&nbsp;</td>
  <td colspan="3">
  <select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
  </select>
    注意：<font color="#0000FF">房屋地址</font>（城区＋街道＋小区＋楼号）自动生成，不需录入 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000FF">房屋地址</font></td> 
  <td colspan="3"> 
    <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>小区类型</td>
  <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx",xqlx);
%>
  </select></td>
  <td align="right">户型</td>
  <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">建筑面积</td>
  <td><input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" ></td>
  <td align="right">房价（元/m）</td>
  <td><input type="text" name="fj" size="20" maxlength="8"  value="<%=fj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>客户资源性质</td>
  <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxz",khzyxz);
%>
  </select></td>
  <td align="right">预计装修时间</td>
  <td><input type="text" name="yjzxsj" size="20" maxlength="10"  value="<%=yjzxsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>是否需回访</td>
  <td><%
	cf.radioToken(out, "sfxhf","Y+需要&N+否",sfxhf);
%>  </td>
  <td align="right">下次回访时间</td>
  <td><input type="text" name="xchfsj" size="20" maxlength="10"  value="<%=xchfsj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">竞争对手名称</td>
  <td colspan="3"><input type="text" name="jzdsmc" size="73" maxlength="100"  value="<%=jzdsmc%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>业务员</td> 
  <td width="32%"> 
  <select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
      <%

	if (zwbm.equals("19"))//19：业务员
	{
		out.println("<option value=\""+ywy+"\">"+ywy+"</option>");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"' ";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+lrbm+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"' ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,ywy);
	}
%>
    </select>	
	
	
	</td>
  <td align="right" width="18%"><font color="#CC0000">*</font><span class="STYLE2">业务员所属小组</span></td> 
  <td width="32%"><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"'",ywyssxz);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="scbkhbh"  value="<%=scbkhbh%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>

//当在下拉框外单击时，下拉框消失
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}

//改变输入值
function changheIn(FormName)
{   

	if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//上箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
	}
	else if(event.keyCode==40)//下箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.xqbm.value;

		FormName.xqbm.value=FormName.valuelist.options[0].text;
	}
	else{//其它键
		if(FormName.xqbm.value=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

		//获取型号列表
		var actionStr="GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.xqbm.value;

//		window.open(actionStr);
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	//去除前面的换行符
	while (true)
	{
		if (ajaxRetStr.substring(0,1)=="\r")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else if (ajaxRetStr.substring(0,1)=="\n")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else{
			break;
		}
	}

	//生成下拉框
	insertform.valuelist.length=0;

	if (ajaxRetStr!="")
	{
		insertform.valuelist.style.display='block';
		strToItem3(insertform.valuelist,ajaxRetStr);
	}
	else{
		insertform.valuelist.style.display='none';
	}

}

//改变下拉框条目
function changeItem(FormName,field)
{
	if(event.keyCode==38)//上箭头
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext;

				FormName.xqbm.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//下箭头
	{
		if (mark=="first")
		{
			mark="";
		}

		FormName.xqbm.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.xqbm.value=oldtext
				FormName.xqbm.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
		FormName.xqbm.focus();
	}
}

//双击下拉框条目
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	FormName.xqbm.value=field.options[field.selectedIndex].text;
	FormName.xqbm.focus();
}

function cf_fwdz(FormName)
{  
	FormName.jiedao.value=strTrim(FormName.jiedao.value);
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.jiedao.value+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.scbkhbh)=="") {
		alert("请输入[市场部客户编号]！");
		FormName.scbkhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[电话]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.ywy)=="") {
		alert("请输入[业务员]！");
		FormName.ywy.focus();
		return false;
	}
	if(	javaTrim(FormName.zt)=="") {
		alert("请输入[状态]！");
		FormName.zt.focus();
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ywyssxz)=="") {
		alert("请选择[业务员所属小组]！");
		FormName.ywyssxz.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "建筑面积"))) {
		return false;
	}
	if(!(isNumber(FormName.fj, "房价"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxhf)) {
		alert("请选择[是否需回访]！");
		FormName.sfxhf[0].focus();
		return false;
	}
	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.xchfsj)=="") {
			alert("请输入[下次回访时间]！");
			FormName.xchfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfsj, "下次回访时间"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.xchfsj)!="") {
			alert("不需输入[下次回访时间]！");
			FormName.xchfsj.select();
			return false;
		}
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
