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
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String zdyxmyxq=cf.executeQuery("select TO_CHAR(ADD_MONTHS(SYSDATE,zdyxmyxq),'YYYY-MM-DD') from sq_dwxx where dwbh='"+ssfgs+"'");


%>

<body bgcolor="#FFFFFF">

<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">审核标志</td>
	<td  width="5%">录入时间</td>
	<td  width="4%">报价级别</td>
	<td  width="7%">项目编号</td>
	<td  width="13%">项目名称</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">工程预算价</td>
	<td  width="28%">审核意见</td>
	<td  width="27%">工艺材料简介</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT DECODE(bj_zdyxmb.shbz,'N','申请审核','S','受理申请','Y',' 审核通过','W','未通过','C','重新申请') shbz,bj_zdyxmb.lrsj,bjjbmc,bj_zdyxmb.xmbh,bj_zdyxmb.xmmc,jdm_jldwbm.jldwmc,bj_zdyxmb.bj,bj_zdyshjl.shyj,gycl";
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
	pageObj.alignStr[8]="align='left'";

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
	    <input type="button"  value="从标准项目导入" onClick=window.open("SelectDrBj_jzbjb.jsp","_self","toolbar=no,menubar=no")>
	  </div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">地区</font></td>
              <td width="34%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select sq_dwxx.dqbm,dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
              </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font>报价级别</td>
              <td width="34%">
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
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
              <td align="right"><font color="#FF0000">*</font>是否需要材料</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+需要&N+否","N");
%></td>
              <td align="right"><font color="#FF0000">*</font>是否需要预交底</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+需要&N+否","N");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>对外报价</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>材料费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>人工费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font><font color="#0000CC">工程预算价</font></td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="不需录入自动生成" size="20" maxlength="17" readonly></td>
              <td colspan="2" bgcolor="#CCCCFF"><font color="#0000CC"><strong>注意：工程预算价<font color="#FF0000">(<font color="#0000CC"><strong>自动生成</strong></font>)</font>＝材料费+人工费</strong></font></td>
            </tr>
            
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" >工艺材料简介</td>
              <td colspan="3"  > 
                <textarea name="gycl" cols="71" rows="4"></textarea>              </td>
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
                <input type="hidden" name="lrr" value="<%=yhdlm%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="允许存盘" onClick="bc.disabled=false;">
                <input type="hidden" name="clcb" value="0" >
                <input type="hidden" name="rgcb" value="0" >
                <input type="hidden" name="cbenj" value="0" >
                <input name="sgcbj" type="hidden"  value="0" >
				</td>
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
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1;
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
	if(	javaTrim(FormName.cbenj)=="") {
		alert("请输入[成本价]！");
		FormName.cbenj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbenj, "成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("请输入[施工队报价]！");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "施工队报价"))) {
		return false;
	}


	if(	javaTrim(FormName.clbj)=="") {
		alert("请输入[材料费]！");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "材料费"))) {
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
	if(	javaTrim(FormName.bj)=="") {
		alert("请输入[工程预算价]！");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "工程预算价"))) {
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
	
	FormName.action="SaveInsertBj_zdyxmb.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

//-->
</SCRIPT>
