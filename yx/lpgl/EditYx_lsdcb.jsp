<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xqmc=null;
String cqbm=null;
String dz=null;
String cclx=null;
String tjdm=null;
String jw=null;
String yzxfsp=null;
String xz=null;
String wyxs=null;
String xqgm=null;
String hxzl=null;
String zlhx=null;
String zlhxmj=null;
String ywy=null;
String dysfwc=null;
String xqfzr=null;
String xqfzrdh=null;
String xqzhpj=null;
String lxsj=null;
String xsfs=null;
String fyssj=null;
String jfhs=null;
String sfytg=null;
String xszk=null;
String khzlgmqk=null;
String khmd=null;
String ykfsgx=null;
String sfjcxc=null;
String khzyl=null;
String yxxcfs=null;
String kfjy=null;
String kfs=null;
String kfslxr=null;
String kfslxrzw=null;
String kfslxrdh=null;
String jzs=null;
String xss=null;
String sldh=null;
String ywzxgs=null;
String zxgssl=null;
String yzxhs=null;
String sftizxq=null;
String yjzxsj=null;
String ywwygs=null;
String wygsmc=null;
String wyfzr=null;
String wydh=null;
String wylxr=null;
String wylxrzw=null;
String lrr=null;
String lrsj=null;
String fgsbh=null;
String xqbh=cf.GB2Uni(request.getParameter("xqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,xqmc,cqbm,dz,cclx,tjdm,jw,yzxfsp,xz,wyxs,xqgm,hxzl,zlhx,zlhxmj,ywy,dysfwc,xqfzr,xqfzrdh,xqzhpj,lxsj,xsfs,fyssj,jfhs,sfytg,xszk,khzlgmqk,khmd,ykfsgx,sfjcxc,khzyl,yxxcfs,kfjy,kfs,kfslxr,kfslxrzw,kfslxrdh,jzs,xss,sldh,ywzxgs,zxgssl,yzxhs,sftizxq,yjzxsj,ywwygs,wygsmc,wyfzr,wydh,wylxr,wylxrzw,lrr,lrsj ";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where  (xqbh="+xqbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xqmc=cf.fillNull(rs.getString("xqmc"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		dz=cf.fillNull(rs.getString("dz"));
		cclx=cf.fillNull(rs.getString("cclx"));
		tjdm=cf.fillNull(rs.getString("tjdm"));
		jw=cf.fillNull(rs.getString("jw"));
		yzxfsp=cf.fillNull(rs.getString("yzxfsp"));
		xz=cf.fillNull(rs.getString("xz"));
		wyxs=cf.fillNull(rs.getString("wyxs"));
		xqgm=cf.fillNull(rs.getString("xqgm"));
		hxzl=cf.fillNull(rs.getString("hxzl"));
		zlhx=cf.fillNull(rs.getString("zlhx"));
		zlhxmj=cf.fillNull(rs.getString("zlhxmj"));
		ywy=cf.fillNull(rs.getString("ywy"));
		dysfwc=cf.fillNull(rs.getString("dysfwc"));
		xqfzr=cf.fillNull(rs.getString("xqfzr"));
		xqfzrdh=cf.fillNull(rs.getString("xqfzrdh"));
		xqzhpj=cf.fillNull(rs.getString("xqzhpj"));
		lxsj=cf.fillNull(rs.getDate("lxsj"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		fyssj=cf.fillNull(rs.getDate("fyssj"));
		jfhs=cf.fillNull(rs.getString("jfhs"));
		sfytg=cf.fillNull(rs.getString("sfytg"));
		xszk=cf.fillNull(rs.getString("xszk"));
		khzlgmqk=cf.fillNull(rs.getString("khzlgmqk"));
		khmd=cf.fillNull(rs.getString("khmd"));
		ykfsgx=cf.fillNull(rs.getString("ykfsgx"));
		sfjcxc=cf.fillNull(rs.getString("sfjcxc"));
		khzyl=cf.fillNull(rs.getString("khzyl"));
		yxxcfs=cf.fillNull(rs.getString("yxxcfs"));
		kfjy=cf.fillNull(rs.getString("kfjy"));
		kfs=cf.fillNull(rs.getString("kfs"));
		kfslxr=cf.fillNull(rs.getString("kfslxr"));
		kfslxrzw=cf.fillNull(rs.getString("kfslxrzw"));
		kfslxrdh=cf.fillNull(rs.getString("kfslxrdh"));
		jzs=cf.fillNull(rs.getString("jzs"));
		xss=cf.fillNull(rs.getString("xss"));
		sldh=cf.fillNull(rs.getString("sldh"));
		ywzxgs=cf.fillNull(rs.getString("ywzxgs"));
		zxgssl=cf.fillNull(rs.getString("zxgssl"));
		yzxhs=cf.fillNull(rs.getString("yzxhs"));
		sftizxq=cf.fillNull(rs.getString("sftizxq"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		ywwygs=cf.fillNull(rs.getString("ywwygs"));
		wygsmc=cf.fillNull(rs.getString("wygsmc"));
		wyfzr=cf.fillNull(rs.getString("wyfzr"));
		wydh=cf.fillNull(rs.getString("wydh"));
		wylxr=cf.fillNull(rs.getString("wylxr"));
		wylxrzw=cf.fillNull(rs.getString("wylxrzw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">城区</td>
  <td><select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm);
%>
  </select></td>
  <td align="right"></td>
  <td><%--<select name="tjdm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	//cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+fgsbh+"' order by dwbh ",tjdm);
%>
  </select>--%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区名称</td> 
  <td colspan="3"> 
    <input type="text" name="xqmc" size="70" maxlength="50"  value="<%=xqmc%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地址</td> 
  <td colspan="3"> 
    <input type="text" name="dz" size="70" maxlength="100"  value="<%=dz%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">周边环境及乘车路线</td>
  <td colspan="3"><textarea name="cclx" cols="69" rows="2"><%=cclx%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">价位</td> 
  <td width="32%"><input type="text" name="jw" size="20" maxlength="40"  value="<%=jw%>" ></td>
  <td align="right" width="18%">楼盘定位</td> 
  <td width="32%"><%
	cf.radioToken(out, "yzxfsp","高档+高档&中高档+中高档&中档+中档&低档+低档",yzxfsp);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">楼盘性质</td> 
  <td width="32%"><select name="xz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"商品房+商品房&经济适用房+经济适用房&集资房+集资房&回迁房+回迁房&商住两用房+商住两用房&别墅+别墅",xz);
%>
  </select></td>
  <td align="right" width="18%">小区调研是否完成</td> 
  <td width="32%"><%
	cf.radioToken(out, "dysfwc","N+未完成&Y+完成",dysfwc);
%></td>
  <%--<td align="right" width="18%">物业形式</td> 
  <td width="32%"><input type="text" name="wyxs" size="20" maxlength="20"  value="<%=wyxs%>" ></td>--%>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区规模</td> 
  <td colspan="3"><input type="text" name="xqgm" size="70" maxlength="50"  value="<%=xqgm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">户型种类</td> 
  <td colspan="3"> 
    <input type="text" name="hxzl" size="70" maxlength="50"  value="<%=hxzl%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">主力户型</td>
  <td><input type="text" name="zlhx" size="20" maxlength="20"  value="<%=zlhx%>" ></td>
  <td align="right">主力户型面积</td>
  <td><input type="text" name="zlhxmj" size="20" maxlength="8"  value="<%=zlhxmj%>" ></td>
</tr>
<%--<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">业务员</td> 
  <td width="32%"><input type="text" name="ywy" size="20" maxlength="30"  value="<%=ywy%>" ></td>
  <td align="right" width="18%">小区调研是否完成</td> 
  <td width="32%"><%
	cf.radioToken(out, "dysfwc","N+未完成&Y+完成",dysfwc);
%></td>
</tr>--%>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区负责人</td> 
  <td width="32%"><input type="text" name="xqfzr" size="20" maxlength="20"  value="<%=xqfzr%>" ></td>
  <td align="right" width="18%">小区负责人电话</td> 
  <td width="32%"><input type="text" name="xqfzrdh" size="20" maxlength="20"  value="<%=xqfzrdh%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区综合评价</td> 
  <td colspan="3"> 
    <textarea name="xqzhpj" cols="69" rows="3"><%=xqzhpj%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#CCCCFF">楼盘销售情况</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">开盘时间</td> 
  <td width="32%"> 
    <input type="text" name="lxsj" size="20" maxlength="10"  value="<%=lxsj%>" >  </td>
  <td align="right" width="18%">销售方式</td> 
  <td width="32%"> 
    <input type="text" name="xsfs" size="20" maxlength="4"  value="<%=xsfs%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">交钥匙时间</td> 
  <td width="32%"> 
    <input type="text" name="fyssj" size="20" maxlength="10"  value="<%=fyssj%>" >  </td>
  <td align="right" width="18%">交房户数</td> 
  <td width="32%"> 
    <input type="text" name="jfhs" size="20" maxlength="8"  value="<%=jfhs%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有团购</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfytg","Y+有&N+无",sfytg);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">销售状况</td>
  <td colspan="3"><textarea name="xszk" cols="69" rows="2"><%=xszk%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#CCCCFF">客户资料获取情况</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户资料购买情况</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "khzlgmqk","公司购买+公司购买&员工购买+员工购买",khzlgmqk);
%>  </td>
  <td align="right" width="18%">客户名单</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "khmd","一手+一手&二手+二手&专业名单+专业名单",khmd);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">与开发商关系</td> 
  <td width="32%"> 
    <input type="text" name="ykfsgx" size="20" maxlength="50"  value="<%=ykfsgx%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#CCCCFF">公司广告宣传情况</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否进场宣传</td>
  <td><%
	cf.radioToken(out, "sfjcxc","Y+是&N+否",sfjcxc);
%></td>
  <td align="right">公司已签订客户数</td>
  <td><input type="text" name="khzyl" size="20" maxlength="9"  value="<%=khzyl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">允许宣传方式</td> 
  <td colspan="3"><input type="text" name="yxxcfs" size="70" maxlength="100"  value="<%=yxxcfs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">开发建议及进驻计划</td> 
  <td colspan="3"> 
    <textarea name="kfjy" cols="69" rows="3"><%=kfjy%></textarea>  </td>
  </tr>
<tr bgcolor="#CCCCFF" align="center">
  <td colspan="4" bgcolor="#CCCCFF">开发商/建筑商/销售商</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">开发商</td>
  <td colspan="3"><input type="text" name="kfs" size="70" maxlength="50"  value="<%=kfs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">开发商联系人</td> 
  <td width="32%"> 
    <input type="text" name="kfslxr" size="20" maxlength="20"  value="<%=kfslxr%>" >  </td>
  <td align="right" width="18%">开发商联系人职务</td> 
  <td width="32%"> 
    <input type="text" name="kfslxrzw" size="20" maxlength="20"  value="<%=kfslxrzw%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">开发商联系人电话</td> 
  <td colspan="3"> 
    <input type="text" name="kfslxrdh" size="70" maxlength="50"  value="<%=kfslxrdh%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">建筑商</td>
  <td colspan="3"><input type="text" name="jzs" size="70" maxlength="50"  value="<%=jzs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售商</td> 
  <td colspan="3"> 
    <input type="text" name="xss" size="70" maxlength="50"  value="<%=xss%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">售楼电话</td>
  <td colspan="3"><input type="text" name="sldh" size="70" maxlength="50"  value="<%=sldh%>" ></td>
  </tr>
<tr bgcolor="#CCCCFF">
  <td colspan="4" align="center">装修情况</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">有无装修公司</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "ywzxgs","Y+有&N+无",ywzxgs);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">装修公司数量</td> 
  <td width="32%"><input type="text" name="zxgssl" size="20" maxlength="8"  value="<%=zxgssl%>" ></td>
  <td align="right" width="18%">已装修户数</td> 
  <td width="32%"><input type="text" name="yzxhs" size="20" maxlength="8"  value="<%=yzxhs%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否统一装修期</td> 
  <td width="32%"><%
	cf.radioToken(out, "sftizxq","是+是&否+否",sftizxq);
%></td>
  <td align="right" width="18%">预计装修时间</td> 
  <td width="32%"><input type="text" name="yjzxsj" size="20" maxlength="10"  value="<%=yjzxsj%>" ></td>
</tr>
<tr bgcolor="#CCCCFF" align="center">
  <td colspan="4">物业</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">有无物业公司</td>
  <td><%
	cf.radioToken(out, "ywwygs","Y+有&N+无",ywwygs);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">物业公司名称</td>
  <td colspan="3"><input type="text" name="wygsmc" size="70" maxlength="50"  value="<%=wygsmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">物业负责人</td> 
  <td width="32%"><input type="text" name="wyfzr" size="20" maxlength="20"  value="<%=wyfzr%>" ></td>
  <td align="right" width="18%">物业电话</td> 
  <td width="32%"><input type="text" name="wydh" size="20" maxlength="40"  value="<%=wydh%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">物业联系人</td> 
  <td width="32%"><input type="text" name="wylxr" size="20" maxlength="20"  value="<%=wylxr%>" ></td>
  <td align="right" width="18%">物业联系人职务</td> 
  <td width="32%"><input type="text" name="wylxrzw" size="20" maxlength="20"  value="<%=wylxrzw%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" ></td>
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" ></td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="xqbh"  value="<%=xqbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input name="tg" type="button" onClick="f_tg(editform)"  value="团购情况">
      <input name="ds" type="button" onClick="f_ds(editform)"  value="竞争对手信息">
      <input name="gg" type="button" onClick="f_gg(editform)"  value="广告宣传情况">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xqbh)=="") {
		alert("请输入[小区编号]！");
		FormName.xqbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请选择[城区]！");
		FormName.cqbm.focus();
		return false;
	}
	/*if(!(isNumber(FormName.zlhxmj, "主力户型面积"))) {
		return false;
	}*/
	if(!(isDatetime(FormName.lxsj, "开盘时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fyssj, "交钥匙时间"))) {
		return false;
	}
	if(!(isNumber(FormName.jfhs, "交房户数"))) {
		return false;
	}
	if(!(isFloat(FormName.khzyl, "客户占有率"))) {
		return false;
	}
	if(	javaTrim(FormName.kfs)=="") {
		alert("请输入[开发商]！");
		FormName.kfs.focus();
		return false;
	}
	if(!(isNumber(FormName.zxgssl, "装修公司数量"))) {
		return false;
	}
	if(!(isNumber(FormName.yzxhs, "已装修户数"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
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

	FormName.action="SaveEditYx_lsdcb.jsp";
	FormName.submit();
	return true;
}

function f_tg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xqbh)=="") {
		alert("请输入[小区编号]！");
		FormName.xqbh.focus();
		return false;
	}

	FormName.action="InsertYx_lptgqk.jsp";
	FormName.submit();
	return true;
}
function f_ds(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xqbh)=="") {
		alert("请输入[小区编号]！");
		FormName.xqbh.focus();
		return false;
	}

	FormName.action="InsertYx_lpjzdsqk.jsp";
	FormName.submit();
	return true;
}
function f_gg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xqbh)=="") {
		alert("请输入[小区编号]！");
		FormName.xqbh.focus();
		return false;
	}

	FormName.action="InsertYx_lpggxcqk.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
