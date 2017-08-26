<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">审核手写项目结算价－修改</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                所属公司              </td>
              <td width="31%"> 
<%
		out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onchange=\"changeFgs(selectform)\">");
		
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}

        out.println("        </select>");
	
%>              </td>
              <td width="19%" align="right"> 
                签约店面              </td>
              <td width="31%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
		}
		else if (kfgssq.equals("1") )
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
		}
		else if (kfgssq.equals("3"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
		}
		else if (kfgssq.equals("4"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">合同号</td>
              <td width="31%"> 
                <input type="text" name="hth" size="20" maxlength="20">              </td>
              <td width="19%" align="right">客户编号</td>
              <td width="31%"> 
                <input type="text" name="khbh" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">设计师</td>
              <td width="31%"> 
                <input type="text" name="sjs" size="20" maxlength="20">              </td>
              <td width="19%" align="right">质检</td>
              <td width="31%"> 
                <input type="text" name="zjxm" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                <font color="#0000CC"><b>联系方式</b></font>              </td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="19%" align="right"> 
                联系方式              </td>
              <td width="31%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                房屋地址              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr align="right" bgcolor="#CCCCFF"> 
              <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                订单编号              </td>
              <td width="31%"> 
                <input type="text" name="ddbh" size="20" maxlength="9" >              </td>
              <td width="19%" align="right">项目专员</td>
              <td width="31%"><select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">主材大类</td>
              <td width="31%"> 
                <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcdlbm');" onChange="zcxlbmMark=0;zcxlbm.length=1;gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">主材小类</td>
              <td width="31%"> 
                <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zcxlbm');" onChange="gysMark=0;gys.length=1;ppbmMark=0;ppbm.length=1;ppmcMark=0;ppmc.length=1;">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>子品牌</b></font></td>
              <td width="31%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppbm')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">子品牌</td>
              <td width="31%"> 
                <input type="text" name="ppbm2" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>品牌名称</b></font></td>
              <td width="31%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ppmc')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">品牌名称</td>
              <td width="31%"> 
                <input type="text" name="ppmc2" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC"><b>供应商名称</b></font></td>
              <td width="31%"> 
                <select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gys')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">供应商名称</td>
              <td width="31%"> 
                <input type="text" name="gys2" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('clgw')">
                  <option value=""></option>
                </select>              </td>
              <td width="19%" align="right">展厅家居顾问</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ztjjgw')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="right" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">增减项序号</td>
              <td><input type="text" name="jc_zczjx_zjxbh" size="20" maxlength="11" ></td>
              <td align="right">处理状态</td>
              <td><select name="jc_zczjx_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="00">增减项未完</option>
                <option value="01">增减项已完成</option>
                <option value="02">已确认</option>
                <option value="04">厂家已接收</option>
                <option value="03">已送货</option>
                <option value="99">退单</option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">增减项原因 </td>
              <td><select name="jc_zczjx_zczjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zczjxyybm')">
                  <option value=""></option>
                </select></td>
              <td align="right" bgcolor="#FFFFFF"><strong><font color="#FF0000">*手写合同审核标志</font></strong></td>
              <td><input type="radio" name="sxhtsfysh" value="Y" checked>已审核</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">确认时间 从</td>
              <td><input type="text" name="jc_zczjx_qrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td><input type="text" name="jc_zczjx_qrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">确认人</td>
              <td><input type="text" name="jc_zczjx_qrr" size="20" maxlength="20" ></td>
              <td align="right" bgcolor="#FFFFFF">厂家接受人</td>
              <td><input type="text" name="jsr" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">厂家接受时间 从</td>
              <td><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">合同送货时间 从</td>
              <td><input type="text" name="jc_zczjx_htshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td><input type="text" name="jc_zczjx_htshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">实送货时间 从</td>
              <td><input type="text" name="jc_zczjx_sshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td><input type="text" name="jc_zczjx_sshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">录入时间 从</td>
              <td><input type="text" name="jc_zczjx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td><input type="text" name="jc_zczjx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">增减项发生时间 从</td>
              <td><input type="text" name="zjxfssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td><input type="text" name="zjxfssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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
	cf.ajax(out);//启用AJAX
%>

var clgwMark=0;
var ztjjgwMark=0;
var xmzyMark=0;

var gysMark=0;
var ppbmMark=0;
var ppmcMark=0;
var zcdlbmMark=0;
var zcxlbmMark=0;
var zczjxyybmMark=0;

var fieldName="";

function changeFgs(FormName) 
{
	FormName.crm_khxx_dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";


	clgwMark=0;
	ztjjgwMark=0;
	xmzyMark=0;

	gysMark=0;
	ppbmMark=0;
	ppmcMark=0;

	FormName.clgw.length=1;
	FormName.ztjjgw.length=1;
	FormName.xmzy.length=1;
	FormName.gys.length=1;
	FormName.ppbm.length=1;
	FormName.ppmc.length=1;


	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="clgw")
	{
		if (clgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			clgwMark=1;
		}
	}
	else if (lx=="ztjjgw")
	{
		if (ztjjgwMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ztjjgwMark=1;
		}
	}
	else if (lx=="xmzy")
	{
		if (xmzyMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" UNION ALL ";

			sql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
			sql+=" from sq_yhxx,sq_sqbm ";
			sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

			sql+=" ORDER BY sfzszg desc,c2 ";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			xmzyMark=1;
		}
	}
	else if (lx=="gys")
	{
		if (gysMark==0)
		{
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_gysxx.gysmc from jxc_ppxx,jxc_gysxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_gysxx.gysmc";
			}
			else
			{
				sql="select distinct jxc_gysxx.gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);

			openAjax(actionStr);
			gysMark=1;
		}
	}


	else if (lx=="ppbm")
	{
		if (ppbmMark==0)
		{
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_ppxx.ppmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.ppmc";
			}
			
			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppbmMark=1;
		}
	}
	else if (lx=="ppmc")
	{
		if (ppmcMark==0)
		{
			if (selectform.zcdlbm.value!="")
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' and jxc_ppxx.cldl='"+selectform.zcdlbm.value+"' order by jxc_ppxx.scsmc";
			}
			else
			{
				sql="select distinct jxc_ppxx.scsmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='"+selectform.fgs.value+"' order by jxc_ppxx.scsmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;

			openAjax(actionStr);
			ppmcMark=1;
		}
	}

}


function getThisOne(lx)
{

	var sql;

	fieldName=lx;

	if (lx=="zcdlbm")
	{
		if (zcdlbmMark==0)
		{
			var sql="select cldlmc from jxc_cldlbm where cldllb in('1','3')  order by cldlmc";
			var actionStr="/ajax/getstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zcdlbmMark=1;
		}
	}
	else if (lx=="zcxlbm")
	{
		if (zcxlbmMark==0)
		{
			if (selectform.zcdlbm.value=="")
			{
				zcxlbmMark=0;
				selectform.zcdlbm.focus();
				alert("请选择【主材大类】");
				return;
			}

			sql="select clxlmc from jxc_clxlbm where cldlmc='"+selectform.zcdlbm.value+"' order by clxlmc";

			var actionStr="/ajax/getstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			zcxlbmMark=1;
		}
	}
	else if (lx=="zczjxyybm")
	{
		if (zczjxyybmMark==0)
		{
			var sql="select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);
			zczjxyybmMark=1;
		}
	}
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="clgw")
	{
		strToSelect(selectform.clgw,ajaxRetStr);
	}
	else if (fieldName=="ztjjgw")
	{
		strToSelect(selectform.ztjjgw,ajaxRetStr);
	}
	else if (fieldName=="xmzy")
	{
		strToSelect(selectform.xmzy,ajaxRetStr);
	}
	else if (fieldName=="gys")
	{
		strToItem2(selectform.gys,ajaxRetStr);
	}
	else if (fieldName=="ppbm")
	{
		strToItem2(selectform.ppbm,ajaxRetStr);
	}
	else if (fieldName=="ppmc")
	{
		strToItem2(selectform.ppmc,ajaxRetStr);
	}
	else if (fieldName=="zcdlbm")
	{
		strToItem2(selectform.zcdlbm,ajaxRetStr);
	}
	else if (fieldName=="zcxlbm")
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
	}
	else if (fieldName=="zczjxyybm")
	{
		strToSelect(selectform.jc_zczjx_zczjxyybm,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.jc_zczjx_qrsj, "确认时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zczjx_qrsj2, "确认时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "厂家接受时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "厂家接受时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zczjx_htshsj, "合同送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zczjx_htshsj2, "合同送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zczjx_sshsj, "实送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zczjx_sshsj2, "实送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zczjx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_zczjx_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "增减项发生时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj2, "增减项发生时间"))) {
		return false;
	}


	FormName.action="Jc_zczjxXgShJsjList.jsp";
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
