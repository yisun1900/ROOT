<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050210'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[允许重做电子报价]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%" height="371">
  <tr>
    <td width="100%"> 
      <div align="center">
        允许重做电子报价
        <BR><b><font color="#CC0000">注意：有过增减项不能重做报价</font></b>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxYxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">分公司</div>
              </td>
              <td width="32%"> 
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>
              </td>
              <td width="16%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F2")){
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh='"+dwbh+"' ","");
	}
	else {
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
              <td width="16%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="34%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">性别</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女","");
%> </td>
              <td width="16%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">身份证号码</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sfzhm" value="" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">风格分类</div>
              </td>
              <td width="34%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">装修价位</div>
              </td>
              <td width="32%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">面积</div>
              </td>
              <td width="34%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">油色</div>
              </td>
              <td width="32%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">合同号</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">签约日期 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">应开工日期 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kgrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="kgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">指派原因</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zpyy" size="20" value="">
              </td>
              <td width="16%"> 
                <div align="right">派单状态</div>
              </td>
              <td width="34%"> 
                <select name="pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">申请派单</option>
                  <option value="2">派单</option>
                  <option value="4">接受派单</option>
                  <option value="3">拒绝派单</option>
                  <option value="5">保持原派</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" bgcolor="#E8E8FF"> 
                <div align="right">派单时间 从</div>
              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="pdsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="pdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">回单标志</div>
              </td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="34%"> 
                <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="2">签约客户</option>
                  <option value="5">设计客户</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">关系客户</div>
              </td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">信息录入人</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到&nbsp;</div>
              </td>
              <td width="34%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">工程担当</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">施工队</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd order by cxbz,sgdmc","");
	}
	else 
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssdw='"+ssfgs+"' order by cxbz,sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">施工班组</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">在施工程标志</div>
              </td>
              <td width="34%"> 
                <select name="crm_khxx_zsbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未开工&2+在施工程&3+已完工","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">完工标志</td>
              <td width="32%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未完工&2+已完工","");
%> 
                </select>
              </td>
              <td width="16%" align="right">&nbsp;</td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right">结果排序</td>
              <td width="32%" bgcolor="#CCFFFF"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="crm_khxx.khbh desc">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">工程担当</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="crm_khxx.lrsj desc" selected>录入时间</option>
                </select>
              </td>
              <td align="right" width="16%">&nbsp;</td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq2, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "派单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj2, "派单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
