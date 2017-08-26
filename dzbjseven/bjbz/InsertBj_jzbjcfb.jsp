<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");

String yhmc=(String)session.getAttribute("yhmc");


String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String xmdlbm=cf.executeQuery("select xmdlbm from bj_jzbjb where bjjbbm='"+bjjbbm+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'");
String xmxlbm=cf.executeQuery("select xmxlbm from bj_jzbjb where bjjbbm='"+bjjbbm+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'");

%>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">项目编号</td>
	<td  width="16%">项目名称</td>
	<td  width="5%">单位</td>
	<td  width="5%">辅材费</td>
	<td  width="5%">主材费</td>
	<td  width="5%">人工费</td>
	<td  width="5%">运输费</td>
	<td  width="5%">机械费</td>
	<td  width="5%">损耗费</td>
	<td  width="5%">其它费</td>
	<td  width="7%">工程预算价</td>
	<td  width="29%">工艺材料简介</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT bj_jzbjcfb.xmbh,bj_jzbjcfb.xmmc,jdm_jldwbm.jldwmc,bj_jzbjcfb.clbj,bj_jzbjcfb.zcf,bj_jzbjcfb.rgbj,bj_jzbjcfb.ysf,bj_jzbjcfb.jxbj,bj_jzbjcfb.shf,bj_jzbjcfb.qtf,bj_jzbjcfb.bj,gycl";
	ls_sql+=" FROM bj_jzbjcfb,jdm_jldwbm   ";
	ls_sql+=" where bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_jzbjcfb.fxmbh='"+xmbh+"' "; 
	ls_sql+=" and bj_jzbjcfb.bjbbh='"+bjbbh+"' "; 
	ls_sql+=" and bj_jzbjcfb.bjjbbm='"+bjjbbm+"' "; 
	ls_sql+=" and bj_jzbjcfb.dqbm='"+dqbm+"' "; 
	ls_sql+=" order by bj_jzbjcfb.xmbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","EditBj_jzbjcfb.jsp?bjbbh="+bjbbh+"&dqbm="+dqbm+"&bjjbbm="+bjjbbm+"&fxmbh="+xmbh,"DeleteBj_jzbjcfb.jsp?bjbbh="+bjbbh+"&dqbm="+dqbm+"&bjjbbm="+bjjbbm+"&fxmbh="+xmbh);
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("删除");
	pageObj.setViewStr("修改");

//	pageObj.alignStr[7]="align='left'";
//	pageObj.alignStr[8]="align='left'";

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">拆分报价－录入 </div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">报价版本号</font></td>
              <td colspan="3"><input type="text" name="bjbbh" value="<%=bjbbh%>" size="73" maxlength="50" readonly>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">地区</font></td>
              <td width="34%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
              </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font><font color="#0000CC">报价级别</font></td>
              <td width="34%">
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">父项目编号</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="fxmbh" size="20" maxlength="16"  value="<%=xmbh%>" readonly></td>
              <td align="right"><font color="#CC0000">*</font>项目编号</td>
              <td><input type="text" name="xmbh" size="20" maxlength="16"  value="" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>项目大类              </td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
              </select>              </td>
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>项目小类              </td>
              <td width="34%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>项目名称</td>
              <td colspan="3"  > 
                <input type="text" name="xmmc" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>计量单位</td>
              <td width="34%" ><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%>
              </select></td>
              <td width="16%" align="right" >饰面</td>
              <td width="34%" ><select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%>
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>对外报价</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>辅材费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>主材费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="zcf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>人工费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>运输费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="ysf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>机械费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="jxbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>损耗费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="shf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>其它费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="qtf" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font><font color="#0000CC">工程预算价</font></td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="不需录入自动生成" size="20" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF">&nbsp;</td>
              <td colspan="3" bgcolor="#CCCCFF"><font color="#0000CC"><strong>注意：工程预算价<font color="#FF0000">(<font color="#0000CC"><strong>自动生成</strong></font>)</font>＝辅材费+主材费＋人工费＋运输费＋机械费＋损耗费＋其它费</strong></font></td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" >工艺材料简介</td>
              <td colspan="3"  > 
                <textarea name="gycl" cols="71" rows="3"></textarea>              </td>
            </tr>
             <tr bgcolor="#FFFFFF">
              <td align="right">辅料名称规格</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
           <tr align="center"> 
             <td colspan="4"> 
                <input type="hidden" name="lrr" value="<%=yhmc%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" >
              <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc"></td>
            </tr>
        </table>
</form>    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
 
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}


	if(	javaTrim(FormName.fxmbh)=="") {
		alert("请输入[父项目编号]！");
		FormName.fxmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	

	if(	javaTrim(FormName.clbj)=="") {
		alert("请输入[辅材费]！");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "辅材费"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("请输入[人工费]！");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.jxbj)=="") {
		alert("请输入[机械费]！");
		FormName.jxbj.focus();
		return false;
	}
	if(!(isFloat(FormName.jxbj, "机械费"))) {
		return false;
	}
	if(	javaTrim(FormName.zcf)=="") {
		alert("请输入[主材费]！");
		FormName.zcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcf, "主材费"))) {
		return false;
	}
	if(	javaTrim(FormName.shf)=="") {
		alert("请输入[损耗费]！");
		FormName.shf.focus();
		return false;
	}
	if(!(isFloat(FormName.shf, "损耗费"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("请输入[运输费]！");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "运输费"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("请输入[其它费]！");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "其它费"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("请输入[工程预算价]！");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "工程预算价"))) {
		return false;
	}


	FormName.action="SaveInsertBj_jzbjcfb.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
