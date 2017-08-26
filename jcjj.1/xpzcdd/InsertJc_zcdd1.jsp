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

String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String zdyhbz=(String)session.getAttribute("zdyhbz");
String zt="4";

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

%>

<body bgcolor="#FFFFFF">
<table width="100%" style='FONT-SIZE: 14px'>
  <tr>
    <td width="100%"> 
      <div align="center">请录入散客主材合同</div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>客户姓名 </td>
              <td><input type="text" name="khxm" value="" size="20" maxlength="50" onKeyUp="keyTo(xb[0])" ></td>
              <td align="right"><font color="#CC0000">*</font>性别 </td>
              <td><input type="radio" name="xb"  value="M" onKeyUp="keyTo(lxfs)">
                男
                <input type="radio" name="xb"  value="W" onKeyUp="keyTo(lxfs)">
                女 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>联系方式</td>
              <td colspan="3"><input type="text" name="lxfs" value="" size="72" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font>房屋地址</td>
              <td colspan="3"><input type="text" name="fwdz" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>主材大类</td>
              <td><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
%>
              </select></td>
              <td align="right">主材小类</td>
              <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>品牌</td>
              <td colspan="3">
			  <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:520PX" >
              </select></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>购买日期</td>
              <td bgcolor="#FFFFFF"><input type="text" name="qhtsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>合同送货时间</td>
              <td bgcolor="#FFFFFF"><input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>主材合同号</td>
              <td bgcolor="#FFFFFF"><input type="text" name="xshth" value="" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>驻店家居顾问</td>
              <td bgcolor="#FFFFFF"><select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
				out.println("<option value=\"\"></option>");

			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				String listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" UNION ALL ";
				listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh  and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" ORDER BY c2 ";
				cf.selectItem(out,listSql,yhmc);
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				String listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" UNION ALL ";
				listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh  and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" ORDER BY c2 ";
				cf.selectItem(out,listSql,yhmc);
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				String listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" UNION ALL ";
				listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
				listSql+=" ORDER BY c2 ";
				cf.selectItem(out,listSql,yhmc);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}

%>
              </select></td>
            </tr>
            
			<%--<tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>代购卡号</td>
              <td><input type="text" name="dgkh" value="<%=dgkh%>" size="20" maxlength="20" ></td>
              <td align="right">收款凭证号</td>
              <td><input type="text" name="skpzh" value="" size="20" maxlength="20" ></td>
            </tr>--%>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*<strong><font color="#FF00FF">正常品-材料费</font></strong></font></td>
              <td><input name="zcpclf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><strong><font color="#660099">特价品-材料费</font></strong></td>
              <td><input name="tjpclf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>安装辅料加工费</td>
              <td><input name="qtf" type="text"  onChange="f_jsjg(insertform)" value="" size="20" maxlength="20"></td>
              <td align="right"><font color="#FF0000">*</font>远程费</td>
              <td><input name="ycf" type="text" onChange="f_jsjg(insertform)" value="" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">合同总额</font></td>
              <td colspan="3"><input type="text" name="wdzje" value="" size="20" maxlength="20"  readonly>
              合同总额＝正常品材料费＋特价品材料费＋安装辅料加工费＋远程费</td>
            </tr>

            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入部门</font>              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>分公司</td>
              <td width="32%">
			  <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
		%> 
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入人</font>              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000CC">录入时间</font>              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="70" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="qddm" value="<%=dwbh%>" >
                <input type="hidden" name="khjl" value="" >
                <input type="hidden" name="jzsjs" value="" >
                <input type="hidden" name="zt" value="<%=zt%>">
                <input type="hidden" name="zqclf" value="0" >

				<input type="hidden" name="xmzy" value="" >
                <input type="hidden" name="jjsjs" value="" >
                <input type="hidden" name="ztjjgw" value="" >
                <input type="hidden" name="ddshbz" value="1" >
                <input type="hidden" name="jhtzshsj" value=""   >
                <input type="hidden" name="dzyy" value="" >
                <input type="hidden" name="kjxsj" value=""  >
                <input type="hidden" name="hkze" value="" size="20" maxlength="20" >
                <input type="hidden" name="zczkl" size="8" maxlength="8" value="10" readonly>
                <input type="hidden" name="htcxhdje" value="0" size="20" maxlength="10" >
                <input type="hidden" name="jmje" value="0" size="20" maxlength="20" >
                <input type="button" name="save"  value="存盘" onClick="f_do(insertform)">
                <input type="button" name="cl"  value="录入新订单" onClick="reset();save.disabled=false;cl.disabled=true" disabled></td>
            </tr>
        </table>
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

<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;



function changeDl(FormName)
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[分公司]！");
		FormName.zcdlbm.value="";
		FormName.fgsbh.focus();
		return;
	}

	czlx=2;

	FormName.zcxlbm.length=1;
	insertform.ycf.readOnly=false;
	insertform.qtf.readOnly=false;

	var sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.zcdlbm.value+"' order by clxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
//	window.open(actionStr);
}



function getPp(FormName)
{
	czlx=3;

	FormName.ppbm.length=1;

	var sql="select distinct jxc_ppxx.ppmc c1,jxc_ppxx.ppmc||DECODE(zcbljs,'Y','（安装辅料加工费计入【正常品材料费】）','N','')||DECODE(ycfbl,'Y','（远程费计入【正常品材料费】）','N','') c2 from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+FormName.fgsbh.value+"' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
		getPp(insertform);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppbm,ajaxRetStr);
	}
}


function f_jsjg(FormName)//参数FormName:Form的名称
{
	var zqclf=0;
	zqclf=FormName.zcpclf.value*1.0+FormName.tjpclf.value*1.0;
	zqclf=round(zqclf,2);
	FormName.zqclf.value=zqclf;
	
	var wdzje=0;
	wdzje=FormName.zqclf.value*1.0+FormName.qtf.value*1.0+FormName.ycf.value*1.0;
	wdzje=round(wdzje,2);
	FormName.wdzje.value=wdzje;
	
	FormName.hkze.value=FormName.wdzje.value;
	FormName.zczkl.value=10;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}

	
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌]！");
		FormName.ppbm.focus();
		return false;
	}

	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[购买日期]！");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "购买日期"))) {
		return false;
	}
	if(	javaTrim(FormName.htshsj)=="") {
		alert("请输入[合同送货时间]！");
		FormName.htshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}

	if(	javaTrim(FormName.xshth)=="") {
		alert("请输入[主材合同号]！");
		FormName.xshth.focus();
		return false;
	}

	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[驻店家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	
	
	if(	javaTrim(FormName.zcpclf)=="") {
		alert("请输入[正常品-材料费]！");
		FormName.zcpclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcpclf, "正常品-材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.tjpclf)=="") {
		alert("请输入[特价品-材料费]！");
		FormName.tjpclf.focus();
		return false;
	}

	if(!(isFloat(FormName.tjpclf, "特价品-材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.zqclf)=="") {
		alert("请输入[材料费]！");
		FormName.zqclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqclf, "材料费"))) {
		return false;
	}


	if(	javaTrim(FormName.qtf)=="") {
		alert("请输入[安装辅料加工费]！");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "安装辅料加工费"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	
	
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[合同总额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "合同总额"))) {
		return false;
	}

	if (parseFloat(FormName.wdzje.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.zqclf.select();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="SaveInsertJc_zcdd1.jsp";
	FormName.submit();
	FormName.save.disabled=true;
	FormName.cl.disabled=false;
	return true;

}


//-->
</SCRIPT>
