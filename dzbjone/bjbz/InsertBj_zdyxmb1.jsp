<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");

String yhdlm=(String)session.getAttribute("yhdlm");
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String bjjbbm=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
String ssfgs=cf.executeQuery("select ssfgs from crm_zxkhxx where khbh='"+khbh+"'");
String zdyxmyxq=cf.executeQuery("select TO_CHAR(ADD_MONTHS(SYSDATE,zdyxmyxq),'YYYY-MM-DD') from sq_dwxx where dwbh='"+ssfgs+"'");

%>

<body bgcolor="#FFFFFF">

<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">状态</td>
	<td  width="6%">录入时间</td>
	<td  width="5%">报价级别</td>
	<td  width="8%">项目编号</td>
	<td  width="17%">项目名称</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">客户报价</td>
	<td  width="45%">审核意见</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT DECODE(bj_zdyxmb.shbz,'N','申请审核','S','受理申请','Y',' 审核通过','W','未通过','C','重新申请') shbz,bj_zdyxmb.lrsj,bjjbmc,bj_zdyxmb.xmbh,bj_zdyxmb.xmmc,jdm_jldwbm.jldwmc,bj_zdyxmb.bj,bj_zdyshjl.shyj";
	ls_sql+=" FROM bj_zdyxmb,jdm_jldwbm,bdm_bjjbbm,bj_zdyshjl   ";
	ls_sql+=" where bj_zdyxmb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_zdyxmb.sqjl=bj_zdyshjl.sqjl(+)";
	ls_sql+=" and bj_zdyxmb.lrr='"+yhdlm+"' and bj_zdyxmb.shbz='W'";//N; 申请审核；S:受理申请；Y:审核通过；W:审核未通过；C:重新申请
	ls_sql+=" order by bj_zdyxmb.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","CEditBj_zdyxmb.jsp?lrr="+yhdlm);
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.setEditStr("重申请");//设置每页显示记录数

//设置主键
	String[] keyName={"xmbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[7]="align='left'";

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/gcjdgz/fxys/ViewCrm_gcfxysjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 录入自定义项目&nbsp;<font color="#0000FF">（项目编号自动生成）</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button"  value="从标准项目导入" onClick=window.open("SelectDrBj_jzbjb1.jsp?dqbm=<%=dqbm%>&khbh=<%=khbh%>&bjjbbm=<%=bjjbbm%>","_self","toolbar=no,menubar=no")>
	  </div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">地区</font></td>
              <td width="34%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
              </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font>报价级别</td>
              <td width="34%">
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>项目大类              </td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
              </select>              </td>
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>项目小类              </td>
              <td width="34%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" >项目分类</td>
              <td colspan="3"  ><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm","");
%>
              </select></td>
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
              <td width="16%" align="right" ><font color="#CC0000">*</font><font color="#0000CC">自定义项目有效期</font></td>
              <td width="34%" ><input type="text" name="zdyxmyxq" value="<%=zdyxmyxq%>" size="20" maxlength="10" readonly></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>客户报价</td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="" size="20" maxlength="17" ></td>
              <td bgcolor="#CCCCFF" align="right">&nbsp;</td>
              <td bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" >工艺材料简介</td>
              <td colspan="3"  > 
                <textarea name="gycl" cols="71" rows="3"></textarea>              </td>
            </tr>
           <tr align="center"> 
             <td colspan="4">
				<input type="hidden" name="sfxycl" value="N" >
				<input type="hidden" name="sfxyyjd" value="N" >
				<input type="hidden" name="clbj" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="zcf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="rgbj" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="ysf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="jxbj" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="shf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="qtf" value="0" size="20" maxlength="17" onChange="f_jsjg(insertform)">
                 <input type="hidden" name="flmcgg" value="" >
                 <input type="hidden" name="bz" value="" >
               <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="允许存盘" onClick="bc.disabled=false;">
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="hidden" name="clcb" value="0" >
                <input type="hidden" name="rgcb" value="0" >
                <input type="hidden" name="jxcb" value="0" >
                <input type="hidden" name="cbenj" value="0" >
                <input type="hidden" name="sgdbj" value="0" >
                <input name="sgcbj" type="hidden"  value="0" >
                <input type="hidden" name="lrr" value="<%=yhdlm%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" ></td>
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
//	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
//	bj=round(bj,2);
//	FormName.bj.value=bj;
}

function f_do(FormName)//参数FormName:Form的名称
{
//	f_jsjg(FormName);

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
	
	if(	javaTrim(FormName.clcb)=="") {
		alert("请输入[材料成本]！");
		FormName.clcb.focus();
		return false;
	}
	if(!(isFloat(FormName.clcb, "材料成本"))) {
		return false;
	}
	if(	javaTrim(FormName.rgcb)=="") {
		alert("请输入[人工成本]！");
		FormName.rgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgcb, "人工成本"))) {
		return false;
	}
	if(	javaTrim(FormName.jxcb)=="") {
		alert("请输入[机械成本]！");
		FormName.jxcb.focus();
		return false;
	}
	if(!(isFloat(FormName.jxcb, "机械成本"))) {
		return false;
	}
	if(	javaTrim(FormName.cbenj)=="") {
		alert("请输入[成本价]！");
		FormName.cbenj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbenj, "成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("请输入[施工成本价]！");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "施工成本价"))) {
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
		alert("请输入[客户报价]！");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "客户报价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdbj)=="") {
		alert("请输入[工程基础报价]！");
		FormName.sgdbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "工程基础报价"))) {
		return false;
	}

	
	if(	javaTrim(FormName.zdyxmyxq)=="") {
		alert("请输入[自定义项目有效期]！");
		FormName.zdyxmyxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zdyxmyxq, "自定义项目有效期"))) {
		return false;
	}
/*
	if(	!radioChecked(FormName.sfxycl)) {
		alert("请选择[是否需要材料]！");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("请选择[是否需要预交底]！");
		FormName.sfxyyjd[0].focus();
		return false;
	}
*/	
	FormName.action="SaveInsertBj_zdyxmb1.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

//-->
</SCRIPT>
