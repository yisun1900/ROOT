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

<form method="post" action="SaveInsertYx_lsdcb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>地区</td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%> 
                </select>
              </td>
              <td width="19%" align="right"><font color="#CC0000">*</font>公司</td>
              <td width="31%"> 
                <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>城区</div>
              </td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>
              </td>
              <td width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>小区名称</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="xqmc" value="" size="74" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>地址</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="dz" value="" size="74" maxlength="80" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>开发商</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="kfs" value="" size="74" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">开发商联系人</td>
              <td width="32%"> 
                <input type="text" name="kfslxr" value="" size="20" maxlength="20" >
              </td>
              <td align="right" width="19%">开发商联系人职务</td>
              <td width="31%"> 
                <input type="text" name="kfslxrzw" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">开发商联系人电话</td>
              <td width="32%"> 
                <input type="text" name="kfslxrdh" value="" size="20" maxlength="20" >
              </td>
              <td align="right" width="19%">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">物业公司名称</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="wygsmc" value="" size="74" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">物业联系人</td>
              <td width="32%"> 
                <input type="text" name="wylxr" value="" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">物业联系人职务</div>
              </td>
              <td width="31%"> 
                <input type="text" name="wylxrzw" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">物业电话</td>
              <td width="32%"> 
                <input type="text" name="wydh" value="" size="20" maxlength="40" >
              </td>
              <td align="right" width="19%">立项时间</td>
              <td width="31%"> 
                <input type="text" name="lxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">交钥匙时间</td>
              <td width="32%"> 
                <input type="text" name="fyssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">交房户数</td>
              <td width="31%"> 
                <input type="text" name="jfhs" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">主力户型</td>
              <td width="32%"> 
                <input type="text" name="zlhx" value="" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">主力户型面积</td>
              <td width="31%"> 
                <input type="text" name="zlhxmj" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">物业形式</td>
              <td width="32%"> 
                <input type="text" name="wyxs" value="" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">价位</td>
              <td width="31%"> 
                <input type="text" name="jw" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">小区负责人</td>
              <td width="32%"> 
                <input type="text" name="xqfzr" value="" size="20" maxlength="20" >
              </td>
              <td align="right" width="19%">小区负责人电话</td>
              <td width="31%"> 
                <input type="text" name="xqfzrdh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">楼盘性质</td>
              <td width="32%"> 
                <input type="text" name="xz" value="" size="20" maxlength="30" >
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>录入人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#CC0000">*</font>录入时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("请输入[城区编码]！");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dz)=="") {
		alert("请输入[地址]！");
		FormName.dz.focus();
		return false;
	}
	if(!(isNumber(FormName.zlhxmj, "主力户型面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.lxsj, "立项时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fyssj, "交钥匙时间"))) {
		return false;
	}
	if(!(isNumber(FormName.jfhs, "交房户数"))) {
		return false;
	}
	if(	javaTrim(FormName.kfs)=="") {
		alert("请输入[开发商]！");
		FormName.kfs.focus();
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[公司编码]！");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
