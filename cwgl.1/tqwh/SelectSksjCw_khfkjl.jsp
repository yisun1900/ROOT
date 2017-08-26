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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 修改收款时间</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_khfkjlSksjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">分公司</div>              </td>
              <td width="32%">
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
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
				%> 
				</select>			  </td>
              <td width="17%"> 
                <div align="right">签约店面</div>              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
              <td width="18%" align="right">收款单位</td>
              <td width="32%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
%> 
                </select>              </td>
              <td width="17%" align="right">收款序号</td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_fkxh" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户编号</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_khbh" size="20" maxlength="20" >              </td>
              <td width="17%"> 
                <div align="right">合同号</div>              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><strong>付款客户姓名</strong></td>
              <td><input type="text" name="fkkhxm" size="20" maxlength="50" ></td>
              <td align="right"><strong>付款房屋地址</strong></td>
              <td><input type="text" name="fkfwdz" size="20" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户姓名</div>              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">结算记录号</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_jsjlh" size="20" maxlength="9" >              </td>
              <td width="17%"> 
                <div align="right">收据编号</div>              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_sjbh" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">收款金额</td>
              <td> 
                <input type="text" name="cw_khfkjl_fkje" size="20" maxlength="17" >              </td>
              <td align="right">收款类型</td>
              <td> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td align="right">收款品牌</td>
              <td><input type="text" name="gysbh" size="20" maxlength="20" ></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">支付方式</td>
              <td width="32%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%> 
                </select>              </td>
              <td width="17%" align="right">转帐款项</td>
              <td width="33%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">收款人</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_skr" size="20" maxlength="20" >              </td>
              <td width="17%"> 
                <div align="right">审核人</div>              </td>
              <td width="33%"> 
                <input type="text" name="sjr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入人</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrr" size="20" maxlength="20" >              </td>
              <td width="17%"> 
                <div align="right">删除标志</div>              </td>
              <td width="33%"> 
                <select name="scbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N" selected>未删除</option>
                  <option value="Y">已删除</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">收款时间 从</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sksj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_sksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">审核时间 从</td>
              <td width="32%"> 
                <input type="text" name="sjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="sjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入时间 从</div>              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%"> 
                <div align="right">到</div>              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">是否需审核</div>              </td>
              <td width="32%"> 
                <select name="skdd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">不需审核</option>
                  <option value="2">需审核</option>
                </select>              </td>
              <td width="17%"> 
                <div align="right">审核标志</div>              </td>
              <td width="33%"> 
                <select name="dsksjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未审核</option>
                  <option value="Y">审核通过</option>
                  <option value="M">审核未通过</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">有效客户标志</td>
              <td width="32%"> 
                <select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">有效信息</option>
                  <option value="N">无效信息</option>
                </select>              </td>
              <td width="17%" align="right">签单状态</td>
              <td width="33%"> 
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未分配店面</option>
                  <option value="1">分配店面</option>
                  <option value="2">设计师提交飞单</option>
                  <option value="3">已签约</option>
                  <option value="4">飞单</option>
                  <option value="5">飞单审核未通过</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right">查询结果排序</td>
              <td width="32%"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="hth">合同号</option>
                  <option value="fkxh">收款序号</option>
                  <option value="khxm">客户姓名</option>
                  <option value="khlx">客户类型</option>
                  <option value="dwmc">收款单位</option>
                  <option value="sksj">收款时间</option>
                  <option value="fklxbm">收款类型</option>
                  <option value="zffsmc">支付方式</option>
                  <option value="fkje">收款金额</option>
                </select>              </td>
              <td width="17%" align="right">每页显示数量</td>
              <td width="33%"> 
                <input type="text" name="myxssl" size="20" maxlength="13" value="40">
                &nbsp;&nbsp; </td>
            </tr>

            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

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

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.cw_khfkjl_fkxh, "收款序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_khfkjl_fkje, "收款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj, "收款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj2, "收款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj2, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_lrsj, "录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
