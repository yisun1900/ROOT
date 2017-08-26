<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String fgsbh=cf.GB2Uni(request.getParameter("ssfgs"));
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+fgsbh+"'");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">录入－－楼盘信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>地区</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%> 
                </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font>公司</td>
              <td width="34%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ","");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>城区              </td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>              </td> 
              <td width="16%" align="right"  >              </td>
              <td width="34%">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>小区名称              </td>
              <td colspan="3"> 
                <input type="text" name="xqmc" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>地址              </td>
              <td colspan="3"> 
                <input type="text" name="dz" value="" size="70" maxlength="80" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
              <p align="right">周边环境及乘车路线              </td>
              <td colspan="3"> 
                <p align="left"> 
                  <textarea name="cclx" cols="69" rows="2"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>价位</td>
              <td width="31%"> 
                <input type="text" name="jw" value="" size="20" maxlength="9" >              </td>
              <td width="16%" align="right">楼盘定位</td>
              <td width="34%"> 
                <input type="radio" name="yzxfsp"  value="高档">
                高档 
                <input type="radio" name="yzxfsp"  value="中高档">
                中高档 
                <input type="radio" name="yzxfsp"  value="中档">
                中档 
                <input type="radio" name="yzxfsp"  value="低档">
              低档 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>楼盘性质</td>
              <td width="31%"> 
                <select name="xz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="商品房">商品房</option>
                  <option value="经济适用房">经济适用房</option>
                  <option value="集资房">集资房</option>
                  <option value="回迁房">回迁房</option>
                  <option value="商住两用房">商住两用房</option>
                  <option value="别墅">别墅</option>
                  <option value="其他">其他</option>
                </select>              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF">小区调研是否完成 </td>
              <td width="34%">
				<input type="radio" name="dysfwc"  value="Y">完成
				<input type="radio" name="dysfwc"  value="N">未完成			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>小区规模              </td>
              <td colspan="3"> 
                <input type="text" name="xqgm" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>户型种类              </td>
              <td colspan="3"> 
                <input type="text" name="hxzl" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">主力户型</td>
              <td width="31%"> 
                <input type="text" name="zlhx" value="" size="20" maxlength="20" >              </td>
              <td width="16%" align="right">主力户型面积</td>
              <td width="34%"> 
              <input type="text" name="zlhxmj" value="" size="20" maxlength="8" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">小区负责人</td>
              <td width="31%">&nbsp;</td>
              <td align="right" width="16%">小区负责人电话</td>
              <td width="34%"> 
              <input type="text" name="xqfzrdh" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>小区综合评价              </td>
              <td colspan="3"> 
                <textarea name="xqzhpj" cols="69" rows="3"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF">楼盘销售情况</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">开盘时间</td>
              <td><input type="text" name="lxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right"><font color="#CC0000">*</font>销售方式</td>
              <td><input type="radio" name="xsfs"  value="现房">
                现房
                <input type="radio" name="xsfs"  value="期房">
                期房 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>交钥匙时间</td>
              <td><input type="text" name="fyssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">交房户数</td>
              <td><input type="text" name="jfhs" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否有团购</td>
              <td>
			  		<input type="radio" name="sfytg"  value="Y">有团购
				  <input type="radio" name="sfytg"  value="N">无			</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><p align="right"><font color="#CC0000">*</font>销售状况              </td>
              <td colspan="3"><textarea name="xszk" cols="69" rows="5"></textarea>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF">客户资料获取情况</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">客户资料购买情况</td>
              <td><input type="radio" name="khzlgmqk" value="公司购买">
                公司购买
                <input type="radio" name="khzlgmqk" value="员工购买">
                员工购买</td>
              <td align="right">客户名单</td>
              <td><input type="radio" name="khmd" value="一手">
                一手
                <input type="radio" name="khmd" value="二手">
                二手
                <input type="radio" name="khmd" value="专业名单">
                专业名单</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">与开发商关系</td>
              <td colspan="3"><input name="ykfsgx" type="text" id="ykfsgx" value="" size="70" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF">公司广告宣传情况</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>是否进场宣传</td>
              <td><input type="radio" name="sfjcxc"  value="Y">
                是
                <input type="radio" name="sfjcxc"  value="N">
                否</td>
              <td align="right">公司已签订客户数</td>
              <td><input name="khzyl" type="text" id="khzyl" value="" size="10" maxlength="8" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">允许宣传方式</td>
              <td colspan="3"><input type="text" name="yxxcfs" value="" size="70" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">开发建议及进驻计划</td>
              <td colspan="3"><textarea name="kfjy" cols="69" rows="3" id="kfjy"></textarea></td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4" bgcolor="#CCCCFF">开发商/建筑商/销售商</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>开发商              </td>
              <td colspan="3"> 
                <input type="text" name="kfs" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">开发商联系人</td>
              <td width="31%"> 
                <input type="text" name="kfslxr" value="" size="20" maxlength="20" >              </td>
              <td align="right" width="16%">开发商联系人职务</td>
              <td width="34%"> 
              <input type="text" name="kfslxrzw" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">开发商联系人电话</td>
              <td colspan="3"> 
                <input type="text" name="kfslxrdh" value="" size="70" maxlength="50" >               </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                建筑商              </td>
              <td colspan="3"> 
                <input type="text" name="jzs" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#CC0000">*</font>销售商              </td>
              <td colspan="3"> 
                <input type="text" name="xss" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>售楼电话 </td>
              <td colspan="3"><input type="text" name="sldh" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="4" align="center">装修情况</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>有无装修公司</td>
              <td width="31%"> 
                <input type="radio" name="ywzxgs"  value="Y">
                有 
                <input type="radio" name="ywzxgs"  value="N">
                无 </td>
              <td width="16%" align="right">&nbsp;</td>
              <td width="34%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">装修公司数量</td>
              <td><input type="text" name="zxgssl" value="" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF">已装修户数</td>
              <td><input type="text" name="yzxhs" value="" size="20" maxlength="10" ></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>是否统一装修期</td>
              <td><input type="radio" name="sftizxq"  value="是">
                是
                <input type="radio" name="sftizxq"  value="否">
                否</td>
              <td align="right">预计装修时间</td>
              <td><input type="text" name="yjzxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4">物业</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#CC0000">*</font>有无物业公司</td>
              <td width="31%"> 
                <input type="radio" name="ywwygs"  value="Y">
                有 
                <input type="radio" name="ywwygs"  value="N">
                无 </td>
              <td width="16%" align="right">&nbsp;</td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                物业公司名称              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="wygsmc" value="" size="70" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                物业负责人              </td>
              <td width="31%"> 
                <input type="text" name="wyfzr" value="" size="20" maxlength="20" >              </td>
              <td width="16%" align="right"> 
                物业电话              </td>
              <td width="34%"> 
              <input type="text" name="wydh" value="" size="20" maxlength="40" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">物业联系人</td>
              <td width="31%"> 
                <input type="text" name="wylxr" value="" size="20" maxlength="20" >              </td>
              <td align="right" width="16%">物业联系人职务</td>
              <td width="34%"> 
              <input type="text" name="wylxrzw" value="" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#CC0000">*</font><font color="#0000FF">录入人</font> </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>              </td>
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font><font color="#0000FF">录入时间              </font></td>
              <td width="34%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            

            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input name="tg" type="button" onClick="f_tg(insertform)"  value="团购情况">
                <input name="ds" type="button" onClick="f_ds(insertform)"  value="竞争对手信息">
                <input name="gg" type="button" onClick="f_gg(insertform)"  value="广告宣传情况">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
        </table>
          <input type="text" name="xqfzr" value="" size="20" maxlength="20" >
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请选择[城区]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请选择[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jw)=="") {
		alert("请输入[价位]！");
		FormName.jw.focus();
		return false;
	}
	if(	javaTrim(FormName.dz)=="") {
		alert("请输入[地址]！");
		FormName.dz.focus();
		return false;
	}

	if(	!radioChecked(FormName.xsfs)) {
		alert("请选择[销售方式]！");
		FormName.xsfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xszk)=="") {
		alert("请输入[销售状况]！");
		FormName.xszk.focus();
		return false;
	}
	if(	javaTrim(FormName.xqgm)=="") {
		alert("请输入[小区规模]！");
		FormName.xqgm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxzl)=="") {
		alert("请输入[户型种类]！");
		FormName.hxzl.focus();
		return false;
	}
	if(	javaTrim(FormName.xqzhpj)=="") {
		alert("请输入[小区综合评价]！");
		FormName.xqzhpj.focus();
		return false;
	}
	if(	javaTrim(FormName.kfs)=="") {
		alert("请输入[开发商]！");
		FormName.kfs.focus();
		return false;
	}
	if(	javaTrim(FormName.xss)=="") {
		alert("请输入[销售商]！");
		FormName.xss.focus();
		return false;
	}
	if(	javaTrim(FormName.sldh)=="") {
		alert("请输入[售楼电话]！");
		FormName.sldh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ywzxgs)) {
		alert("请选择[有无装修公司]！");
		FormName.ywzxgs[0].focus();
		return false;
	}
	
	if(!(isNumber(FormName.zxgssl, "装修公司数量"))) {
		return false;
	}
	if(	!radioChecked(FormName.ywwygs)) {
		alert("请选择[有无物业公司]！");
		FormName.ywwygs[0].focus();
		return false;
	}
	if(!(isNumber(FormName.yzxhs, "已装修户数"))) {
		return false;
	}

	if(	javaTrim(FormName.fyssj)=="") {
		alert("请输入[交钥匙时间]！");
		FormName.fyssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fyssj, "交钥匙时间"))) {
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

	/*if(!(isNumber(FormName.zlhxmj, "主力户型面积"))) {
		return false;
	}*/
	if(!(isDatetime(FormName.lxsj, "开盘时间"))) {
		return false;
	}
	if(!(isNumber(FormName.jfhs, "交房户数"))) {
		return false;
	}

	if(	!radioChecked(FormName.sftizxq)) {
		alert("请选择[是否统一装修期]！");
		FormName.sftizxq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjcxc)) {
		alert("请选择[是否进场宣传]！");
		FormName.sfjcxc[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "预计装修时间"))) {
		return false;
	}

	FormName.action="SaveInsertYx_lsdcb.jsp";
	FormName.submit();
	return true;
}
function f_tg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请选择[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}

	FormName.action="InsertYx_lptgqk.jsp";
	FormName.submit();
	return true;
}
function f_ds(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请选择[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}

	FormName.action="InsertYx_lpjzdsqk.jsp";
	FormName.submit();
	return true;
}
function f_gg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请选择[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}

	FormName.action="InsertYx_lpggxcqk.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
