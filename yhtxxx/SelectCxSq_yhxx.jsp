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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>
<body bgcolor="#FFFFFF">

<form method="post" action="Sq_yhxxCxList.jsp" name="selectform">
      <div align="center">录入提醒</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC">所属公司</td>
              <td width="32%"> 
             <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
              </select>              </td>
              <td width="18%" align="right">所属部门</td>
              <td width="32%"> 
				<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
					}
					else if (kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwlx,dwbh","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
					%> 
              </select>             </td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF">
              <td align="right">职务</td>
              <td><select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%>
              </select></td>
              <td align="right">工种</td>
              <td><select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">员工序号</td>
              <td width="32%"> 
              <input type="text" name="ygbh" size="20" maxlength="8" >              </td>
              <td width="18%" align="right">工号</td>
              <td width="32%"> 
              <input type="text" name="bianhao" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">员工名称</td>
              <td width="32%"><input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" ></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">提醒方式</td>
              <td colspan="3"><input type="radio" name="txfs"  value="1">
                系统
                <input type="radio" name="txfs"  value="2">
                电话
                <input type="radio" name="txfs"  value="3">
                传真
                <input type="radio" name="txfs"  value="4">
                短信
                <input type="radio" name="txfs"  value="9">
                全部 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">提醒间隔 从</td>
              <td><input name="txjg" type="text" id="txjg" size="20" maxlength="10" ></td>
              <td align="right">到</td>
              <td><input name="txjg2" type="text" id="txjg2" size="20" maxlength="10" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
              <div align="right">录入时间 从</div>              </td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
              <td width="18%"> 
              <div align="right">到</div>              </td>
              <td width="32%"> 
              <input type="text" name="lrsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="sq_yhxx.dwbh">所属部门</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.xzzwbm">职务</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属部门</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.xzzwbm">职务</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属部门</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.xzzwbm">职务</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                <br>
                第四列 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属部门</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.xzzwbm">职务</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第五列 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属部门</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.xzzwbm">职务</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>
                第六列 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属部门</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.zwbm">工种</option>
                  <option value="sq_yhxx.xzzwbm">职务</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">				</td>
            </tr>
          </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwlx not in('F3','F4','F5') order by dwlx,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isNumber(FormName.txjg, "提醒间隔"))) {
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
