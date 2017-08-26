<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>
<%
String lrr=(String)session.getAttribute("yhmc");
String dqbm=(String)session.getAttribute("dqbm");
String fgsbh=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
%>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Yx_lsdcbList.jsp" name="selectform">
<div align="center">维护楼盘信息－录入人</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区编号</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqbh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">小区名称</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">城区</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by sq_dwxx.dqbm","");
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by sq_dwxx.dqbm","");
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地址</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_dz" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">推荐店面</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_tjdm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">价位</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_jw" size="20" maxlength="40" >  </td>
  <td align="right" width="18%">楼盘定位</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_yzxfsp","高档+高档&中高档+中高档&中档+中档&低档+低档","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">楼盘性质</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_xz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"商品房+商品房&经济适用房+经济适用房&集资房+集资房&回迁房+回迁房&商住两用房+商住两用房&别墅+别墅","");
%>
    </select>  </td>
  <td align="right" width="18%">物业形式</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wyxs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区规模</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqgm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">户型种类</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_hxzl" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">主力户型</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_zlhx" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">主力户型面积</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_zlhxmj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">业务员</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_ywy" size="20" maxlength="30" >  </td>
  <td align="right" width="18%">小区调研是否完成</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_dysfwc","N+未完成&Y+完成","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区负责人</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqfzr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">小区负责人电话</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xqfzrdh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">开盘时间</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_lxsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">销售方式</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xsfs" size="20" maxlength="4" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">交钥匙时间</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_fyssj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">交房户数</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_jfhs" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否有团购</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_sfytg","Y+有&N+无","");
%>  </td>
  <td align="right" width="18%">客户资料购买情况</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_khzlgmqk","公司购买+公司购买&员工购买+员工购买","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户名单</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_khmd","一手+一手&二手+二手&专业名单+专业名单","");
%>  </td>
  <td align="right" width="18%">与开发商关系</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_ykfsgx" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否进场宣传</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_sfjcxc","Y+是&N+否","");
%>  </td>
  <td align="right" width="18%">客户占有率</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_khzyl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">允许宣传方式</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_yxxcfs" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">开发商</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfs" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">开发商联系人</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfslxr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">开发商联系人职务</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfslxrzw" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">开发商联系人电话</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_kfslxrdh" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">建筑商</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_jzs" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售商</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_xss" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">售楼电话</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_sldh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">有无装修公司</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_ywzxgs","Y+有&N+无","");
%>  </td>
  <td align="right" width="18%">装修公司数量</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_zxgssl" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">已装修户数</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_yzxhs" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">是否统一装修期</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_sftizxq","是+是&否+否","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">预计装修时间</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_yjzxsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">有无物业公司</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "yx_lsdcb_ywwygs","Y+有&N+无","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">物业公司名称</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wygsmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">物业负责人</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wyfzr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">物业电话</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wydh" size="20" maxlength="40" >  </td>
  <td align="right" width="18%">物业联系人</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wylxr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">物业联系人职务</td> 
  <td width="32%"> 
    <input type="text" name="yx_lsdcb_wylxrzw" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">开发进度</td> 
  <td width="32%"> 
    <select name="yx_lsdcb_kfjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+未开发&2+已申请&3+已批准&4+未批准&5+已完成","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="yx_lsdcb_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="yx_lsdcb_lrsj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="yx_lsdcb_lrr" value="<%=lrr%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%">分公司 </td>
  <td width="32%"><select name="yx_lsdcb_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isNumber(FormName.yx_lsdcb_xqbh, "小区编号"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_zlhxmj, "主力户型面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_lxsj, "开盘时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_fyssj, "交钥匙时间"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_jfhs, "交房户数"))) {
		return false;
	}
	if(!(isFloat(FormName.yx_lsdcb_khzyl, "客户占有率"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_zxgssl, "装修公司数量"))) {
		return false;
	}
	if(!(isNumber(FormName.yx_lsdcb_yzxhs, "已装修户数"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_yjzxsj, "预计装修时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lsdcb_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
